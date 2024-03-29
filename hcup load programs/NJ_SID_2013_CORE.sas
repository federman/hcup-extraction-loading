/*******************************************************************            
* Creation Date: 08/06/2014                                                     
*   NJ_SID_2013_CORE.SAS:                                                       
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      INPATIENT STAY CORE FILE INTO SAS                                        
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
DATA NJ_SIDC_2013_CORE;                                                         
INFILE 'NJ_SID_2013_CORE.ASC' FIRSTOBS=3 LRECL = 1700;                          
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY                     LENGTH=3                                           
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AHOUR                      LENGTH=3                 FORMAT=Z4.                
  LABEL="Admission Hour"                                                        
                                                                                
  AMONTH                     LENGTH=3                                           
  LABEL="Admission month"                                                       
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  BILLTYPE                   LENGTH=$4                                          
  LABEL="Type of bill, UB-04 coding"                                            
                                                                                
  BWT                        LENGTH=4                                           
  LABEL="Birth weight in grams"                                                 
                                                                                
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
                                                                                
  CPTM1_1                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 1"                                          
                                                                                
  CPTM1_2                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 2"                                          
                                                                                
  CPTM1_3                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 3"                                          
                                                                                
  CPTM1_4                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 4"                                          
                                                                                
  CPTM1_5                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 5"                                          
                                                                                
  CPTM1_6                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 6"                                          
                                                                                
  CPTM1_7                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 7"                                          
                                                                                
  CPTM1_8                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 8"                                          
                                                                                
  CPTM1_9                    LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 9"                                          
                                                                                
  CPTM1_10                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 10"                                         
                                                                                
  CPTM1_11                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 11"                                         
                                                                                
  CPTM1_12                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 12"                                         
                                                                                
  CPTM1_13                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 13"                                         
                                                                                
  CPTM1_14                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 14"                                         
                                                                                
  CPTM1_15                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 15"                                         
                                                                                
  CPTM1_16                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 16"                                         
                                                                                
  CPTM1_17                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 17"                                         
                                                                                
  CPTM1_18                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 18"                                         
                                                                                
  CPTM1_19                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 19"                                         
                                                                                
  CPTM1_20                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 20"                                         
                                                                                
  CPTM1_21                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 21"                                         
                                                                                
  CPTM1_22                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 22"                                         
                                                                                
  CPTM1_23                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 23"                                         
                                                                                
  CPTM1_24                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 24"                                         
                                                                                
  CPTM1_25                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 25"                                         
                                                                                
  CPTM1_26                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 26"                                         
                                                                                
  CPTM1_27                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 27"                                         
                                                                                
  CPTM1_28                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 28"                                         
                                                                                
  CPTM1_29                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 29"                                         
                                                                                
  CPTM1_30                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 30"                                         
                                                                                
  CPTM1_31                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 31"                                         
                                                                                
  CPTM1_32                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 32"                                         
                                                                                
  CPTM1_33                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 33"                                         
                                                                                
  CPTM1_34                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 34"                                         
                                                                                
  CPTM1_35                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 35"                                         
                                                                                
  CPTM1_36                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 36"                                         
                                                                                
  CPTM1_37                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 37"                                         
                                                                                
  CPTM1_38                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 38"                                         
                                                                                
  CPTM1_39                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 39"                                         
                                                                                
  CPTM1_40                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 40"                                         
                                                                                
  CPTM1_41                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 41"                                         
                                                                                
  CPTM1_42                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 42"                                         
                                                                                
  CPTM1_43                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 43"                                         
                                                                                
  CPTM1_44                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 44"                                         
                                                                                
  CPTM1_45                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 45"                                         
                                                                                
  CPTM1_46                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 46"                                         
                                                                                
  CPTM1_47                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 47"                                         
                                                                                
  CPTM1_48                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 48"                                         
                                                                                
  CPTM1_49                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 49"                                         
                                                                                
  CPTM1_50                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 50"                                         
                                                                                
  CPTM2_1                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 1"                                         
                                                                                
  CPTM2_2                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 2"                                         
                                                                                
  CPTM2_3                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 3"                                         
                                                                                
  CPTM2_4                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 4"                                         
                                                                                
  CPTM2_5                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 5"                                         
                                                                                
  CPTM2_6                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 6"                                         
                                                                                
  CPTM2_7                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 7"                                         
                                                                                
  CPTM2_8                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 8"                                         
                                                                                
  CPTM2_9                    LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 9"                                         
                                                                                
  CPTM2_10                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 10"                                        
                                                                                
  CPTM2_11                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 11"                                        
                                                                                
  CPTM2_12                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 12"                                        
                                                                                
  CPTM2_13                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 13"                                        
                                                                                
  CPTM2_14                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 14"                                        
                                                                                
  CPTM2_15                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 15"                                        
                                                                                
  CPTM2_16                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 16"                                        
                                                                                
  CPTM2_17                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 17"                                        
                                                                                
  CPTM2_18                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 18"                                        
                                                                                
  CPTM2_19                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 19"                                        
                                                                                
  CPTM2_20                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 20"                                        
                                                                                
  CPTM2_21                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 21"                                        
                                                                                
  CPTM2_22                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 22"                                        
                                                                                
  CPTM2_23                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 23"                                        
                                                                                
  CPTM2_24                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 24"                                        
                                                                                
  CPTM2_25                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 25"                                        
                                                                                
  CPTM2_26                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 26"                                        
                                                                                
  CPTM2_27                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 27"                                        
                                                                                
  CPTM2_28                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 28"                                        
                                                                                
  CPTM2_29                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 29"                                        
                                                                                
  CPTM2_30                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 30"                                        
                                                                                
  CPTM2_31                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 31"                                        
                                                                                
  CPTM2_32                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 32"                                        
                                                                                
  CPTM2_33                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 33"                                        
                                                                                
  CPTM2_34                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 34"                                        
                                                                                
  CPTM2_35                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 35"                                        
                                                                                
  CPTM2_36                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 36"                                        
                                                                                
  CPTM2_37                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 37"                                        
                                                                                
  CPTM2_38                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 38"                                        
                                                                                
  CPTM2_39                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 39"                                        
                                                                                
  CPTM2_40                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 40"                                        
                                                                                
  CPTM2_41                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 41"                                        
                                                                                
  CPTM2_42                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 42"                                        
                                                                                
  CPTM2_43                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 43"                                        
                                                                                
  CPTM2_44                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 44"                                        
                                                                                
  CPTM2_45                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 45"                                        
                                                                                
  CPTM2_46                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 46"                                        
                                                                                
  CPTM2_47                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 47"                                        
                                                                                
  CPTM2_48                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 48"                                        
                                                                                
  CPTM2_49                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 49"                                        
                                                                                
  CPTM2_50                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 50"                                        
                                                                                
  DHOUR                      LENGTH=3                 FORMAT=Z4.                
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
                                                                                
  DRG                        LENGTH=3                                           
  LABEL="DRG in effect on discharge date"                                       
                                                                                
  DRG24                      LENGTH=3                                           
  LABEL="DRG, version 24"                                                       
                                                                                
  DRGVER                     LENGTH=3                                           
  LABEL="DRG grouper version used on discharge date"                            
                                                                                
  DRG_NoPOA                  LENGTH=3                                           
  LABEL="DRG in use on discharge date, calculated without POA"                  
                                                                                
  DSHOSPID                   LENGTH=$17                                         
  LABEL="Data source hospital identifier"                                       
                                                                                
  DX1                        LENGTH=$5                                          
  LABEL="Diagnosis 1"                                                           
                                                                                
  DX2                        LENGTH=$5                                          
  LABEL="Diagnosis 2"                                                           
                                                                                
  DX3                        LENGTH=$5                                          
  LABEL="Diagnosis 3"                                                           
                                                                                
  DX4                        LENGTH=$5                                          
  LABEL="Diagnosis 4"                                                           
                                                                                
  DX5                        LENGTH=$5                                          
  LABEL="Diagnosis 5"                                                           
                                                                                
  DX6                        LENGTH=$5                                          
  LABEL="Diagnosis 6"                                                           
                                                                                
  DX7                        LENGTH=$5                                          
  LABEL="Diagnosis 7"                                                           
                                                                                
  DX8                        LENGTH=$5                                          
  LABEL="Diagnosis 8"                                                           
                                                                                
  DX9                        LENGTH=$5                                          
  LABEL="Diagnosis 9"                                                           
                                                                                
  DX10                       LENGTH=$5                                          
  LABEL="Diagnosis 10"                                                          
                                                                                
  DX11                       LENGTH=$5                                          
  LABEL="Diagnosis 11"                                                          
                                                                                
  DX12                       LENGTH=$5                                          
  LABEL="Diagnosis 12"                                                          
                                                                                
  DX13                       LENGTH=$5                                          
  LABEL="Diagnosis 13"                                                          
                                                                                
  DX14                       LENGTH=$5                                          
  LABEL="Diagnosis 14"                                                          
                                                                                
  DX15                       LENGTH=$5                                          
  LABEL="Diagnosis 15"                                                          
                                                                                
  DX16                       LENGTH=$5                                          
  LABEL="Diagnosis 16"                                                          
                                                                                
  DX17                       LENGTH=$5                                          
  LABEL="Diagnosis 17"                                                          
                                                                                
  DX18                       LENGTH=$5                                          
  LABEL="Diagnosis 18"                                                          
                                                                                
  DX19                       LENGTH=$5                                          
  LABEL="Diagnosis 19"                                                          
                                                                                
  DX20                       LENGTH=$5                                          
  LABEL="Diagnosis 20"                                                          
                                                                                
  DX21                       LENGTH=$5                                          
  LABEL="Diagnosis 21"                                                          
                                                                                
  DX22                       LENGTH=$5                                          
  LABEL="Diagnosis 22"                                                          
                                                                                
  DX23                       LENGTH=$5                                          
  LABEL="Diagnosis 23"                                                          
                                                                                
  DX24                       LENGTH=$5                                          
  LABEL="Diagnosis 24"                                                          
                                                                                
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
                                                                                
  DXCCS19                    LENGTH=4                                           
  LABEL="CCS: diagnosis 19"                                                     
                                                                                
  DXCCS20                    LENGTH=4                                           
  LABEL="CCS: diagnosis 20"                                                     
                                                                                
  DXCCS21                    LENGTH=4                                           
  LABEL="CCS: diagnosis 21"                                                     
                                                                                
  DXCCS22                    LENGTH=4                                           
  LABEL="CCS: diagnosis 22"                                                     
                                                                                
  DXCCS23                    LENGTH=4                                           
  LABEL="CCS: diagnosis 23"                                                     
                                                                                
  DXCCS24                    LENGTH=4                                           
  LABEL="CCS: diagnosis 24"                                                     
                                                                                
  DXPOA1                     LENGTH=$1                                          
  LABEL="Diagnosis 1, present on admission indicator"                           
                                                                                
  DXPOA2                     LENGTH=$1                                          
  LABEL="Diagnosis 2, present on admission indicator"                           
                                                                                
  DXPOA3                     LENGTH=$1                                          
  LABEL="Diagnosis 3, present on admission indicator"                           
                                                                                
  DXPOA4                     LENGTH=$1                                          
  LABEL="Diagnosis 4, present on admission indicator"                           
                                                                                
  DXPOA5                     LENGTH=$1                                          
  LABEL="Diagnosis 5, present on admission indicator"                           
                                                                                
  DXPOA6                     LENGTH=$1                                          
  LABEL="Diagnosis 6, present on admission indicator"                           
                                                                                
  DXPOA7                     LENGTH=$1                                          
  LABEL="Diagnosis 7, present on admission indicator"                           
                                                                                
  DXPOA8                     LENGTH=$1                                          
  LABEL="Diagnosis 8, present on admission indicator"                           
                                                                                
  DXPOA9                     LENGTH=$1                                          
  LABEL="Diagnosis 9, present on admission indicator"                           
                                                                                
  DXPOA10                    LENGTH=$1                                          
  LABEL="Diagnosis 10, present on admission indicator"                          
                                                                                
  DXPOA11                    LENGTH=$1                                          
  LABEL="Diagnosis 11, present on admission indicator"                          
                                                                                
  DXPOA12                    LENGTH=$1                                          
  LABEL="Diagnosis 12, present on admission indicator"                          
                                                                                
  DXPOA13                    LENGTH=$1                                          
  LABEL="Diagnosis 13, present on admission indicator"                          
                                                                                
  DXPOA14                    LENGTH=$1                                          
  LABEL="Diagnosis 14, present on admission indicator"                          
                                                                                
  DXPOA15                    LENGTH=$1                                          
  LABEL="Diagnosis 15, present on admission indicator"                          
                                                                                
  DXPOA16                    LENGTH=$1                                          
  LABEL="Diagnosis 16, present on admission indicator"                          
                                                                                
  DXPOA17                    LENGTH=$1                                          
  LABEL="Diagnosis 17, present on admission indicator"                          
                                                                                
  DXPOA18                    LENGTH=$1                                          
  LABEL="Diagnosis 18, present on admission indicator"                          
                                                                                
  DXPOA19                    LENGTH=$1                                          
  LABEL="Diagnosis 19, present on admission indicator"                          
                                                                                
  DXPOA20                    LENGTH=$1                                          
  LABEL="Diagnosis 20, present on admission indicator"                          
                                                                                
  DXPOA21                    LENGTH=$1                                          
  LABEL="Diagnosis 21, present on admission indicator"                          
                                                                                
  DXPOA22                    LENGTH=$1                                          
  LABEL="Diagnosis 22, present on admission indicator"                          
                                                                                
  DXPOA23                    LENGTH=$1                                          
  LABEL="Diagnosis 23, present on admission indicator"                          
                                                                                
  DXPOA24                    LENGTH=$1                                          
  LABEL="Diagnosis 24, present on admission indicator"                          
                                                                                
  DX_Admitting               LENGTH=$5                                          
  LABEL="Admitting Diagnosis Code"                                              
                                                                                
  ECODE1                     LENGTH=$5                                          
  LABEL="E code 1"                                                              
                                                                                
  ECODE2                     LENGTH=$5                                          
  LABEL="E code 2"                                                              
                                                                                
  ECODE3                     LENGTH=$5                                          
  LABEL="E code 3"                                                              
                                                                                
  ECODE4                     LENGTH=$5                                          
  LABEL="E code 4"                                                              
                                                                                
  ECODE5                     LENGTH=$5                                          
  LABEL="E code 5"                                                              
                                                                                
  ECODE6                     LENGTH=$5                                          
  LABEL="E code 6"                                                              
                                                                                
  ECODE7                     LENGTH=$5                                          
  LABEL="E code 7"                                                              
                                                                                
  ECODE8                     LENGTH=$5                                          
  LABEL="E code 8"                                                              
                                                                                
  ECODE9                     LENGTH=$5                                          
  LABEL="E code 9"                                                              
                                                                                
  ECODE10                    LENGTH=$5                                          
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
                                                                                
  E_POA1                     LENGTH=$1                                          
  LABEL="E Code 1, present on admission indicator"                              
                                                                                
  E_POA2                     LENGTH=$1                                          
  LABEL="E Code 2, present on admission indicator"                              
                                                                                
  E_POA3                     LENGTH=$1                                          
  LABEL="E Code 3, present on admission indicator"                              
                                                                                
  E_POA4                     LENGTH=$1                                          
  LABEL="E Code 4, present on admission indicator"                              
                                                                                
  E_POA5                     LENGTH=$1                                          
  LABEL="E Code 5, present on admission indicator"                              
                                                                                
  E_POA6                     LENGTH=$1                                          
  LABEL="E Code 6, present on admission indicator"                              
                                                                                
  E_POA7                     LENGTH=$1                                          
  LABEL="E Code 7, present on admission indicator"                              
                                                                                
  E_POA8                     LENGTH=$1                                          
  LABEL="E Code 8, present on admission indicator"                              
                                                                                
  E_POA9                     LENGTH=$1                                          
  LABEL="E Code 9, present on admission indicator"                              
                                                                                
  E_POA10                    LENGTH=$1                                          
  LABEL="E Code 10, present on admission indicator"                             
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HISPANIC_X                 LENGTH=$5                                          
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  HOSPBRTH                   LENGTH=3                                           
  LABEL="Indicator of birth in this hospital"                                   
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  KEY                        LENGTH=8                 FORMAT=Z15.               
  LABEL="HCUP record identifier"                                                
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MARITALSTATUSUB04          LENGTH=$1                                          
  LABEL="Patient's marital status, UB-04 standard coding"                       
                                                                                
  MDC                        LENGTH=3                                           
  LABEL="MDC in effect on discharge date"                                       
                                                                                
  MDC24                      LENGTH=3                                           
  LABEL="MDC, version 24"                                                       
                                                                                
  MDC_NoPOA                  LENGTH=3                                           
  LABEL="MDC in use on discharge date, calculated without POA"                  
                                                                                
  MDNUM1_R                   LENGTH=5                                           
  LABEL="Physician 1 number (re-identified)"                                    
                                                                                
  MDNUM2_R                   LENGTH=5                                           
  LABEL="Physician 2 number (re-identified)"                                    
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MOMNUM_R                   LENGTH=5                                           
  LABEL="Mother's number (re-identified)"                                       
                                                                                
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
                                                                                
  OS_TIME                    LENGTH=4                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  P7EDSRC_X                  LENGTH=$2                                          
  LABEL="Condition Code P7, Direct Inpatient Admission from Emergency Room"     
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$3                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$3                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$3                                          
  LABEL="Tertiary expected payer (as received from source)"                     
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_NCHS                    LENGTH=3                                           
  LABEL="Patient Location: NCHS Urban-Rural Code"                               
                                                                                
  PL_RUCA10_2005             LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, ten levels" 
                                                                                
  PL_RUCA2005                LENGTH=4                 FORMAT=4.1                
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes"             
                                                                                
  PL_RUCA4_2005              LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, four levels"
                                                                                
  PL_RUCC                    LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Continuum Codes(RUCC)"                   
                                                                                
  PL_UIC                     LENGTH=3                                           
  LABEL="Patient location: Urban Influence Codes"                               
                                                                                
  PL_UR_CAT4                 LENGTH=3                                           
  LABEL="Patient Location: Urban-Rural 4 Categories"                            
                                                                                
  PR1                        LENGTH=$4                                          
  LABEL="Procedure 1"                                                           
                                                                                
  PR2                        LENGTH=$4                                          
  LABEL="Procedure 2"                                                           
                                                                                
  PR3                        LENGTH=$4                                          
  LABEL="Procedure 3"                                                           
                                                                                
  PR4                        LENGTH=$4                                          
  LABEL="Procedure 4"                                                           
                                                                                
  PR5                        LENGTH=$4                                          
  LABEL="Procedure 5"                                                           
                                                                                
  PR6                        LENGTH=$4                                          
  LABEL="Procedure 6"                                                           
                                                                                
  PR7                        LENGTH=$4                                          
  LABEL="Procedure 7"                                                           
                                                                                
  PR8                        LENGTH=$4                                          
  LABEL="Procedure 8"                                                           
                                                                                
  PR9                        LENGTH=$4                                          
  LABEL="Procedure 9"                                                           
                                                                                
  PR10                       LENGTH=$4                                          
  LABEL="Procedure 10"                                                          
                                                                                
  PR11                       LENGTH=$4                                          
  LABEL="Procedure 11"                                                          
                                                                                
  PR12                       LENGTH=$4                                          
  LABEL="Procedure 12"                                                          
                                                                                
  PR13                       LENGTH=$4                                          
  LABEL="Procedure 13"                                                          
                                                                                
  PR14                       LENGTH=$4                                          
  LABEL="Procedure 14"                                                          
                                                                                
  PR15                       LENGTH=$4                                          
  LABEL="Procedure 15"                                                          
                                                                                
  PR16                       LENGTH=$4                                          
  LABEL="Procedure 16"                                                          
                                                                                
  PR17                       LENGTH=$4                                          
  LABEL="Procedure 17"                                                          
                                                                                
  PR18                       LENGTH=$4                                          
  LABEL="Procedure 18"                                                          
                                                                                
  PR19                       LENGTH=$4                                          
  LABEL="Procedure 19"                                                          
                                                                                
  PR20                       LENGTH=$4                                          
  LABEL="Procedure 20"                                                          
                                                                                
  PR21                       LENGTH=$4                                          
  LABEL="Procedure 21"                                                          
                                                                                
  PR22                       LENGTH=$4                                          
  LABEL="Procedure 22"                                                          
                                                                                
  PR23                       LENGTH=$4                                          
  LABEL="Procedure 23"                                                          
                                                                                
  PR24                       LENGTH=$4                                          
  LABEL="Procedure 24"                                                          
                                                                                
  PR25                       LENGTH=$4                                          
  LABEL="Procedure 25"                                                          
                                                                                
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
                                                                                
  PRCCS9                     LENGTH=3                                           
  LABEL="CCS: procedure 9"                                                      
                                                                                
  PRCCS10                    LENGTH=3                                           
  LABEL="CCS: procedure 10"                                                     
                                                                                
  PRCCS11                    LENGTH=3                                           
  LABEL="CCS: procedure 11"                                                     
                                                                                
  PRCCS12                    LENGTH=3                                           
  LABEL="CCS: procedure 12"                                                     
                                                                                
  PRCCS13                    LENGTH=3                                           
  LABEL="CCS: procedure 13"                                                     
                                                                                
  PRCCS14                    LENGTH=3                                           
  LABEL="CCS: procedure 14"                                                     
                                                                                
  PRCCS15                    LENGTH=3                                           
  LABEL="CCS: procedure 15"                                                     
                                                                                
  PRCCS16                    LENGTH=3                                           
  LABEL="CCS: procedure 16"                                                     
                                                                                
  PRCCS17                    LENGTH=3                                           
  LABEL="CCS: procedure 17"                                                     
                                                                                
  PRCCS18                    LENGTH=3                                           
  LABEL="CCS: procedure 18"                                                     
                                                                                
  PRCCS19                    LENGTH=3                                           
  LABEL="CCS: procedure 19"                                                     
                                                                                
  PRCCS20                    LENGTH=3                                           
  LABEL="CCS: procedure 20"                                                     
                                                                                
  PRCCS21                    LENGTH=3                                           
  LABEL="CCS: procedure 21"                                                     
                                                                                
  PRCCS22                    LENGTH=3                                           
  LABEL="CCS: procedure 22"                                                     
                                                                                
  PRCCS23                    LENGTH=3                                           
  LABEL="CCS: procedure 23"                                                     
                                                                                
  PRCCS24                    LENGTH=3                                           
  LABEL="CCS: procedure 24"                                                     
                                                                                
  PRCCS25                    LENGTH=3                                           
  LABEL="CCS: procedure 25"                                                     
                                                                                
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
                                                                                
  PRDAY9                     LENGTH=4                                           
  LABEL="Number of days from admission to PR9"                                  
                                                                                
  PRDAY10                    LENGTH=4                                           
  LABEL="Number of days from admission to PR10"                                 
                                                                                
  PRDAY11                    LENGTH=4                                           
  LABEL="Number of days from admission to PR11"                                 
                                                                                
  PRDAY12                    LENGTH=4                                           
  LABEL="Number of days from admission to PR12"                                 
                                                                                
  PRDAY13                    LENGTH=4                                           
  LABEL="Number of days from admission to PR13"                                 
                                                                                
  PRDAY14                    LENGTH=4                                           
  LABEL="Number of days from admission to PR14"                                 
                                                                                
  PRDAY15                    LENGTH=4                                           
  LABEL="Number of days from admission to PR15"                                 
                                                                                
  PRDAY16                    LENGTH=4                                           
  LABEL="Number of days from admission to PR16"                                 
                                                                                
  PRDAY17                    LENGTH=4                                           
  LABEL="Number of days from admission to PR17"                                 
                                                                                
  PRDAY18                    LENGTH=4                                           
  LABEL="Number of days from admission to PR18"                                 
                                                                                
  PRDAY19                    LENGTH=4                                           
  LABEL="Number of days from admission to PR19"                                 
                                                                                
  PRDAY20                    LENGTH=4                                           
  LABEL="Number of days from admission to PR20"                                 
                                                                                
  PRDAY21                    LENGTH=4                                           
  LABEL="Number of days from admission to PR21"                                 
                                                                                
  PRDAY22                    LENGTH=4                                           
  LABEL="Number of days from admission to PR22"                                 
                                                                                
  PRDAY23                    LENGTH=4                                           
  LABEL="Number of days from admission to PR23"                                 
                                                                                
  PRDAY24                    LENGTH=4                                           
  LABEL="Number of days from admission to PR24"                                 
                                                                                
  PRDAY25                    LENGTH=4                                           
  LABEL="Number of days from admission to PR25"                                 
                                                                                
  PROCTYPE                   LENGTH=3                                           
  LABEL="Procedure type indicator"                                              
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO                      LENGTH=4                 FORMAT=Z5.                
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO2                     LENGTH=4                 FORMAT=Z5.                
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  PointOfOriginUB04          LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, UB-04 standard coding"         
                                                                                
  PointOfOrigin_X            LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, as received from source"       
                                                                                
  PrimLang                   LENGTH=$3                                          
  LABEL="Primary language of patient"                                           
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X                     LENGTH=$5                                          
  LABEL="Race (as received from source)"                                        
                                                                                
  READMIT                    LENGTH=3                                           
  LABEL="Readmission"                                                           
                                                                                
  TOTCHG                     LENGTH=6                                           
  LABEL="Total charges (cleaned)"                                               
                                                                                
  TOTCHG_X                   LENGTH=7                                           
  LABEL="Total charges (as received from source)"                               
                                                                                
  TRAN_IN                    LENGTH=3                                           
  LABEL="Transfer in indicator"                                                 
                                                                                
  TRAN_OUT                   LENGTH=3                                           
  LABEL="Transfer out indicator"                                                
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  TOWN                       LENGTH=$4                                          
  LABEL="Patient town of residence (as received from source)"                   
                                                                                
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
                                                                                
  PRMONTH7                   LENGTH=3                                           
  LABEL="Month of procedure 7"                                                  
                                                                                
  PRMONTH8                   LENGTH=3                                           
  LABEL="Month of procedure 8"                                                  
                                                                                
  PRMONTH9                   LENGTH=3                                           
  LABEL="Month of procedure 9"                                                  
                                                                                
  PRMONTH10                  LENGTH=3                                           
  LABEL="Month of procedure 10"                                                 
                                                                                
  PRMONTH11                  LENGTH=3                                           
  LABEL="Month of procedure 11"                                                 
                                                                                
  PRMONTH12                  LENGTH=3                                           
  LABEL="Month of procedure 12"                                                 
                                                                                
  PRMONTH13                  LENGTH=3                                           
  LABEL="Month of procedure 13"                                                 
                                                                                
  PRMONTH14                  LENGTH=3                                           
  LABEL="Month of procedure 14"                                                 
                                                                                
  PRMONTH15                  LENGTH=3                                           
  LABEL="Month of procedure 15"                                                 
                                                                                
  PRMONTH16                  LENGTH=3                                           
  LABEL="Month of procedure 16"                                                 
                                                                                
  PRMONTH17                  LENGTH=3                                           
  LABEL="Month of procedure 17"                                                 
                                                                                
  PRMONTH18                  LENGTH=3                                           
  LABEL="Month of procedure 18"                                                 
                                                                                
  PRMONTH19                  LENGTH=3                                           
  LABEL="Month of procedure 19"                                                 
                                                                                
  PRMONTH20                  LENGTH=3                                           
  LABEL="Month of procedure 20"                                                 
                                                                                
  PRMONTH21                  LENGTH=3                                           
  LABEL="Month of procedure 21"                                                 
                                                                                
  PRMONTH22                  LENGTH=3                                           
  LABEL="Month of procedure 22"                                                 
                                                                                
  PRMONTH23                  LENGTH=3                                           
  LABEL="Month of procedure 23"                                                 
                                                                                
  PRMONTH24                  LENGTH=3                                           
  LABEL="Month of procedure 24"                                                 
                                                                                
  PRMONTH25                  LENGTH=3                                           
  LABEL="Month of procedure 25"                                                 
                                                                                
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
                                                                                
  PRYEAR7                    LENGTH=3                                           
  LABEL="Year of procedure 7"                                                   
                                                                                
  PRYEAR8                    LENGTH=3                                           
  LABEL="Year of procedure 8"                                                   
                                                                                
  PRYEAR9                    LENGTH=3                                           
  LABEL="Year of procedure 9"                                                   
                                                                                
  PRYEAR10                   LENGTH=3                                           
  LABEL="Year of procedure 10"                                                  
                                                                                
  PRYEAR11                   LENGTH=3                                           
  LABEL="Year of procedure 11"                                                  
                                                                                
  PRYEAR12                   LENGTH=3                                           
  LABEL="Year of procedure 12"                                                  
                                                                                
  PRYEAR13                   LENGTH=3                                           
  LABEL="Year of procedure 13"                                                  
                                                                                
  PRYEAR14                   LENGTH=3                                           
  LABEL="Year of procedure 14"                                                  
                                                                                
  PRYEAR15                   LENGTH=3                                           
  LABEL="Year of procedure 15"                                                  
                                                                                
  PRYEAR16                   LENGTH=3                                           
  LABEL="Year of procedure 16"                                                  
                                                                                
  PRYEAR17                   LENGTH=3                                           
  LABEL="Year of procedure 17"                                                  
                                                                                
  PRYEAR18                   LENGTH=3                                           
  LABEL="Year of procedure 18"                                                  
                                                                                
  PRYEAR19                   LENGTH=3                                           
  LABEL="Year of procedure 19"                                                  
                                                                                
  PRYEAR20                   LENGTH=3                                           
  LABEL="Year of procedure 20"                                                  
                                                                                
  PRYEAR21                   LENGTH=3                                           
  LABEL="Year of procedure 21"                                                  
                                                                                
  PRYEAR22                   LENGTH=3                                           
  LABEL="Year of procedure 22"                                                  
                                                                                
  PRYEAR23                   LENGTH=3                                           
  LABEL="Year of procedure 23"                                                  
                                                                                
  PRYEAR24                   LENGTH=3                                           
  LABEL="Year of procedure 24"                                                  
                                                                                
  PRYEAR25                   LENGTH=3                                           
  LABEL="Year of procedure 25"                                                  
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                      N3PF.                                    
      @4      AGEDAY                   N3PF.                                    
      @7      AGEMONTH                 N3PF.                                    
      @10     AHOUR                    N4PF.                                    
      @14     AMONTH                   N2PF.                                    
      @16     ATYPE                    N2PF.                                    
      @18     AWEEKEND                 N2PF.                                    
      @20     BILLTYPE                 $CHAR4.                                  
      @24     BWT                      N4PF.                                    
      @28     CPT1                     $CHAR5.                                  
      @33     CPT2                     $CHAR5.                                  
      @38     CPT3                     $CHAR5.                                  
      @43     CPT4                     $CHAR5.                                  
      @48     CPT5                     $CHAR5.                                  
      @53     CPT6                     $CHAR5.                                  
      @58     CPT7                     $CHAR5.                                  
      @63     CPT8                     $CHAR5.                                  
      @68     CPT9                     $CHAR5.                                  
      @73     CPT10                    $CHAR5.                                  
      @78     CPT11                    $CHAR5.                                  
      @83     CPT12                    $CHAR5.                                  
      @88     CPT13                    $CHAR5.                                  
      @93     CPT14                    $CHAR5.                                  
      @98     CPT15                    $CHAR5.                                  
      @103    CPT16                    $CHAR5.                                  
      @108    CPT17                    $CHAR5.                                  
      @113    CPT18                    $CHAR5.                                  
      @118    CPT19                    $CHAR5.                                  
      @123    CPT20                    $CHAR5.                                  
      @128    CPT21                    $CHAR5.                                  
      @133    CPT22                    $CHAR5.                                  
      @138    CPT23                    $CHAR5.                                  
      @143    CPT24                    $CHAR5.                                  
      @148    CPT25                    $CHAR5.                                  
      @153    CPT26                    $CHAR5.                                  
      @158    CPT27                    $CHAR5.                                  
      @163    CPT28                    $CHAR5.                                  
      @168    CPT29                    $CHAR5.                                  
      @173    CPT30                    $CHAR5.                                  
      @178    CPT31                    $CHAR5.                                  
      @183    CPT32                    $CHAR5.                                  
      @188    CPT33                    $CHAR5.                                  
      @193    CPT34                    $CHAR5.                                  
      @198    CPT35                    $CHAR5.                                  
      @203    CPT36                    $CHAR5.                                  
      @208    CPT37                    $CHAR5.                                  
      @213    CPT38                    $CHAR5.                                  
      @218    CPT39                    $CHAR5.                                  
      @223    CPT40                    $CHAR5.                                  
      @228    CPT41                    $CHAR5.                                  
      @233    CPT42                    $CHAR5.                                  
      @238    CPT43                    $CHAR5.                                  
      @243    CPT44                    $CHAR5.                                  
      @248    CPT45                    $CHAR5.                                  
      @253    CPT46                    $CHAR5.                                  
      @258    CPT47                    $CHAR5.                                  
      @263    CPT48                    $CHAR5.                                  
      @268    CPT49                    $CHAR5.                                  
      @273    CPT50                    $CHAR5.                                  
      @278    CPTCCS1                  N3PF.                                    
      @281    CPTCCS2                  N3PF.                                    
      @284    CPTCCS3                  N3PF.                                    
      @287    CPTCCS4                  N3PF.                                    
      @290    CPTCCS5                  N3PF.                                    
      @293    CPTCCS6                  N3PF.                                    
      @296    CPTCCS7                  N3PF.                                    
      @299    CPTCCS8                  N3PF.                                    
      @302    CPTCCS9                  N3PF.                                    
      @305    CPTCCS10                 N3PF.                                    
      @308    CPTCCS11                 N3PF.                                    
      @311    CPTCCS12                 N3PF.                                    
      @314    CPTCCS13                 N3PF.                                    
      @317    CPTCCS14                 N3PF.                                    
      @320    CPTCCS15                 N3PF.                                    
      @323    CPTCCS16                 N3PF.                                    
      @326    CPTCCS17                 N3PF.                                    
      @329    CPTCCS18                 N3PF.                                    
      @332    CPTCCS19                 N3PF.                                    
      @335    CPTCCS20                 N3PF.                                    
      @338    CPTCCS21                 N3PF.                                    
      @341    CPTCCS22                 N3PF.                                    
      @344    CPTCCS23                 N3PF.                                    
      @347    CPTCCS24                 N3PF.                                    
      @350    CPTCCS25                 N3PF.                                    
      @353    CPTCCS26                 N3PF.                                    
      @356    CPTCCS27                 N3PF.                                    
      @359    CPTCCS28                 N3PF.                                    
      @362    CPTCCS29                 N3PF.                                    
      @365    CPTCCS30                 N3PF.                                    
      @368    CPTCCS31                 N3PF.                                    
      @371    CPTCCS32                 N3PF.                                    
      @374    CPTCCS33                 N3PF.                                    
      @377    CPTCCS34                 N3PF.                                    
      @380    CPTCCS35                 N3PF.                                    
      @383    CPTCCS36                 N3PF.                                    
      @386    CPTCCS37                 N3PF.                                    
      @389    CPTCCS38                 N3PF.                                    
      @392    CPTCCS39                 N3PF.                                    
      @395    CPTCCS40                 N3PF.                                    
      @398    CPTCCS41                 N3PF.                                    
      @401    CPTCCS42                 N3PF.                                    
      @404    CPTCCS43                 N3PF.                                    
      @407    CPTCCS44                 N3PF.                                    
      @410    CPTCCS45                 N3PF.                                    
      @413    CPTCCS46                 N3PF.                                    
      @416    CPTCCS47                 N3PF.                                    
      @419    CPTCCS48                 N3PF.                                    
      @422    CPTCCS49                 N3PF.                                    
      @425    CPTCCS50                 N3PF.                                    
      @428    CPTM1_1                  $CHAR2.                                  
      @430    CPTM1_2                  $CHAR2.                                  
      @432    CPTM1_3                  $CHAR2.                                  
      @434    CPTM1_4                  $CHAR2.                                  
      @436    CPTM1_5                  $CHAR2.                                  
      @438    CPTM1_6                  $CHAR2.                                  
      @440    CPTM1_7                  $CHAR2.                                  
      @442    CPTM1_8                  $CHAR2.                                  
      @444    CPTM1_9                  $CHAR2.                                  
      @446    CPTM1_10                 $CHAR2.                                  
      @448    CPTM1_11                 $CHAR2.                                  
      @450    CPTM1_12                 $CHAR2.                                  
      @452    CPTM1_13                 $CHAR2.                                  
      @454    CPTM1_14                 $CHAR2.                                  
      @456    CPTM1_15                 $CHAR2.                                  
      @458    CPTM1_16                 $CHAR2.                                  
      @460    CPTM1_17                 $CHAR2.                                  
      @462    CPTM1_18                 $CHAR2.                                  
      @464    CPTM1_19                 $CHAR2.                                  
      @466    CPTM1_20                 $CHAR2.                                  
      @468    CPTM1_21                 $CHAR2.                                  
      @470    CPTM1_22                 $CHAR2.                                  
      @472    CPTM1_23                 $CHAR2.                                  
      @474    CPTM1_24                 $CHAR2.                                  
      @476    CPTM1_25                 $CHAR2.                                  
      @478    CPTM1_26                 $CHAR2.                                  
      @480    CPTM1_27                 $CHAR2.                                  
      @482    CPTM1_28                 $CHAR2.                                  
      @484    CPTM1_29                 $CHAR2.                                  
      @486    CPTM1_30                 $CHAR2.                                  
      @488    CPTM1_31                 $CHAR2.                                  
      @490    CPTM1_32                 $CHAR2.                                  
      @492    CPTM1_33                 $CHAR2.                                  
      @494    CPTM1_34                 $CHAR2.                                  
      @496    CPTM1_35                 $CHAR2.                                  
      @498    CPTM1_36                 $CHAR2.                                  
      @500    CPTM1_37                 $CHAR2.                                  
      @502    CPTM1_38                 $CHAR2.                                  
      @504    CPTM1_39                 $CHAR2.                                  
      @506    CPTM1_40                 $CHAR2.                                  
      @508    CPTM1_41                 $CHAR2.                                  
      @510    CPTM1_42                 $CHAR2.                                  
      @512    CPTM1_43                 $CHAR2.                                  
      @514    CPTM1_44                 $CHAR2.                                  
      @516    CPTM1_45                 $CHAR2.                                  
      @518    CPTM1_46                 $CHAR2.                                  
      @520    CPTM1_47                 $CHAR2.                                  
      @522    CPTM1_48                 $CHAR2.                                  
      @524    CPTM1_49                 $CHAR2.                                  
      @526    CPTM1_50                 $CHAR2.                                  
      @528    CPTM2_1                  $CHAR2.                                  
      @530    CPTM2_2                  $CHAR2.                                  
      @532    CPTM2_3                  $CHAR2.                                  
      @534    CPTM2_4                  $CHAR2.                                  
      @536    CPTM2_5                  $CHAR2.                                  
      @538    CPTM2_6                  $CHAR2.                                  
      @540    CPTM2_7                  $CHAR2.                                  
      @542    CPTM2_8                  $CHAR2.                                  
      @544    CPTM2_9                  $CHAR2.                                  
      @546    CPTM2_10                 $CHAR2.                                  
      @548    CPTM2_11                 $CHAR2.                                  
      @550    CPTM2_12                 $CHAR2.                                  
      @552    CPTM2_13                 $CHAR2.                                  
      @554    CPTM2_14                 $CHAR2.                                  
      @556    CPTM2_15                 $CHAR2.                                  
      @558    CPTM2_16                 $CHAR2.                                  
      @560    CPTM2_17                 $CHAR2.                                  
      @562    CPTM2_18                 $CHAR2.                                  
      @564    CPTM2_19                 $CHAR2.                                  
      @566    CPTM2_20                 $CHAR2.                                  
      @568    CPTM2_21                 $CHAR2.                                  
      @570    CPTM2_22                 $CHAR2.                                  
      @572    CPTM2_23                 $CHAR2.                                  
      @574    CPTM2_24                 $CHAR2.                                  
      @576    CPTM2_25                 $CHAR2.                                  
      @578    CPTM2_26                 $CHAR2.                                  
      @580    CPTM2_27                 $CHAR2.                                  
      @582    CPTM2_28                 $CHAR2.                                  
      @584    CPTM2_29                 $CHAR2.                                  
      @586    CPTM2_30                 $CHAR2.                                  
      @588    CPTM2_31                 $CHAR2.                                  
      @590    CPTM2_32                 $CHAR2.                                  
      @592    CPTM2_33                 $CHAR2.                                  
      @594    CPTM2_34                 $CHAR2.                                  
      @596    CPTM2_35                 $CHAR2.                                  
      @598    CPTM2_36                 $CHAR2.                                  
      @600    CPTM2_37                 $CHAR2.                                  
      @602    CPTM2_38                 $CHAR2.                                  
      @604    CPTM2_39                 $CHAR2.                                  
      @606    CPTM2_40                 $CHAR2.                                  
      @608    CPTM2_41                 $CHAR2.                                  
      @610    CPTM2_42                 $CHAR2.                                  
      @612    CPTM2_43                 $CHAR2.                                  
      @614    CPTM2_44                 $CHAR2.                                  
      @616    CPTM2_45                 $CHAR2.                                  
      @618    CPTM2_46                 $CHAR2.                                  
      @620    CPTM2_47                 $CHAR2.                                  
      @622    CPTM2_48                 $CHAR2.                                  
      @624    CPTM2_49                 $CHAR2.                                  
      @626    CPTM2_50                 $CHAR2.                                  
      @628    DHOUR                    N4PF.                                    
      @632    DIED                     N2PF.                                    
      @634    DISPUB04                 N2PF.                                    
      @636    DISPUNIFORM              N2PF.                                    
      @638    DISP_X                   $CHAR2.                                  
      @640    DMONTH                   N2PF.                                    
      @642    DQTR                     N2PF.                                    
      @644    DRG                      N3PF.                                    
      @647    DRG24                    N3PF.                                    
      @650    DRGVER                   N2PF.                                    
      @652    DRG_NoPOA                N3PF.                                    
      @655    DSHOSPID                 $CHAR17.                                 
      @672    DX1                      $CHAR5.                                  
      @677    DX2                      $CHAR5.                                  
      @682    DX3                      $CHAR5.                                  
      @687    DX4                      $CHAR5.                                  
      @692    DX5                      $CHAR5.                                  
      @697    DX6                      $CHAR5.                                  
      @702    DX7                      $CHAR5.                                  
      @707    DX8                      $CHAR5.                                  
      @712    DX9                      $CHAR5.                                  
      @717    DX10                     $CHAR5.                                  
      @722    DX11                     $CHAR5.                                  
      @727    DX12                     $CHAR5.                                  
      @732    DX13                     $CHAR5.                                  
      @737    DX14                     $CHAR5.                                  
      @742    DX15                     $CHAR5.                                  
      @747    DX16                     $CHAR5.                                  
      @752    DX17                     $CHAR5.                                  
      @757    DX18                     $CHAR5.                                  
      @762    DX19                     $CHAR5.                                  
      @767    DX20                     $CHAR5.                                  
      @772    DX21                     $CHAR5.                                  
      @777    DX22                     $CHAR5.                                  
      @782    DX23                     $CHAR5.                                  
      @787    DX24                     $CHAR5.                                  
      @792    DXCCS1                   N4PF.                                    
      @796    DXCCS2                   N4PF.                                    
      @800    DXCCS3                   N4PF.                                    
      @804    DXCCS4                   N4PF.                                    
      @808    DXCCS5                   N4PF.                                    
      @812    DXCCS6                   N4PF.                                    
      @816    DXCCS7                   N4PF.                                    
      @820    DXCCS8                   N4PF.                                    
      @824    DXCCS9                   N4PF.                                    
      @828    DXCCS10                  N4PF.                                    
      @832    DXCCS11                  N4PF.                                    
      @836    DXCCS12                  N4PF.                                    
      @840    DXCCS13                  N4PF.                                    
      @844    DXCCS14                  N4PF.                                    
      @848    DXCCS15                  N4PF.                                    
      @852    DXCCS16                  N4PF.                                    
      @856    DXCCS17                  N4PF.                                    
      @860    DXCCS18                  N4PF.                                    
      @864    DXCCS19                  N4PF.                                    
      @868    DXCCS20                  N4PF.                                    
      @872    DXCCS21                  N4PF.                                    
      @876    DXCCS22                  N4PF.                                    
      @880    DXCCS23                  N4PF.                                    
      @884    DXCCS24                  N4PF.                                    
      @888    DXPOA1                   $CHAR1.                                  
      @889    DXPOA2                   $CHAR1.                                  
      @890    DXPOA3                   $CHAR1.                                  
      @891    DXPOA4                   $CHAR1.                                  
      @892    DXPOA5                   $CHAR1.                                  
      @893    DXPOA6                   $CHAR1.                                  
      @894    DXPOA7                   $CHAR1.                                  
      @895    DXPOA8                   $CHAR1.                                  
      @896    DXPOA9                   $CHAR1.                                  
      @897    DXPOA10                  $CHAR1.                                  
      @898    DXPOA11                  $CHAR1.                                  
      @899    DXPOA12                  $CHAR1.                                  
      @900    DXPOA13                  $CHAR1.                                  
      @901    DXPOA14                  $CHAR1.                                  
      @902    DXPOA15                  $CHAR1.                                  
      @903    DXPOA16                  $CHAR1.                                  
      @904    DXPOA17                  $CHAR1.                                  
      @905    DXPOA18                  $CHAR1.                                  
      @906    DXPOA19                  $CHAR1.                                  
      @907    DXPOA20                  $CHAR1.                                  
      @908    DXPOA21                  $CHAR1.                                  
      @909    DXPOA22                  $CHAR1.                                  
      @910    DXPOA23                  $CHAR1.                                  
      @911    DXPOA24                  $CHAR1.                                  
      @912    DX_Admitting             $CHAR5.                                  
      @917    ECODE1                   $CHAR5.                                  
      @922    ECODE2                   $CHAR5.                                  
      @927    ECODE3                   $CHAR5.                                  
      @932    ECODE4                   $CHAR5.                                  
      @937    ECODE5                   $CHAR5.                                  
      @942    ECODE6                   $CHAR5.                                  
      @947    ECODE7                   $CHAR5.                                  
      @952    ECODE8                   $CHAR5.                                  
      @957    ECODE9                   $CHAR5.                                  
      @962    ECODE10                  $CHAR5.                                  
      @967    E_CCS1                   N4PF.                                    
      @971    E_CCS2                   N4PF.                                    
      @975    E_CCS3                   N4PF.                                    
      @979    E_CCS4                   N4PF.                                    
      @983    E_CCS5                   N4PF.                                    
      @987    E_CCS6                   N4PF.                                    
      @991    E_CCS7                   N4PF.                                    
      @995    E_CCS8                   N4PF.                                    
      @999    E_CCS9                   N4PF.                                    
      @1003   E_CCS10                  N4PF.                                    
      @1007   E_POA1                   $CHAR1.                                  
      @1008   E_POA2                   $CHAR1.                                  
      @1009   E_POA3                   $CHAR1.                                  
      @1010   E_POA4                   $CHAR1.                                  
      @1011   E_POA5                   $CHAR1.                                  
      @1012   E_POA6                   $CHAR1.                                  
      @1013   E_POA7                   $CHAR1.                                  
      @1014   E_POA8                   $CHAR1.                                  
      @1015   E_POA9                   $CHAR1.                                  
      @1016   E_POA10                  $CHAR1.                                  
      @1017   FEMALE                   N2PF.                                    
      @1019   HCUP_ED                  N2PF.                                    
      @1021   HCUP_OS                  N2PF.                                    
      @1023   HISPANIC_X               $CHAR5.                                  
      @1028   HOSPBRTH                 N3PF.                                    
      @1031   HOSPST                   $CHAR2.                                  
      @1033   KEY                      15.                                      
      @1048   LOS                      N5PF.                                    
      @1053   LOS_X                    N6PF.                                    
      @1059   MARITALSTATUSUB04        $CHAR1.                                  
      @1060   MDC                      N2PF.                                    
      @1062   MDC24                    N2PF.                                    
      @1064   MDC_NoPOA                N2PF.                                    
      @1066   MDNUM1_R                 N9PF.                                    
      @1075   MDNUM2_R                 N9PF.                                    
      @1084   MEDINCSTQ                N2PF.                                    
      @1086   MOMNUM_R                 N9PF.                                    
      @1095   MRN_R                    N9PF.                                    
      @1104   NCHRONIC                 N3PF.                                    
      @1107   NCPT                     N3PF.                                    
      @1110   NDX                      N2PF.                                    
      @1112   NECODE                   N2PF.                                    
      @1114   NEOMAT                   N2PF.                                    
      @1116   NPR                      N2PF.                                    
      @1118   ORPROC                   N2PF.                                    
      @1120   OS_TIME                  N8PF.                                    
      @1128   P7EDSRC_X                $CHAR2.                                  
      @1130   PAY1                     N2PF.                                    
      @1132   PAY1_X                   $CHAR3.                                  
      @1135   PAY2                     N2PF.                                    
      @1137   PAY2_X                   $CHAR3.                                  
      @1140   PAY3                     N2PF.                                    
      @1142   PAY3_X                   $CHAR3.                                  
      @1145   PL_CBSA                  N3PF.                                    
      @1148   PL_NCHS                  N2PF.                                    
      @1150   PL_RUCA10_2005           N2PF.                                    
      @1152   PL_RUCA2005              N4P1F.                                   
      @1156   PL_RUCA4_2005            N2PF.                                    
      @1158   PL_RUCC                  N2PF.                                    
      @1160   PL_UIC                   N2PF.                                    
      @1162   PL_UR_CAT4               N2PF.                                    
      @1164   PR1                      $CHAR4.                                  
      @1168   PR2                      $CHAR4.                                  
      @1172   PR3                      $CHAR4.                                  
      @1176   PR4                      $CHAR4.                                  
      @1180   PR5                      $CHAR4.                                  
      @1184   PR6                      $CHAR4.                                  
      @1188   PR7                      $CHAR4.                                  
      @1192   PR8                      $CHAR4.                                  
      @1196   PR9                      $CHAR4.                                  
      @1200   PR10                     $CHAR4.                                  
      @1204   PR11                     $CHAR4.                                  
      @1208   PR12                     $CHAR4.                                  
      @1212   PR13                     $CHAR4.                                  
      @1216   PR14                     $CHAR4.                                  
      @1220   PR15                     $CHAR4.                                  
      @1224   PR16                     $CHAR4.                                  
      @1228   PR17                     $CHAR4.                                  
      @1232   PR18                     $CHAR4.                                  
      @1236   PR19                     $CHAR4.                                  
      @1240   PR20                     $CHAR4.                                  
      @1244   PR21                     $CHAR4.                                  
      @1248   PR22                     $CHAR4.                                  
      @1252   PR23                     $CHAR4.                                  
      @1256   PR24                     $CHAR4.                                  
      @1260   PR25                     $CHAR4.                                  
      @1264   PRCCS1                   N3PF.                                    
      @1267   PRCCS2                   N3PF.                                    
      @1270   PRCCS3                   N3PF.                                    
      @1273   PRCCS4                   N3PF.                                    
      @1276   PRCCS5                   N3PF.                                    
      @1279   PRCCS6                   N3PF.                                    
      @1282   PRCCS7                   N3PF.                                    
      @1285   PRCCS8                   N3PF.                                    
      @1288   PRCCS9                   N3PF.                                    
      @1291   PRCCS10                  N3PF.                                    
      @1294   PRCCS11                  N3PF.                                    
      @1297   PRCCS12                  N3PF.                                    
      @1300   PRCCS13                  N3PF.                                    
      @1303   PRCCS14                  N3PF.                                    
      @1306   PRCCS15                  N3PF.                                    
      @1309   PRCCS16                  N3PF.                                    
      @1312   PRCCS17                  N3PF.                                    
      @1315   PRCCS18                  N3PF.                                    
      @1318   PRCCS19                  N3PF.                                    
      @1321   PRCCS20                  N3PF.                                    
      @1324   PRCCS21                  N3PF.                                    
      @1327   PRCCS22                  N3PF.                                    
      @1330   PRCCS23                  N3PF.                                    
      @1333   PRCCS24                  N3PF.                                    
      @1336   PRCCS25                  N3PF.                                    
      @1339   PRDAY1                   N5PF.                                    
      @1344   PRDAY2                   N5PF.                                    
      @1349   PRDAY3                   N5PF.                                    
      @1354   PRDAY4                   N5PF.                                    
      @1359   PRDAY5                   N5PF.                                    
      @1364   PRDAY6                   N5PF.                                    
      @1369   PRDAY7                   N5PF.                                    
      @1374   PRDAY8                   N5PF.                                    
      @1379   PRDAY9                   N5PF.                                    
      @1384   PRDAY10                  N5PF.                                    
      @1389   PRDAY11                  N5PF.                                    
      @1394   PRDAY12                  N5PF.                                    
      @1399   PRDAY13                  N5PF.                                    
      @1404   PRDAY14                  N5PF.                                    
      @1409   PRDAY15                  N5PF.                                    
      @1414   PRDAY16                  N5PF.                                    
      @1419   PRDAY17                  N5PF.                                    
      @1424   PRDAY18                  N5PF.                                    
      @1429   PRDAY19                  N5PF.                                    
      @1434   PRDAY20                  N5PF.                                    
      @1439   PRDAY21                  N5PF.                                    
      @1444   PRDAY22                  N5PF.                                    
      @1449   PRDAY23                  N5PF.                                    
      @1454   PRDAY24                  N5PF.                                    
      @1459   PRDAY25                  N5PF.                                    
      @1464   PROCTYPE                 N3PF.                                    
      @1467   PSTATE                   $CHAR2.                                  
      @1469   PSTCO                    N5PF.                                    
      @1474   PSTCO2                   N5PF.                                    
      @1479   PointOfOriginUB04        $CHAR1.                                  
      @1480   PointOfOrigin_X          $CHAR1.                                  
      @1481   PrimLang                 $CHAR3.                                  
      @1484   RACE                     N2PF.                                    
      @1486   RACE_X                   $CHAR5.                                  
      @1491   READMIT                  N2PF.                                    
      @1493   TOTCHG                   N10PF.                                   
      @1503   TOTCHG_X                 N15P2F.                                  
      @1518   TRAN_IN                  N2PF.                                    
      @1520   TRAN_OUT                 N2PF.                                    
      @1522   YEAR                     N4PF.                                    
      @1526   ZIP3                     $CHAR3.                                  
      @1529   ZIPINC_QRTL              N3PF.                                    
      @1532   TOWN                     $CHAR4.                                  
      @1536   ZIP                      $CHAR5.                                  
      @1541   AYEAR                    N4PF.                                    
      @1545   BMONTH                   N2PF.                                    
      @1547   BYEAR                    N4PF.                                    
      @1551   PRMONTH1                 N2PF.                                    
      @1553   PRMONTH2                 N2PF.                                    
      @1555   PRMONTH3                 N2PF.                                    
      @1557   PRMONTH4                 N2PF.                                    
      @1559   PRMONTH5                 N2PF.                                    
      @1561   PRMONTH6                 N2PF.                                    
      @1563   PRMONTH7                 N2PF.                                    
      @1565   PRMONTH8                 N2PF.                                    
      @1567   PRMONTH9                 N2PF.                                    
      @1569   PRMONTH10                N2PF.                                    
      @1571   PRMONTH11                N2PF.                                    
      @1573   PRMONTH12                N2PF.                                    
      @1575   PRMONTH13                N2PF.                                    
      @1577   PRMONTH14                N2PF.                                    
      @1579   PRMONTH15                N2PF.                                    
      @1581   PRMONTH16                N2PF.                                    
      @1583   PRMONTH17                N2PF.                                    
      @1585   PRMONTH18                N2PF.                                    
      @1587   PRMONTH19                N2PF.                                    
      @1589   PRMONTH20                N2PF.                                    
      @1591   PRMONTH21                N2PF.                                    
      @1593   PRMONTH22                N2PF.                                    
      @1595   PRMONTH23                N2PF.                                    
      @1597   PRMONTH24                N2PF.                                    
      @1599   PRMONTH25                N2PF.                                    
      @1601   PRYEAR1                  N4PF.                                    
      @1605   PRYEAR2                  N4PF.                                    
      @1609   PRYEAR3                  N4PF.                                    
      @1613   PRYEAR4                  N4PF.                                    
      @1617   PRYEAR5                  N4PF.                                    
      @1621   PRYEAR6                  N4PF.                                    
      @1625   PRYEAR7                  N4PF.                                    
      @1629   PRYEAR8                  N4PF.                                    
      @1633   PRYEAR9                  N4PF.                                    
      @1637   PRYEAR10                 N4PF.                                    
      @1641   PRYEAR11                 N4PF.                                    
      @1645   PRYEAR12                 N4PF.                                    
      @1649   PRYEAR13                 N4PF.                                    
      @1653   PRYEAR14                 N4PF.                                    
      @1657   PRYEAR15                 N4PF.                                    
      @1661   PRYEAR16                 N4PF.                                    
      @1665   PRYEAR17                 N4PF.                                    
      @1669   PRYEAR18                 N4PF.                                    
      @1673   PRYEAR19                 N4PF.                                    
      @1677   PRYEAR20                 N4PF.                                    
      @1681   PRYEAR21                 N4PF.                                    
      @1685   PRYEAR22                 N4PF.                                    
      @1689   PRYEAR23                 N4PF.                                    
      @1693   PRYEAR24                 N4PF.                                    
      @1697   PRYEAR25                 N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
LIBNAME mylib "D:\git\hcup-extraction-loading\extraction-loading\raw-hcup";
DATA mylib.NJ_SIDC_2013_CORE;
    SET NJ_SIDC_2013_CORE;
RUN;       
