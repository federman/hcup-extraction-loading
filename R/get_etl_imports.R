#' brings in objects for ETL workbench
#' 

get_etl_imports <- function(){
  
  { # Paths -------------------------------------------------------------------
    
     paths = lst(
       path_server = '//files.drexel.edu/encrypted/SOPH/UHC/SchnakeMahl_HCUP',
       path_server_raw  = glue("{path_server}/raw"),
       path_server_dbt =  glue("{path_server}/dbt/v0"),  
       path_server_dbt_source = glue("{path_server_dbt}/sources"), 
     )
    
  }
}
