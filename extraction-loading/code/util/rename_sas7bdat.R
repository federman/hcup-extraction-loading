#' This script will standardize all .sas7bdat files to adhere to just "{dataset_id}.sas7bdat" 


original_file_names = list.files("raw-hcup/") %>% 
  keep(~str_detect(.x,'sas7bdat')) %>% 
  discard(~str_sub(.x,1,1)==str_to_upper(str_sub(.x,1,1))) 


original_file_names %>% 
  walk(function(original_file){

    standardized_file = original_file  %>% 
      str_remove(".sas7bdat") %>% 
      str_replace(.,pattern = "sidc", replacement = 'sid') %>% 
      str_to_upper() %>% 
      paste0(.,'.sas7bdat')
    
    file.rename(glue("raw-hcup/{original_file}"),
                glue("raw-hcup/{standardized_file}"))
    
    cli_alert("Renamed `{original_file}` to `{standardized_file}`")
    
  })
