#' This function will return the status of various files available for
#' each dataset_id. Currently it only works in the `dev` context and
#' searches the /raw-hcup directory for these files. 




get_dbt_models_dir = function(table_info){
  
  
  ## table parameter 

  
  ## get end path
  local_path = getwd()
  git_index = local_path %>% str_locate('git') %>% max()
  base_path = local_path %>% str_sub(0,git_index)
  repo_dir = 'hcup-dbt/models/docs'
  endpoint_dir = glue("{base_path}/{repo_dir}/{table_info$geo}/{table_info$database}/{table_info$year_grp}/{table_info$state}")
  endpoint_file = glue("{endpoint_dir}/{str_to_lower(glue('{table_info$name}.yml'))}")
  
  ## return
  endpoint = list(
    dir = endpoint_dir,
    file = endpoint_file
  )
  return(endpoint)
}
