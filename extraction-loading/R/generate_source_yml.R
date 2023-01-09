#' This function will take in a few arguemtns (mainly table name + metadata) and write dbt 
#' source.yml files for those tables into the dbt repository. It relies on two help functions
#' listed below
#' 
#' @param table_name: is the raw HCUP table name it should be upper case. e.g  table_name = 'NY_SEDD_2017_CHGS'

source("R/parse_hcup_table_name.R")
source("R/get_dbt_models_dir.R")


generate_source_yml <- function(table_name,db_external_loc) {

  # Parameters
  db_external_loc = "D:\\git\\hcup-extraction-loading\\extraction-loading\\raw-hcup\\{name}.parquet"
  table_name = 'NY_SEDD_2017_CHGS'
  
  ## Staging
  db_tags = list(
    sedd = c('State','ER','SEDD')
  )
  
  
  ## Intermediaa
  table_info = parse_hcup_table_name(table_name)
  db_tags_tmp = db_tags[[table_info$database]]
  table_desc = paste0('New York State SEDD 2017 CHGS. ','{{ doc("sedd_',table_info$table,'_description") }}' ) %>% 
    noquote()
  db_desc  = '{{ doc("sedd_description") }}'
  
  
  # Create a list object representing the source.yml configuration
  source_yml <- list(
    version= as.integer(2),
    sources= list(
      list(
        name= table_info$database %>% str_to_upper(),
        tags= db_tags_tmp,
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
  endpoint = get_dbt_models_dir(table_info)
  
  
  # Write actual yaml file
  if(file.exists(endpoint$dir)) {
    message(glue("Write source.yml for {table_name}"))
    write_yaml(source_yml, endpoint$file)
  }
  # write_yaml(source_yml, "source.yml")
  
}
