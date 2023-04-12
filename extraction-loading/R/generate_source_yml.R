#' This function will take in a hcup file name and generate the source.yml for dbt.
#'
#' It relies on two helper functions
#'    - parse_hcup_table_name() will return metadtata for this file
#'    - get_dbt_source_dir() returns where the soruce.yml should be written to
#'
#' @param table_name: is the raw HCUP table name it should be upper case.
#'        table_name = 'NY_SEDD_2017_CHGS'
#' @param env: env will determine location of source file (local vs remote)
#'
#'
#' Example:
#'    table_name = 'AZ_SID_2015q1q3_DX_PR_GRPS'

source("R/parse_hcup_table_name.R")
source("R/get_dbt_source_dir.R")


df_codebooks = read_csv("clean/df_codebooks.csv")

generate_source_yml <- function(table_name, env) {
  {  # Setup -------------------------------------------------------------------
    cli_alert("Start source.yml generation for {table_name}")
    source_loc = ifelse(env == "ran",
                        "D:\\git\\hcup-extraction-loading\\extraction-loading\\raw-hcup\\{name}.parquet",
                        "\\\\files.drexel.edu\\encrypted\\SOPH\\UHC\\SchnakeMahl_HCUP\\dbt\\v0\\sources\\{name}.parquet")
    if (env == "ran"){cli_alert_warning('saving to local source folder!')}
    file_metadata = parse_hcup_table_name(table_name)
    src_endpoint = get_dbt_source_dir(file_metadata)
  }
  
  { # Column Metadata ---------------------------------------------------------
    column_metadata = df_codebooks %>%
      filter(dataset_id == table_name) %>%
      group_by(row_number()) %>%
      group_map( ~ {
        column = list(
          name = .x$var,
          type = .x$value_type,
          description = .x$var_label
        )
        return(column)
      })
  }
  
  { # source.yml --------------------------------------------------------------
    source_yml <- list(version = as.integer(2),
                       sources = list(
                         list(
                           name = file_metadata$database %>% str_to_upper(),
                           tags = file_metadata$db_tags,
                           description = file_metadata$db_desc,
                           meta = list(external_location = source_loc),
                           tables = list(
                             list(
                               name = table_name,
                               description = file_metadata$file_desc,
                               columns = column_metadata )   )  )   ))
  }
  
  
  { # Write -------------------------------------------------------------------
    write_yaml(source_yml, src_endpoint)
    cli_alert_success("Write source.yml for {table_name}")
  }
  
}
