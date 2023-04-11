#' This will explore if our sources files have the expected base columns

{ # Setup -------------------------------------------------------------------
  sid_base_columns = c(
    "KEY","AGE", "AYEAR", "AMONTH", "ZIP", "ZIP3", "VisitLink", 
    "CPT1", "CPT2", "CPT3", "CPTCCS1","CPTCCS2", 
    "DHOUR", "DMONTH", "DQTR", "DRG", "DISP_X", "DISPUB04", "DMONTH", "DQTR", "DSHOSPID", 
    "HCUP_ED","HCUP_OS", "HOSPST",  
    "I10_DX1","I10_DX2", 
    "LOS", "PSTCO", "PSTCO2","HISPANIC", "RACE", "ZIPINC_QRTL", "PAY1", "DIED", "FEMALE", "HOSP_NPI", 
    "I10_DX_Admitting")
  
  sid_base_chgs_base_columns = c(
    "CHARGE","KEY","REVCODE","UNITS"
  )
  
  df_summary_sid = arrow::read_parquet("clean/df_summary.parquet") %>% 
    filter(year>=2016,
           state!='MA',
           db == 'SID') %>% 
    mutate(path = glue("raw-hcup/{dataset_id}.parquet"))
  
  ## Check for base columns
  df_base = df_summary_sid %>% 
    filter(file == "CORE") %>% 
    group_by(row_number()) %>% 
    group_map(~{
      # row = df_summary_sid  %>%  filter(file == "CORE") %>% slice(1)
      row = .x
      ds_tmp = open_dataset(row$path)
      df_exists_tmp = tibble(db = row$db,
                             dataset_id = row$dataset_id,
                             base = sid_base_columns) %>% 
        mutate(base_exists = base%in%names(ds_tmp))
      return(df_exists_tmp)
    }) %>% 
    bind_rows()
  
  
  ## Summarize availablity
  df_base %>% 
    count(db, base, base_exists) %>% 
    mutate(name = paste0(db,"-",ifelse(base_exists,'True','False'))) %>% 
    select(name, base, n) %>% 
    pivot_wider(names_from = name,
                values_from = n) %>% 
    arrange(desc(`SID-False`)) # %>% View()
}


{ # EDA + QC ------------------------------------------------------

  { # Universal columns -------------------------------------------------------

    
    }
  
  { # YEAR and MONTH ----------------------------------------------------------
    tibble(field = open_dataset("raw-hcup/NY_SID_2018_CORE.parquet") %>% names() )
  }
  
  { # HOSP_NPI  --------------------------------------------------------
    df_base %>% 
      filter(base == 'HOSP_NPI') %>% 
      arrange(base_exists)
  }
  
  
  { # ZIP ---------------------------------------------------------------------
    df_base %>% 
      filter(base == "ZIP",
             base_exists == F) %>% 
      arrange(base_exists, dataset_id)
    
    ## MA files all are missing ZIP and only have ZIP3
    open_dataset("raw-hcup/MA_SID_2017_CORE.parquet") %>% 
      count(ZIP3) %>% 
      collect()
    
  }
  
  { # DX vs I10_DX ------------------------------------------------------------
    df_base %>% 
      filter(base == "I10_DX1",
             db == "SID") %>% 
      arrange(base_exists, dataset_id)
  }
}


{ # Generate base fields  ---------------------------------------
  
  df_sid_base_fields = df_summary_sid %>%
    filter(file %in% c("CORE", "CHGS")) %>%
    group_by(row_number()) %>%
    group_map( ~ {
      # row = df_summary_sid %>% filter(dataset_id == 'AZ_SID_2016_CORE')
      row = .x
      base_fields_tmp = sid_base_columns
      if (row$file == "CHGS") base_fields_tmp = sid_base_chgs_base_columns
      fields_in_file = open_dataset( glue("raw-hcup/{row$dataset_id}.parquet")) %>%  names()
      
      base_fields = base_fields_tmp %>% 
        sort() %>% 
        map(function(var){
          present = var%in%fields_in_file
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
    left_join(df_summary_sid)
   
  save(df_sid_base_fields, file = "clean/df_sid_base_fields.rdata")
}


 
