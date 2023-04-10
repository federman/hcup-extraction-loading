#' EDA on available od dx and i10_dx and compare flu codes over time
#' 


ds1 = open_dataset('raw-hcup/NJ_SID_2012_CORE.parquet')
ds2 = open_dataset('raw-hcup/NJ_SID_2017_CORE.parquet')
