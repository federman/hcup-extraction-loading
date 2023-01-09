#' This function will return the status of various files available for
#' each dataset_id. Currently it only works in the `dev` context and
#' searches the /raw-hcup directory for these files. 
#' 
get_dbt_models_dir = function(table_info){
  
  vec__state_datasets = c("sedd","sid")
  
  ## table parameter 
  tier1_path = ifelse(table_info$database%in%vec__state_datasets,'state','nationwide' )
  tier2_path = table_info$database
  tier3_path = table_info$state 
  tier4_path = glue("{table_info$name}.yml") %>% str_to_lower()
  
  ## get end path
  local_path = getwd()
  git_index = local_path %>% str_locate('git') %>% max()
  base_path = local_path %>% str_sub(0,git_index)
  repo_dir = 'hcup-dbt/models/docs'
  endpoint_dir = glue("{base_path}/{repo_dir}/{tier1_path}/{tier2_path}/{tier3_path}")
  endpoint_file = glue("{endpoint_dir}/{tier4_path}")
  
  ## return
  endpoint = list(
    dir = endpoint_dir,
    file = endpoint_file
  )
  return(endpoint)
}
