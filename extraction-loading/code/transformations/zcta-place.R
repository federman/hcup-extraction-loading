{
  # Setup -------------------------------------------------------------------
 
  df_raw = read.csv("seeds/raw/zcta_place_rel_10.txt") %>% 
    as_tibble()
  
  
}


{ # QC ----------------------------------------------------------------------
  
  ## Check that 1:1 zip to zcta: Good!
  xwalk_zip_zcta %>% count(ZIP) %>% count(n)
  
  
}

{ # Op. as parquet ----------------------------------------------------------
  
  xwalk_zip_zcta %>% arrow::write_parquet("clean/xwalk_zip_zcta.parquet")
}
