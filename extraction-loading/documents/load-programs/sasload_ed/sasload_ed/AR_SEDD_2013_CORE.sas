/*******************************************************************            
* Creation Date: 08/23/2017                                                     
*   AR_SEDD_2013_CORE.SAS:                                                      
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      OUTPATIENT SEDD CORE FILE INTO SAS                                       
*******************************************************************/            
                                                                                
                                                                                
***************************************************************;                
* ----------------------------------------------------------- *;                
* |  NOTICE: Use of HCUP data constitutes acceptance of the | *;                
* |  terms and conditions of the HCUP Data Use Agreement.   | *;                
* ----------------------------------------------------------- *;                
***************************************************************;                
                                                                                
                                                                                
***********************************************;                                
*  Create SAS informats for missing values     ;                                
***********************************************;                                
PROC FORMAT;                                                                    
  INVALUE N2PF                                                                  
    '-9' = .                                                                    
    '-8' = .A                                                                   
    '-6' = .C                                                                   
    '-5' = .N                                                                   
    OTHER = (|2.|)                                                              
  ;                                                                             
  INVALUE N3PF                                                                  
    '-99' = .                                                                   
    '-88' = .A                                                                  
    '-66' = .C                                                                  
    OTHER = (|3.|)                                                              
  ;                                                                             
  INVALUE N4PF                                                                  
    '-999' = .                                                                  
    '-888' = .A                                                                 
    '-666' = .C                                                                 
    OTHER = (|4.|)                                                              
  ;                                                                             
  INVALUE N4P1F                                                                 
    '-9.9' = .                                                                  
    '-8.8' = .A                                                                 
    '-6.6' = .C                                                                 
    OTHER = (|4.1|)                                                             
  ;                                                                             
  INVALUE N5PF                                                                  
    '-9999' = .                                                                 
    '-8888' = .A                                                                
    '-6666' = .C                                                                
    OTHER = (|5.|)                                                              
  ;                                                                             
  INVALUE N5P2F                                                                 
    '-9.99' = .                                                                 
    '-8.88' = .A                                                                
    '-6.66' = .C                                                                
    OTHER = (|5.2|)                                                             
  ;                                                                             
  INVALUE N6PF                                                                  
    '-99999' = .                                                                
    '-88888' = .A                                                               
    '-66666' = .C                                                               
    OTHER = (|6.|)                                                              
  ;                                                                             
  INVALUE N6P2F                                                                 
    '-99.99' = .                                                                
    '-88.88' = .A                                                               
    '-66.66' = .C                                                               
    OTHER = (|6.2|)                                                             
  ;                                                                             
  INVALUE N7P2F                                                                 
    '-999.99' = .                                                               
    '-888.88' = .A                                                              
    '-666.66' = .C                                                              
    OTHER = (|7.2|)                                                             
  ;                                                                             
  INVALUE N7P4F                                                                 
    '-9.9999' = .                                                               
    '-8.8888' = .A                                                              
    '-6.6666' = .C                                                              
    OTHER = (|7.4|)                                                             
  ;                                                                             
  INVALUE N8PF                                                                  
    '-9999999' = .                                                              
    '-8888888' = .A                                                             
    '-6666666' = .C                                                             
    OTHER = (|8.|)                                                              
  ;                                                                             
  INVALUE N8P2F                                                                 
    '-9999.99' = .                                                              
    '-8888.88' = .A                                                             
    '-6666.66' = .C                                                             
    OTHER = (|8.2|)                                                             
  ;                                                                             
  INVALUE N9PF                                                                  
    '-99999999' = .                                                             
    '-88888888' = .A                                                            
    '-66666666' = .C                                                            
    OTHER = (|9.|)                                                              
  ;                                                                             
  INVALUE N9P2F                                                                 
    '-99999.99' = .                                                             
    '-88888.88' = .A                                                            
    '-66666.66' = .C                                                            
    OTHER = (|9.2|)                                                             
  ;                                                                             
  INVALUE N10PF                                                                 
    '-999999999' = .                                                            
    '-888888888' = .A                                                           
    '-666666666' = .C                                                           
    OTHER = (|10.|)                                                             
  ;                                                                             
  INVALUE N10P4F                                                                
    '-9999.9999' = .                                                            
    '-8888.8888' = .A                                                           
    '-6666.6666' = .C                                                           
    OTHER = (|10.4|)                                                            
  ;                                                                             
  INVALUE N10P5F                                                                
    '-999.99999' = .                                                            
    '-888.88888' = .A                                                           
    '-666.66666' = .C                                                           
    OTHER = (|10.5|)                                                            
  ;                                                                             
  INVALUE DATE10F                                                               
    '-999999999' = .                                                            
    '-888888888' = .A                                                           
    '-666666666' = .C                                                           
    OTHER = (|MMDDYY10.|)                                                       
  ;                                                                             
  INVALUE N11PF                                                                 
    '-9999999999' = .                                                           
    '-8888888888' = .A                                                          
    '-6666666666' = .C                                                          
    OTHER = (|11.|)                                                             
  ;                                                                             
  INVALUE N11P2F                                                                
    '-9999999.99' = .                                                           
    '-8888888.88' = .A                                                          
    '-6666666.66' = .C                                                          
    OTHER = (|11.2|)                                                            
  ;                                                                             
  INVALUE N12P2F                                                                
    '-99999999.99' = .                                                          
    '-88888888.88' = .A                                                         
    '-66666666.66' = .C                                                         
    OTHER = (|12.2|)                                                            
  ;                                                                             
  INVALUE N12P5F                                                                
    '-99999.99999' = .                                                          
    '-88888.88888' = .A                                                         
    '-66666.66666' = .C                                                         
    OTHER = (|12.5|)                                                            
  ;                                                                             
  INVALUE N13PF                                                                 
    '-999999999999' = .                                                         
    '-888888888888' = .A                                                        
    '-666666666666' = .C                                                        
    OTHER = (|13.|)                                                             
  ;                                                                             
  INVALUE N15P2F                                                                
    '-99999999999.99' = .                                                       
    '-88888888888.88' = .A                                                      
    '-66666666666.66' = .C                                                      
    OTHER = (|15.2|)                                                            
  ;                                                                             
  RUN;                                                                          
                                                                                
                                                                                
