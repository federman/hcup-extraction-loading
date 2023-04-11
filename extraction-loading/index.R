{# 0. Setup ----

  { # Load pipeline packages ----------------------------------------------
    
    ## Packages
    rm(list = ls())
    suppressWarnings({
      suppressMessages({
        library(rstudioapi) 
        library(cli)
        library(glue)         
        library(stringr)
        library(yaml)
        library(data.table)
        library(arrow)
        library(tidyverse)
      })
    })
    
    ## Options
    options(cli.unicode = TRUE)
    options(readr.show_col_types = FALSE)
  }
  
  { # Load pipeline dependencies ----------------------------------------------

    ## Utility functions
    list.files(path = 'R/', all.files = T,recursive = T, full.names = T, pattern = '.R') %>% 
      walk(~source(.x))
    
    ## Imports
    df_summary = arrow::read_parquet("clean/df_summary.parquet")
    load("clean/df_sid_base_fields.rdata")
  }
  
  { # Scripts -------------------------------------------------------------------
    'code/eda/eda/v0.2/eda.R'
    'code/dbt/sid-base-models.R'
    'code/dbt/sedd-base-models.R'
    'code/transformations/indicators.R'
    'code/transformations/zip-zcta.R'
    'code/transformations/zip-ruca.R'
    'code/transformations/zcta-place.R'
    
  }
  
  cli_alert_success("SALURBAL ETL pipeline setup completed!")
}
 
{ # 1. Extraction (done on desktop with high RAM) ----
  
  ## Step 1: Evaluate ELT status
  get_elt_status()  
  
  ## Step 2: Copy load programs
  copy_load_program()  
  
  ## Step 3: Run load programs 
  get_elt_status() %>% filter(is.na(loaded_data)) 
  
  ## Step 4: Load as parquet
  etl_to_db(xwalk_zip_zcta)
  
  get_elt_status() %>% filter(is.na(parquet)) 
  
  
  ## Step 5: Generate codebooks
  generate_codebooks()
}




{ # 2. Loading  -----------------------------------------------------------
  
  ## load source.ymls into dbt
  get_file_ids() %>% walk(~generate_source_yml(.x))
  
  ## SID base models
  ### . sql
  df_sid_base_fields %>% 
    filter(year >=2016, state !='MA') %>% 
    group_by(row_number()) %>% 
    group_walk(~{
      write_dbt_base_model(.x$db, .x$dataset_id, .x$state, .x$base_fields)
      })
  
  
  get_stage_models() %>% walk(~generate_stg_model_yml(.x))
  
  
}
