{# 0. Setup ----
  ## Load Dependencies
  rm(list= ls()); options(scipen = 999)
  library(rstudioapi) 
  library(glue)         
  library(stringr)
  library(readstata13)
  library(arrow)
  library(tidyverse)
  
  ## Set directory and load helpers 
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
  sapply(list.files(path = 'R/', all.files = T,recursive = T, full.names = T, pattern = '.R'), source)
}



{ # 1. Extraction ----

  ## Step 1: Evaluate ELT status
  get_elt_status()
  
  ## Step 2: Copy and .Do files as needed
  copy_load_program()
  
  ## Step 3: Run STATA to generate dta
  get_elt_status() %>% select(-parquet, -codebook)
  
  ## Step 4: Load as parquet
  load_dta_to_db()
  
  ## Step 5: Generate codebooks
  generate_codebooks()
}




{ # 2. Datastores -----------------------------------------------------------
  
  ## combined codebook for local EDA
  get_elt_status() %>% 
    make_target_endpoints() %>% 
    pull(path_codebook) %>% 
    map_df(~fread(.)) %>% 
    as_tibble() %>% 
    fwrite("clean/df_codebooks.csv")
    
    
  ## generate docs blocks in .md for DBT
  
  generate_source_yml()
  
  
}
