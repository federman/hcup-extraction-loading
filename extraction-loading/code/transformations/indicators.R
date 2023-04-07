{
  # Setup -------------------------------------------------------------------
  load("seeds/raw/zcta_acs_7state_2018.rdata")
  dfa = zcta_acs_7state_2018
  
  vec__indicators = dfa %>%
    ungroup() %>%
    select(-c(year, state_fips, state_abbr, zcta)) %>%
    names()
  
  
}

{ # codebook template -------------------------------------------------------
  
  df_template = tibble(
    var_name = vec__indicators,
    value_type = NA,
    var_def = NA )
  
  df_template %>% fwrite("seeds/raw/zcta_acs_7state_2018_codebook_template.csv")
}