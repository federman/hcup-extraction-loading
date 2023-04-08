{
  # Setup -------------------------------------------------------------------
  xwalk_zip_urban = readxl::read_excel("seeds/raw/RUCA2010zipcode.xlsx",
                      sheet = "Data") %>% 
    select("ZIP"="ZIP_CODE",
           "RUCA"="RUCA1") %>% 
    mutate(urban =  RUCA<4)
  
  
}


{ # QC ----------------------------------------------------------------------
  
  ## Check that 1:1 zip to zcta: Good!
  xwalk_zip_urban %>% count(ZIP) %>% count(n)
  
  
}

{ # Op. as parquet ----------------------------------------------------------
  
  xwalk_zip_urban %>% arrow::write_parquet("clean/xwalk_zip_urban.parquet")
}

