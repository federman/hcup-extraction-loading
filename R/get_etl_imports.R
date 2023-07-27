#' brings in objects for ETL workbench
#' 

get_etl_imports <- function(){
  
  { # Paths -------------------------------------------------------------------
    
     paths = lst(
       path_server_raw  = '//files.drexel.edu/encrypted/SOPH/UHC/SchnakeMahl_HCUP/raw',
       path_server_dbt_source = '//files.drexel.edu/encrypted/SOPH/UHC/SchnakeMahl_HCUP/dbt/v0/sources'
     )
    
  }
}