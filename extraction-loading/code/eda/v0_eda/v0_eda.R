{ # 0. Setup ----------------------------------------------------------------
  
  df_summary = arrow::read_parquet("clean/df_summary.parquet") %>% 
    mutate(dataset_instance = paste(c(db, state, year_raw), collapse = "_")) 
  
  
}


{ # CORE vs CHGS relationship --------------------------------------------------------------------
  
  { ## Distribution of relationships -------------------------------------------
    
    #' Check relationships between CORE and CHGS. For which dataset instances
    #' is the relationship 1:1 vs 1:many
    
    df_relationships = df_summary %>% 
      filter(file %in%c("CHGS",'CORE')) %>% 
      select(dataset_instance, db, year, state, file, n_rows) %>% 
      pivot_wider(values_from = n_rows, names_from = file) %>% 
      mutate( core_chgs_relationship = ifelse(CHGS == CORE,"1:1","1:many"))
    
    
    df_relationships %>% 
      count(state, core_chgs_relationship) %>% 
      arrange(state)
    
    #' This relationship varies by State.  
  }
  
  { ## 1:1 example ----------------------------------------------------------
    
    #' here we look at what a 1:1 CHGS may look like. dataset = SID_GA_2015q1q3
    #' so charges are just wide
 
    dataset_id_tmp = 'AZ_SID_2015q1q3'

    key_tmp = glue("raw-hcup/{dataset_id_tmp}_CORE.parquet") %>% 
      open_dataset() %>% 
      select(KEY) %>% 
      head(n = 1) %>% 
      collect() %>% 
      pull(KEY)
    
    chgs_tmp = glue("raw-hcup/{dataset_id_tmp}_CHGS.parquet") %>% 
      open_dataset() %>% 
      filter(KEY == key_tmp) %>% 
      collect()
  }
  
  { ## 1:many example ----------------------------------------------------------
    
    #' here we look at what a 1:1 CHGS may look like.
    #' Charges are long
    
    dataset_id_tmp = 'GA_SID_2015q1q3'
    
    key_tmp = glue("raw-hcup/{dataset_id_tmp}_CORE.parquet") %>% 
      open_dataset() %>% 
      select(KEY) %>% 
      head(n = 1) %>% 
      collect() %>% 
      pull(KEY)
    
    chgs_tmp = glue("raw-hcup/{dataset_id_tmp}_CHGS.parquet") %>% 
      open_dataset() %>% 
      filter(KEY == key_tmp) %>% 
      collect()
    
  }
  
}

{ # q4 vs q41q3 -------------------------------------------------------------
  
  #' why are some dataset split by YEAR-q?
  #' So for example, for AZ_SID_2015. Are the q4_CORE and q1q3_CORE keys identical or
  #' completely different?
  
  
  keys_q1q3 = open_dataset('raw-hcup/AZ_SID_2015q1q3_CORE.parquet') %>% 
    count(KEY) %>% 
    collect() %>% 
    mutate(q1q3 = T) %>% 
    select(-n)
  
  keys_q4 = open_dataset('raw-hcup/AZ_SID_2015q4_CORE.parquet') %>% 
    count(KEY) %>% 
    collect() %>% 
    mutate(q4 = T)%>% 
    select(-n)
  
  full_join(keys_q1q3,keys_q4) %>% 
    rowwise() %>% 
    mutate(n = sum(q1q3,q4, na.rm = T)) %>% 
    count(n)
  
  #' It seems these are completely unique dataset, with different Keys. So unique encounters.
  
}