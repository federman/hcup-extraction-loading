#' Loads .dta to database as both data (.parquet) and metadata (.csv)
#'
#'    @dataset_id: this arguemnt is just the HCUP dataset id (e.g. "NY_SEDD_2017_CHGS")
#'
#' Example:
#'     datasets_to_load = c('NJ_SID_2017_CHGS')
#'     dataset_id_tmp = 'NJ_SID_2017_CHGS'
#'     datasets_to_load = c('NJ_SID_2016_CORE')
#'     dataset_id_tmp = 'NJ_SID_2016_CORE'


source("R/get_elt_status.R")
source("R/make_target_endpoints.R")


etl_individual_table = function(dataset_id_tmp){
  
  { # Setup -------------------------------------------------------------------
    file_tmp = list.files(path = "raw-hcup/",
                          pattern = dataset_id_tmp,
                          full.names = T) %>%
      keep(~ str_detect(.x, '.dta|.sas7bdat'))
    
    if (str_detect(file_tmp, '.dta')) {
      df_raw =  readstata13::read.dta13(glue("raw-hcup/{dataset_id_tmp}.dta"))
    } else {
      df_raw = haven::read_sas(glue("raw-hcup/{dataset_id_tmp}.sas7bdat"))
    }
    
    cli_alert("Start .dta to parquet conversion for {dataset_id_tmp}")
  }
 
  if (str_detect(file_tmp, 'CORE')) {
    # CORE transformations ----------------------------------------------------------

    ## store linkage metadata
    df_raw %>% 
      as_tibble() %>% 
      count(ZIP, name = 'n_discharges') %>%
      left_join(xwalk_zip_zcta) %>% 
      arrow::write_csv_arrow(sink = glue('intermediate/zip-zcta/{dataset_id_tmp}__linkage_quality.csv'))
   
    ## Merge zip-zcta thene xport
    df_raw %>%
      left_join(xwalk_zip_zcta)  %>% 
      write_parquet(sink = glue("raw-hcup/{dataset_id_tmp}.parquet"))
  }
  #' 
  #' if (str_detect(file_tmp, "CHGS")){
  #'   # CHGS transformations ----------------------------------------------------------
  #'   #' - [ ] standardize  to long
  #'   #' 
  #' }
  #' 
  #' 
  if (!str_detect(file_tmp, "CORE|CHGS")) { 
    # Default export ------------------------------------------------------------------
    write_parquet(sink = glue("raw-hcup/{dataset_id_tmp}.parquet"))
    cli_alert_success("Finished .dta to parquet conversion for {dataset_id_tmp}")    
  }
}


etl_to_db = function(xwalk_zip_zcta) {
  {
    # Setup -------------------------------------------------------------------
    
    ## get datasets that have .dta but not parquet
    datasets_to_load = get_elt_status() %>%
      filter(loaded_data %in% c("dta", "sas7bdat") ,
             is.na(parquet)) %>%
      pull(dataset_id)
    
    if (length(datasets_to_load) == 0) {
      print(get_elt_status() %>% select(dataset_id, parquet))
      cli_alert_warning("All .dta have been converted to .parquet. No Action taken.")
      return()
    }
  }
  
  {
    # Load --------------------------------------------------------------------
    
    
    
    datasets_to_load %>%
      walk(function(dataset_id_tmp) {
        li
        
        
        cli_alert("Start .dta to parquet conversion for {dataset_id_tmp}")
        
        list
        
        
        %>%
         
      })
    
  }
  
  
  
}

