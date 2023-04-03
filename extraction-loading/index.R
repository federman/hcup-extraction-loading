{ # 1. Extraction (done on desktop with high RAM) ----
  
  ## Step 1: Evaluate ELT status
  get_elt_status()  
  
  ## Step 2: Copy load programs
  copy_load_program()  
  
  ## Step 3: Run STATA to generate dta
  get_elt_status() %>%
    filter(is.na(loaded_data)) %>% 
    arrange(load_program) %>% 
    select(-parquet, -codebook)
  
  ## Step 4: Load as parquet
  load_dta_to_db()
  
  ## Step 5: Generate codebooks
  generate_codebooks()
}




{ # 2. Loading  -----------------------------------------------------------
  
  ## load source.ymls into dbt
  get_file_ids() %>% walk(~generate_source_yml(.x))
  
  ## generate stg model .ymls into dbt
  get_stage_models() %>% walk(~generate_stg_model_yml(.x))
  
  
}
