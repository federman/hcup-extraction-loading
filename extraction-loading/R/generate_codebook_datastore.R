
#' Generates codebooks for all parquets
#'    
#'  
#'    

source("R/get_elt_status.R")
source("R/make_target_endpoints.R")

make_codebooks = function(df_id){
  # df_id = df_targets %>% slice(1)
  
  ds = arrow::open_dataset(df_id$path_parquet)
  
  # get data type
  df_types = tibble(raw = ds$ToString() %>% str_split("\n") %>% unlist()) %>%
    filter(str_detect(raw,":")) %>%
    rowwise() %>%
    mutate(raw_split = str_split(raw,":"),
           var = raw_split[[1]],
           value_type = raw_split[[2]] %>% str_trim()) %>%
    select(var, value_type)
  
  # operationalize codebook
  codebook = tibble(
    var = names(ds$metadata$r$columns),
    var_label = ds$metadata$r$attributes$var.labels
  )  %>%
    left_join(df_types, by = "var") %>%
    mutate(dataset_id = df_id$dataset_id)
  
  ## Saving
  codebook %>% write_csv(df_id$path_codebook)
  
  ## messeage
  message(glue("Codebook written for {df_id$dataset_id}"))
  
  
}

generate_codebooks = function(){
  
  ## Individual codebooks 
  df_targets_without_codebooks = get_elt_status() %>% 
    make_target_endpoints(keep_column = 'codebook') %>% 
    select(-path_dta) %>% 
    filter(!codebook)
  
  if (nrow(df_targets_without_codebooks) == 0){
    print( get_elt_status() %>% select(dataset_id, codebook))
    message(glue("No codebooks missing!"))
  } else {
    df_targets_without_codebooks %>% 
      group_by(row_number()) %>% 
      group_walk(~make_codebooks(.x))
    message(glue("Codebooks written for {nrow(df_targets)} datasets"))
  }
  
  ## Compiled codebook
  get_elt_status() %>% 
    make_target_endpoints() %>% 
    pull(path_codebook) %>% 
    map_df(~fread(.)) %>% 
    as_tibble() %>% 
    fwrite("clean/df_codebooks.csv")
}
