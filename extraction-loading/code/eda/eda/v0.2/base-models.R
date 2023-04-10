#' This will explore if our sources files have the expected base columns

{ # Setup -------------------------------------------------------------------
  base_columns = c("AGE", "YEAR", "ZIP", "ZIP3", "VisitLink", "CPT1", "CPT2", "CPT3", "CPTCCS1",
                   "CPTCCS2", "DHOUR", "DMONTH", "DQTR", "DRG", "DISP_X", "DISPUB04", "DMONTH", "DQTR", "DSHOSPID", "HCUP_ED",
                   "HCUP_OS", "HOSPST", "I10_DX_Visit_Reason1", "I10_DX_Visit_Reason2", "I10_DX1",
                   "I10_DX2", "LOS", "PSTCO", "PSTCO2","HISPANIC", "RACE", "ZIPINC_QRTL", "PAY1", "DIED", "FEMALE", "HOSP_NPI", 
                   "I10_DX_Admitting")
  
  df_summary = arrow::read_parquet("clean/df_summary.parquet") %>% 
    mutate(path = glue("raw-hcup/{dataset_id}.parquet"))
}


{ # Check base columns ------------------------------------------------------

  ## Check for base columns
  df_base = df_summary %>% 
    filter(file == "CORE") %>% 
    group_by(row_number()) %>% 
    group_map(~{
      # row = df_summary  %>%  filter(file == "CORE") %>% slice(1)
      row = .x
      ds_tmp = open_dataset(row$path)
      df_exists_tmp = tibble(db = row$db,
                             dataset_id = row$dataset_id,
                             base = base_columns) %>% 
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
    arrange(desc(`SID-False`)) %>% 
      View()
  
  
  ## SIDmissing I10_DX1/2
  df_base %>% 
    filter(base == "I10_DX1",
           db == "SID") %>% 
    arrange(base_exists, dataset_id) %>% View()
}
