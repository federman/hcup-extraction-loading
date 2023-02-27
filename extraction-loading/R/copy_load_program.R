#' Copy STATA load program into raw directory 

#'    
#'    @dataset_id: this arguemnt is just the HCUP dataset id (e.g. "NY_SEDD_2017_CHGS")
#'    dataset_id = "GA_SID_2018_CHGS" 
#'    

source("R/get_elt_status.R")

copy_load_file = function(dataset_id){
  
  load_paths = tibble( 
    paths = list.files(
      path = 'documents/load-programs/',  
      recursive = T, full.names = T) ) %>% 
    filter(str_detect(paths,dataset_id),
           !str_detect(paths,'.loc')) %>% 
    pull(paths) %>% 
    slice(1)
  
  new_path = file.path("raw-hcup",basename(load_paths))
  
  file.copy(from = load_paths, 
            to = new_path)
}

copy_load_program = function(){
  
  ## get any datasets missing .Do
  df_missing = get_elt_status() %>% filter(is.na(Do))
  
  if(nrow(df_missing)>0){
    df_missing$dataset_id %>% map(~copy_load_file(.x))
    print(get_elt_status())
    message(glue("Copied .Do files for {nrow(df_missing)} files"))
    df_missing$dataset_id %>% walk(~message(glue("- {.x}")))
  } else {
    print(get_elt_status() %>% select(dataset_id, Do))
    message(glue("No .Do files missing"))
  }
  
  
}
