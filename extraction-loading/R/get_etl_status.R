#' There are a few files we need to take stock of
#'   - raw data: .acs 
#'   - load program in the same directory as data: .Do or .Sas
#'   - loaded results: .dta or .sas7bdat
#'   - extract codebook: .csv
#'   - extract data: .parquet

get_etl_status = function() {
  
  { ### Inventory
    path_raw_hcup = '//files.drexel.edu/encrypted/SOPH/UHC/SchnakeMahl_HCUP/raw'
    etl_files = list.files(path_raw_hcup, 
                                recursive = T)  |>  
      basename()
  }

  
  status_raw = tibble(raw = etl_files) |>
    rowwise() |>
    mutate(
      raw_split = str_split(raw, "\\."),
      dataset_id = raw_split[[1]],
      file_extension = raw_split[[2]]
    ) |>
    select(-contains('raw')) |>
    mutate(value = T) |>
    ## handle codebooks
    mutate(
      file_extension = ifelse(
        str_detect(dataset_id, '_codebook'),
        'codebook',
        file_extension
      ),
      dataset_id = str_remove(dataset_id, "_codebook")
    ) |>
    pivot_wider(names_from = 'file_extension', values_from = value)
  
  if (!"Do" %in% names(status_raw))  status_raw = status_raw |> mutate(Do = NA) 
  if (!"sas" %in% names(status_raw)) status_raw = status_raw |> mutate(sas = NA) 
  if (!"dta" %in% names(status_raw))  status_raw = status_raw |> mutate(dta = NA) 
  if (!"sas7bdat" %in% names(status_raw)) status_raw = status_raw |> mutate(sas7bdat = NA) 
  if (!"parquet" %in% names(status_raw)) status_raw = status_raw |> mutate(parquet = NA) 
  if (!"codebook" %in% names(status_raw))  status_raw = status_raw |>mutate(codebook = NA) 
  
  etl_status =   status_raw |> 
    mutate(
      load_program = case_when(
        is.na(sas) & is.na(Do) ~ NA_character_,
        !is.na(sas) &
          !is.na(Do) ~ 'REDUNDANT',
        !is.na(sas) ~ '.sas',
        !is.na(Do) ~ '.Do',
        TRUE  ~ "ERROR"
      ),
      loaded_data = case_when(
        is.na(dta) & is.na(sas7bdat) ~ NA_character_,
        !is.na(dta) &
          !is.na(sas7bdat) ~ 'REDUNDANT',
        !is.na(sas7bdat) ~ 'sas7bdat',
        !is.na(dta) ~
          'dta',
        TRUE  ~ "ERROR"
      )
    ) |>
    arrange(dataset_id) |>
    select(dataset_id, asc,
           load_program, loaded_data,
           parquet, codebook) |>
    arrange(codebook, parquet,
            loaded_data,
            load_program,
            asc)
  
  return(etl_status)
}
