{
  # Setup -------------------------------------------------------------------
  load("seeds/raw/zip_zcta_cw_2010_2019.Rdata")
  xwalk_zip_zcta = zip_zcta_cw %>% 
    as_tibble() %>% 
    mutate_all(~as.character(.x)) %>% 
    select(ZIP = zip, ZCTA = zcta)
  
  
}


{ # QC ----------------------------------------------------------------------
  
  ## Check that 1:1 zip to zcta: Good!
  xwalk_zip_zcta %>% count(ZIP) %>% count(n)
  
  
}

{ # Op. as parquet ----------------------------------------------------------
  
  xwalk_zip_zcta %>% arrow::write_parquet("clean/xwalk_zip_zcta.parquet")
}
