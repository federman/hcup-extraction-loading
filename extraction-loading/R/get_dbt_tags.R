#' THis funciton will take a source or stg_model and return associated tags
#' 
#' @param id: This is either a stg_model_name or a databse_name

get_dbt_tags = function(id, stg = F){
  db_tags = list(
    sedd = c('State','ER','SEDD','Source'),
    sid = c('State','Inpatient','SID','Source')
  )
  
  ## stage
  stg_db_tags = db_tags[[id]]
  
  ## int
  int_tags = if (stg){
    c(stg_db_tags,'Stage')
  } else if (!stg) {
    stg_db_tags
  }
  
  ## final
  final = list(int_tags)
  return(final)
}