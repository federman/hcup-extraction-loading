library(rstudioapi) 
library(yaml)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

generate_source_yml <- function() {

  db_name = 'SEDD'
  db_tags = '["State","Emergency Department","ER","SEDD"]'
  db_desc  = '{{ doc("sedd_description") }}'
  db_external_loc = "D:\\git\\hcup-extraction-loading\\extraction-loading\\raw-hcup\\{name}.parquet"
  table_name = 'NY_SEDD_2017_CHGS'
  table_desc = 'New York State SEDD 2017 CHGS'
  
  # Create a list object representing the source.yml configuration
  source_yml <- list(
    version= 2,
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
  
  # Write the list object to a file
  write_yaml(source_yml, "source.yml")
}

generate_source_yml()
