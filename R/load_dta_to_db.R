#' Loads .dta to database as both data (.parquet) and metadata (.csv)
#'    
#'    @dataset_id: this arguemnt is just the HCUP dataset id (e.g. "NY_SEDD_2017_CHGS")
#'    


source("R/get_etl_status.R") 

load_dta_to_db = function(etl){
  
  ## get datasets that have .dta but not parquet
  datasets_to_load = get_etl_status(etl, path = T) %>% 
    filter(loaded_data == "dta",
           is.na(parquet)|parquet==F)  %>% 
    select(dataset_id, dir, everything())
  
  if(nrow(datasets_to_load)>0){
    datasets_to_load %>%
      group_by(row_number()) %>% 
      group_walk(function(dfa,i){
        dataset_id_tmp = dfa$dataset_id
        path_raw_tmp = dfa$dir
        cli_alert("Start .dta to parquet conversion for {dataset_id_tmp}")
        readstata13::read.dta13(glue("{path_raw_tmp}/{dataset_id_tmp}.dta")) %>%
          write_parquet(sink = glue("{etl$path_server_dbt_source}/{dataset_id_tmp}.parquet"))
        cli_alert_success("Finished .dta to parquet conversion for {dataset_id_tmp}")       
      }) 
  } else {
    print(get_etl_status(etl) %>% select(dataset_id, parquet))
    cli_alert_warning("All .dta have been converted to .parquet. No Action taken.")
  }
  
  
}
