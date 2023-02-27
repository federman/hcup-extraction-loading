#' This function will return the status of various files available for
#' each dataset_id. Currently it only works in the `dev` context and
#' searches the /raw-hcup directory for these files. 

get_elt_status = function(){
  
  elt_files = list.files(path = "raw-hcup/", recursive = T)
  
  elt_status = tibble(raw = elt_files) %>% 
    rowwise() %>% 
    mutate(raw_split = str_split(raw,"\\.") ) %>% 
    mutate(dataset_id = raw_split[[1]],
           file_extension = raw_split[[2]]) %>% 
    select(-contains('raw')) %>% 
    mutate(value = T) %>% 
    ## handle codebooks
    mutate(file_extension = ifelse(str_detect(dataset_id, '_codebook'),
                                   'codebook',
                                   file_extension),
           dataset_id = str_remove(dataset_id, "_codebook")) %>% 
    pivot_wider(names_from = 'file_extension', values_from = value) %>% 
    mutate(sas7dat = NA) %>% 
    ## handle sas vs stata
    mutate(
      load_program = case_when(
        is.na(sas)&is.na(Do)~NA_character_,
        !is.na(sas)&!is.na(Do)~'REDUNDANT',
        !is.na(sas)~'.sas',
        !is.na(Do)~'.Do',
        TRUE  ~ "ERROR"  ),
      loaded_data = case_when(
        is.na(dta)&is.na(sas7dat)~NA_character_,
        !is.na(dta)&!is.na(sas7dat)~'REDUNDANT',
        !is.na(sas7dat)~'sas7dat',
        !is.na(dta)~'dta',
        TRUE  ~ "ERROR"  )) %>% 
    arrange(dataset_id) %>% 
    select(dataset_id, asc,
           load_program, loaded_data, 
           parquet, codebook) %>% 
    arrange(codebook, parquet,
            loaded_data,
            load_program,
            asc)
  
  # if (!"parquet"%in%names(elt_status)){
  #   
  #   elt_template = tibble(dataset_id = character(),
  #                         asc = logical(),
  #                         Do = logical(),
  #                         dta = logical(),
  #                         parquet = logical())
  #   
  #   elt_status = elt_status %>% 
  #     left_join(elt_template)
  # }
  return(elt_status)
}
