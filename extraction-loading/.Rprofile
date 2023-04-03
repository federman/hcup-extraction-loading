{# 0. renv --------------------------------------------------------------------
  source("renv/activate.R")
}

{# 1. Setup ----
  ## Load Dependencies
  rm(list= ls()); options(scipen = 999, readr.show_col_types = FALSE)
  library(rstudioapi) 
  library(glue)         
  library(stringr)
  library(yaml)
  library(readstata13)
  library(data.table)
  library(arrow)
  library(tidyverse)
  library(cli)
  
  ## Set directory and load helpers 
  # setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
  list.files(path = 'R/', all.files = T,recursive = T, full.names = T, pattern = '.R') %>% 
    walk(~source(.x))
  
  cli_alert_success("HCUP ETL Setup Success!")
}
