{ # 0. Seeds --------------------------------------------------
  'code/eda/eda/v0.2/eda.R'
  'code/transformations/indicators.R'
  'code/transformations/zip-zcta.R'
  'code/transformations/zip-ruca.R'
  'code/transformations/zcta-place.R'
}

{ # 1. ETL --------------------------------------------------
  
  { ## 1.1 Data/metadata --------------------------------------------------

    ## Step 1: Evaluate ELT status
    get_etl_status() 
    
    ## Step 2: Copy load programs
    copy_load_program()  
    
    ## Step 3: Run load programs 
    get_etl_status() %>% filter(is.na(loaded_data)) 
    
    ## Step 4: Load as parquet 
    get_etl_status() %>% filter(is.na(parquet)) 
    
    ## Step 5: Generate codebooks
    generate_codebooks()    
  }
  
  { ## 1.2 Models --------------------------------------------------------------
    
    ## Models > Source
    df_codebooks = fread("clean/df_codebooks.csv") |> as_tibble()
    get_file_ids() %>% walk(~generate_source_yml(.x, env = "uhc"))
    
    ## Models > Base > SID 
    generate_dbt_base_metadata('SID') %>% 
      group_by(row_number()) %>% 
      group_walk(~.x %>% write_dbt_base_model())
    
    ## Models > Base > SEDD  
    generate_dbt_base_metadata('SEDD') %>% 
      group_by(row_number()) %>% 
      group_walk(~.x %>% write_dbt_base_model())
    
  }
}



{ # 2. Post-DBT processing  -----------------------------------------------------------

  ## Models > Marts
  diversify_marts(version = 'v0')
  
}
