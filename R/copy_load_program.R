#' Copy STATA load program into raw directory 

#'    
#'    @dataset_id: this arguemnt is just the HCUP dataset id (e.g. "NY_SEDD_2017_CHGS")
#'    dataset_id = "AZ_SID_2015q1q3_CHGS" 
#'    

source("R/get_etl_status.R")

copy_load_file = function(dataset_id, etl){
  
  all_load_paths = tibble( 
    path = list.files(
      path = 'documents/load-programs/',  
      recursive = T, full.names = T) ) %>% 
    filter(str_detect(path,dataset_id),
           !str_detect(path,'.loc'))
  
  if (any(str_detect(all_load_paths$path,'.Do'))){
    load_path = all_load_paths %>% 
      filter(str_detect(path, '.Do')) %>% 
      pull(path)
  } else {
    load_path = all_load_paths %>% 
      slice(1) %>% 
      pull(path)
  }
  
  new_file_path_dir = list.files(etl$path_server_raw, full.names = T, recursive = T)  |> 
    keep(~str_detect(.x,dataset_id)) |>
    dirname()
  
  new_path = file.path(new_file_path_dir,basename(load_path))
  
  file.copy(from = load_path, 
            to = new_path)
}

copy_load_program = function(etl){
  

    # prod: copies all --------------------------------------------------------
    df_missing = get_etl_status(etl) %>% filter(is.na(load_program))
    
    if(nrow(df_missing)>0){
      df_missing$dataset_id %>% map(~copy_load_file(.x, etl))
      print(get_etl_status(etl))
      cli_alert("Copied load program files for {nrow(df_missing)} files")
      df_missing$dataset_id %>% walk(~cli_alert("- {.x}"))
    } else {
      print(get_etl_status(etl) %>% select(dataset_id, load_program))
      cli_alert_info("No load program missing")
    }
  
}
