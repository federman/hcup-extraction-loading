{
  # Setup -------------------------------------------------------------------
 
  xwalk_zcta_place = read.csv("seeds/raw/zcta_place_rel_10.txt") %>% 
    as_tibble() %>% 
    mutate(ZCTA = str_pad(ZCTA5,width=5,side='left', pad='0' )) %>% 
    select(ZCTA, PLACE = GEOID) %>% 
    mutate_all(~as.character(.x)) %>% 
    distinct()
  
}


{ # QC ----------------------------------------------------------------------
   
  
  
}

{ # Op. as parquet ----------------------------------------------------------
  
  xwalk_zcta_place %>% arrow::write_parquet("clean/xwalk_zcta_place.parquet")
}
