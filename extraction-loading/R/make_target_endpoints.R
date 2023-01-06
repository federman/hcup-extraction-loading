#' returns a data frame with target endpoints for .parquet and codebooks
#'
#' @param df_status: table containined elt_status, specifically we will mutate
#' a valid path using dataset_id.
#' @param keep_column: string of which other columns to keep other than dataset_id 
#' and paths. 
#'

make_target_endpoints = function(df_status, keep_column = 0){
  keep_column = "codebook"
  
  col_index_keep = which(names(df_status)== keep_column)
  
  df_status%>% 
    mutate(path_dta = glue("raw-hcup/{dataset_id}.dta"),
           path_parquet = glue("raw-hcup/{dataset_id}.parquet"),
           path_codebook = glue("raw-hcup/{dataset_id}_codebook.csv")) %>% 
    select(dataset_id, 
           contains("path"),
           ifelse(is_empty(col_index_keep),0,col_index_keep)) %>% 
    return()
}
