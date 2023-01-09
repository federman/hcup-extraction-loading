#' This function will return the status of various files available for
#' each dataset_id. Currently it only works in the `dev` context and
#' searches the /raw-hcup directory for these files. 



parse_hcup_table_name = function(table_name){
  table_info = table_name %>% 
    str_to_lower() %>% 
    str_split('_') %>% 
    .[[1]] %>% 
    set_names(c("state",'database','year','table')) %>% 
    c(.,c("name" = table_name %>% str_to_lower)) %>% 
    as.list()
  return(table_info)
}
