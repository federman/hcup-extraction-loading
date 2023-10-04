{ # 0. Seeds --------------------------------------------------
  'code/eda/eda/v0.2/eda.R'
  'code/transformations/indicators.R'
  'code/transformations/zip-zcta.R'
  'code/transformations/zip-ruca.R'
  'code/transformations/zcta-place.R'
  
  etl = get_etl_imports()
}

{ # 1. ETL --------------------------------------------------
  
  { ## 1.1 Data/metadata --------------------------------------------------

    ## Step 1: Evaluate ETL status
    get_etl_status(etl) 
    
    ## Step 2: Copy load programs
    copy_load_program(etl)  
    
    ## Step 3: Run load programs 
 
    get_etl_status(etl) %>% filter(is.na(loaded_data)) 
    
    ## Step 4: Load as parquet 
    load_dta_to_db(etl, subset = T)
    # load_dta_to_db(etl)
    
    ## Step 5: Generate codebooks
    generate_codebooks(etl)    
  }
  
}



{ # 2. Post-DBT processing  -----------------------------------------------------------

  ## Models > Marts
  diversify_marts(version = 'v0')
  
}