*******************************;                                                
*  Data Step                  *;                                                
*******************************;                                                
DATA AR_SEDDC_2013_CORE;                                                        
INFILE 'AR_SEDD_2013_CORE.ASC' FIRSTOBS=3 LRECL = 1226;                         
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY                     LENGTH=3                                           
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AHOUR                      LENGTH=3                      FORMAT=Z4.           
  LABEL="Admission Hour"                                                        
                                                                                
  AMONTH                     LENGTH=3                                           
  LABEL="Admission month"                                                       
                                                                                
  APGAR1                     LENGTH=3                                           
  LABEL="One-minute APGAR score"                                                
                                                                                
  APGAR5                     LENGTH=3                                           
  LABEL="Five-minute APGAR score"                                               
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  BILLTYPE                   LENGTH=$4                                          
  LABEL="Type of bill, UB-04 coding"                                            
                                                                                
  CPT1                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 1"                                            
                                                                                
  CPT2                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 2"                                            
                                                                                
  CPT3                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 3"                                            
                                                                                
  CPT4                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 4"                                            
                                                                                
  CPT5                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 5"                                            
                                                                                
  CPT6                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 6"                                            
                                                                                
  CPT7                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 7"                                            
                                                                                
  CPT8                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 8"                                            
                                                                                
  CPT9                       LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 9"                                            
                                                                                
  CPT10                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 10"                                           
                                                                                
  CPT11                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 11"                                           
                                                                                
  CPT12                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 12"                                           
                                                                                
  CPT13                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 13"                                           
                                                                                
  CPT14                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 14"                                           
                                                                                
  CPT15                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 15"                                           
                                                                                
  CPT16                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 16"                                           
                                                                                
  CPT17                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 17"                                           
                                                                                
  CPT18                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 18"                                           
                                                                                
  CPT19                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 19"                                           
                                                                                
  CPT20                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 20"                                           
                                                                                
  CPT21                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 21"                                           
                                                                                
  CPT22                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 22"                                           
                                                                                
  CPT23                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 23"                                           
                                                                                
  CPT24                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 24"                                           
                                                                                
  CPT25                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 25"                                           
                                                                                
  CPT26                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 26"                                           
                                                                                
  CPT27                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 27"                                           
                                                                                
  CPT28                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 28"                                           
                                                                                
  CPT29                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 29"                                           
                                                                                
  CPT30                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 30"                                           
                                                                                
  CPT31                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 31"                                           
                                                                                
  CPT32                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 32"                                           
                                                                                
  CPT33                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 33"                                           
                                                                                
  CPT34                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 34"                                           
                                                                                
  CPT35                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 35"                                           
                                                                                
  CPT36                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 36"                                           
                                                                                
  CPT37                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 37"                                           
                                                                                
  CPT38                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 38"                                           
                                                                                
  CPT39                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 39"                                           
                                                                                
  CPT40                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 40"                                           
                                                                                
  CPT41                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 41"                                           
                                                                                
  CPT42                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 42"                                           
                                                                                
  CPT43                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 43"                                           
                                                                                
  CPT44                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 44"                                           
                                                                                
  CPT45                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 45"                                           
                                                                                
  CPT46                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 46"                                           
                                                                                
  CPT47                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 47"                                           
                                                                                
  CPT48                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 48"                                           
                                                                                
  CPT49                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 49"                                           
                                                                                
  CPT50                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 50"                                           
                                                                                
  CPT51                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 51"                                           
                                                                                
  CPT52                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 52"                                           
                                                                                
  CPT53                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 53"                                           
                                                                                
  CPT54                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 54"                                           
                                                                                
  CPT55                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 55"                                           
                                                                                
  CPT56                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 56"                                           
                                                                                
  CPT57                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 57"                                           
                                                                                
  CPT58                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 58"                                           
                                                                                
  CPTCCS1                    LENGTH=4                                           
  LABEL="CCS: CPT 1"                                                            
                                                                                
  CPTCCS2                    LENGTH=4                                           
  LABEL="CCS: CPT 2"                                                            
                                                                                
  CPTCCS3                    LENGTH=4                                           
  LABEL="CCS: CPT 3"                                                            
                                                                                
  CPTCCS4                    LENGTH=4                                           
  LABEL="CCS: CPT 4"                                                            
                                                                                
  CPTCCS5                    LENGTH=4                                           
  LABEL="CCS: CPT 5"                                                            
                                                                                
  CPTCCS6                    LENGTH=4                                           
  LABEL="CCS: CPT 6"                                                            
                                                                                
  CPTCCS7                    LENGTH=4                                           
  LABEL="CCS: CPT 7"                                                            
                                                                                
  CPTCCS8                    LENGTH=4                                           
  LABEL="CCS: CPT 8"                                                            
                                                                                
  CPTCCS9                    LENGTH=4                                           
  LABEL="CCS: CPT 9"                                                            
                                                                                
  CPTCCS10                   LENGTH=4                                           
  LABEL="CCS: CPT 10"                                                           
                                                                                
  CPTCCS11                   LENGTH=4                                           
  LABEL="CCS: CPT 11"                                                           
                                                                                
  CPTCCS12                   LENGTH=4                                           
  LABEL="CCS: CPT 12"                                                           
                                                                                
  CPTCCS13                   LENGTH=4                                           
  LABEL="CCS: CPT 13"                                                           
                                                                                
  CPTCCS14                   LENGTH=4                                           
  LABEL="CCS: CPT 14"                                                           
                                                                                
  CPTCCS15                   LENGTH=4                                           
  LABEL="CCS: CPT 15"                                                           
                                                                                
  CPTCCS16                   LENGTH=4                                           
  LABEL="CCS: CPT 16"                                                           
                                                                                
  CPTCCS17                   LENGTH=4                                           
  LABEL="CCS: CPT 17"                                                           
                                                                                
  CPTCCS18                   LENGTH=4                                           
  LABEL="CCS: CPT 18"                                                           
                                                                                
  CPTCCS19                   LENGTH=4                                           
  LABEL="CCS: CPT 19"                                                           
                                                                                
  CPTCCS20                   LENGTH=4                                           
  LABEL="CCS: CPT 20"                                                           
                                                                                
  CPTCCS21                   LENGTH=4                                           
  LABEL="CCS: CPT 21"                                                           
                                                                                
  CPTCCS22                   LENGTH=4                                           
  LABEL="CCS: CPT 22"                                                           
                                                                                
  CPTCCS23                   LENGTH=4                                           
  LABEL="CCS: CPT 23"                                                           
                                                                                
  CPTCCS24                   LENGTH=4                                           
  LABEL="CCS: CPT 24"                                                           
                                                                                
  CPTCCS25                   LENGTH=4                                           
  LABEL="CCS: CPT 25"                                                           
                                                                                
  CPTCCS26                   LENGTH=4                                           
  LABEL="CCS: CPT 26"                                                           
                                                                                
  CPTCCS27                   LENGTH=4                                           
  LABEL="CCS: CPT 27"                                                           
                                                                                
  CPTCCS28                   LENGTH=4                                           
  LABEL="CCS: CPT 28"                                                           
                                                                                
  CPTCCS29                   LENGTH=4                                           
  LABEL="CCS: CPT 29"                                                           
                                                                                
  CPTCCS30                   LENGTH=4                                           
  LABEL="CCS: CPT 30"                                                           
                                                                                
  CPTCCS31                   LENGTH=4                                           
  LABEL="CCS: CPT 31"                                                           
                                                                                
  CPTCCS32                   LENGTH=4                                           
  LABEL="CCS: CPT 32"                                                           
                                                                                
  CPTCCS33                   LENGTH=4                                           
  LABEL="CCS: CPT 33"                                                           
                                                                                
  CPTCCS34                   LENGTH=4                                           
  LABEL="CCS: CPT 34"                                                           
                                                                                
  CPTCCS35                   LENGTH=4                                           
  LABEL="CCS: CPT 35"                                                           
                                                                                
  CPTCCS36                   LENGTH=4                                           
  LABEL="CCS: CPT 36"                                                           
                                                                                
  CPTCCS37                   LENGTH=4                                           
  LABEL="CCS: CPT 37"                                                           
                                                                                
  CPTCCS38                   LENGTH=4                                           
  LABEL="CCS: CPT 38"                                                           
                                                                                
  CPTCCS39                   LENGTH=4                                           
  LABEL="CCS: CPT 39"                                                           
                                                                                
  CPTCCS40                   LENGTH=4                                           
  LABEL="CCS: CPT 40"                                                           
                                                                                
  CPTCCS41                   LENGTH=4                                           
  LABEL="CCS: CPT 41"                                                           
                                                                                
  CPTCCS42                   LENGTH=4                                           
  LABEL="CCS: CPT 42"                                                           
                                                                                
  CPTCCS43                   LENGTH=4                                           
  LABEL="CCS: CPT 43"                                                           
                                                                                
  CPTCCS44                   LENGTH=4                                           
  LABEL="CCS: CPT 44"                                                           
                                                                                
  CPTCCS45                   LENGTH=4                                           
  LABEL="CCS: CPT 45"                                                           
                                                                                
  CPTCCS46                   LENGTH=4                                           
  LABEL="CCS: CPT 46"                                                           
                                                                                
  CPTCCS47                   LENGTH=4                                           
  LABEL="CCS: CPT 47"                                                           
                                                                                
  CPTCCS48                   LENGTH=4                                           
  LABEL="CCS: CPT 48"                                                           
                                                                                
  CPTCCS49                   LENGTH=4                                           
  LABEL="CCS: CPT 49"                                                           
                                                                                
  CPTCCS50                   LENGTH=4                                           
  LABEL="CCS: CPT 50"                                                           
                                                                                
  CPTCCS51                   LENGTH=4                                           
  LABEL="CCS: CPT 51"                                                           
                                                                                
  CPTCCS52                   LENGTH=4                                           
  LABEL="CCS: CPT 52"                                                           
                                                                                
  CPTCCS53                   LENGTH=4                                           
  LABEL="CCS: CPT 53"                                                           
                                                                                
  CPTCCS54                   LENGTH=4                                           
  LABEL="CCS: CPT 54"                                                           
                                                                                
  CPTCCS55                   LENGTH=4                                           
  LABEL="CCS: CPT 55"                                                           
                                                                                
  CPTCCS56                   LENGTH=4                                           
  LABEL="CCS: CPT 56"                                                           
                                                                                
  CPTCCS57                   LENGTH=4                                           
  LABEL="CCS: CPT 57"                                                           
                                                                                
  CPTCCS58                   LENGTH=4                                           
  LABEL="CCS: CPT 58"                                                           
                                                                                
  DHOUR                      LENGTH=3                      FORMAT=Z4.           
  LABEL="Discharge Hour"                                                        
                                                                                
  DIED                       LENGTH=3                                           
  LABEL="Died during hospitalization"                                           
                                                                                
  DISPUB04                   LENGTH=3                                           
  LABEL="Disposition of patient (UB-04 standard coding)"                        
                                                                                
  DISPUNIFORM                LENGTH=3                                           
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
  DISP_X                     LENGTH=$2                                          
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DMONTH                     LENGTH=3                                           
  LABEL="Discharge month"                                                       
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DSHOSPID                   LENGTH=$17                                         
  LABEL="Data source hospital identifier"                                       
                                                                                
  DURATION                   LENGTH=4                                           
  LABEL="Elapsed time for hospital care in hours"                               
                                                                                
  DX1                        LENGTH=$7                                          
  LABEL="Diagnosis 1"                                                           
                                                                                
  DX2                        LENGTH=$7                                          
  LABEL="Diagnosis 2"                                                           
                                                                                
  DX3                        LENGTH=$7                                          
  LABEL="Diagnosis 3"                                                           
                                                                                
  DX4                        LENGTH=$7                                          
  LABEL="Diagnosis 4"                                                           
                                                                                
  DX5                        LENGTH=$7                                          
  LABEL="Diagnosis 5"                                                           
                                                                                
  DX6                        LENGTH=$7                                          
  LABEL="Diagnosis 6"                                                           
                                                                                
  DX7                        LENGTH=$7                                          
  LABEL="Diagnosis 7"                                                           
                                                                                
  DX8                        LENGTH=$7                                          
  LABEL="Diagnosis 8"                                                           
                                                                                
  DX9                        LENGTH=$7                                          
  LABEL="Diagnosis 9"                                                           
                                                                                
  DX10                       LENGTH=$7                                          
  LABEL="Diagnosis 10"                                                          
                                                                                
  DX11                       LENGTH=$7                                          
  LABEL="Diagnosis 11"                                                          
                                                                                
  DX12                       LENGTH=$7                                          
  LABEL="Diagnosis 12"                                                          
                                                                                
  DX13                       LENGTH=$7                                          
  LABEL="Diagnosis 13"                                                          
                                                                                
  DX14                       LENGTH=$7                                          
  LABEL="Diagnosis 14"                                                          
                                                                                
  DX15                       LENGTH=$7                                          
  LABEL="Diagnosis 15"                                                          
                                                                                
  DX16                       LENGTH=$7                                          
  LABEL="Diagnosis 16"                                                          
                                                                                
  DX17                       LENGTH=$7                                          
  LABEL="Diagnosis 17"                                                          
                                                                                
  DX18                       LENGTH=$7                                          
  LABEL="Diagnosis 18"                                                          
                                                                                
  DXCCS1                     LENGTH=4                                           
  LABEL="CCS: diagnosis 1"                                                      
                                                                                
  DXCCS2                     LENGTH=4                                           
  LABEL="CCS: diagnosis 2"                                                      
                                                                                
  DXCCS3                     LENGTH=4                                           
  LABEL="CCS: diagnosis 3"                                                      
                                                                                
  DXCCS4                     LENGTH=4                                           
  LABEL="CCS: diagnosis 4"                                                      
                                                                                
  DXCCS5                     LENGTH=4                                           
  LABEL="CCS: diagnosis 5"                                                      
                                                                                
  DXCCS6                     LENGTH=4                                           
  LABEL="CCS: diagnosis 6"                                                      
                                                                                
  DXCCS7                     LENGTH=4                                           
  LABEL="CCS: diagnosis 7"                                                      
                                                                                
  DXCCS8                     LENGTH=4                                           
  LABEL="CCS: diagnosis 8"                                                      
                                                                                
  DXCCS9                     LENGTH=4                                           
  LABEL="CCS: diagnosis 9"                                                      
                                                                                
  DXCCS10                    LENGTH=4                                           
  LABEL="CCS: diagnosis 10"                                                     
                                                                                
  DXCCS11                    LENGTH=4                                           
  LABEL="CCS: diagnosis 11"                                                     
                                                                                
  DXCCS12                    LENGTH=4                                           
  LABEL="CCS: diagnosis 12"                                                     
                                                                                
  DXCCS13                    LENGTH=4                                           
  LABEL="CCS: diagnosis 13"                                                     
                                                                                
  DXCCS14                    LENGTH=4                                           
  LABEL="CCS: diagnosis 14"                                                     
                                                                                
  DXCCS15                    LENGTH=4                                           
  LABEL="CCS: diagnosis 15"                                                     
                                                                                
  DXCCS16                    LENGTH=4                                           
  LABEL="CCS: diagnosis 16"                                                     
                                                                                
  DXCCS17                    LENGTH=4                                           
  LABEL="CCS: diagnosis 17"                                                     
                                                                                
  DXCCS18                    LENGTH=4                                           
  LABEL="CCS: diagnosis 18"                                                     
                                                                                
  DaysToEvent                LENGTH=8                                           
  LABEL="Days from 'start date' to admission"                                   
                                                                                
  ECODE1                     LENGTH=$7                                          
  LABEL="E code 1"                                                              
                                                                                
  ECODE2                     LENGTH=$7                                          
  LABEL="E code 2"                                                              
                                                                                
  ECODE3                     LENGTH=$7                                          
  LABEL="E code 3"                                                              
                                                                                
  ECODE4                     LENGTH=$7                                          
  LABEL="E code 4"                                                              
                                                                                
  ECODE5                     LENGTH=$7                                          
  LABEL="E code 5"                                                              
                                                                                
  ECODE6                     LENGTH=$7                                          
  LABEL="E code 6"                                                              
                                                                                
  ECODE7                     LENGTH=$7                                          
  LABEL="E code 7"                                                              
                                                                                
  ECODE8                     LENGTH=$7                                          
  LABEL="E code 8"                                                              
                                                                                
  ECODE9                     LENGTH=$7                                          
  LABEL="E code 9"                                                              
                                                                                
  ECODE10                    LENGTH=$7                                          
  LABEL="E code 10"                                                             
                                                                                
  E_CCS1                     LENGTH=3                                           
  LABEL="CCS: E Code 1"                                                         
                                                                                
  E_CCS2                     LENGTH=3                                           
  LABEL="CCS: E Code 2"                                                         
                                                                                
  E_CCS3                     LENGTH=3                                           
  LABEL="CCS: E Code 3"                                                         
                                                                                
  E_CCS4                     LENGTH=3                                           
  LABEL="CCS: E Code 4"                                                         
                                                                                
  E_CCS5                     LENGTH=3                                           
  LABEL="CCS: E Code 5"                                                         
                                                                                
  E_CCS6                     LENGTH=3                                           
  LABEL="CCS: E Code 6"                                                         
                                                                                
  E_CCS7                     LENGTH=3                                           
  LABEL="CCS: E Code 7"                                                         
                                                                                
  E_CCS8                     LENGTH=3                                           
  LABEL="CCS: E Code 8"                                                         
                                                                                
  E_CCS9                     LENGTH=3                                           
  LABEL="CCS: E Code 9"                                                         
                                                                                
  E_CCS10                    LENGTH=3                                           
  LABEL="CCS: E Code 10"                                                        
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HISPANIC_X                 LENGTH=$1                                          
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  HOSPBRTH                   LENGTH=3                                           
  LABEL="Indicator of birth in this hospital"                                   
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  KEY                        LENGTH=8                      FORMAT=Z15.          
  LABEL="HCUP record identifier"                                                
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MARITALSTATUSUB04          LENGTH=$1                                          
  LABEL="Patient's marital status, UB-04 standard coding"                       
                                                                                
  MARITALSTATUS_X            LENGTH=$1                                          
  LABEL="Patient's marital status (as received from source)"                    
                                                                                
  MDNUM1_R                   LENGTH=5                                           
  LABEL="Physician 1 number (re-identified)"                                    
                                                                                
  MDNUM2_R                   LENGTH=5                                           
  LABEL="Physician 2 number (re-identified)"                                    
                                                                                
  MDNUM3_R                   LENGTH=5                                           
  LABEL="Physician 3 number (re-identified)"                                    
                                                                                
  MDNUM4_R                   LENGTH=5                                           
  LABEL="Physician 4 number (re-identified)"                                    
                                                                                
  MDNUMTYPE1                 LENGTH=$1                                          
  LABEL="Physician 1 number type"                                               
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
  NCHRONIC                   LENGTH=3                                           
  LABEL="Number of chronic conditions"                                          
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures on this record"                         
                                                                                
  NDX                        LENGTH=3                                           
  LABEL="Number of diagnoses on this record"                                    
                                                                                
  NECODE                     LENGTH=3                                           
  LABEL="Number of E codes on this record"                                      
                                                                                
  NEOMAT                     LENGTH=3                                           
  LABEL="Neonatal and/or maternal DX and/or PR"                                 
                                                                                
  NPR                        LENGTH=3                                           
  LABEL="Number of procedures on this record"                                   
                                                                                
  ORPROC                     LENGTH=3                                           
  LABEL="Major operating room procedure indicator"                              
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$1                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$1                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$1                                          
  LABEL="Tertiary expected payer (as received from source)"                     
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_NCHS                    LENGTH=3                                           
  LABEL="Patient Location: NCHS Urban-Rural Code"                               
                                                                                
  PL_RUCA10_2005             LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, ten levels" 
                                                                                
  PL_RUCA2005                LENGTH=4                      FORMAT=4.1           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes"             
                                                                                
  PL_RUCA4_2005              LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, four levels"
                                                                                
  PL_RUCC                    LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Continuum Codes(RUCC)"                   
                                                                                
  PL_UIC                     LENGTH=3                                           
  LABEL="Patient location: Urban Influence Codes"                               
                                                                                
  PL_UR_CAT4                 LENGTH=3                                           
  LABEL="Patient Location: Urban-Rural 4 Categories"                            
                                                                                
  PR1                        LENGTH=$7                                          
  LABEL="Procedure 1"                                                           
                                                                                
  PR2                        LENGTH=$7                                          
  LABEL="Procedure 2"                                                           
                                                                                
  PR3                        LENGTH=$7                                          
  LABEL="Procedure 3"                                                           
                                                                                
  PR4                        LENGTH=$7                                          
  LABEL="Procedure 4"                                                           
                                                                                
  PR5                        LENGTH=$7                                          
  LABEL="Procedure 5"                                                           
                                                                                
  PR6                        LENGTH=$7                                          
  LABEL="Procedure 6"                                                           
                                                                                
  PR7                        LENGTH=$7                                          
  LABEL="Procedure 7"                                                           
                                                                                
  PR8                        LENGTH=$7                                          
  LABEL="Procedure 8"                                                           
                                                                                
  PRCCS1                     LENGTH=3                                           
  LABEL="CCS: procedure 1"                                                      
                                                                                
  PRCCS2                     LENGTH=3                                           
  LABEL="CCS: procedure 2"                                                      
                                                                                
  PRCCS3                     LENGTH=3                                           
  LABEL="CCS: procedure 3"                                                      
                                                                                
  PRCCS4                     LENGTH=3                                           
  LABEL="CCS: procedure 4"                                                      
                                                                                
  PRCCS5                     LENGTH=3                                           
  LABEL="CCS: procedure 5"                                                      
                                                                                
  PRCCS6                     LENGTH=3                                           
  LABEL="CCS: procedure 6"                                                      
                                                                                
  PRCCS7                     LENGTH=3                                           
  LABEL="CCS: procedure 7"                                                      
                                                                                
  PRCCS8                     LENGTH=3                                           
  LABEL="CCS: procedure 8"                                                      
                                                                                
  PRDAY1                     LENGTH=4                                           
  LABEL="Number of days from admission to PR1"                                  
                                                                                
  PRDAY2                     LENGTH=4                                           
  LABEL="Number of days from admission to PR2"                                  
                                                                                
  PRDAY3                     LENGTH=4                                           
  LABEL="Number of days from admission to PR3"                                  
                                                                                
  PRDAY4                     LENGTH=4                                           
  LABEL="Number of days from admission to PR4"                                  
                                                                                
  PRDAY5                     LENGTH=4                                           
  LABEL="Number of days from admission to PR5"                                  
                                                                                
  PRDAY6                     LENGTH=4                                           
  LABEL="Number of days from admission to PR6"                                  
                                                                                
  PRDAY7                     LENGTH=4                                           
  LABEL="Number of days from admission to PR7"                                  
                                                                                
  PRDAY8                     LENGTH=4                                           
  LABEL="Number of days from admission to PR8"                                  
                                                                                
  PROCTYPE                   LENGTH=3                                           
  LABEL="Procedure type indicator"                                              
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  PointOfOriginUB04          LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, UB-04 standard coding"         
                                                                                
  PointOfOrigin_X            LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, as received from source"       
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X                     LENGTH=$1                                          
  LABEL="Race (as received from source)"                                        
                                                                                
  STATE_AS                   LENGTH=3                                           
  LABEL="State Ambulatory Surgery service indicator"                            
                                                                                
  STATE_ED                   LENGTH=3                                           
  LABEL="State Emergency Department service indicator"                          
                                                                                
  STATE_OS                   LENGTH=3                                           
  LABEL="State Observation Stay service indicator"                              
                                                                                
  TOTCHG                     LENGTH=6                                           
  LABEL="Total charges (cleaned)"                                               
                                                                                
  TOTCHG_X                   LENGTH=7                                           
  LABEL="Total charges (as received from source)"                               
                                                                                
  VisitLink                  LENGTH=8                                           
  LABEL="Visit linkage variable"                                                
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  ZIP                        LENGTH=$5                                          
  LABEL="Patient ZIP Code"                                                      
                                                                                
  AYEAR                      LENGTH=3                                           
  LABEL="Admission year"                                                        
                                                                                
  BMONTH                     LENGTH=3                                           
  LABEL="Birth month"                                                           
                                                                                
  BYEAR                      LENGTH=3                                           
  LABEL="Birth year"                                                            
                                                                                
  PRMONTH1                   LENGTH=3                                           
  LABEL="Month of procedure 1"                                                  
                                                                                
  PRMONTH2                   LENGTH=3                                           
  LABEL="Month of procedure 2"                                                  
                                                                                
  PRMONTH3                   LENGTH=3                                           
  LABEL="Month of procedure 3"                                                  
                                                                                
  PRMONTH4                   LENGTH=3                                           
  LABEL="Month of procedure 4"                                                  
                                                                                
  PRMONTH5                   LENGTH=3                                           
  LABEL="Month of procedure 5"                                                  
                                                                                
  PRMONTH6                   LENGTH=3                                           
  LABEL="Month of procedure 6"                                                  
                                                                                
  PRYEAR1                    LENGTH=3                                           
  LABEL="Year of procedure 1"                                                   
                                                                                
  PRYEAR2                    LENGTH=3                                           
  LABEL="Year of procedure 2"                                                   
                                                                                
  PRYEAR3                    LENGTH=3                                           
  LABEL="Year of procedure 3"                                                   
                                                                                
  PRYEAR4                    LENGTH=3                                           
  LABEL="Year of procedure 4"                                                   
                                                                                
  PRYEAR5                    LENGTH=3                                           
  LABEL="Year of procedure 5"                                                   
                                                                                
  PRYEAR6                    LENGTH=3                                           
  LABEL="Year of procedure 6"                                                   
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                           N3PF.                               
      @4      AGEDAY                        N3PF.                               
      @7      AGEMONTH                      N3PF.                               
      @10     AHOUR                         N4PF.                               
      @14     AMONTH                        N2PF.                               
      @16     APGAR1                        N2PF.                               
      @18     APGAR5                        N2PF.                               
      @20     ATYPE                         N2PF.                               
      @22     AWEEKEND                      N2PF.                               
      @24     BILLTYPE                      $CHAR4.                             
      @28     CPT1                          $CHAR5.                             
      @33     CPT2                          $CHAR5.                             
      @38     CPT3                          $CHAR5.                             
      @43     CPT4                          $CHAR5.                             
      @48     CPT5                          $CHAR5.                             
      @53     CPT6                          $CHAR5.                             
      @58     CPT7                          $CHAR5.                             
      @63     CPT8                          $CHAR5.                             
      @68     CPT9                          $CHAR5.                             
      @73     CPT10                         $CHAR5.                             
      @78     CPT11                         $CHAR5.                             
      @83     CPT12                         $CHAR5.                             
      @88     CPT13                         $CHAR5.                             
      @93     CPT14                         $CHAR5.                             
      @98     CPT15                         $CHAR5.                             
      @103    CPT16                         $CHAR5.                             
      @108    CPT17                         $CHAR5.                             
      @113    CPT18                         $CHAR5.                             
      @118    CPT19                         $CHAR5.                             
      @123    CPT20                         $CHAR5.                             
      @128    CPT21                         $CHAR5.                             
      @133    CPT22                         $CHAR5.                             
      @138    CPT23                         $CHAR5.                             
      @143    CPT24                         $CHAR5.                             
      @148    CPT25                         $CHAR5.                             
      @153    CPT26                         $CHAR5.                             
      @158    CPT27                         $CHAR5.                             
      @163    CPT28                         $CHAR5.                             
      @168    CPT29                         $CHAR5.                             
      @173    CPT30                         $CHAR5.                             
      @178    CPT31                         $CHAR5.                             
      @183    CPT32                         $CHAR5.                             
      @188    CPT33                         $CHAR5.                             
      @193    CPT34                         $CHAR5.                             
      @198    CPT35                         $CHAR5.                             
      @203    CPT36                         $CHAR5.                             
      @208    CPT37                         $CHAR5.                             
      @213    CPT38                         $CHAR5.                             
      @218    CPT39                         $CHAR5.                             
      @223    CPT40                         $CHAR5.                             
      @228    CPT41                         $CHAR5.                             
      @233    CPT42                         $CHAR5.                             
      @238    CPT43                         $CHAR5.                             
      @243    CPT44                         $CHAR5.                             
      @248    CPT45                         $CHAR5.                             
      @253    CPT46                         $CHAR5.                             
      @258    CPT47                         $CHAR5.                             
      @263    CPT48                         $CHAR5.                             
      @268    CPT49                         $CHAR5.                             
      @273    CPT50                         $CHAR5.                             
      @278    CPT51                         $CHAR5.                             
      @283    CPT52                         $CHAR5.                             
      @288    CPT53                         $CHAR5.                             
      @293    CPT54                         $CHAR5.                             
      @298    CPT55                         $CHAR5.                             
      @303    CPT56                         $CHAR5.                             
      @308    CPT57                         $CHAR5.                             
      @313    CPT58                         $CHAR5.                             
      @318    CPTCCS1                       N3PF.                               
      @321    CPTCCS2                       N3PF.                               
      @324    CPTCCS3                       N3PF.                               
      @327    CPTCCS4                       N3PF.                               
      @330    CPTCCS5                       N3PF.                               
      @333    CPTCCS6                       N3PF.                               
      @336    CPTCCS7                       N3PF.                               
      @339    CPTCCS8                       N3PF.                               
      @342    CPTCCS9                       N3PF.                               
      @345    CPTCCS10                      N3PF.                               
      @348    CPTCCS11                      N3PF.                               
      @351    CPTCCS12                      N3PF.                               
      @354    CPTCCS13                      N3PF.                               
      @357    CPTCCS14                      N3PF.                               
      @360    CPTCCS15                      N3PF.                               
      @363    CPTCCS16                      N3PF.                               
      @366    CPTCCS17                      N3PF.                               
      @369    CPTCCS18                      N3PF.                               
      @372    CPTCCS19                      N3PF.                               
      @375    CPTCCS20                      N3PF.                               
      @378    CPTCCS21                      N3PF.                               
      @381    CPTCCS22                      N3PF.                               
      @384    CPTCCS23                      N3PF.                               
      @387    CPTCCS24                      N3PF.                               
      @390    CPTCCS25                      N3PF.                               
      @393    CPTCCS26                      N3PF.                               
      @396    CPTCCS27                      N3PF.                               
      @399    CPTCCS28                      N3PF.                               
      @402    CPTCCS29                      N3PF.                               
      @405    CPTCCS30                      N3PF.                               
      @408    CPTCCS31                      N3PF.                               
      @411    CPTCCS32                      N3PF.                               
      @414    CPTCCS33                      N3PF.                               
      @417    CPTCCS34                      N3PF.                               
      @420    CPTCCS35                      N3PF.                               
      @423    CPTCCS36                      N3PF.                               
      @426    CPTCCS37                      N3PF.                               
      @429    CPTCCS38                      N3PF.                               
      @432    CPTCCS39                      N3PF.                               
      @435    CPTCCS40                      N3PF.                               
      @438    CPTCCS41                      N3PF.                               
      @441    CPTCCS42                      N3PF.                               
      @444    CPTCCS43                      N3PF.                               
      @447    CPTCCS44                      N3PF.                               
      @450    CPTCCS45                      N3PF.                               
      @453    CPTCCS46                      N3PF.                               
      @456    CPTCCS47                      N3PF.                               
      @459    CPTCCS48                      N3PF.                               
      @462    CPTCCS49                      N3PF.                               
      @465    CPTCCS50                      N3PF.                               
      @468    CPTCCS51                      N3PF.                               
      @471    CPTCCS52                      N3PF.                               
      @474    CPTCCS53                      N3PF.                               
      @477    CPTCCS54                      N3PF.                               
      @480    CPTCCS55                      N3PF.                               
      @483    CPTCCS56                      N3PF.                               
      @486    CPTCCS57                      N3PF.                               
      @489    CPTCCS58                      N3PF.                               
      @492    DHOUR                         N4PF.                               
      @496    DIED                          N2PF.                               
      @498    DISPUB04                      N2PF.                               
      @500    DISPUNIFORM                   N2PF.                               
      @502    DISP_X                        $CHAR2.                             
      @504    DMONTH                        N2PF.                               
      @506    DQTR                          N2PF.                               
      @508    DSHOSPID                      $CHAR17.                            
      @525    DURATION                      N6PF.                               
      @531    DX1                           $CHAR7.                             
      @538    DX2                           $CHAR7.                             
      @545    DX3                           $CHAR7.                             
      @552    DX4                           $CHAR7.                             
      @559    DX5                           $CHAR7.                             
      @566    DX6                           $CHAR7.                             
      @573    DX7                           $CHAR7.                             
      @580    DX8                           $CHAR7.                             
      @587    DX9                           $CHAR7.                             
      @594    DX10                          $CHAR7.                             
      @601    DX11                          $CHAR7.                             
      @608    DX12                          $CHAR7.                             
      @615    DX13                          $CHAR7.                             
      @622    DX14                          $CHAR7.                             
      @629    DX15                          $CHAR7.                             
      @636    DX16                          $CHAR7.                             
      @643    DX17                          $CHAR7.                             
      @650    DX18                          $CHAR7.                             
      @657    DXCCS1                        N4PF.                               
      @661    DXCCS2                        N4PF.                               
      @665    DXCCS3                        N4PF.                               
      @669    DXCCS4                        N4PF.                               
      @673    DXCCS5                        N4PF.                               
      @677    DXCCS6                        N4PF.                               
      @681    DXCCS7                        N4PF.                               
      @685    DXCCS8                        N4PF.                               
      @689    DXCCS9                        N4PF.                               
      @693    DXCCS10                       N4PF.                               
      @697    DXCCS11                       N4PF.                               
      @701    DXCCS12                       N4PF.                               
      @705    DXCCS13                       N4PF.                               
      @709    DXCCS14                       N4PF.                               
      @713    DXCCS15                       N4PF.                               
      @717    DXCCS16                       N4PF.                               
      @721    DXCCS17                       N4PF.                               
      @725    DXCCS18                       N4PF.                               
      @729    DaysToEvent                   N6PF.                               
      @735    ECODE1                        $CHAR7.                             
      @742    ECODE2                        $CHAR7.                             
      @749    ECODE3                        $CHAR7.                             
      @756    ECODE4                        $CHAR7.                             
      @763    ECODE5                        $CHAR7.                             
      @770    ECODE6                        $CHAR7.                             
      @777    ECODE7                        $CHAR7.                             
      @784    ECODE8                        $CHAR7.                             
      @791    ECODE9                        $CHAR7.                             
      @798    ECODE10                       $CHAR7.                             
      @805    E_CCS1                        N4PF.                               
      @809    E_CCS2                        N4PF.                               
      @813    E_CCS3                        N4PF.                               
      @817    E_CCS4                        N4PF.                               
      @821    E_CCS5                        N4PF.                               
      @825    E_CCS6                        N4PF.                               
      @829    E_CCS7                        N4PF.                               
      @833    E_CCS8                        N4PF.                               
      @837    E_CCS9                        N4PF.                               
      @841    E_CCS10                       N4PF.                               
      @845    FEMALE                        N2PF.                               
      @847    HCUP_ED                       N2PF.                               
      @849    HCUP_OS                       N2PF.                               
      @851    HISPANIC_X                    $CHAR1.                             
      @852    HOSPBRTH                      N3PF.                               
      @855    HOSPST                        $CHAR2.                             
      @857    KEY                           15.                                 
      @872    LOS                           N5PF.                               
      @877    LOS_X                         N6PF.                               
      @883    MARITALSTATUSUB04             $CHAR1.                             
      @884    MARITALSTATUS_X               $CHAR1.                             
      @885    MDNUM1_R                      N9PF.                               
      @894    MDNUM2_R                      N9PF.                               
      @903    MDNUM3_R                      N9PF.                               
      @912    MDNUM4_R                      N9PF.                               
      @921    MDNUMTYPE1                    $CHAR1.                             
      @922    MEDINCSTQ                     N2PF.                               
      @924    MRN_R                         N9PF.                               
      @933    NCHRONIC                      N3PF.                               
      @936    NCPT                          N4PF.                               
      @940    NDX                           N3PF.                               
      @943    NECODE                        N2PF.                               
      @945    NEOMAT                        N2PF.                               
      @947    NPR                           N3PF.                               
      @950    ORPROC                        N2PF.                               
      @952    OS_TIME                       N11P2F.                             
      @963    PAY1                          N2PF.                               
      @965    PAY1_X                        $CHAR1.                             
      @966    PAY2                          N2PF.                               
      @968    PAY2_X                        $CHAR1.                             
      @969    PAY3                          N2PF.                               
      @971    PAY3_X                        $CHAR1.                             
      @972    PL_CBSA                       N3PF.                               
      @975    PL_NCHS                       N2PF.                               
      @977    PL_RUCA10_2005                N2PF.                               
      @979    PL_RUCA2005                   N4P1F.                              
      @983    PL_RUCA4_2005                 N2PF.                               
      @985    PL_RUCC                       N2PF.                               
      @987    PL_UIC                        N2PF.                               
      @989    PL_UR_CAT4                    N2PF.                               
      @991    PR1                           $CHAR7.                             
      @998    PR2                           $CHAR7.                             
      @1005   PR3                           $CHAR7.                             
      @1012   PR4                           $CHAR7.                             
      @1019   PR5                           $CHAR7.                             
      @1026   PR6                           $CHAR7.                             
      @1033   PR7                           $CHAR7.                             
      @1040   PR8                           $CHAR7.                             
      @1047   PRCCS1                        N3PF.                               
      @1050   PRCCS2                        N3PF.                               
      @1053   PRCCS3                        N3PF.                               
      @1056   PRCCS4                        N3PF.                               
      @1059   PRCCS5                        N3PF.                               
      @1062   PRCCS6                        N3PF.                               
      @1065   PRCCS7                        N3PF.                               
      @1068   PRCCS8                        N3PF.                               
      @1071   PRDAY1                        N5PF.                               
      @1076   PRDAY2                        N5PF.                               
      @1081   PRDAY3                        N5PF.                               
      @1086   PRDAY4                        N5PF.                               
      @1091   PRDAY5                        N5PF.                               
      @1096   PRDAY6                        N5PF.                               
      @1101   PRDAY7                        N5PF.                               
      @1106   PRDAY8                        N5PF.                               
      @1111   PROCTYPE                      N3PF.                               
      @1114   PSTATE                        $CHAR2.                             
      @1116   PSTCO2                        N5PF.                               
      @1121   PointOfOriginUB04             $CHAR1.                             
      @1122   PointOfOrigin_X               $CHAR1.                             
      @1123   RACE                          N2PF.                               
      @1125   RACE_X                        $CHAR1.                             
      @1126   STATE_AS                      N2PF.                               
      @1128   STATE_ED                      N2PF.                               
      @1130   STATE_OS                      N2PF.                               
      @1132   TOTCHG                        N10PF.                              
      @1142   TOTCHG_X                      N15P2F.                             
      @1157   VisitLink                     N9PF.                               
      @1166   YEAR                          N4PF.                               
      @1170   ZIP3                          $CHAR3.                             
      @1173   ZIPINC_QRTL                   N3PF.                               
      @1176   ZIP                           $CHAR5.                             
      @1181   AYEAR                         N4PF.                               
      @1185   BMONTH                        N2PF.                               
      @1187   BYEAR                         N4PF.                               
      @1191   PRMONTH1                      N2PF.                               
      @1193   PRMONTH2                      N2PF.                               
      @1195   PRMONTH3                      N2PF.                               
      @1197   PRMONTH4                      N2PF.                               
      @1199   PRMONTH5                      N2PF.                               
      @1201   PRMONTH6                      N2PF.                               
      @1203   PRYEAR1                       N4PF.                               
      @1207   PRYEAR2                       N4PF.                               
      @1211   PRYEAR3                       N4PF.                               
      @1215   PRYEAR4                       N4PF.                               
      @1219   PRYEAR5                       N4PF.                               
      @1223   PRYEAR6                       N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
