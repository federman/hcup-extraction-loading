
#' Generates codebooks for all parquets
#'    
#'  
#'    

source("R/get_elt_status.R")
source("R/make_target_endpoints.R")

make_codebooks = function(df_id){
  # df_id = df_targets_without_codebooks %>% slice(1)
  
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
  cli_alert_success("Codebook written for {df_id$dataset_id}")
  
  
}

generate_codebooks = function(){
  
  { # Generate individual codebooks -------------------------------------------
    df_targets_without_codebooks = get_elt_status() %>% 
      make_target_endpoints(keep_column = 'codebook') %>% 
      select(-path_dta) %>% 
      filter(is.na(codebook))
    
    if (nrow(df_targets_without_codebooks) == 0){
      cli_alert_success("No codebooks missing - No Action taken!")
    } else {
      df_targets_without_codebooks %>% 
        group_by(row_number()) %>% 
        group_walk(~make_codebooks(.x))
      cli_alert_success("{nrow(df_targets_without_codebooks)} codebooks written")
    }
  }
  
  { # Compile codebook --------------------------------------------------------
    df_codebooks = get_elt_status() %>% 
      make_target_endpoints() %>% 
      pull(path_codebook) %>% 
      map_df(~fread(.)) %>% 
      as_tibble() 
    df_codebooks%>% fwrite("clean/df_codebooks.csv")
    cli_alert_success("Compiled codebooks at clean/df_codebooks.csv")
  }
  
  { # Compile source metadata --------------------------------------------------------
    
    df_summary = df_codebooks %>% 
      count(dataset_id, name = 'n_columns') %>% 
      rowwise() %>% 
      mutate(split = str_split(dataset_id, "_"),
             state = split[[1]],
             db = split[[2]],
             year_raw = split[[3]],
             year = str_sub(year_raw,1,4),
             file = split[4:length(split)] %>% paste(collapse = '_'),
             n_rows =   open_dataset(glue("raw-hcup/{dataset_id}.parquet"))$num_rows) %>% 
      select(dataset_id, n_columns, n_rows, state, db, year,year_raw, file)
    df_summary %>% write_parquet("clean/df_summary.parquet")
    cli_alert_success("Compiled source summary at clean/df_summary.parquet")
    
  }
  
}
