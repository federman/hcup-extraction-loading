#' get stage models metadata

source('R/parse_hcup_file_name.R')

get_stage_models = function(){
  
  
  df_codebooks = read.csv("clean/df_codebooks.csv") %>% as_tibble()
    
  
  ## Stage: get paths
  stg_models = tibble(model_path = 
            list.files("../../hcup-dbt/models/staging/", 
                        recursive = T, full.names = T,)) %>% 
    rowwise() %>% 
    filter(str_detect(model_path,'.sql')) %>% 
    mutate(model = str_split(model_path,"/") %>% 
             as_vector() %>% 
             tail(n=1) %>% 
             str_remove(".sql"),
           dataset_id = model %>% 
             str_remove(".sql") %>% 
             str_remove("stg_") %>% 
             str_to_upper(),
           database = parse_hcup_file_name(dataset_id )$database,
           yml_path = str_replace(model_path,".sql",".yml")
           ) 
  stg_columns =  tibble(csv_path = 
           list.files("../../hcup-dbt/external/", 
                      recursive = T, full.names = T,)) %>% 
    rowwise() %>% 
    filter(str_detect(csv_path, '/stg_')) %>% 
    mutate(endpoint = str_split(csv_path,"/") %>% 
             as_vector() %>% 
             tail(n=1) ,
           model = endpoint %>% 
             str_remove(".csv")) 
  
  
  ## Intermediate: get columns
  int_paths = stg_models %>% left_join(stg_columns, by = 'model') %>% 
    ungroup()
  int_paths %>% 
    group_by(row_number()) %>% 
    group_map(~{
      # .x = int_paths %>% slice(1) 
      
      ## stage
      model_columns = read.csv(.x$csv_path) %>% names()
      df_file_codebook = df_codebooks %>%
        filter(dataset_id == .x$dataset_id,
               var%in%model_columns)
      df_model_new_columns = tibble(var = model_columns,
                                    database = .x$database ) %>% 
        filter(!var%in%df_file_codebook$var) 
      
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
            description =  paste0('{{ doc("stg_',.x$database,'_',.x$var,'_description") }}')
          )
        })
      columns_metadata = c(columns_src,columns_new)
      
      ## final
      list(
        model_path = .x$model_path,
        yml_path = .x$yml_path,
        model = .x$model,
        database = .x$database,
        dataset_id = .x$dataset_id,
        columns = columns_metadata
      )
    })
  
 
}
