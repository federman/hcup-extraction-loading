#' Goal here to write a function taht writes documentation on columns in YAML
#' @param dataset_id: dataset id
#'          
#' @param columns : a vector of column names to pull from the codebook
#' 
#' 
#' @example: 
dataset_id_tmp = "NY_SEDD_2018_CORE"; 
columns = c("KEY","AGE","DIED",'RACE',
            'HISPANIC','FEMALE','PAY1',
            'ZIP','AYEAR','AMONTH',
            'I10_DX_Visit_Reason1','I10_DX_Visit_Reason2',
            'I10_DX1', 'I10_DX2')



generate_columns_yaml = function(dataset_id_tmp, columns ){
  
  ## Stage
  src_codebook = read.csv("clean/df_codebooks.csv") %>% as_tibble()
  stg_codebook = src_codebook %>%  
    filter(dataset_id == dataset_id_tmp) %>% 
    filter(var%in%columns)
  
  ## Intermediate
  int_codebook = stg_codebook %>% 
    group_by(row_number()) %>% 
    group_map(~{
      stg = .x
      list(
        name = stg$var,
        type = stg$value_type,
        description = stg$var_label 
      )
    })
  
  ## Final
  int_codebook %>% as.yaml()
  
}