#' This function will take in a few arguemtns (mainly table name + metadata) and write dbt 
#' source.yml files for those tables into the dbt repository. It relies on two help functions
#' listed below
#' 
#' @param file_name: is the raw HCUP table name it should be upper case. 
#'        file_name = 'NY_SEDD_2017_CHGS'
#' @param env: env will determine location of source file (local vs remote)

source("R/parse_hcup_file_name.R")
source("R/get_dbt_models_dir.R")
df_codebooks = read_csv("clean/eda/df_codebooks.csv")

generate_source_yml <- function(file_name, env = "dev") {

  # Staging
  source_loc = case_when( 
    env == "dev" ~ "D:\\git\\hcup-extraction-loading\\extraction-loading\\raw-hcup\\{name}.parquet"
    )
  file_metadata = parse_hcup_file_name(file_name)
  column_metadata = df_codebooks %>% 
    filter(dataset_id == file_name) %>% 
    group_by(row_number()) %>%
    group_map(~{
      column = list(
        name = .x$var,
        type = .x$value_type,
        description = .x$var_label
      )
      return(column)
    })
  endpoint = get_dbt_models_dir(file_metadata)
  
  ## Intermediate
  source_yml <- list(
    version= as.integer(2),
    sources= list(
      list(
        name= file_metadata$database %>% str_to_upper(),
        tags= file_metadata$db_tags,
        description = file_metadata$db_desc,
        meta = list(
          external_location = source_loc
        ),
        tables = list(
          list(
            name = file_name,
            description = file_metadata$file_desc,
            columns = column_metadata
          )
        )
      )
    )
  )
  
  
  # Final
  if (file.exists(endpoint$dir)) {
    message(glue("Write source.yml for {file_name}"))
    write_yaml(source_yml, endpoint$file)
  } else {
    message(glue("ERROR: NEED TO  CREATE DIRECTORY FOR {file_name}"))
  }
  
}
