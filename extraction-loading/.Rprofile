{ # renv --------------------------------------------------------------------
  source("renv/activate.R")  
}

{ # Setup -------------------------------------------------------------------
  
  ## Clear + activate renv
  #  rm(list=ls())
  

  { # Load base packages ------------------------------------------------------
    library(base)
    library(datasets)
    library(stats)
    library(utils)
    library(methods)
    library(graphics)
    library(grDevices)
  }
  
  { # Load pipeline packages ----------------------------------------------
    
    ## Packages
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
    list.files(path = 'R/', all.files = T,recursive = T, full.names = T, pattern = '.R') %>% walk(~source(.x))
    
    ## Imports

  }
  
  
  cli_alert_success("SALURBAL ETL pipeline setup completed!")
}
