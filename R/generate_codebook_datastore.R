
#' Generates codebooks for all parquets
#'    
#'  
#'    

source("R/get_etl_status.R")
source("R/make_target_endpoints.R")

make_codebooks = function(df_id){
  # df_id = df_targets_codebooks %>% slice(1)
  # df_id = df_targets_codebooks %>% slice(120)
  
  cli_alert('Start codebook generation for {df_id$dataset_id}')
  
  ds = arrow::open_dataset(df_id$path_parquet)
  has_metadata = length(ds$metadata) > 0
  
  
  
  # get data type
  df_types = tibble(raw = ds$ToString() %>% str_split("\n") %>% unlist()) %>%
    filter(str_detect(raw,":")) %>%
    rowwise() %>%
    mutate(raw_split = str_split(raw,":"),
           var = raw_split[[1]],
           value_type = raw_split[[2]] %>% str_trim()) %>%
    select(var, value_type)%>%
    mutate(dataset_id = df_id$dataset_id)
  
  # get metadata if available
  if (has_metadata){
    codebook = tibble(
      var = names(ds$metadata$r$columns),
      var_label = ds$metadata$r$attributes$var.labels
    )  %>%
      left_join(df_types, by = "var") 
  } else {
    codebook = df_types %>% 
      mutate(var_label = '')
  }
  

  ## Saving
  codebook %>% fwrite(df_id$path_codebook)

  ## messeage
  cli_alert_success("Codebook written for {df_id$dataset_id}")
  
}

generate_codebooks = function(etl){
  
  
  { # Setup -------------------------------------------------------------------
    df_targets_codebooks = get_etl_status(etl, path = T) %>% 
      mutate(path_raw =  glue("{dir}/{dataset_id}.dta"),
             path_parquet = glue("{etl$path_server_dbt_source}/{dataset_id}.parquet"),
             path_codebook = glue("{dir}/{dataset_id}_codebook.csv")) %>% 
      filter(parquet == T)
  }
  
  { # Generate individual codebooks -------------------------------------------
    df_targets_without_codebooks = df_targets_codebooks %>%
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
    
    ## preliminary compilation
    df_codebooks_raw  = df_targets_codebooks %>% 
      pull(path_codebook) %>% 
      map_df(~fread(.)) %>% 
      as_tibble() 
    df_codebooks_raw_missing = df_codebooks_raw %>%  filter(is.na(var_label)) 
    df_codebooks_raw_full = df_codebooks_raw %>%  filter(!is.na(var_label)) 
    
    ## Check for missing var_label
    vec__missing_label = df_codebooks_raw_missing %>%  
      count(var) %>% 
      pull(var)
    xwalk_var_metadata = df_codebooks_raw_full %>% 
      select(var, var_label) %>% 
      distinct() %>% 
      group_by(var) %>% 
      slice(1) %>% 
      ungroup()
    
    ## Fill in missing var_label
    df_codebooks_imputed = df_codebooks_raw_missing %>% 
      select(-var_label) %>% 
      left_join(xwalk_var_metadata) 
    df_codebooks_int = df_codebooks_raw_full %>% 
      bind_rows(df_codebooks_imputed)
    
    ## Fill in CHARGE for every CHGS file if not available
    row__charge = df_codebooks_raw %>% filter(var == "CHARGE") %>% 
      select(-dataset_id) %>% 
      distinct() %>% 
      drop_na()
    df_codebooks_no_charges = df_codebooks_int %>% 
      filter(var!="CHARGE")
    df_codebook_charges = df_codebooks_int %>% 
      select(dataset_id) %>% 
      distinct() %>% 
      filter(str_detect(dataset_id,'CHGS')) %>% 
      bind_cols(row__charge)
    df_codebooks = df_codebooks_int %>%  
      bind_rows(df_codebook_charges) %>% 
      arrange(dataset_id, var) 
   
    df_codebooks%>% fwrite("clean/df_codebooks.csv")
    
    ## export metadata to server
    df_codebooks %>% fwrite(glue("{etl$path_server_dbt}/df_codebooks.csv"))
    etl %>% as_tibble() %>% fwrite(glue("{etl$path_server_dbt}/etl_objects.csv"))
    cli_alert_success("Compiled codebooks at clean/df_codebooks.csv")
  }
  
  { # Compile source metadata --------------------------------------------------------
   
     get_file_size_mb =  function(file_dir){
       
      
      file_metadata = file.info(file_dir)
      file_mb = file_metadata$size/10^6
       
      return(file_mb)
    }
    
    
    df_summary = df_codebooks %>% 
      count(dataset_id, name = 'n_columns') %>% 
      left_join(df_targets_codebooks %>% select(dataset_id,contains('path'))) %>% 
      rowwise() %>%
      mutate(split = str_split(dataset_id, "_"),
             state = split[[1]],
             db = split[[2]],
             year_raw = split[[3]],
             year = str_sub(year_raw,1,4),
             file = split[4:length(split)] %>% paste(collapse = '_'),
             n_rows =   open_dataset(path_parquet)$num_rows,
             db_year = case_when(
               between(as.numeric(year),2019,2021)~glue("{db}_2019_2021"),
               between(as.numeric(year),2016,2018)~glue("{db}_2016_2018"),
               as.numeric(year)==2015~glue("{db}_2015"),
               between(as.numeric(year),2005,2014)~glue("{db}_2005_2014"),
               TRUE ~"ERROR"  ),
             dataset_instance = paste(c(db, state, year_raw), collapse = "_"),
             size_mb_raw = get_file_size_mb(path_raw),
             size_mb_parquet =  get_file_size_mb(path_parquet)
             )  %>%  
      select(dataset_id, n_columns, n_rows, state, db, year,year_raw, file, db_year, 
             dataset_instance, size_mb_raw, size_mb_parquet) %>% 
      ungroup()
    df_summary %>% write_parquet("clean/df_summary.parquet")
    df_summary %>% write_parquet(glue("{etl$path_server_dbt}/df_summary.parquet"))
    cli_alert_success("Compiled source summary at clean/df_summary.parquet")
 
  }
  
}
