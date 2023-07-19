#' This function will return the status of various files available for
#' each dataset_id. Currently it only works in the `dev` context and
#' searches the /raw-hcup directory for these files. 




get_dbt_source_dir = function(file_metadata){
  
  
  ##  parameters 
  local_path = getwd()
  env = ifelse(local_path == "D:/git/hcup-extraction-loading/extraction-loading",'dev','prod')

  ## generate endpoint
  if (env == "dev"){
    git_index = local_path %>% str_locate('git') %>% max()
    base_path = local_path %>% str_sub(0,git_index)
    repo_dir = 'hcup-dbt/models/sources'
    endpoint = glue("{base_path}/{repo_dir}/{file_metadata$database}/{str_to_lower(glue('{file_metadata$name}.yml'))}")
  } else {
    git_index = local_path %>% str_locate('Git') %>% max()
    base_path = local_path %>% str_sub(0,git_index)
    repo_dir = 'hcup-dbt/models/sources'
    endpoint = glue("{base_path}/{repo_dir}/{file_metadata$database}/{str_to_lower(glue('{file_metadata$name}.yml'))}")
  }
  
  ## return
  return(endpoint)
}
