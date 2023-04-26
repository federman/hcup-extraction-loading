#' Function  will access parquet marts and convert to .dta and .sas7bdat
#' 
#' @param version string: release version
#' 
#' Example
#'    version = 'v0'

diversify_marts  = function(version){
  # mart_dir = glue('\\files.drexel.edu\encrypted\SOPH\UHC\SchnakeMahl_HCUP\dbt\{version}\models')
  # list.files(mart_dir) %>% 
  #   keep(~str_detect(.,'mart')&str_detect(.x,'parquet')) %>% 
  #   walk(~{
  #     mart_file = .x
  #     mart_name = mart_file %>% str_remove(".parquet")
  #     df_mart = arrow::read_parquet(glue("{mart_dir}{mart_name}.parquet"))
  #     df_mart %>% haven::write_sas(glue("{mart_dir}{mart_name}.sas7bdat"))
  #     df_mart %>% haven::write_dta(glue("{mart_dir}{mart_name}.dta"))
  #     cli_alert_success("Diversify outputs for {mart_file}")
  #   })
}