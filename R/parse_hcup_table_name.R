#' This function will return the status of various files available for
#' each dataset_id. Currently it only works in the `dev` context and
#' searches the /raw-hcup directory for these files.
#' 
#' Example
#'    table)na

source("R/get_dbt_tags.R")

parse_hcup_table_name = function(table_name) {
  {
    # Setup -------------------------------------------------------------------
    
    {
      ## Local Objects
      vec__state_datasets = c("sedd", "sid")
    }
    
    {
      ## Decompose table name
      table_split_raw = table_name %>%
        str_to_lower() %>%
        str_split('_') %>%
        .[[1]] 
      stg__table_info =  lst(
          state = table_split_raw[1],
          database = table_split_raw[2],
          year = str_sub(table_split_raw[3],1,4)|> as.numeric(),
          year_grp = case_when(
            between(year, 2019, 2021) ~ '2019_2021',
            between(year, 2016, 2018) ~ '2016_2018',
            between(year, 2015, 2015) ~ '2015',
            between(year, 2005, 2014) ~ '2005_2014',
            TRUE  ~ "9999"   ),
          table = paste(table_split_raw[4:length(table_split_raw)], collapse = '_') )
    }
    
  }
  
  
  
  {
    # Op. table description  ---------------------------------------------------
    
    {
      ## Op. db_year doc block id
      stg__db_year_doc_id = glue("{stg__table_info$database}_{stg__table_info$year_grp}_description")
    }
    
    {
      ## Op. table doc block id
      stg__table_doc_id = c(stg__table_info$database,
                            stg__table_info$table,
                            stg__table_info$year_grp,
                            'description') %>%
        paste(collapse = '_')
    }
    
    table_desc = glue('{{{{ doc("{stg__table_doc_id}") + "\\n" + "\\n" + doc("{stg__db_year_doc_id}")}}}}')
  }
  
  
  
  {
    # Return  metadata list   ------------------------------------------------------
    int_table_info = c(
      "db_tags" =  get_dbt_tags(stg__table_info$database)  ,
      "db_desc" =  paste0('{{ doc("', stg__table_info$database, '_description") }}'),
      "name" = table_name %>% str_to_lower,
      "year_grp" = stg__table_info$year_grp,
      "geo" = ifelse(
        stg__table_info$database %in% vec__state_datasets,
        'state',
        'nationwide'
      ),
      "file_desc" = table_desc
    )
    
    table_info_final = c(stg__table_info, int_table_info) %>%  as.list()
    return(table_info_final)
  }
  
  
}
