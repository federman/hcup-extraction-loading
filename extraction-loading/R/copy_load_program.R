#' Copy STATA load program into raw directory 

#'    
#'    @dataset_id: this arguemnt is just the HCUP dataset id (e.g. "NY_SEDD_2017_CHGS")
#'    dataset_id = "GA_SID_2018_CHGS" 
#'    

source("R/get_etl_status.R")

copy_load_file = function(dataset_id){
  
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
   
  
  new_path = file.path("raw-hcup",basename(load_path))
  
  file.copy(from = load_path, 
            to = new_path)
}

copy_load_program = function(dev = F){
  
  if (dev){
    # dev: clears already consumed load programs ------------------------------
    ## get state load programs that have already generated .dta files
    stata_load_done = get_etl_status() %>% 
      filter(load_program == '.Do',
             !is.na(loaded_data)) %>% 
      pull(dataset_id) %>% 
      paste0("raw-hcup/",.,".Do") 
    
    ## get their paths from /raw-hcup
    stata_load_done_paths =   tibble(load_program = list.files('raw-hcup/', full.names = T) ) %>% 
      rowwise() %>% 
      filter(load_program%in%stata_load_done) %>% 
      pull(load_program)
    
    ## Delete these `used` load programs
    stata_load_done_paths %>% walk(~unlink(.x))
    cli_alert("Removed used stata load programs.")
  } else  {
    # prod: copies all --------------------------------------------------------
    df_missing = get_etl_status() %>% filter(is.na(load_program))
    
    if(nrow(df_missing)>0){
      df_missing$dataset_id %>% map(~copy_load_file(.x))
      print(get_etl_status())
      cli_alert("Copied load program files for {nrow(df_missing)} files")
      df_missing$dataset_id %>% walk(~cli_alert("- {.x}"))
    } else {
      print(get_etl_status() %>% select(dataset_id, load_program))
      cli_alert_info("No load program missing")
    }
  }
  
  
}
