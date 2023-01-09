library(rstudioapi) 
library(yaml)
library(glue)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

vec__state_datasets = c("sedd","sid")

parse_hcup_table_name = function(table_name){
  table_info = table_name %>% 
    str_to_lower() %>% 
    str_split('_') %>% 
    .[[1]] %>% 
    set_names(c("state",'dataset','year','table'))
  return(table_info)
}


get_dbt_models_dir = function(table_name){
  
  ## table parameter 
  table_info = parse_hcup_table_name(table_name)
  tier1_path = ifelse(table_info['dataset']%in%vec__state_datasets,'state','nationwide' )
  tier2_path = table_info['dataset']
  tier3_path = table_info['state']
  tier4_path = glue("{table_name}.yml") %>% str_to_lower()
  
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

generate_source_yml <- function() {

  # Parameters
  db_name = 'SEDD'
  db_tags = c("State","Emergency Department","ER","SEDD")
  db_desc  = '{{ doc("sedd_description") }}'
  db_external_loc = "D:\\git\\hcup-extraction-loading\\extraction-loading\\raw-hcup\\{name}.parquet"
  table_name = 'NY_SEDD_2017_CHGS'
  table_desc = 'New York State SEDD 2017 CHGS'
  
  # Create a list object representing the source.yml configuration
  source_yml <- list(
    version= as.integer(2),
    sources= list(
      list(
        name= db_name,
        tags= db_tags,
        description = db_desc,
        meta = list(
          external_location = db_external_loc
        ),
        tables = list(
          list(
            name = table_name,
            description = table_desc
          )
        )
      )
    )
  )
  
  # Check directory exists
  endpoint = get_dbt_models_dir(table_name)
  
  
  # Write actual yaml file
  if(file.exists(endpoint$dir)) {
    write_yaml(source_yml, endpoint$file)
  }
  write_yaml(source_yml, "source.yml")
  
}

generate_source_yml()
