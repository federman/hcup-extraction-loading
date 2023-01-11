#' This function will return the status of various files available for
#' each dataset_id. Currently it only works in the `dev` context and
#' searches the /raw-hcup directory for these files. 




get_dbt_models_dir = function(file_metadata){
  
  
  ##  parameters 
  local_path = getwd()
  env = ifelse(local_path == "D:/git/hcup-extraction-loading/extraction-loading",'dev','prod')

  ## generate endpoint
  if (env == "dev"){
    git_index = local_path %>% str_locate('git') %>% max()
    base_path = local_path %>% str_sub(0,git_index)
    repo_dir = 'hcup-dbt/models/docs'
    endpoint_dir = glue("{base_path}/{repo_dir}/{file_metadata$geo}/{file_metadata$database}/{file_metadata$year_grp}/{file_metadata$state}")
    endpoint_file = glue("{endpoint_dir}/{str_to_lower(glue('{file_metadata$name}.yml'))}")
  } else {
    git_index = local_path %>% str_locate('Git') %>% max()
    base_path = local_path %>% str_sub(0,git_index)
    repo_dir = 'hcup-dbt/models/docs'
    endpoint_dir = glue("{base_path}/{repo_dir}/{file_metadata$geo}/{file_metadata$database}/{file_metadata$year_grp}/{file_metadata$state}")
    endpoint_file = glue("{endpoint_dir}/{str_to_lower(glue('{file_metadata$name}.yml'))}")
  }
  
  ## return
  endpoint = list(
    dir = endpoint_dir,
    file = endpoint_file
  )
  return(endpoint)
}
