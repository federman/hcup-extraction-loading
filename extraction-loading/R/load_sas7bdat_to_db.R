#' Loads .dta to database as both data (.parquet) and metadata (.csv)
#'    
#'    @dataset_id: this arguemnt is just the HCUP dataset id (e.g. "NY_SEDD_2017_CHGS")
#'    


source("R/get_elt_status.R")
source("R/make_target_endpoints.R")

load_sas7bdat_to_db = function(){
  
  ## get datasets that have .dta but not parquet
  datasets_to_load = get_elt_status() %>% 
    filter(loaded_data == "sas7bdat",
           is.na(parquet)) %>% 
    pull(dataset_id)
  
  if(length(datasets_to_load)>0){
    datasets_to_load %>%
      walk(function(dataset_id_tmp){
        # dataset_id_tmp = datasets_to_load[1]
        cli_alert("Start .sas7bdat to parquet conversion for {dataset_id_tmp}")
        
        haven::read_sas(glue("raw-hcup/{dataset_id_tmp}.sas7bdat")) %>% 
          write_parquet(sink = glue("raw-hcup/{dataset_id_tmp}.parquet"))
        
        cli_alert_success("Finished .sas7bdat to parquet conversion for {dataset_id_tmp}")       
      }) 
  } else {
    print(get_elt_status() %>% select(dataset_id, parquet))
    cli_alert_warning("All .sas7bdat have been converted to .parquet. No Action taken.")
  }
  
  
}
