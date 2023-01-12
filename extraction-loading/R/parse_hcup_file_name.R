#' This function will return the status of various files available for
#' each dataset_id. Currently it only works in the `dev` context and
#' searches the /raw-hcup directory for these files. 

source("R/get_dbt_tags.R")

parse_hcup_file_name = function(file_name){
  
  ## Local objects
  vec__state_datasets = c("sedd","sid")

  ## Staging
  stg_table_info = file_name %>% 
    str_to_lower() %>% 
    str_split('_') %>% 
    .[[1]] %>% 
    set_names(c("state",'database','year','table')) 
  stg_year_grp = case_when(
    between(stg_table_info['year'],2019,2021)~'2019_2021',
    between(stg_table_info['year'],2016,2018)~'2016_2018'
  )
  stg_file_doc_block_id = c(stg_table_info['database'],
                            stg_table_info['table'],
                            stg_year_grp,
                            'description') %>%
    paste(collapse = '_')
  stg_file_desc_intro = paste(c(str_to_upper(stg_table_info), 'file. '), collapse = ' ')
  table_desc = paste0(stg_file_desc_intro,
                      '{{ doc("',stg_file_doc_block_id,'") }}' ) 
  
  ## Intermediate
  int_table_info = c(
    "db_tags" =  get_db_tags(stg_table_info['database'])  ,
    "db_desc" =  paste0('{{ doc("',stg_table_info['database'],'_description") }}'),
    "name" = file_name %>% str_to_lower,
    "year_grp" = stg_year_grp,
    "geo" = ifelse(stg_table_info['database']%in%vec__state_datasets,'state','nationwide' ),
    "file_desc" = table_desc
  )
  
  ## Final
  table_info_final = c(stg_table_info,int_table_info) %>%  as.list()
  return(table_info_final)
}
