#' This will explore if our sources files have the expected base columns

{ # Setup -------------------------------------------------------------------
  sedd_base_columns = c("KEY","AGE", "YEAR", "ZIP", "ZIP3", "VisitLink", "CPT1", "CPT2", "CPT3", "CPTCCS1",
                   "CPTCCS2", "DHOUR", "DMONTH", "DQTR", "DISP_X", "DISPUB04", "DMONTH", "DQTR", "DSHOSPID", "HCUP_ED",
                   "HCUP_OS", "HOSPST", "I10_DX_Visit_Reason1", "I10_DX_Visit_Reason2", "I10_DX1",
                   "I10_DX2", "LOS", "PSTCO", "PSTCO2","HISPANIC", "RACE", "ZIPINC_QRTL", "PAY1", "DIED", "FEMALE", "HOSP_NPI")
  
  df_summary_sedd = arrow::read_parquet("clean/df_summary.parquet") %>% 
    mutate(path = glue("raw-hcup/{dataset_id}.parquet"))%>% 
    filter( db == 'SEDD')
}


{ # EDA + QC ------------------------------------------------------

  ## Check for base columns
  df_base = df_summary_sedd %>% 
    filter(file == "CORE",
           db == 'SEDD') %>% 
    group_by(row_number()) %>% 
    group_map(~{
      # row = df_summary_sedd  %>%  filter(file == "CORE") %>% slice(1)
      row = .x
      ds_tmp = open_dataset(row$path)
      df_exists_tmp = tibble(db = row$db,
                             dataset_id = row$dataset_id,
                             base = sedd_base_columns) %>% 
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
                values_from = n) # %>% View()
}



{ # Generate CORE base columns  ---------------------------------------
  
  df_sedd_base_fields = df_summary_sedd %>%
    filter(file %in% c("CORE")) %>%
    group_by(row_number()) %>%
    group_map( ~ {
      row = .x
      base_fields_tmp = sedd_base_columns
      if (row$file == "CHGS") base_fields_tmp = sedd_base_chgs_base_columns
      row %>%
        select(dataset_id) %>%
        mutate(base_fields = list(
          open_dataset(glue("raw-hcup/{dataset_id}.parquet")) %>%
            names() %>%
            keep( ~ .x %in% base_fields_tmp)
        ))
    }) %>% 
    bind_rows() %>% 
    left_join(df_summary_sedd)
  
  save(df_sedd_base_fields, file = "clean/df_sedd_base_fields.rdata")
}
