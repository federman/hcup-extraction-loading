#' will generate a base model .sql for DBT
#' 
#'   @param db: a string specifiying database of table. Acceptable values in "SEDD" and "SID"
#'   @param dataset_id_tmp: a string specifying dataset id in upper case - e.g. NY_SID_2017_CORE
#'   @param fields: a list of base fields
#'   
#'   Example:
#'      db = "SID"; dataset_id_tmp = 'NY_SID_2017_CORE'; state = "NY"; fields = as.list(c("KEY","AMONTH"))
#'   

write_base_model_sql = function(db, dataset_id_tmp, state, fields){
  
  cli_alert("Start base__model.sql for {dataset_id_tmp}")
  
  fields = unlist(fields)
base_model_template_sql <-  "{{ config(materialized='external', format =  target.schema) }}
SELECT
  {{ fields }},
  'sid_core' AS db_file,
  CONCAT_WS('', AYEAR, '-', AMONTH, '-01') AS admit_date,
FROM {{ source('{{ db }}', '{{ dataset }}') }}

{{ limit_data_in_dev() }}"
 
  # Replace {{ fields }} with vector of fields  
  base_model_template_sql <- gsub("\\{\\{\\s*fields\\s*\\}\\}", paste( fields, collapse = ",\n  "), base_model_template_sql)
  base_model_template_sql <- gsub("\\{\\{\\s*db\\s*\\}\\}",db, base_model_template_sql)
  base_model_template_sql <- gsub("\\{\\{\\s*dataset\\s*\\}\\}",dataset_id_tmp, base_model_template_sql)
  
  
  # Export
  base_model_file = glue("base__{str_to_lower(dataset_id_tmp)}.sql")
  endpoint = glue("../../hcup-dbt/models/base/{db}/{state}/{base_model_file}")
  write(base_model_template_sql, file = endpoint)
  cli_alert_success("{base_model_file} written")
}
