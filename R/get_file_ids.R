#' This function is for 'loading' step of EL. It works on both `dev` and `prod` environements
#' It assumes fully loaded files all have been added to codebooks.csv. It will return a vector
#' containing all the loaded file id's. 

get_file_ids = function(){
  df_codebooks = read.csv("clean/df_codebooks.csv")
  
  vec__file_ids = df_codebooks %>% 
    pull(dataset_id) %>% 
    unique() %>% 
    sort()
  
  return(vec__file_ids)
}
