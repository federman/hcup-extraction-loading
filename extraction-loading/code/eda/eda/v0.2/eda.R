{ # 0. Setup ----------------------------------------------------------------
  df_summary = arrow::read_parquet("clean/df_summary.parquet") 
}


{ # Stats -------------------------------------------------------------------
  
  ## Total rows: 528,035,025
  n_rows = df_summary %>% pull(n_rows) %>% sum()
  
  ## dta/sasbdat7 size:
  df_summary %>% 
    summarize(size_gb_raw = sum(size_mb_raw)/10^3,
              size_mgb_parquet = sum(size_mb_parquet)/10^3)
  
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
  #' The q1 vs q3 a4 is financial quarters. for this dataset they split into quarters.

}

{ # Insurance/Hospital ----------------------------------------
  #' where is isnurance type found (self-pay, medicaid ... etc)
  df_summary %>% 
    filter(file == "CORE") %>% 
    slice(1) %>% 
    pull(dataset_id)
  
  ds = open_dataset('raw-hcup/AZ_SID_2015q1q3_CORE.parquet')
  
  ## https://hcup-us.ahrq.gov/db/vars/siddistnote.jsp?var=pay1
  ds %>% 
    count(PAY1) %>% 
    collect()
  
  ## https://hcup-us.ahrq.gov/db/vars/siddistnote.jsp?var=pointoforigin_x
  ds %>% 
    count(PointOfOrigin_X ) %>% 
    collect()
}

{ # VisitLink  --------------------------------------------------------------

  df_summary  %>% 
    filter(file == "CORE",
           db == 'SEDD')%>% 
    group_by(db) %>% 
    slice(1) %>% 
    ungroup() %>% 
    pull(dataset_id) %>% 
    paste0("raw-hcup/",.,".parquet")
  ds = open_dataset('raw-hcup/NY_SEDD_2017_CORE.parquet')
  
  ds %>% count(VisitLink)
}

{ # Race +Hispanic ----------------------------------------------------------

  
  
  df_summary %>% 
    filter(file =='CORE') %>% 
    slice(3,13) %>% 
    pull(dataset_id)
  
  ## 
  id = 'AZ_SID_2016_CORE'
  id = 'GA_SID_2017_CORE'
  ds = glue("raw-hcup/{id}.parquet") %>% open_dataset()
  
  ds %>% count(RACE, HISPANIC) %>% collect()
}


{ # KEY dictionary ----------------------------------------------------------

  # df_key = df_summary %>% 
  #   filter(file =='CORE') %>% 
  #   mutate(path = glue("raw-hcup/{dataset_id}.parquet")) %>%
  #   pull(path) %>% 
  #   map_df(~{
  #     open_dataset(.x) %>% count(KEY) %>% collect() %>% mutate(path = .x)
  #   })
  df_key %>% write_parquet(sink = 'clean/df_key.parquet')
   
}


{ # Polar joins 362018102833327 ---------------------------------------------

  df_key = read_parquet()
}
