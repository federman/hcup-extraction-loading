#' Loads .dta to database as both data (.parquet) and metadata (.csv)
#'
#'    @dataset_id: this arguemnt is just the HCUP dataset id (e.g. "NY_SEDD_2017_CHGS")
#'
#' Example:
#'     dataset_id_tmp = 'MA_SID_2014_CORE'
#'     dataset_id_tmp = 'AZ_SID_2015q1q3_DX_PR_GRPS'
#'     dataset_id_tmp = 'AZ_SID_2015q1q3_CHGS'
#'     dataset_id_tmp = 'MA_SID_2016_CHGS'  # charges wide

source("R/get_etl_status.R")
source("R/make_target_endpoints.R")


etl_individual_table = function(dataset_id_tmp, xwalk_zip_zcta){
  
  { # Setup -------------------------------------------------------------------
    
    ## Prep CLI message for global environement printing
    cli_msg1 = glue("Start parquet conversion for {dataset_id_tmp}")
    cli_msg2 = glue("Finished parquet conversion for {dataset_id_tmp}")
    cli_alert(cli_msg1, .envir = globalenv())
    
    ## Import .dta/.sas7bdat
    file_tmp = list.files(path = "raw-hcup/",
                          pattern = dataset_id_tmp,
                          full.names = T) %>%
      keep(~ str_detect(.x, '.dta|.sas7bdat'))
    if (str_detect(file_tmp, '.dta')) {
      df_raw =  readstata13::read.dta13(glue("raw-hcup/{dataset_id_tmp}.dta"))
    } else {
      df_raw = haven::read_sas(glue("raw-hcup/{dataset_id_tmp}.sas7bdat"))
    }

  }

 

  if (str_detect(file_tmp, "CHGS")){
    # CHGS transformations ----------------------------------------------------------

    ## check relationship type
    chgs_long = df_raw %>%
      slice(1:10 ^ 3) %>%
      count(KEY) %>%
      count(n, name = 'key_row_count') %>%
      nrow() != 1

    ## Export long charges table by default
    if (chgs_long) {
      df_raw %>% write_parquet(sink = glue("raw-hcup/{dataset_id_tmp}.parquet"))
      cli_alert_success(cli_msg2, .envir = globalenv())
    }


    ## Pivot charges long if needed
    if (!chgs_long) {
      
      ## setup
      has_revcd =  any(str_detect(names(df_raw %>% select(-any_of('NREVCD') )  ), "REVCD" ))
      has_units =  any(str_detect(names(df_raw %>% select(-any_of('NREVCD') )  ), "UNIT" ))
      has_chgs = any(str_detect(names(df_raw %>% select(-any_of('NREVCD') )  ), "CHG" ))
      
      ## process charges
      df_charges = df_raw %>%
        select(-any_of('NREVCD')) %>%
        select(KEY, contains('CHG')) %>%
        mutate_all(~as.character(.x)) %>%
        pivot_longer(-KEY, values_to = 'CHARGE') %>%
        filter(!is.na(CHARGE),
               CHARGE!='') %>%
        mutate(charge_id = parse_number(name)) %>%
        select(-name)
      
      ## Process others if available
      # if (has_revcd){
      #   df_revcd = df_raw %>%
      #     select(-any_of('NREVCD')) %>%
      #     select(KEY, contains('REVCD')) %>%
      #     mutate_all(~as.character(.x)) %>%
      #     pivot_longer(-KEY, values_to = 'REVCODE') %>%
      #     filter(!is.na(REVCODE),
      #            REVCODE!='') %>%
      #     mutate(charge_id = parse_number(name)) %>%
      #     select(-name)
      # }
      # 
      # if (has_units){
      #   df_units = df_raw %>%
      #     select(-any_of('NREVCD')) %>%
      #     select(KEY, contains('UNIT')) %>%
      #     mutate_all(~as.character(.x)) %>%
      #     pivot_longer(-KEY, values_to = 'UNITS') %>%
      #     filter(!is.na(UNITS),
      #            UNITS!='') %>%
      #     mutate(charge_id = parse_number(name)) %>%
      #     select(-name)
      # }

      
      # df_revcd %>%
      #   left_join(df_units, by = c("KEY", "charge_id")) %>%
      #   left_join(df_charges, by = c("KEY", "charge_id")) %>%
      #   select(CHARGE, KEY, REVCODE, UNITS) %>%
      # mutate(CHARGE = as.double(CHARGE),
      #        KEY = as.double(KEY),
      #        REVCODE = as.character(REVCODE),
      #        UNITS = as.double(UNITS))
      
      df_charges %>%
        select(KEY, CHARGE) %>%
        mutate(CHARGE = as.double(CHARGE),
               KEY = as.double(KEY)) %>%
        write_parquet(sink = glue("raw-hcup/{dataset_id_tmp}.parquet"))
      
      cli_alert_success(cli_msg2, .envir = globalenv())
    }

  }


  if (!str_detect(file_tmp, "CHGS")) {
    # Default export ------------------------------------------------------------------
    df_raw %>% write_parquet(sink = glue("raw-hcup/{dataset_id_tmp}.parquet"))
    cli_alert_success(cli_msg2, .envir = globalenv())
  }
   
}


etl_to_db = function(xwalk_zip_zcta) {
  
  { # Setup -------------------------------------------------------------------
    
    ## get datasets that have .dta but not parquet
    datasets_to_load = get_etl_status() %>%
      filter(loaded_data %in% c("dta", "sas7bdat") ,
             is.na(parquet)) %>%
      pull(dataset_id)
    
    if (length(datasets_to_load) == 0) {
      print(get_etl_status() %>% select(dataset_id, parquet))
      cli_alert_warning("All .dta have been converted to .parquet. No Action taken.", .envir = globalenv())
      return()
    }
  }
  
  { # Loop --------------------------------------------------------------------
    datasets_to_load %>%
      walk(~etl_individual_table(dataset_id_tmp =.x, xwalk_zip_zcta))
  }
  
}

