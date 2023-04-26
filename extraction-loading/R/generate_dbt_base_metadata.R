#' Function will generate the base column metadata required to crate DBT base models and .yml files
#' 
#'   @param: 
#'   
#'  
#'   Example:
#'      db_tmp = 'SID'
#'      db_tmp = 'SEDD'


generate_dbt_base_metadata = function(db_tmp){
 
  { # Setup -------------------------------------------------------------------
    
    { ## assign db specific columns 
      
      base_columns_core_all = lst(
        SID  =  c(
          "KEY","AGE", "AYEAR", "AMONTH", "ZIP", "ZIP3", "VisitLink", 
          "CPT1", "CPT2", "CPT3", "CPTCCS1","CPTCCS2", 
          "DHOUR", "DMONTH", "DQTR", "DRG", "DISP_X", "DISPUB04", "DMONTH", "DQTR", "DSHOSPID", 
          "HCUP_ED","HCUP_OS", "HOSPST",  
          "I10_DX1","I10_DX2", 
          "LOS", "PSTCO", "PSTCO2","HISPANIC", "RACE", "ZIPINC_QRTL", "PAY1", "DIED", "FEMALE", "HOSP_NPI", 
          "I10_DX_Admitting") 
      )
      
      sid_base_columns = c(
        "KEY","AGE", "AYEAR", "AMONTH", "ZIP", "ZIP3", "VisitLink", 
        "CPT1", "CPT2", "CPT3", "CPTCCS1","CPTCCS2", 
        "DHOUR", "DMONTH", "DQTR", "DRG", "DISP_X", "DISPUB04", "DMONTH", "DQTR", "DSHOSPID", 
        "HCUP_ED","HCUP_OS", "HOSPST",  
        "I10_DX1","I10_DX2", 
        "LOS", "PSTCO", "PSTCO2","HISPANIC", "RACE", "ZIPINC_QRTL", "PAY1", "DIED", "FEMALE", "HOSP_NPI", 
        "I10_DX_Admitting") %>% list()
      
      sedd_base_columns = c("KEY","AGE", "AMONTH","AYEAR","YEAR", "ZIP", "ZIP3", "VisitLink", "CPT1", "CPT2", "CPT3", "CPTCCS1",
                               "CPTCCS2", "DHOUR", "DMONTH", "DQTR", "DISP_X", "DISPUB04", "DMONTH", "DQTR", "DSHOSPID", "HCUP_ED",
                               "HCUP_OS", "HOSPST", "I10_DX_Visit_Reason1", "I10_DX_Visit_Reason2", "I10_DX1",
                               "I10_DX2", "LOS", "PSTCO", "PSTCO2","HISPANIC", "RACE", "ZIPINC_QRTL", 
                               "PAY1", "DIED", "FEMALE", "HOSP_NPI") %>% list()
      
      base_columns_core = ifelse(db_tmp == 'SID', sid_base_columns, sedd_base_columns) %>% unlist()
      base_columns_chgs = c("KEY","SUM(CHARGE) AS total_charge")
    }
  
    ## get db specific metadata
    df_summary = arrow::read_parquet("clean/df_summary.parquet") %>% 
      filter(year>=2016,
             state!='MA',
             db == db_tmp) %>% 
      mutate(path = glue("raw-hcup/{dataset_id}.parquet"))
  }
  
  { # QC ----------------------------------------------------------------------
    #' This section is used for EDA and doesn't run, just useful coe for debugging

    if (F) {

      ## Check for base columns
      df_base = df_summary_sid %>%
        filter(file == "CORE") %>%
        group_by(row_number()) %>%
        group_map( ~ {
          # row = df_summary_sid  %>%  filter(file == "CORE") %>% slice(1)
          row = .x
          ds_tmp = open_dataset(row$path)
          df_exists_tmp = tibble(
            db = row$db,
            dataset_id = row$dataset_id,
            base = sid_base_columns
          ) %>%
            mutate(base_exists = base %in% names(ds_tmp))
          return(df_exists_tmp)
        }) %>%
        bind_rows()
      
      ## Summarize availablity
      df_base %>%
        count(db, base, base_exists) %>%
        mutate(name = paste0(db, "-", ifelse(base_exists, 'True', 'False'))) %>%
        select(name, base, n) %>%
        pivot_wider(names_from = name,
                    values_from = n) %>%
        arrange(desc(`SID-False`)) # %>% View()
      
      ## Complete base_fields
      df_base %>% 
        group_by(dataset_id) %>% summarize(n_base_exists = sum(base_exists)) %>%
        arrange(desc(n_base_exists)) %>%
        slice(1)
    }
  }
  
  { #  base model   ---------------------------------------
    
    df_base_fields = df_summary %>%
      filter(file %in% c("CORE", "CHGS")) %>%
      group_by(row_number()) %>%
      group_map( ~ {
        # row = df_summary_sid %>% filter(dataset_id == 'AZ_SID_2016_CHGS')
        row = .x
        base_fields_tmp = base_columns_core
        if (row$file == "CHGS") base_fields_tmp = base_columns_chgs
        fields_in_file = open_dataset( glue("raw-hcup/{row$dataset_id}.parquet")) %>%  names()
        
        base_fields = base_fields_tmp %>% 
          sort() %>% 
          map(function(var){
            present = var%in%c(fields_in_file, "SUM(CHARGE) AS total_charge")
            if(present){
              var %>% return()
            } else {
              # cli_alert_warning("{var} NOT PRESENT: Op. as NULL")
              glue("NULL AS {var}") %>% return()
            }
          }) %>% 
          unique() %>% 
          list()
        
        row %>%
          select(dataset_id) %>%
          mutate(base_fields = base_fields)
      }) %>% 
      bind_rows() %>% 
      left_join(df_summary)
    

    return(df_base_fields)
  }
  
  
  
  
}