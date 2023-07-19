#' THis funciton will take a source or base_model and return associated tags
#' 
#' @param id: This is either a base_model_name or a databse_name
#' 
#' Example
#'    db = 'sid'; base = T

get_dbt_tags = function(db, base = F){
  db = str_to_lower(db)
  db_tags = list(
    sedd = c('State','ER','SEDD','Source'),
    sid = c('State','Inpatient','SID','Source')
  )
  
  ## stage
  base_db_tags = db_tags[[db]]
  
  ## int
  int_tags = if (base){
    c(base_db_tags,'dbt_base',glue("base__{db}"))
  } else if (!base) {
    base_db_tags
  }
  
  ## final
  final = list(int_tags)
  return(final)
}