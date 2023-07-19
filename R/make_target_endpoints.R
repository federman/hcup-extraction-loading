#' returns a data frame with target endpoints for .parquet and codebooks
#'
#' @param df_status: table containined elt_status, specifically we will mutate
#' a valid path using dataset_id.
#' @param keep_column: string of which other columns to keep other than dataset_id 
#' and paths. 
#'
#'
#' Example:
#'    - df_status = get_etl_status(path = T); keep_column = 'codebook'

make_target_endpoints = function(df_status, keep_column = NA){
  
  df_path = df_status%>% 
    mutate(path_dta = glue("{dir}/{dataset_id}.dta"),
           path_parquet = glue("{dir}/{dataset_id}.parquet"),
           path_codebook = glue("{dir}/{dataset_id}_codebook.csv"))
  
  if (is.na(keep_column)){
    df_final = df_path %>% 
      select(dataset_id, 
             contains("path") ) 
      
  }
  
  if (!is.na(keep_column)){
    df_final =  df_path %>% 
      select(dataset_id, 
             contains("path"),
             any_of(c(keep_column))) 
  }
  
  return(df_final)
}
