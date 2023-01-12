#' THis funciton will take a source or stg_model and return associated tags
#' 
#' @param id: This is either a stg_model_name or a databse_name

get_dbt_tags = function(id){
  db_tags = list(
    sedd = c('State','ER','SEDD','Source'),
    sid = c('State','Inpatient','SID','Source')
  )
  
  final = if (id%in%c("sedd","sid")){
    list(db_tags[[id]])
  }
  
  return(final)
}