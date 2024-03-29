#' will generate a base model .sql for DBT
#' 
#'   @param db: a string specifiying database of table. Acceptable values in "SEDD" and "SID"
#'   @param dataset_id_tmp: a string specifying dataset id in upper case - e.g. NY_SID_2017_CORE
#'   @param fields: a list of base fields
#'   
#'   Example:
#'     row = df_sid_base_fields %>% filter(dataset_id == 'AZ_SID_2016_CORE')
#'     row = df_sid_base_fields %>% filter(dataset_id == 'AZ_SID_2016_CHGS')
#'     db = row$db; file = row$file; dataset_id_tmp = row$dataset_id; state = row$state; fields = row$base_fields


# write_dbt_base_model = function(db, file, dataset_id_tmp, state, fields){
write_dbt_base_model = function(row){
  
base_model_template_sql <-  "{{ config(materialized='external', format =  target.schema) }}
SELECT
  {{ fields }},
  {{ state }}
FROM {{ source('{{ db }}', '{{ dataset }}') }}

{{ {{ dev_macro }} }}


{{ group_CHGS }}"
  
  {# Setup -------------------------------------------------------------------
    db = row$db 
    file = row$file
    dataset_id_tmp = row$dataset_id
    state = row$state
    year = row$year
    fields = row$base_fields   
    cli_alert("Start base__model.sql for {dataset_id_tmp}")
    fields = unlist(fields)    
    base_model_file_name = glue("base__{str_to_lower(dataset_id_tmp)}")
    base_model_sql_name = glue("{base_model_file_name}.sql")
    base_model_yml_name = glue("{base_model_file_name}.yml")
    sql_endpoint = glue("../../hcup-dbt/models/base/{db}/{state}/{base_model_sql_name}")
    yml_endpoint = glue("../../hcup-dbt/models/base/{db}/{state}/{base_model_yml_name}")
    
    
    ## File specific
    dev_macro_func = ifelse(file == 'CORE','limit_data_in_dev()',glue("limit_chgs_in_dev(core_model = '{str_replace(base_model_file_name,'chgs','core')}')"))
    group_CHGS_sql = ifelse(file == 'CORE','','GROUP BY KEY')
    state_tmp = ifelse(file == 'CORE',  glue("'{state}' AS state,"),'')
  
  }

  { # Generate .sql -------------------------------------------------------------
    base_model_template_sql <- gsub("\\{\\{\\s*fields\\s*\\}\\}", paste( fields, collapse = ",\n  "), base_model_template_sql)
    base_model_template_sql <- gsub("\\{\\{\\s*db\\s*\\}\\}",db, base_model_template_sql)
    base_model_template_sql <- gsub("\\{\\{\\s*dataset\\s*\\}\\}",dataset_id_tmp, base_model_template_sql)
    base_model_template_sql <- gsub("\\{\\{\\s*file\\s*\\}\\}",file, base_model_template_sql)
    base_model_template_sql <- gsub("\\{\\{\\s*state\\s*\\}\\}",state_tmp, base_model_template_sql)
    base_model_template_sql <- gsub("\\{\\{\\s*dev_macro\\s*\\}\\}",dev_macro_func, base_model_template_sql)
    base_model_template_sql <- gsub("\\{\\{\\s*group_CHGS\\s*\\}\\}",group_CHGS_sql, base_model_template_sql)
  }
  
  {# Write .sql --------------------------------------------------------------
    write(base_model_template_sql, file = sql_endpoint)
    cli_alert_success("{base_model_sql_name} written")        
  }
  
  { # Generate .yml -----------------------------------------------------------
    
    df_codebooks = read.csv("clean/df_codebooks.csv") %>% as_tibble()
    model_columns = fields %>% 
      map_chr(~.x %>% recode("SUM(CHARGE) AS total_charge"='total_charge')) %>% 
      c('state') %>% 
      discard(~(.x=='state'&file!='CORE'))
    df_file_codebook = df_codebooks %>%
      filter(dataset_id == dataset_id_tmp,
             var%in%model_columns)
    df_model_new_columns = tibble(var = model_columns,
                                  database = str_to_lower(db)) %>% 
      filter(!var%in%df_file_codebook$var,
             !str_detect(var, 'NULL')) 
    
    ## int
    columns_src = df_file_codebook %>% 
      group_by(row_number()) %>% 
      group_map(~{
        list(
          name = .x$var,
          type = .x$value_type,
          description = .x$var_label
        )
      })
    columns_new = df_model_new_columns %>% 
      group_by(row_number()) %>% 
      group_map(~{
        list(
          name = .x$var,
          description =  paste0('{{ doc("base__',.x$database,'_',.x$var,'_description") }}')
        )
      })
    columns_metadata = c(columns_src,columns_new)
    
    ## final
    metadata_tmp =  list(
      # model_path = .x$model_path,
      yml_path = yml_endpoint,
      model = base_model_file_name,
      database = str_to_lower(db),
      dataset_id = dataset_id_tmp,
      columns = columns_metadata
    )    
  }
  
  
  { # Write .yml --------------------------------------------------------------

    ## Stage
    stg_model_tags = get_dbt_tags(metadata_tmp$database, base = T) %>% unlist()
    
    ## Intermediate
    int_yml <- list(
      version= as.integer(2),
      models= list(
        list(
          name = metadata_tmp$model,
          description =  paste0('{{ doc("base__',metadata_tmp$database,'_description") }}'),
          docs = list(
            node_color = '#829356'
          ),
          config = list(
            tags = stg_model_tags
          ),
          columns = metadata_tmp$columns
        )
      )
    )
    
    ## Final
    write_yaml(x = int_yml,
               file = metadata_tmp$yml_path)    
  }
  
}
