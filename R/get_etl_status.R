#' There are a few files we need to take stock of
#'   - raw data: .acs
#'   - load program in the same directory as data: .Do or .Sas
#'   - loaded results: .dta or .sas7bdat
#'   - extract codebook: .csv
#'   - extract data: .parquet

get_etl_status = function(etl, path = F) {
  
  etl_files_full = list.files(etl$path_server_raw, recursive = T) 
  etl_files = etl_files_full |>  basename()
  paths_raw = tibble(raw_full = glue('{etl$path_server_raw}/{etl_files_full}')) |>
    rowwise() |>
    mutate(
      raw = basename(raw_full),
      raw_split = str_split(raw, "\\."),
      dir = dirname(raw_full),
      dataset_id = raw_split[[1]],
      file_extension = raw_split[[2]]
    ) |> 
    ungroup()
  
  status_raw = paths_raw |>
    rowwise() |>
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
  
  status_dbt = status_raw %>% 
    select(dataset_id) %>% 
    mutate(parquet = file.exists(glue('{etl$path_server_dbt_source}/{dataset_id}.parquet')))
  
  if (!"parquet" %in% names(status_dbt)) status_dbt = status_dbt |> mutate(parquet = NA)
  if (!"Do" %in% names(status_raw)) status_raw = status_raw |> mutate(Do = NA)
  if (!"sas" %in% names(status_raw)) status_raw = status_raw |> mutate(sas = NA)
  if (!"dta" %in% names(status_raw)) status_raw = status_raw |> mutate(dta = NA)
  if (!"sas7bdat" %in% names(status_raw)) status_raw = status_raw |> mutate(sas7bdat = NA)
  if (!"codebook" %in% names(status_raw)) status_raw = status_raw |> mutate(codebook = NA)
  
  etl_status =   status_raw |>
    left_join(status_dbt) |>
    mutate(
      load_program = case_when(
        is.na(sas) & is.na(Do) ~ NA_character_,!is.na(sas) &
          !is.na(Do) ~ 'REDUNDANT',!is.na(sas) ~ '.sas',!is.na(Do) ~ '.Do',
        TRUE  ~ "ERROR"
      ),
      loaded_data = case_when(
        is.na(dta) & is.na(sas7bdat) ~ NA_character_,!is.na(dta) &
          !is.na(sas7bdat) ~ 'REDUNDANT',!is.na(sas7bdat) ~ 'sas7bdat',!is.na(dta) ~
          'dta',
        TRUE  ~ "ERROR"
      )
    ) |>
    arrange(dataset_id) |>
    select(dataset_id, asc,
           load_program, loaded_data,
           parquet, codebook, dir) |>
    arrange(codebook, parquet,
            loaded_data,
            load_program,
            asc)
  
  if (path == T){return(etl_status)}
  if (path != T) return(etl_status %>% select(-dir))
}
