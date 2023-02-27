/*******************************************************************            
* Creation Date: 09/27/2016                                                     
*   MD_SEDD_2011_CORE.SAS:                                                      
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
DATA MD_SEDDC_2011_CORE;                                                        
INFILE 'MD_SEDD_2011_CORE.ASC' FIRSTOBS=3 LRECL = 949;                          
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY                     LENGTH=3                                           
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  ASOURCE                    LENGTH=3                                           
  LABEL="Admission source (uniform)"                                            
                                                                                
  ASOURCE_X                  LENGTH=$2                                          
  LABEL="Admission source (as received from source)"                            
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  BILLTYPE                   LENGTH=$4                                          
  LABEL="UB-92 bill type"                                                       
                                                                                
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
                                                                                
  CPTDAY1                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT1"                                 
                                                                                
  CPTDAY2                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT2"                                 
                                                                                
  CPTDAY3                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT3"                                 
                                                                                
  CPTDAY4                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT4"                                 
                                                                                
  CPTDAY5                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT5"                                 
                                                                                
  CPTDAY6                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT6"                                 
                                                                                
  CPTDAY7                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT7"                                 
                                                                                
  CPTDAY8                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT8"                                 
                                                                                
  CPTDAY9                    LENGTH=4                                           
  LABEL="Number of days from admission to CPT9"                                 
                                                                                
  CPTDAY10                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT10"                                
                                                                                
  CPTDAY11                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT11"                                
                                                                                
  CPTDAY12                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT12"                                
                                                                                
  CPTDAY13                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT13"                                
                                                                                
  CPTDAY14                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT14"                                
                                                                                
  CPTDAY15                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT15"                                
                                                                                
  CPTDAY16                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT16"                                
                                                                                
  CPTDAY17                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT17"                                
                                                                                
  CPTDAY18                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT18"                                
                                                                                
  CPTDAY19                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT19"                                
                                                                                
  CPTDAY20                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT20"                                
                                                                                
  CPTDAY21                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT21"                                
                                                                                
  CPTDAY22                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT22"                                
                                                                                
  CPTDAY23                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT23"                                
                                                                                
  CPTDAY24                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT24"                                
                                                                                
  CPTDAY25                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT25"                                
                                                                                
  CPTDAY26                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT26"                                
                                                                                
  CPTDAY27                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT27"                                
                                                                                
  CPTDAY28                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT28"                                
                                                                                
  CPTDAY29                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT29"                                
                                                                                
  CPTDAY30                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT30"                                
                                                                                
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
                                                                                
  DIED                       LENGTH=3                                           
  LABEL="Died during hospitalization"                                           
                                                                                
  DISPUB04                   LENGTH=3                                           
  LABEL="Disposition of patient (UB-04 standard coding)"                        
                                                                                
  DISPUNIFORM                LENGTH=3                                           
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
  DISP_X                     LENGTH=$2                                          
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DSHOSPID                   LENGTH=$17                                         
  LABEL="Data source hospital identifier"                                       
                                                                                
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
                                                                                
  DX_Visit_Reason1           LENGTH=$7                                          
  LABEL="Reason for visit diagnosis 1"                                          
                                                                                
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
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HCUP_SURGERY_BROAD         LENGTH=3                                           
  LABEL="Revised HCUP_AS (PCLASSn=3 or 4, or broad definition)"                 
                                                                                
  HCUP_SURGERY_NARROW        LENGTH=3                                           
  LABEL="Revised HCUP_AS (PCLASSn=4, or narrow definition)"                     
                                                                                
  HISPANIC_X                 LENGTH=$1                                          
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  HOSPBRTH                   LENGTH=3                                           
  LABEL="Indicator of birth in this hospital"                                   
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  KEY                        LENGTH=8                      FORMAT=Z18.          
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
                                                                                
  OPservice                  LENGTH=$2                                          
  LABEL="Indicator of outpatient service (as received from source)"             
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$2                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$2                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAYER1_X                   LENGTH=$2                                          
  LABEL="Primary expected payer plan identifier (as received from source)"      
                                                                                
  PAYER2_X                   LENGTH=$2                                          
  LABEL="Secondary expected payer plan identifier (as received from source)"    
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_MSA1993                 LENGTH=3                                           
  LABEL="Patient location: Metropolitan Statistical Area (MSA), 1993"           
                                                                                
  PL_NCHS2006                LENGTH=3                                           
  LABEL="Patient Location: NCHS Urban-Rural Code (V2006)"                       
                                                                                
  PL_RUCA10_2005             LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, ten levels" 
                                                                                
  PL_RUCA2005                LENGTH=4                      FORMAT=4.1           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes"             
                                                                                
  PL_RUCA4_2005              LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, four levels"
                                                                                
  PL_RUCC2003                LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Continuum Codes(RUCC), 2003"             
                                                                                
  PL_UIC2003                 LENGTH=3                                           
  LABEL="Patient location: Urban Influence Codes, 2003"                         
                                                                                
  PL_UR_CAT4                 LENGTH=3                                           
  LABEL="Patient Location: Urban-Rural 4 Categories"                            
                                                                                
  PROCTYPE                   LENGTH=3                                           
  LABEL="Procedure type indicator"                                              
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO                      LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
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
                                                                                
  SpannedServiceCount        LENGTH=3                                           
  LABEL=                                                                        
  "Count of spanned services included on this record, as received from source"  
                                                                                
  TOTCHG                     LENGTH=6                                           
  LABEL="Total charges (cleaned)"                                               
                                                                                
  TOTCHG_X                   LENGTH=7                                           
  LABEL="Total charges (as received from source)"                               
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  AYEAR                      LENGTH=3                                           
  LABEL="Admission year"                                                        
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                           N3PF.                               
      @4      AGEDAY                        N3PF.                               
      @7      AGEMONTH                      N3PF.                               
      @10     ASOURCE                       N2PF.                               
      @12     ASOURCE_X                     $CHAR2.                             
      @14     ATYPE                         N2PF.                               
      @16     AWEEKEND                      N2PF.                               
      @18     BILLTYPE                      $CHAR4.                             
      @22     CPT1                          $CHAR5.                             
      @27     CPT2                          $CHAR5.                             
      @32     CPT3                          $CHAR5.                             
      @37     CPT4                          $CHAR5.                             
      @42     CPT5                          $CHAR5.                             
      @47     CPT6                          $CHAR5.                             
      @52     CPT7                          $CHAR5.                             
      @57     CPT8                          $CHAR5.                             
      @62     CPT9                          $CHAR5.                             
      @67     CPT10                         $CHAR5.                             
      @72     CPT11                         $CHAR5.                             
      @77     CPT12                         $CHAR5.                             
      @82     CPT13                         $CHAR5.                             
      @87     CPT14                         $CHAR5.                             
      @92     CPT15                         $CHAR5.                             
      @97     CPT16                         $CHAR5.                             
      @102    CPT17                         $CHAR5.                             
      @107    CPT18                         $CHAR5.                             
      @112    CPT19                         $CHAR5.                             
      @117    CPT20                         $CHAR5.                             
      @122    CPT21                         $CHAR5.                             
      @127    CPT22                         $CHAR5.                             
      @132    CPT23                         $CHAR5.                             
      @137    CPT24                         $CHAR5.                             
      @142    CPT25                         $CHAR5.                             
      @147    CPT26                         $CHAR5.                             
      @152    CPT27                         $CHAR5.                             
      @157    CPT28                         $CHAR5.                             
      @162    CPT29                         $CHAR5.                             
      @167    CPT30                         $CHAR5.                             
      @172    CPTCCS1                       N3PF.                               
      @175    CPTCCS2                       N3PF.                               
      @178    CPTCCS3                       N3PF.                               
      @181    CPTCCS4                       N3PF.                               
      @184    CPTCCS5                       N3PF.                               
      @187    CPTCCS6                       N3PF.                               
      @190    CPTCCS7                       N3PF.                               
      @193    CPTCCS8                       N3PF.                               
      @196    CPTCCS9                       N3PF.                               
      @199    CPTCCS10                      N3PF.                               
      @202    CPTCCS11                      N3PF.                               
      @205    CPTCCS12                      N3PF.                               
      @208    CPTCCS13                      N3PF.                               
      @211    CPTCCS14                      N3PF.                               
      @214    CPTCCS15                      N3PF.                               
      @217    CPTCCS16                      N3PF.                               
      @220    CPTCCS17                      N3PF.                               
      @223    CPTCCS18                      N3PF.                               
      @226    CPTCCS19                      N3PF.                               
      @229    CPTCCS20                      N3PF.                               
      @232    CPTCCS21                      N3PF.                               
      @235    CPTCCS22                      N3PF.                               
      @238    CPTCCS23                      N3PF.                               
      @241    CPTCCS24                      N3PF.                               
      @244    CPTCCS25                      N3PF.                               
      @247    CPTCCS26                      N3PF.                               
      @250    CPTCCS27                      N3PF.                               
      @253    CPTCCS28                      N3PF.                               
      @256    CPTCCS29                      N3PF.                               
      @259    CPTCCS30                      N3PF.                               
      @262    CPTDAY1                       N3PF.                               
      @265    CPTDAY2                       N3PF.                               
      @268    CPTDAY3                       N3PF.                               
      @271    CPTDAY4                       N3PF.                               
      @274    CPTDAY5                       N3PF.                               
      @277    CPTDAY6                       N3PF.                               
      @280    CPTDAY7                       N3PF.                               
      @283    CPTDAY8                       N3PF.                               
      @286    CPTDAY9                       N3PF.                               
      @289    CPTDAY10                      N3PF.                               
      @292    CPTDAY11                      N3PF.                               
      @295    CPTDAY12                      N3PF.                               
      @298    CPTDAY13                      N3PF.                               
      @301    CPTDAY14                      N3PF.                               
      @304    CPTDAY15                      N3PF.                               
      @307    CPTDAY16                      N3PF.                               
      @310    CPTDAY17                      N3PF.                               
      @313    CPTDAY18                      N3PF.                               
      @316    CPTDAY19                      N3PF.                               
      @319    CPTDAY20                      N3PF.                               
      @322    CPTDAY21                      N3PF.                               
      @325    CPTDAY22                      N3PF.                               
      @328    CPTDAY23                      N3PF.                               
      @331    CPTDAY24                      N3PF.                               
      @334    CPTDAY25                      N3PF.                               
      @337    CPTDAY26                      N3PF.                               
      @340    CPTDAY27                      N3PF.                               
      @343    CPTDAY28                      N3PF.                               
      @346    CPTDAY29                      N3PF.                               
      @349    CPTDAY30                      N3PF.                               
      @352    CPTM1_1                       $CHAR2.                             
      @354    CPTM1_2                       $CHAR2.                             
      @356    CPTM1_3                       $CHAR2.                             
      @358    CPTM1_4                       $CHAR2.                             
      @360    CPTM1_5                       $CHAR2.                             
      @362    CPTM1_6                       $CHAR2.                             
      @364    CPTM1_7                       $CHAR2.                             
      @366    CPTM1_8                       $CHAR2.                             
      @368    CPTM1_9                       $CHAR2.                             
      @370    CPTM1_10                      $CHAR2.                             
      @372    CPTM1_11                      $CHAR2.                             
      @374    CPTM1_12                      $CHAR2.                             
      @376    CPTM1_13                      $CHAR2.                             
      @378    CPTM1_14                      $CHAR2.                             
      @380    CPTM1_15                      $CHAR2.                             
      @382    CPTM1_16                      $CHAR2.                             
      @384    CPTM1_17                      $CHAR2.                             
      @386    CPTM1_18                      $CHAR2.                             
      @388    CPTM1_19                      $CHAR2.                             
      @390    CPTM1_20                      $CHAR2.                             
      @392    CPTM1_21                      $CHAR2.                             
      @394    CPTM1_22                      $CHAR2.                             
      @396    CPTM1_23                      $CHAR2.                             
      @398    CPTM1_24                      $CHAR2.                             
      @400    CPTM1_25                      $CHAR2.                             
      @402    CPTM1_26                      $CHAR2.                             
      @404    CPTM1_27                      $CHAR2.                             
      @406    CPTM1_28                      $CHAR2.                             
      @408    CPTM1_29                      $CHAR2.                             
      @410    CPTM1_30                      $CHAR2.                             
      @412    CPTM2_1                       $CHAR2.                             
      @414    CPTM2_2                       $CHAR2.                             
      @416    CPTM2_3                       $CHAR2.                             
      @418    CPTM2_4                       $CHAR2.                             
      @420    CPTM2_5                       $CHAR2.                             
      @422    CPTM2_6                       $CHAR2.                             
      @424    CPTM2_7                       $CHAR2.                             
      @426    CPTM2_8                       $CHAR2.                             
      @428    CPTM2_9                       $CHAR2.                             
      @430    CPTM2_10                      $CHAR2.                             
      @432    CPTM2_11                      $CHAR2.                             
      @434    CPTM2_12                      $CHAR2.                             
      @436    CPTM2_13                      $CHAR2.                             
      @438    CPTM2_14                      $CHAR2.                             
      @440    CPTM2_15                      $CHAR2.                             
      @442    CPTM2_16                      $CHAR2.                             
      @444    CPTM2_17                      $CHAR2.                             
      @446    CPTM2_18                      $CHAR2.                             
      @448    CPTM2_19                      $CHAR2.                             
      @450    CPTM2_20                      $CHAR2.                             
      @452    CPTM2_21                      $CHAR2.                             
      @454    CPTM2_22                      $CHAR2.                             
      @456    CPTM2_23                      $CHAR2.                             
      @458    CPTM2_24                      $CHAR2.                             
      @460    CPTM2_25                      $CHAR2.                             
      @462    CPTM2_26                      $CHAR2.                             
      @464    CPTM2_27                      $CHAR2.                             
      @466    CPTM2_28                      $CHAR2.                             
      @468    CPTM2_29                      $CHAR2.                             
      @470    CPTM2_30                      $CHAR2.                             
      @472    DIED                          N2PF.                               
      @474    DISPUB04                      N2PF.                               
      @476    DISPUNIFORM                   N2PF.                               
      @478    DISP_X                        $CHAR2.                             
      @480    DQTR                          N2PF.                               
      @482    DSHOSPID                      $CHAR17.                            
      @499    DX1                           $CHAR7.                             
      @506    DX2                           $CHAR7.                             
      @513    DX3                           $CHAR7.                             
      @520    DX4                           $CHAR7.                             
      @527    DX5                           $CHAR7.                             
      @534    DX6                           $CHAR7.                             
      @541    DX7                           $CHAR7.                             
      @548    DX8                           $CHAR7.                             
      @555    DX9                           $CHAR7.                             
      @562    DX10                          $CHAR7.                             
      @569    DX11                          $CHAR7.                             
      @576    DX12                          $CHAR7.                             
      @583    DX13                          $CHAR7.                             
      @590    DX14                          $CHAR7.                             
      @597    DX15                          $CHAR7.                             
      @604    DX16                          $CHAR7.                             
      @611    DXCCS1                        N4PF.                               
      @615    DXCCS2                        N4PF.                               
      @619    DXCCS3                        N4PF.                               
      @623    DXCCS4                        N4PF.                               
      @627    DXCCS5                        N4PF.                               
      @631    DXCCS6                        N4PF.                               
      @635    DXCCS7                        N4PF.                               
      @639    DXCCS8                        N4PF.                               
      @643    DXCCS9                        N4PF.                               
      @647    DXCCS10                       N4PF.                               
      @651    DXCCS11                       N4PF.                               
      @655    DXCCS12                       N4PF.                               
      @659    DXCCS13                       N4PF.                               
      @663    DXCCS14                       N4PF.                               
      @667    DXCCS15                       N4PF.                               
      @671    DXCCS16                       N4PF.                               
      @675    DX_Visit_Reason1              $CHAR7.                             
      @682    ECODE1                        $CHAR7.                             
      @689    ECODE2                        $CHAR7.                             
      @696    ECODE3                        $CHAR7.                             
      @703    ECODE4                        $CHAR7.                             
      @710    ECODE5                        $CHAR7.                             
      @717    ECODE6                        $CHAR7.                             
      @724    ECODE7                        $CHAR7.                             
      @731    E_CCS1                        N4PF.                               
      @735    E_CCS2                        N4PF.                               
      @739    E_CCS3                        N4PF.                               
      @743    E_CCS4                        N4PF.                               
      @747    E_CCS5                        N4PF.                               
      @751    E_CCS6                        N4PF.                               
      @755    E_CCS7                        N4PF.                               
      @759    FEMALE                        N2PF.                               
      @761    HCUP_ED                       N2PF.                               
      @763    HCUP_OS                       N2PF.                               
      @765    HCUP_SURGERY_BROAD            N2PF.                               
      @767    HCUP_SURGERY_NARROW           N2PF.                               
      @769    HISPANIC_X                    $CHAR1.                             
      @770    HOSPBRTH                      N3PF.                               
      @773    HOSPST                        $CHAR2.                             
      @775    KEY                           15.                                 
      @790    LOS                           N5PF.                               
      @795    LOS_X                         N6PF.                               
      @801    MARITALSTATUSUB04             $CHAR1.                             
      @802    MARITALSTATUS_X               $CHAR1.                             
      @803    MDNUM1_R                      N9PF.                               
      @812    MEDINCSTQ                     N2PF.                               
      @814    MRN_R                         N9PF.                               
      @823    NCHRONIC                      N3PF.                               
      @826    NCPT                          N4PF.                               
      @830    NDX                           N3PF.                               
      @833    NECODE                        N2PF.                               
      @835    NEOMAT                        N2PF.                               
      @837    OPservice                     $CHAR2.                             
      @839    OS_TIME                       N11P2F.                             
      @850    PAY1                          N2PF.                               
      @852    PAY1_X                        $CHAR2.                             
      @854    PAY2                          N2PF.                               
      @856    PAY2_X                        $CHAR2.                             
      @858    PAYER1_X                      $CHAR2.                             
      @860    PAYER2_X                      $CHAR2.                             
      @862    PL_CBSA                       N3PF.                               
      @865    PL_MSA1993                    N3PF.                               
      @868    PL_NCHS2006                   N2PF.                               
      @870    PL_RUCA10_2005                N2PF.                               
      @872    PL_RUCA2005                   N4P1F.                              
      @876    PL_RUCA4_2005                 N2PF.                               
      @878    PL_RUCC2003                   N2PF.                               
      @880    PL_UIC2003                    N2PF.                               
      @882    PL_UR_CAT4                    N2PF.                               
      @884    PROCTYPE                      N3PF.                               
      @887    PSTATE                        $CHAR2.                             
      @889    PSTCO                         N5PF.                               
      @894    PSTCO2                        N5PF.                               
      @899    RACE                          N2PF.                               
      @901    RACE_X                        $CHAR1.                             
      @902    STATE_AS                      N2PF.                               
      @904    STATE_ED                      N2PF.                               
      @906    STATE_OS                      N2PF.                               
      @908    SpannedServiceCount           N3PF.                               
      @911    TOTCHG                        N10PF.                              
      @921    TOTCHG_X                      N15P2F.                             
      @936    YEAR                          N4PF.                               
      @940    ZIP3                          $CHAR3.                             
      @943    ZIPINC_QRTL                   N3PF.                               
      @946    AYEAR                         N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
