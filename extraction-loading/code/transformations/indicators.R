{
  # Setup -------------------------------------------------------------------
  load("seeds/raw/zcta_acs_az.rdata")
  load("seeds/raw/zcta_acs_fl.rdata")
  load("seeds/raw/zcta_acs_ga.rdata")
  load("seeds/raw/zcta_acs_ky.rdata")
  load("seeds/raw/zcta_acs_ma.rdata")
  load("seeds/raw/zcta_acs_nj.rdata")
  load("seeds/raw/zcta_acs_ny.rdata")

  df_acs_raw = list(zcta_acs_az,
                    zcta_acs_fl,
                    zcta_acs_ga ,
                    zcta_acs_ky ,
                    zcta_acs_ma ,
                    zcta_acs_nj ,
                    zcta_acs_ny ) %>% 
    bind_rows() %>% 
    ungroup() %>% 
    select(-contains('state')) %>% 
    rename(YEAR = year, ZCTA  = zcta)

  
}

{ # get cross-sectioanl indicators  -------------------------------------------------------
   
  df_indicators = df_acs_raw %>% 
    group_by(ZCTA) %>% 
    filter(YEAR == max(YEAR)) %>% 
    ungroup() 
}

{ # load to dbt  ------------------------------------------------------------
  df_indicators %>% write_parquet(sink = glue("seeds/acs_zcta_indicators.parquet"))
}
