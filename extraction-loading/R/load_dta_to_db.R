#' Loads .dta to database as both data (.parquet) and metadata (.csv)
#'    
#'    @dataset_id: this arguemnt is just the HCUP dataset id (e.g. "NY_SEDD_2017_CHGS")
#'    


source("R/get_elt_status.R")
source("R/make_target_endpoints.R")

load_dta_to_db = function(){
  
  ## get datasets that have .dta but not parquet
  datasets_to_load = get_elt_status() %>% 
    filter(loaded_data == "dta",
           is.na(parquet)) %>% 
    pull(dataset_id)
  
  if(length(datasets_to_load)>0){
    datasets_to_load %>%
      walk(function(dataset_id_tmp){
        # dataset_id_tmp = datasets_to_load[1]
        cli_alert("Start .dta to parquet conversion for {dataset_id_tmp}")
        readstata13::read.dta13(glue("raw-hcup/{dataset_id_tmp}.dta")) %>%
          write_parquet(sink = glue("raw-hcup/{dataset_id_tmp}.parquet"))
        cli_alert_success("Finished .dta to parquet conversion for {dataset_id_tmp}")       
      }) 
  } else {
    print(get_elt_status() %>% select(dataset_id, parquet))
    cli_alert_warning("All .dta have been converted to .parquet. No Action taken.")
  }
  
  
}
