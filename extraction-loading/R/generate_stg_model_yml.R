#' Goal here to write a function taht writes documentation on columns in YAML
#' @param dataset_id: dataset id
#'          
#' @param columns : a vector of column names to pull from the codebook
#' 
#' 
#' @example:
#'    stg_model_metadata = get_stage_models()[[1]]

generate_stg_model_yml = function(stg_model_metadata){
   
  ## Stage
  stg_model_tags = get_dbt_tags(stg_model_metadata$database, stg = T) %>% unlist()
  
  ## Intermediate
  int_yml <- list(
    version= as.integer(2),
    models= list(
      list(
        name = stg_model_metadata$model,
        description =  paste0('{{ doc("stg_',stg_model_metadata$database,'_description") }}'),
        docs = list(
          node_color = '#829356'
        ),
        config = list(
          tags = stg_model_tags
        ),
        columns = stg_model_metadata$columns
      )
    )
  )
  
  ## Final
  write_yaml(x = int_yml,
             file = stg_model_metadata$yml_path)
  
}

