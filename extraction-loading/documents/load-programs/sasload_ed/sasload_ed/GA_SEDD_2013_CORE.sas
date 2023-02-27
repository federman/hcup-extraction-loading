/*******************************************************************            
* Creation Date: 12/01/2017                                                     
*   GA_SEDD_2013_CORE.SAS:                                                      
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
DATA GA_SEDDC_2013_CORE;                                                        
INFILE 'GA_SEDD_2013_CORE.ASC' FIRSTOBS=3 LRECL = 2524;                         
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY                     LENGTH=3                                           
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AMONTH                     LENGTH=3                                           
  LABEL="Admission month"                                                       
                                                                                
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
                                                                                
  CPTDAY31                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT31"                                
                                                                                
  CPTDAY32                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT32"                                
                                                                                
  CPTDAY33                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT33"                                
                                                                                
  CPTDAY34                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT34"                                
                                                                                
  CPTDAY35                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT35"                                
                                                                                
  CPTDAY36                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT36"                                
                                                                                
  CPTDAY37                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT37"                                
                                                                                
  CPTDAY38                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT38"                                
                                                                                
  CPTDAY39                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT39"                                
                                                                                
  CPTDAY40                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT40"                                
                                                                                
  CPTDAY41                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT41"                                
                                                                                
  CPTDAY42                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT42"                                
                                                                                
  CPTDAY43                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT43"                                
                                                                                
  CPTDAY44                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT44"                                
                                                                                
  CPTDAY45                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT45"                                
                                                                                
  CPTDAY46                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT46"                                
                                                                                
  CPTDAY47                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT47"                                
                                                                                
  CPTDAY48                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT48"                                
                                                                                
  CPTDAY49                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT49"                                
                                                                                
  CPTDAY50                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT50"                                
                                                                                
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
                                                                                
  DX19                       LENGTH=$7                                          
  LABEL="Diagnosis 19"                                                          
                                                                                
  DX20                       LENGTH=$7                                          
  LABEL="Diagnosis 20"                                                          
                                                                                
  DX21                       LENGTH=$7                                          
  LABEL="Diagnosis 21"                                                          
                                                                                
  DX22                       LENGTH=$7                                          
  LABEL="Diagnosis 22"                                                          
                                                                                
  DX23                       LENGTH=$7                                          
  LABEL="Diagnosis 23"                                                          
                                                                                
  DX24                       LENGTH=$7                                          
  LABEL="Diagnosis 24"                                                          
                                                                                
  DX25                       LENGTH=$7                                          
  LABEL="Diagnosis 25"                                                          
                                                                                
  DX26                       LENGTH=$7                                          
  LABEL="Diagnosis 26"                                                          
                                                                                
  DX27                       LENGTH=$7                                          
  LABEL="Diagnosis 27"                                                          
                                                                                
  DX28                       LENGTH=$7                                          
  LABEL="Diagnosis 28"                                                          
                                                                                
  DX29                       LENGTH=$7                                          
  LABEL="Diagnosis 29"                                                          
                                                                                
  DX30                       LENGTH=$7                                          
  LABEL="Diagnosis 30"                                                          
                                                                                
  DX31                       LENGTH=$7                                          
  LABEL="Diagnosis 31"                                                          
                                                                                
  DX32                       LENGTH=$7                                          
  LABEL="Diagnosis 32"                                                          
                                                                                
  DX33                       LENGTH=$7                                          
  LABEL="Diagnosis 33"                                                          
                                                                                
  DX34                       LENGTH=$7                                          
  LABEL="Diagnosis 34"                                                          
                                                                                
  DX35                       LENGTH=$7                                          
  LABEL="Diagnosis 35"                                                          
                                                                                
  DX36                       LENGTH=$7                                          
  LABEL="Diagnosis 36"                                                          
                                                                                
  DX37                       LENGTH=$7                                          
  LABEL="Diagnosis 37"                                                          
                                                                                
  DX38                       LENGTH=$7                                          
  LABEL="Diagnosis 38"                                                          
                                                                                
  DX39                       LENGTH=$7                                          
  LABEL="Diagnosis 39"                                                          
                                                                                
  DX40                       LENGTH=$7                                          
  LABEL="Diagnosis 40"                                                          
                                                                                
  DX41                       LENGTH=$7                                          
  LABEL="Diagnosis 41"                                                          
                                                                                
  DX42                       LENGTH=$7                                          
  LABEL="Diagnosis 42"                                                          
                                                                                
  DX43                       LENGTH=$7                                          
  LABEL="Diagnosis 43"                                                          
                                                                                
  DX44                       LENGTH=$7                                          
  LABEL="Diagnosis 44"                                                          
                                                                                
  DX45                       LENGTH=$7                                          
  LABEL="Diagnosis 45"                                                          
                                                                                
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
                                                                                
  DXCCS25                    LENGTH=4                                           
  LABEL="CCS: diagnosis 25"                                                     
                                                                                
  DXCCS26                    LENGTH=4                                           
  LABEL="CCS: diagnosis 26"                                                     
                                                                                
  DXCCS27                    LENGTH=4                                           
  LABEL="CCS: diagnosis 27"                                                     
                                                                                
  DXCCS28                    LENGTH=4                                           
  LABEL="CCS: diagnosis 28"                                                     
                                                                                
  DXCCS29                    LENGTH=4                                           
  LABEL="CCS: diagnosis 29"                                                     
                                                                                
  DXCCS30                    LENGTH=4                                           
  LABEL="CCS: diagnosis 30"                                                     
                                                                                
  DXCCS31                    LENGTH=4                                           
  LABEL="CCS: diagnosis 31"                                                     
                                                                                
  DXCCS32                    LENGTH=4                                           
  LABEL="CCS: diagnosis 32"                                                     
                                                                                
  DXCCS33                    LENGTH=4                                           
  LABEL="CCS: diagnosis 33"                                                     
                                                                                
  DXCCS34                    LENGTH=4                                           
  LABEL="CCS: diagnosis 34"                                                     
                                                                                
  DXCCS35                    LENGTH=4                                           
  LABEL="CCS: diagnosis 35"                                                     
                                                                                
  DXCCS36                    LENGTH=4                                           
  LABEL="CCS: diagnosis 36"                                                     
                                                                                
  DXCCS37                    LENGTH=4                                           
  LABEL="CCS: diagnosis 37"                                                     
                                                                                
  DXCCS38                    LENGTH=4                                           
  LABEL="CCS: diagnosis 38"                                                     
                                                                                
  DXCCS39                    LENGTH=4                                           
  LABEL="CCS: diagnosis 39"                                                     
                                                                                
  DXCCS40                    LENGTH=4                                           
  LABEL="CCS: diagnosis 40"                                                     
                                                                                
  DXCCS41                    LENGTH=4                                           
  LABEL="CCS: diagnosis 41"                                                     
                                                                                
  DXCCS42                    LENGTH=4                                           
  LABEL="CCS: diagnosis 42"                                                     
                                                                                
  DXCCS43                    LENGTH=4                                           
  LABEL="CCS: diagnosis 43"                                                     
                                                                                
  DXCCS44                    LENGTH=4                                           
  LABEL="CCS: diagnosis 44"                                                     
                                                                                
  DXCCS45                    LENGTH=4                                           
  LABEL="CCS: diagnosis 45"                                                     
                                                                                
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
                                                                                
  DXPOA25                    LENGTH=$1                                          
  LABEL="Diagnosis 25, present on admission indicator"                          
                                                                                
  DXPOA26                    LENGTH=$1                                          
  LABEL="Diagnosis 26, present on admission indicator"                          
                                                                                
  DXPOA27                    LENGTH=$1                                          
  LABEL="Diagnosis 27, present on admission indicator"                          
                                                                                
  DXPOA28                    LENGTH=$1                                          
  LABEL="Diagnosis 28, present on admission indicator"                          
                                                                                
  DXPOA29                    LENGTH=$1                                          
  LABEL="Diagnosis 29, present on admission indicator"                          
                                                                                
  DXPOA30                    LENGTH=$1                                          
  LABEL="Diagnosis 30, present on admission indicator"                          
                                                                                
  DXPOA31                    LENGTH=$1                                          
  LABEL="Diagnosis 31, present on admission indicator"                          
                                                                                
  DXPOA32                    LENGTH=$1                                          
  LABEL="Diagnosis 32, present on admission indicator"                          
                                                                                
  DXPOA33                    LENGTH=$1                                          
  LABEL="Diagnosis 33, present on admission indicator"                          
                                                                                
  DXPOA34                    LENGTH=$1                                          
  LABEL="Diagnosis 34, present on admission indicator"                          
                                                                                
  DXPOA35                    LENGTH=$1                                          
  LABEL="Diagnosis 35, present on admission indicator"                          
                                                                                
  DXPOA36                    LENGTH=$1                                          
  LABEL="Diagnosis 36, present on admission indicator"                          
                                                                                
  DXPOA37                    LENGTH=$1                                          
  LABEL="Diagnosis 37, present on admission indicator"                          
                                                                                
  DXPOA38                    LENGTH=$1                                          
  LABEL="Diagnosis 38, present on admission indicator"                          
                                                                                
  DXPOA39                    LENGTH=$1                                          
  LABEL="Diagnosis 39, present on admission indicator"                          
                                                                                
  DXPOA40                    LENGTH=$1                                          
  LABEL="Diagnosis 40, present on admission indicator"                          
                                                                                
  DXPOA41                    LENGTH=$1                                          
  LABEL="Diagnosis 41, present on admission indicator"                          
                                                                                
  DXPOA42                    LENGTH=$1                                          
  LABEL="Diagnosis 42, present on admission indicator"                          
                                                                                
  DXPOA43                    LENGTH=$1                                          
  LABEL="Diagnosis 43, present on admission indicator"                          
                                                                                
  DXPOA44                    LENGTH=$1                                          
  LABEL="Diagnosis 44, present on admission indicator"                          
                                                                                
  DXPOA45                    LENGTH=$1                                          
  LABEL="Diagnosis 45, present on admission indicator"                          
                                                                                
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
                                                                                
  Homeless                   LENGTH=3                                           
  LABEL="Indicator that patient is homeless"                                    
                                                                                
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
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  NCHRONIC                   LENGTH=3                                           
  LABEL="Number of chronic conditions"                                          
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures for this visit"                         
                                                                                
  NDX                        LENGTH=3                                           
  LABEL="Number of diagnoses on this record"                                    
                                                                                
  NECODE                     LENGTH=3                                           
  LABEL="Number of E codes on this record"                                      
                                                                                
  NEOMAT                     LENGTH=3                                           
  LABEL="Neonatal and/or maternal DX and/or PR"                                 
                                                                                
  NPR                        LENGTH=3                                           
  LABEL="Number of procedures on this record"                                   
                                                                                
  OPservice                  LENGTH=$2                                          
  LABEL="Indicator of outpatient service (as received from source)"             
                                                                                
  ORPROC                     LENGTH=3                                           
  LABEL="Major operating room procedure indicator"                              
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$4                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$4                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$4                                          
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
                                                                                
  PR9                        LENGTH=$7                                          
  LABEL="Procedure 9"                                                           
                                                                                
  PR10                       LENGTH=$7                                          
  LABEL="Procedure 10"                                                          
                                                                                
  PR11                       LENGTH=$7                                          
  LABEL="Procedure 11"                                                          
                                                                                
  PR12                       LENGTH=$7                                          
  LABEL="Procedure 12"                                                          
                                                                                
  PR13                       LENGTH=$7                                          
  LABEL="Procedure 13"                                                          
                                                                                
  PR14                       LENGTH=$7                                          
  LABEL="Procedure 14"                                                          
                                                                                
  PR15                       LENGTH=$7                                          
  LABEL="Procedure 15"                                                          
                                                                                
  PR16                       LENGTH=$7                                          
  LABEL="Procedure 16"                                                          
                                                                                
  PR17                       LENGTH=$7                                          
  LABEL="Procedure 17"                                                          
                                                                                
  PR18                       LENGTH=$7                                          
  LABEL="Procedure 18"                                                          
                                                                                
  PR19                       LENGTH=$7                                          
  LABEL="Procedure 19"                                                          
                                                                                
  PR20                       LENGTH=$7                                          
  LABEL="Procedure 20"                                                          
                                                                                
  PR21                       LENGTH=$7                                          
  LABEL="Procedure 21"                                                          
                                                                                
  PR22                       LENGTH=$7                                          
  LABEL="Procedure 22"                                                          
                                                                                
  PR23                       LENGTH=$7                                          
  LABEL="Procedure 23"                                                          
                                                                                
  PR24                       LENGTH=$7                                          
  LABEL="Procedure 24"                                                          
                                                                                
  PR25                       LENGTH=$7                                          
  LABEL="Procedure 25"                                                          
                                                                                
  PR26                       LENGTH=$7                                          
  LABEL="Procedure 26"                                                          
                                                                                
  PR27                       LENGTH=$7                                          
  LABEL="Procedure 27"                                                          
                                                                                
  PR28                       LENGTH=$7                                          
  LABEL="Procedure 28"                                                          
                                                                                
  PR29                       LENGTH=$7                                          
  LABEL="Procedure 29"                                                          
                                                                                
  PR30                       LENGTH=$7                                          
  LABEL="Procedure 30"                                                          
                                                                                
  PR31                       LENGTH=$7                                          
  LABEL="Procedure 31"                                                          
                                                                                
  PR32                       LENGTH=$7                                          
  LABEL="Procedure 32"                                                          
                                                                                
  PR33                       LENGTH=$7                                          
  LABEL="Procedure 33"                                                          
                                                                                
  PR34                       LENGTH=$7                                          
  LABEL="Procedure 34"                                                          
                                                                                
  PR35                       LENGTH=$7                                          
  LABEL="Procedure 35"                                                          
                                                                                
  PR36                       LENGTH=$7                                          
  LABEL="Procedure 36"                                                          
                                                                                
  PR37                       LENGTH=$7                                          
  LABEL="Procedure 37"                                                          
                                                                                
  PR38                       LENGTH=$7                                          
  LABEL="Procedure 38"                                                          
                                                                                
  PR39                       LENGTH=$7                                          
  LABEL="Procedure 39"                                                          
                                                                                
  PR40                       LENGTH=$7                                          
  LABEL="Procedure 40"                                                          
                                                                                
  PR41                       LENGTH=$7                                          
  LABEL="Procedure 41"                                                          
                                                                                
  PR42                       LENGTH=$7                                          
  LABEL="Procedure 42"                                                          
                                                                                
  PR43                       LENGTH=$7                                          
  LABEL="Procedure 43"                                                          
                                                                                
  PR44                       LENGTH=$7                                          
  LABEL="Procedure 44"                                                          
                                                                                
  PR45                       LENGTH=$7                                          
  LABEL="Procedure 45"                                                          
                                                                                
  PR46                       LENGTH=$7                                          
  LABEL="Procedure 46"                                                          
                                                                                
  PR47                       LENGTH=$7                                          
  LABEL="Procedure 47"                                                          
                                                                                
  PR48                       LENGTH=$7                                          
  LABEL="Procedure 48"                                                          
                                                                                
  PR49                       LENGTH=$7                                          
  LABEL="Procedure 49"                                                          
                                                                                
  PR50                       LENGTH=$7                                          
  LABEL="Procedure 50"                                                          
                                                                                
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
                                                                                
  PRCCS26                    LENGTH=3                                           
  LABEL="CCS: procedure 26"                                                     
                                                                                
  PRCCS27                    LENGTH=3                                           
  LABEL="CCS: procedure 27"                                                     
                                                                                
  PRCCS28                    LENGTH=3                                           
  LABEL="CCS: procedure 28"                                                     
                                                                                
  PRCCS29                    LENGTH=3                                           
  LABEL="CCS: procedure 29"                                                     
                                                                                
  PRCCS30                    LENGTH=3                                           
  LABEL="CCS: procedure 30"                                                     
                                                                                
  PRCCS31                    LENGTH=3                                           
  LABEL="CCS: procedure 31"                                                     
                                                                                
  PRCCS32                    LENGTH=3                                           
  LABEL="CCS: procedure 32"                                                     
                                                                                
  PRCCS33                    LENGTH=3                                           
  LABEL="CCS: procedure 33"                                                     
                                                                                
  PRCCS34                    LENGTH=3                                           
  LABEL="CCS: procedure 34"                                                     
                                                                                
  PRCCS35                    LENGTH=3                                           
  LABEL="CCS: procedure 35"                                                     
                                                                                
  PRCCS36                    LENGTH=3                                           
  LABEL="CCS: procedure 36"                                                     
                                                                                
  PRCCS37                    LENGTH=3                                           
  LABEL="CCS: procedure 37"                                                     
                                                                                
  PRCCS38                    LENGTH=3                                           
  LABEL="CCS: procedure 38"                                                     
                                                                                
  PRCCS39                    LENGTH=3                                           
  LABEL="CCS: procedure 39"                                                     
                                                                                
  PRCCS40                    LENGTH=3                                           
  LABEL="CCS: procedure 40"                                                     
                                                                                
  PRCCS41                    LENGTH=3                                           
  LABEL="CCS: procedure 41"                                                     
                                                                                
  PRCCS42                    LENGTH=3                                           
  LABEL="CCS: procedure 42"                                                     
                                                                                
  PRCCS43                    LENGTH=3                                           
  LABEL="CCS: procedure 43"                                                     
                                                                                
  PRCCS44                    LENGTH=3                                           
  LABEL="CCS: procedure 44"                                                     
                                                                                
  PRCCS45                    LENGTH=3                                           
  LABEL="CCS: procedure 45"                                                     
                                                                                
  PRCCS46                    LENGTH=3                                           
  LABEL="CCS: procedure 46"                                                     
                                                                                
  PRCCS47                    LENGTH=3                                           
  LABEL="CCS: procedure 47"                                                     
                                                                                
  PRCCS48                    LENGTH=3                                           
  LABEL="CCS: procedure 48"                                                     
                                                                                
  PRCCS49                    LENGTH=3                                           
  LABEL="CCS: procedure 49"                                                     
                                                                                
  PRCCS50                    LENGTH=3                                           
  LABEL="CCS: procedure 50"                                                     
                                                                                
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
                                                                                
  PRDAY26                    LENGTH=4                                           
  LABEL="Number of days from admission to PR26"                                 
                                                                                
  PRDAY27                    LENGTH=4                                           
  LABEL="Number of days from admission to PR27"                                 
                                                                                
  PRDAY28                    LENGTH=4                                           
  LABEL="Number of days from admission to PR28"                                 
                                                                                
  PRDAY29                    LENGTH=4                                           
  LABEL="Number of days from admission to PR29"                                 
                                                                                
  PRDAY30                    LENGTH=4                                           
  LABEL="Number of days from admission to PR30"                                 
                                                                                
  PRDAY31                    LENGTH=4                                           
  LABEL="Number of days from admission to PR31"                                 
                                                                                
  PRDAY32                    LENGTH=4                                           
  LABEL="Number of days from admission to PR32"                                 
                                                                                
  PRDAY33                    LENGTH=4                                           
  LABEL="Number of days from admission to PR33"                                 
                                                                                
  PRDAY34                    LENGTH=4                                           
  LABEL="Number of days from admission to PR34"                                 
                                                                                
  PRDAY35                    LENGTH=4                                           
  LABEL="Number of days from admission to PR35"                                 
                                                                                
  PRDAY36                    LENGTH=4                                           
  LABEL="Number of days from admission to PR36"                                 
                                                                                
  PRDAY37                    LENGTH=4                                           
  LABEL="Number of days from admission to PR37"                                 
                                                                                
  PRDAY38                    LENGTH=4                                           
  LABEL="Number of days from admission to PR38"                                 
                                                                                
  PRDAY39                    LENGTH=4                                           
  LABEL="Number of days from admission to PR39"                                 
                                                                                
  PRDAY40                    LENGTH=4                                           
  LABEL="Number of days from admission to PR40"                                 
                                                                                
  PRDAY41                    LENGTH=4                                           
  LABEL="Number of days from admission to PR41"                                 
                                                                                
  PRDAY42                    LENGTH=4                                           
  LABEL="Number of days from admission to PR42"                                 
                                                                                
  PRDAY43                    LENGTH=4                                           
  LABEL="Number of days from admission to PR43"                                 
                                                                                
  PRDAY44                    LENGTH=4                                           
  LABEL="Number of days from admission to PR44"                                 
                                                                                
  PRDAY45                    LENGTH=4                                           
  LABEL="Number of days from admission to PR45"                                 
                                                                                
  PRDAY46                    LENGTH=4                                           
  LABEL="Number of days from admission to PR46"                                 
                                                                                
  PRDAY47                    LENGTH=4                                           
  LABEL="Number of days from admission to PR47"                                 
                                                                                
  PRDAY48                    LENGTH=4                                           
  LABEL="Number of days from admission to PR48"                                 
                                                                                
  PRDAY49                    LENGTH=4                                           
  LABEL="Number of days from admission to PR49"                                 
                                                                                
  PRDAY50                    LENGTH=4                                           
  LABEL="Number of days from admission to PR50"                                 
                                                                                
  PROCTYPE                   LENGTH=3                                           
  LABEL="Procedure type indicator"                                              
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO                      LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code"                                        
                                                                                
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
                                                                                
  HOSPID                     LENGTH=4                      FORMAT=Z5.           
  LABEL="HCUP hospital identification number"                                   
                                                                                
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
                                                                                
  PRMONTH26                  LENGTH=3                                           
  LABEL="Month of procedure 26"                                                 
                                                                                
  PRMONTH27                  LENGTH=3                                           
  LABEL="Month of procedure 27"                                                 
                                                                                
  PRMONTH28                  LENGTH=3                                           
  LABEL="Month of procedure 28"                                                 
                                                                                
  PRMONTH29                  LENGTH=3                                           
  LABEL="Month of procedure 29"                                                 
                                                                                
  PRMONTH30                  LENGTH=3                                           
  LABEL="Month of procedure 30"                                                 
                                                                                
  PRMONTH31                  LENGTH=3                                           
  LABEL="Month of procedure 31"                                                 
                                                                                
  PRMONTH32                  LENGTH=3                                           
  LABEL="Month of procedure 32"                                                 
                                                                                
  PRMONTH33                  LENGTH=3                                           
  LABEL="Month of procedure 33"                                                 
                                                                                
  PRMONTH34                  LENGTH=3                                           
  LABEL="Month of procedure 34"                                                 
                                                                                
  PRMONTH35                  LENGTH=3                                           
  LABEL="Month of procedure 35"                                                 
                                                                                
  PRMONTH36                  LENGTH=3                                           
  LABEL="Month of procedure 36"                                                 
                                                                                
  PRMONTH37                  LENGTH=3                                           
  LABEL="Month of procedure 37"                                                 
                                                                                
  PRMONTH38                  LENGTH=3                                           
  LABEL="Month of procedure 38"                                                 
                                                                                
  PRMONTH39                  LENGTH=3                                           
  LABEL="Month of procedure 39"                                                 
                                                                                
  PRMONTH40                  LENGTH=3                                           
  LABEL="Month of procedure 40"                                                 
                                                                                
  PRMONTH41                  LENGTH=3                                           
  LABEL="Month of procedure 41"                                                 
                                                                                
  PRMONTH42                  LENGTH=3                                           
  LABEL="Month of procedure 42"                                                 
                                                                                
  PRMONTH43                  LENGTH=3                                           
  LABEL="Month of procedure 43"                                                 
                                                                                
  PRMONTH44                  LENGTH=3                                           
  LABEL="Month of procedure 44"                                                 
                                                                                
  PRMONTH45                  LENGTH=3                                           
  LABEL="Month of procedure 45"                                                 
                                                                                
  PRMONTH46                  LENGTH=3                                           
  LABEL="Month of procedure 46"                                                 
                                                                                
  PRMONTH47                  LENGTH=3                                           
  LABEL="Month of procedure 47"                                                 
                                                                                
  PRMONTH48                  LENGTH=3                                           
  LABEL="Month of procedure 48"                                                 
                                                                                
  PRMONTH49                  LENGTH=3                                           
  LABEL="Month of procedure 49"                                                 
                                                                                
  PRMONTH50                  LENGTH=3                                           
  LABEL="Month of procedure 50"                                                 
                                                                                
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
                                                                                
  PRYEAR26                   LENGTH=3                                           
  LABEL="Year of procedure 26"                                                  
                                                                                
  PRYEAR27                   LENGTH=3                                           
  LABEL="Year of procedure 27"                                                  
                                                                                
  PRYEAR28                   LENGTH=3                                           
  LABEL="Year of procedure 28"                                                  
                                                                                
  PRYEAR29                   LENGTH=3                                           
  LABEL="Year of procedure 29"                                                  
                                                                                
  PRYEAR30                   LENGTH=3                                           
  LABEL="Year of procedure 30"                                                  
                                                                                
  PRYEAR31                   LENGTH=3                                           
  LABEL="Year of procedure 31"                                                  
                                                                                
  PRYEAR32                   LENGTH=3                                           
  LABEL="Year of procedure 32"                                                  
                                                                                
  PRYEAR33                   LENGTH=3                                           
  LABEL="Year of procedure 33"                                                  
                                                                                
  PRYEAR34                   LENGTH=3                                           
  LABEL="Year of procedure 34"                                                  
                                                                                
  PRYEAR35                   LENGTH=3                                           
  LABEL="Year of procedure 35"                                                  
                                                                                
  PRYEAR36                   LENGTH=3                                           
  LABEL="Year of procedure 36"                                                  
                                                                                
  PRYEAR37                   LENGTH=3                                           
  LABEL="Year of procedure 37"                                                  
                                                                                
  PRYEAR38                   LENGTH=3                                           
  LABEL="Year of procedure 38"                                                  
                                                                                
  PRYEAR39                   LENGTH=3                                           
  LABEL="Year of procedure 39"                                                  
                                                                                
  PRYEAR40                   LENGTH=3                                           
  LABEL="Year of procedure 40"                                                  
                                                                                
  PRYEAR41                   LENGTH=3                                           
  LABEL="Year of procedure 41"                                                  
                                                                                
  PRYEAR42                   LENGTH=3                                           
  LABEL="Year of procedure 42"                                                  
                                                                                
  PRYEAR43                   LENGTH=3                                           
  LABEL="Year of procedure 43"                                                  
                                                                                
  PRYEAR44                   LENGTH=3                                           
  LABEL="Year of procedure 44"                                                  
                                                                                
  PRYEAR45                   LENGTH=3                                           
  LABEL="Year of procedure 45"                                                  
                                                                                
  PRYEAR46                   LENGTH=3                                           
  LABEL="Year of procedure 46"                                                  
                                                                                
  PRYEAR47                   LENGTH=3                                           
  LABEL="Year of procedure 47"                                                  
                                                                                
  PRYEAR48                   LENGTH=3                                           
  LABEL="Year of procedure 48"                                                  
                                                                                
  PRYEAR49                   LENGTH=3                                           
  LABEL="Year of procedure 49"                                                  
                                                                                
  PRYEAR50                   LENGTH=3                                           
  LABEL="Year of procedure 50"                                                  
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                           N3PF.                               
      @4      AGEDAY                        N3PF.                               
      @7      AGEMONTH                      N3PF.                               
      @10     AMONTH                        N2PF.                               
      @12     ATYPE                         N2PF.                               
      @14     AWEEKEND                      N2PF.                               
      @16     BILLTYPE                      $CHAR4.                             
      @20     CPT1                          $CHAR5.                             
      @25     CPT2                          $CHAR5.                             
      @30     CPT3                          $CHAR5.                             
      @35     CPT4                          $CHAR5.                             
      @40     CPT5                          $CHAR5.                             
      @45     CPT6                          $CHAR5.                             
      @50     CPT7                          $CHAR5.                             
      @55     CPT8                          $CHAR5.                             
      @60     CPT9                          $CHAR5.                             
      @65     CPT10                         $CHAR5.                             
      @70     CPT11                         $CHAR5.                             
      @75     CPT12                         $CHAR5.                             
      @80     CPT13                         $CHAR5.                             
      @85     CPT14                         $CHAR5.                             
      @90     CPT15                         $CHAR5.                             
      @95     CPT16                         $CHAR5.                             
      @100    CPT17                         $CHAR5.                             
      @105    CPT18                         $CHAR5.                             
      @110    CPT19                         $CHAR5.                             
      @115    CPT20                         $CHAR5.                             
      @120    CPT21                         $CHAR5.                             
      @125    CPT22                         $CHAR5.                             
      @130    CPT23                         $CHAR5.                             
      @135    CPT24                         $CHAR5.                             
      @140    CPT25                         $CHAR5.                             
      @145    CPT26                         $CHAR5.                             
      @150    CPT27                         $CHAR5.                             
      @155    CPT28                         $CHAR5.                             
      @160    CPT29                         $CHAR5.                             
      @165    CPT30                         $CHAR5.                             
      @170    CPT31                         $CHAR5.                             
      @175    CPT32                         $CHAR5.                             
      @180    CPT33                         $CHAR5.                             
      @185    CPT34                         $CHAR5.                             
      @190    CPT35                         $CHAR5.                             
      @195    CPT36                         $CHAR5.                             
      @200    CPT37                         $CHAR5.                             
      @205    CPT38                         $CHAR5.                             
      @210    CPT39                         $CHAR5.                             
      @215    CPT40                         $CHAR5.                             
      @220    CPT41                         $CHAR5.                             
      @225    CPT42                         $CHAR5.                             
      @230    CPT43                         $CHAR5.                             
      @235    CPT44                         $CHAR5.                             
      @240    CPT45                         $CHAR5.                             
      @245    CPT46                         $CHAR5.                             
      @250    CPT47                         $CHAR5.                             
      @255    CPT48                         $CHAR5.                             
      @260    CPT49                         $CHAR5.                             
      @265    CPT50                         $CHAR5.                             
      @270    CPTCCS1                       N3PF.                               
      @273    CPTCCS2                       N3PF.                               
      @276    CPTCCS3                       N3PF.                               
      @279    CPTCCS4                       N3PF.                               
      @282    CPTCCS5                       N3PF.                               
      @285    CPTCCS6                       N3PF.                               
      @288    CPTCCS7                       N3PF.                               
      @291    CPTCCS8                       N3PF.                               
      @294    CPTCCS9                       N3PF.                               
      @297    CPTCCS10                      N3PF.                               
      @300    CPTCCS11                      N3PF.                               
      @303    CPTCCS12                      N3PF.                               
      @306    CPTCCS13                      N3PF.                               
      @309    CPTCCS14                      N3PF.                               
      @312    CPTCCS15                      N3PF.                               
      @315    CPTCCS16                      N3PF.                               
      @318    CPTCCS17                      N3PF.                               
      @321    CPTCCS18                      N3PF.                               
      @324    CPTCCS19                      N3PF.                               
      @327    CPTCCS20                      N3PF.                               
      @330    CPTCCS21                      N3PF.                               
      @333    CPTCCS22                      N3PF.                               
      @336    CPTCCS23                      N3PF.                               
      @339    CPTCCS24                      N3PF.                               
      @342    CPTCCS25                      N3PF.                               
      @345    CPTCCS26                      N3PF.                               
      @348    CPTCCS27                      N3PF.                               
      @351    CPTCCS28                      N3PF.                               
      @354    CPTCCS29                      N3PF.                               
      @357    CPTCCS30                      N3PF.                               
      @360    CPTCCS31                      N3PF.                               
      @363    CPTCCS32                      N3PF.                               
      @366    CPTCCS33                      N3PF.                               
      @369    CPTCCS34                      N3PF.                               
      @372    CPTCCS35                      N3PF.                               
      @375    CPTCCS36                      N3PF.                               
      @378    CPTCCS37                      N3PF.                               
      @381    CPTCCS38                      N3PF.                               
      @384    CPTCCS39                      N3PF.                               
      @387    CPTCCS40                      N3PF.                               
      @390    CPTCCS41                      N3PF.                               
      @393    CPTCCS42                      N3PF.                               
      @396    CPTCCS43                      N3PF.                               
      @399    CPTCCS44                      N3PF.                               
      @402    CPTCCS45                      N3PF.                               
      @405    CPTCCS46                      N3PF.                               
      @408    CPTCCS47                      N3PF.                               
      @411    CPTCCS48                      N3PF.                               
      @414    CPTCCS49                      N3PF.                               
      @417    CPTCCS50                      N3PF.                               
      @420    CPTDAY1                       N3PF.                               
      @423    CPTDAY2                       N3PF.                               
      @426    CPTDAY3                       N3PF.                               
      @429    CPTDAY4                       N3PF.                               
      @432    CPTDAY5                       N3PF.                               
      @435    CPTDAY6                       N3PF.                               
      @438    CPTDAY7                       N3PF.                               
      @441    CPTDAY8                       N3PF.                               
      @444    CPTDAY9                       N3PF.                               
      @447    CPTDAY10                      N3PF.                               
      @450    CPTDAY11                      N3PF.                               
      @453    CPTDAY12                      N3PF.                               
      @456    CPTDAY13                      N3PF.                               
      @459    CPTDAY14                      N3PF.                               
      @462    CPTDAY15                      N3PF.                               
      @465    CPTDAY16                      N3PF.                               
      @468    CPTDAY17                      N3PF.                               
      @471    CPTDAY18                      N3PF.                               
      @474    CPTDAY19                      N3PF.                               
      @477    CPTDAY20                      N3PF.                               
      @480    CPTDAY21                      N3PF.                               
      @483    CPTDAY22                      N3PF.                               
      @486    CPTDAY23                      N3PF.                               
      @489    CPTDAY24                      N3PF.                               
      @492    CPTDAY25                      N3PF.                               
      @495    CPTDAY26                      N3PF.                               
      @498    CPTDAY27                      N3PF.                               
      @501    CPTDAY28                      N3PF.                               
      @504    CPTDAY29                      N3PF.                               
      @507    CPTDAY30                      N3PF.                               
      @510    CPTDAY31                      N3PF.                               
      @513    CPTDAY32                      N3PF.                               
      @516    CPTDAY33                      N3PF.                               
      @519    CPTDAY34                      N3PF.                               
      @522    CPTDAY35                      N3PF.                               
      @525    CPTDAY36                      N3PF.                               
      @528    CPTDAY37                      N3PF.                               
      @531    CPTDAY38                      N3PF.                               
      @534    CPTDAY39                      N3PF.                               
      @537    CPTDAY40                      N3PF.                               
      @540    CPTDAY41                      N3PF.                               
      @543    CPTDAY42                      N3PF.                               
      @546    CPTDAY43                      N3PF.                               
      @549    CPTDAY44                      N3PF.                               
      @552    CPTDAY45                      N3PF.                               
      @555    CPTDAY46                      N3PF.                               
      @558    CPTDAY47                      N3PF.                               
      @561    CPTDAY48                      N3PF.                               
      @564    CPTDAY49                      N3PF.                               
      @567    CPTDAY50                      N3PF.                               
      @570    DIED                          N2PF.                               
      @572    DISPUB04                      N2PF.                               
      @574    DISPUNIFORM                   N2PF.                               
      @576    DISP_X                        $CHAR2.                             
      @578    DMONTH                        N2PF.                               
      @580    DQTR                          N2PF.                               
      @582    DX1                           $CHAR7.                             
      @589    DX2                           $CHAR7.                             
      @596    DX3                           $CHAR7.                             
      @603    DX4                           $CHAR7.                             
      @610    DX5                           $CHAR7.                             
      @617    DX6                           $CHAR7.                             
      @624    DX7                           $CHAR7.                             
      @631    DX8                           $CHAR7.                             
      @638    DX9                           $CHAR7.                             
      @645    DX10                          $CHAR7.                             
      @652    DX11                          $CHAR7.                             
      @659    DX12                          $CHAR7.                             
      @666    DX13                          $CHAR7.                             
      @673    DX14                          $CHAR7.                             
      @680    DX15                          $CHAR7.                             
      @687    DX16                          $CHAR7.                             
      @694    DX17                          $CHAR7.                             
      @701    DX18                          $CHAR7.                             
      @708    DX19                          $CHAR7.                             
      @715    DX20                          $CHAR7.                             
      @722    DX21                          $CHAR7.                             
      @729    DX22                          $CHAR7.                             
      @736    DX23                          $CHAR7.                             
      @743    DX24                          $CHAR7.                             
      @750    DX25                          $CHAR7.                             
      @757    DX26                          $CHAR7.                             
      @764    DX27                          $CHAR7.                             
      @771    DX28                          $CHAR7.                             
      @778    DX29                          $CHAR7.                             
      @785    DX30                          $CHAR7.                             
      @792    DX31                          $CHAR7.                             
      @799    DX32                          $CHAR7.                             
      @806    DX33                          $CHAR7.                             
      @813    DX34                          $CHAR7.                             
      @820    DX35                          $CHAR7.                             
      @827    DX36                          $CHAR7.                             
      @834    DX37                          $CHAR7.                             
      @841    DX38                          $CHAR7.                             
      @848    DX39                          $CHAR7.                             
      @855    DX40                          $CHAR7.                             
      @862    DX41                          $CHAR7.                             
      @869    DX42                          $CHAR7.                             
      @876    DX43                          $CHAR7.                             
      @883    DX44                          $CHAR7.                             
      @890    DX45                          $CHAR7.                             
      @897    DXCCS1                        N4PF.                               
      @901    DXCCS2                        N4PF.                               
      @905    DXCCS3                        N4PF.                               
      @909    DXCCS4                        N4PF.                               
      @913    DXCCS5                        N4PF.                               
      @917    DXCCS6                        N4PF.                               
      @921    DXCCS7                        N4PF.                               
      @925    DXCCS8                        N4PF.                               
      @929    DXCCS9                        N4PF.                               
      @933    DXCCS10                       N4PF.                               
      @937    DXCCS11                       N4PF.                               
      @941    DXCCS12                       N4PF.                               
      @945    DXCCS13                       N4PF.                               
      @949    DXCCS14                       N4PF.                               
      @953    DXCCS15                       N4PF.                               
      @957    DXCCS16                       N4PF.                               
      @961    DXCCS17                       N4PF.                               
      @965    DXCCS18                       N4PF.                               
      @969    DXCCS19                       N4PF.                               
      @973    DXCCS20                       N4PF.                               
      @977    DXCCS21                       N4PF.                               
      @981    DXCCS22                       N4PF.                               
      @985    DXCCS23                       N4PF.                               
      @989    DXCCS24                       N4PF.                               
      @993    DXCCS25                       N4PF.                               
      @997    DXCCS26                       N4PF.                               
      @1001   DXCCS27                       N4PF.                               
      @1005   DXCCS28                       N4PF.                               
      @1009   DXCCS29                       N4PF.                               
      @1013   DXCCS30                       N4PF.                               
      @1017   DXCCS31                       N4PF.                               
      @1021   DXCCS32                       N4PF.                               
      @1025   DXCCS33                       N4PF.                               
      @1029   DXCCS34                       N4PF.                               
      @1033   DXCCS35                       N4PF.                               
      @1037   DXCCS36                       N4PF.                               
      @1041   DXCCS37                       N4PF.                               
      @1045   DXCCS38                       N4PF.                               
      @1049   DXCCS39                       N4PF.                               
      @1053   DXCCS40                       N4PF.                               
      @1057   DXCCS41                       N4PF.                               
      @1061   DXCCS42                       N4PF.                               
      @1065   DXCCS43                       N4PF.                               
      @1069   DXCCS44                       N4PF.                               
      @1073   DXCCS45                       N4PF.                               
      @1077   DXPOA1                        $CHAR1.                             
      @1078   DXPOA2                        $CHAR1.                             
      @1079   DXPOA3                        $CHAR1.                             
      @1080   DXPOA4                        $CHAR1.                             
      @1081   DXPOA5                        $CHAR1.                             
      @1082   DXPOA6                        $CHAR1.                             
      @1083   DXPOA7                        $CHAR1.                             
      @1084   DXPOA8                        $CHAR1.                             
      @1085   DXPOA9                        $CHAR1.                             
      @1086   DXPOA10                       $CHAR1.                             
      @1087   DXPOA11                       $CHAR1.                             
      @1088   DXPOA12                       $CHAR1.                             
      @1089   DXPOA13                       $CHAR1.                             
      @1090   DXPOA14                       $CHAR1.                             
      @1091   DXPOA15                       $CHAR1.                             
      @1092   DXPOA16                       $CHAR1.                             
      @1093   DXPOA17                       $CHAR1.                             
      @1094   DXPOA18                       $CHAR1.                             
      @1095   DXPOA19                       $CHAR1.                             
      @1096   DXPOA20                       $CHAR1.                             
      @1097   DXPOA21                       $CHAR1.                             
      @1098   DXPOA22                       $CHAR1.                             
      @1099   DXPOA23                       $CHAR1.                             
      @1100   DXPOA24                       $CHAR1.                             
      @1101   DXPOA25                       $CHAR1.                             
      @1102   DXPOA26                       $CHAR1.                             
      @1103   DXPOA27                       $CHAR1.                             
      @1104   DXPOA28                       $CHAR1.                             
      @1105   DXPOA29                       $CHAR1.                             
      @1106   DXPOA30                       $CHAR1.                             
      @1107   DXPOA31                       $CHAR1.                             
      @1108   DXPOA32                       $CHAR1.                             
      @1109   DXPOA33                       $CHAR1.                             
      @1110   DXPOA34                       $CHAR1.                             
      @1111   DXPOA35                       $CHAR1.                             
      @1112   DXPOA36                       $CHAR1.                             
      @1113   DXPOA37                       $CHAR1.                             
      @1114   DXPOA38                       $CHAR1.                             
      @1115   DXPOA39                       $CHAR1.                             
      @1116   DXPOA40                       $CHAR1.                             
      @1117   DXPOA41                       $CHAR1.                             
      @1118   DXPOA42                       $CHAR1.                             
      @1119   DXPOA43                       $CHAR1.                             
      @1120   DXPOA44                       $CHAR1.                             
      @1121   DXPOA45                       $CHAR1.                             
      @1122   DaysToEvent                   N6PF.                               
      @1128   ECODE1                        $CHAR7.                             
      @1135   ECODE2                        $CHAR7.                             
      @1142   ECODE3                        $CHAR7.                             
      @1149   ECODE4                        $CHAR7.                             
      @1156   ECODE5                        $CHAR7.                             
      @1163   ECODE6                        $CHAR7.                             
      @1170   ECODE7                        $CHAR7.                             
      @1177   ECODE8                        $CHAR7.                             
      @1184   ECODE9                        $CHAR7.                             
      @1191   E_CCS1                        N4PF.                               
      @1195   E_CCS2                        N4PF.                               
      @1199   E_CCS3                        N4PF.                               
      @1203   E_CCS4                        N4PF.                               
      @1207   E_CCS5                        N4PF.                               
      @1211   E_CCS6                        N4PF.                               
      @1215   E_CCS7                        N4PF.                               
      @1219   E_CCS8                        N4PF.                               
      @1223   E_CCS9                        N4PF.                               
      @1227   E_POA1                        $CHAR1.                             
      @1228   E_POA2                        $CHAR1.                             
      @1229   E_POA3                        $CHAR1.                             
      @1230   E_POA4                        $CHAR1.                             
      @1231   E_POA5                        $CHAR1.                             
      @1232   E_POA6                        $CHAR1.                             
      @1233   E_POA7                        $CHAR1.                             
      @1234   E_POA8                        $CHAR1.                             
      @1235   E_POA9                        $CHAR1.                             
      @1236   FEMALE                        N2PF.                               
      @1238   HCUP_ED                       N2PF.                               
      @1240   HCUP_OS                       N2PF.                               
      @1242   HISPANIC_X                    $CHAR1.                             
      @1243   HOSPBRTH                      N3PF.                               
      @1246   HOSPST                        $CHAR2.                             
      @1248   Homeless                      N2PF.                               
      @1250   KEY                           15.                                 
      @1265   LOS                           N5PF.                               
      @1270   LOS_X                         N6PF.                               
      @1276   MARITALSTATUSUB04             $CHAR1.                             
      @1277   MARITALSTATUS_X               $CHAR1.                             
      @1278   MDNUM1_R                      N9PF.                               
      @1287   MDNUM2_R                      N9PF.                               
      @1296   MDNUM3_R                      N9PF.                               
      @1305   MDNUM4_R                      N9PF.                               
      @1314   MEDINCSTQ                     N2PF.                               
      @1316   NCHRONIC                      N3PF.                               
      @1319   NCPT                          N4PF.                               
      @1323   NDX                           N3PF.                               
      @1326   NECODE                        N2PF.                               
      @1328   NEOMAT                        N2PF.                               
      @1330   NPR                           N3PF.                               
      @1333   OPservice                     $CHAR2.                             
      @1335   ORPROC                        N2PF.                               
      @1337   OS_TIME                       N11P2F.                             
      @1348   PAY1                          N2PF.                               
      @1350   PAY1_X                        $CHAR4.                             
      @1354   PAY2                          N2PF.                               
      @1356   PAY2_X                        $CHAR4.                             
      @1360   PAY3                          N2PF.                               
      @1362   PAY3_X                        $CHAR4.                             
      @1366   PL_CBSA                       N3PF.                               
      @1369   PL_NCHS                       N2PF.                               
      @1371   PL_RUCA10_2005                N2PF.                               
      @1373   PL_RUCA2005                   N4P1F.                              
      @1377   PL_RUCA4_2005                 N2PF.                               
      @1379   PL_RUCC                       N2PF.                               
      @1381   PL_UIC                        N2PF.                               
      @1383   PL_UR_CAT4                    N2PF.                               
      @1385   PR1                           $CHAR7.                             
      @1392   PR2                           $CHAR7.                             
      @1399   PR3                           $CHAR7.                             
      @1406   PR4                           $CHAR7.                             
      @1413   PR5                           $CHAR7.                             
      @1420   PR6                           $CHAR7.                             
      @1427   PR7                           $CHAR7.                             
      @1434   PR8                           $CHAR7.                             
      @1441   PR9                           $CHAR7.                             
      @1448   PR10                          $CHAR7.                             
      @1455   PR11                          $CHAR7.                             
      @1462   PR12                          $CHAR7.                             
      @1469   PR13                          $CHAR7.                             
      @1476   PR14                          $CHAR7.                             
      @1483   PR15                          $CHAR7.                             
      @1490   PR16                          $CHAR7.                             
      @1497   PR17                          $CHAR7.                             
      @1504   PR18                          $CHAR7.                             
      @1511   PR19                          $CHAR7.                             
      @1518   PR20                          $CHAR7.                             
      @1525   PR21                          $CHAR7.                             
      @1532   PR22                          $CHAR7.                             
      @1539   PR23                          $CHAR7.                             
      @1546   PR24                          $CHAR7.                             
      @1553   PR25                          $CHAR7.                             
      @1560   PR26                          $CHAR7.                             
      @1567   PR27                          $CHAR7.                             
      @1574   PR28                          $CHAR7.                             
      @1581   PR29                          $CHAR7.                             
      @1588   PR30                          $CHAR7.                             
      @1595   PR31                          $CHAR7.                             
      @1602   PR32                          $CHAR7.                             
      @1609   PR33                          $CHAR7.                             
      @1616   PR34                          $CHAR7.                             
      @1623   PR35                          $CHAR7.                             
      @1630   PR36                          $CHAR7.                             
      @1637   PR37                          $CHAR7.                             
      @1644   PR38                          $CHAR7.                             
      @1651   PR39                          $CHAR7.                             
      @1658   PR40                          $CHAR7.                             
      @1665   PR41                          $CHAR7.                             
      @1672   PR42                          $CHAR7.                             
      @1679   PR43                          $CHAR7.                             
      @1686   PR44                          $CHAR7.                             
      @1693   PR45                          $CHAR7.                             
      @1700   PR46                          $CHAR7.                             
      @1707   PR47                          $CHAR7.                             
      @1714   PR48                          $CHAR7.                             
      @1721   PR49                          $CHAR7.                             
      @1728   PR50                          $CHAR7.                             
      @1735   PRCCS1                        N3PF.                               
      @1738   PRCCS2                        N3PF.                               
      @1741   PRCCS3                        N3PF.                               
      @1744   PRCCS4                        N3PF.                               
      @1747   PRCCS5                        N3PF.                               
      @1750   PRCCS6                        N3PF.                               
      @1753   PRCCS7                        N3PF.                               
      @1756   PRCCS8                        N3PF.                               
      @1759   PRCCS9                        N3PF.                               
      @1762   PRCCS10                       N3PF.                               
      @1765   PRCCS11                       N3PF.                               
      @1768   PRCCS12                       N3PF.                               
      @1771   PRCCS13                       N3PF.                               
      @1774   PRCCS14                       N3PF.                               
      @1777   PRCCS15                       N3PF.                               
      @1780   PRCCS16                       N3PF.                               
      @1783   PRCCS17                       N3PF.                               
      @1786   PRCCS18                       N3PF.                               
      @1789   PRCCS19                       N3PF.                               
      @1792   PRCCS20                       N3PF.                               
      @1795   PRCCS21                       N3PF.                               
      @1798   PRCCS22                       N3PF.                               
      @1801   PRCCS23                       N3PF.                               
      @1804   PRCCS24                       N3PF.                               
      @1807   PRCCS25                       N3PF.                               
      @1810   PRCCS26                       N3PF.                               
      @1813   PRCCS27                       N3PF.                               
      @1816   PRCCS28                       N3PF.                               
      @1819   PRCCS29                       N3PF.                               
      @1822   PRCCS30                       N3PF.                               
      @1825   PRCCS31                       N3PF.                               
      @1828   PRCCS32                       N3PF.                               
      @1831   PRCCS33                       N3PF.                               
      @1834   PRCCS34                       N3PF.                               
      @1837   PRCCS35                       N3PF.                               
      @1840   PRCCS36                       N3PF.                               
      @1843   PRCCS37                       N3PF.                               
      @1846   PRCCS38                       N3PF.                               
      @1849   PRCCS39                       N3PF.                               
      @1852   PRCCS40                       N3PF.                               
      @1855   PRCCS41                       N3PF.                               
      @1858   PRCCS42                       N3PF.                               
      @1861   PRCCS43                       N3PF.                               
      @1864   PRCCS44                       N3PF.                               
      @1867   PRCCS45                       N3PF.                               
      @1870   PRCCS46                       N3PF.                               
      @1873   PRCCS47                       N3PF.                               
      @1876   PRCCS48                       N3PF.                               
      @1879   PRCCS49                       N3PF.                               
      @1882   PRCCS50                       N3PF.                               
      @1885   PRDAY1                        N5PF.                               
      @1890   PRDAY2                        N5PF.                               
      @1895   PRDAY3                        N5PF.                               
      @1900   PRDAY4                        N5PF.                               
      @1905   PRDAY5                        N5PF.                               
      @1910   PRDAY6                        N5PF.                               
      @1915   PRDAY7                        N5PF.                               
      @1920   PRDAY8                        N5PF.                               
      @1925   PRDAY9                        N5PF.                               
      @1930   PRDAY10                       N5PF.                               
      @1935   PRDAY11                       N5PF.                               
      @1940   PRDAY12                       N5PF.                               
      @1945   PRDAY13                       N5PF.                               
      @1950   PRDAY14                       N5PF.                               
      @1955   PRDAY15                       N5PF.                               
      @1960   PRDAY16                       N5PF.                               
      @1965   PRDAY17                       N5PF.                               
      @1970   PRDAY18                       N5PF.                               
      @1975   PRDAY19                       N5PF.                               
      @1980   PRDAY20                       N5PF.                               
      @1985   PRDAY21                       N5PF.                               
      @1990   PRDAY22                       N5PF.                               
      @1995   PRDAY23                       N5PF.                               
      @2000   PRDAY24                       N5PF.                               
      @2005   PRDAY25                       N5PF.                               
      @2010   PRDAY26                       N5PF.                               
      @2015   PRDAY27                       N5PF.                               
      @2020   PRDAY28                       N5PF.                               
      @2025   PRDAY29                       N5PF.                               
      @2030   PRDAY30                       N5PF.                               
      @2035   PRDAY31                       N5PF.                               
      @2040   PRDAY32                       N5PF.                               
      @2045   PRDAY33                       N5PF.                               
      @2050   PRDAY34                       N5PF.                               
      @2055   PRDAY35                       N5PF.                               
      @2060   PRDAY36                       N5PF.                               
      @2065   PRDAY37                       N5PF.                               
      @2070   PRDAY38                       N5PF.                               
      @2075   PRDAY39                       N5PF.                               
      @2080   PRDAY40                       N5PF.                               
      @2085   PRDAY41                       N5PF.                               
      @2090   PRDAY42                       N5PF.                               
      @2095   PRDAY43                       N5PF.                               
      @2100   PRDAY44                       N5PF.                               
      @2105   PRDAY45                       N5PF.                               
      @2110   PRDAY46                       N5PF.                               
      @2115   PRDAY47                       N5PF.                               
      @2120   PRDAY48                       N5PF.                               
      @2125   PRDAY49                       N5PF.                               
      @2130   PRDAY50                       N5PF.                               
      @2135   PROCTYPE                      N3PF.                               
      @2138   PSTATE                        $CHAR2.                             
      @2140   PSTCO                         N5PF.                               
      @2145   PSTCO2                        N5PF.                               
      @2150   PointOfOriginUB04             $CHAR1.                             
      @2151   PointOfOrigin_X               $CHAR1.                             
      @2152   RACE                          N2PF.                               
      @2154   RACE_X                        $CHAR1.                             
      @2155   STATE_AS                      N2PF.                               
      @2157   STATE_ED                      N2PF.                               
      @2159   STATE_OS                      N2PF.                               
      @2161   TOTCHG                        N10PF.                              
      @2171   TOTCHG_X                      N15P2F.                             
      @2186   VisitLink                     N9PF.                               
      @2195   YEAR                          N4PF.                               
      @2199   ZIP3                          $CHAR3.                             
      @2202   ZIPINC_QRTL                   N3PF.                               
      @2205   HOSPID                        N5PF.                               
      @2210   ZIP                           $CHAR5.                             
      @2215   AYEAR                         N4PF.                               
      @2219   BMONTH                        N2PF.                               
      @2221   BYEAR                         N4PF.                               
      @2225   PRMONTH1                      N2PF.                               
      @2227   PRMONTH2                      N2PF.                               
      @2229   PRMONTH3                      N2PF.                               
      @2231   PRMONTH4                      N2PF.                               
      @2233   PRMONTH5                      N2PF.                               
      @2235   PRMONTH6                      N2PF.                               
      @2237   PRMONTH7                      N2PF.                               
      @2239   PRMONTH8                      N2PF.                               
      @2241   PRMONTH9                      N2PF.                               
      @2243   PRMONTH10                     N2PF.                               
      @2245   PRMONTH11                     N2PF.                               
      @2247   PRMONTH12                     N2PF.                               
      @2249   PRMONTH13                     N2PF.                               
      @2251   PRMONTH14                     N2PF.                               
      @2253   PRMONTH15                     N2PF.                               
      @2255   PRMONTH16                     N2PF.                               
      @2257   PRMONTH17                     N2PF.                               
      @2259   PRMONTH18                     N2PF.                               
      @2261   PRMONTH19                     N2PF.                               
      @2263   PRMONTH20                     N2PF.                               
      @2265   PRMONTH21                     N2PF.                               
      @2267   PRMONTH22                     N2PF.                               
      @2269   PRMONTH23                     N2PF.                               
      @2271   PRMONTH24                     N2PF.                               
      @2273   PRMONTH25                     N2PF.                               
      @2275   PRMONTH26                     N2PF.                               
      @2277   PRMONTH27                     N2PF.                               
      @2279   PRMONTH28                     N2PF.                               
      @2281   PRMONTH29                     N2PF.                               
      @2283   PRMONTH30                     N2PF.                               
      @2285   PRMONTH31                     N2PF.                               
      @2287   PRMONTH32                     N2PF.                               
      @2289   PRMONTH33                     N2PF.                               
      @2291   PRMONTH34                     N2PF.                               
      @2293   PRMONTH35                     N2PF.                               
      @2295   PRMONTH36                     N2PF.                               
      @2297   PRMONTH37                     N2PF.                               
      @2299   PRMONTH38                     N2PF.                               
      @2301   PRMONTH39                     N2PF.                               
      @2303   PRMONTH40                     N2PF.                               
      @2305   PRMONTH41                     N2PF.                               
      @2307   PRMONTH42                     N2PF.                               
      @2309   PRMONTH43                     N2PF.                               
      @2311   PRMONTH44                     N2PF.                               
      @2313   PRMONTH45                     N2PF.                               
      @2315   PRMONTH46                     N2PF.                               
      @2317   PRMONTH47                     N2PF.                               
      @2319   PRMONTH48                     N2PF.                               
      @2321   PRMONTH49                     N2PF.                               
      @2323   PRMONTH50                     N2PF.                               
      @2325   PRYEAR1                       N4PF.                               
      @2329   PRYEAR2                       N4PF.                               
      @2333   PRYEAR3                       N4PF.                               
      @2337   PRYEAR4                       N4PF.                               
      @2341   PRYEAR5                       N4PF.                               
      @2345   PRYEAR6                       N4PF.                               
      @2349   PRYEAR7                       N4PF.                               
      @2353   PRYEAR8                       N4PF.                               
      @2357   PRYEAR9                       N4PF.                               
      @2361   PRYEAR10                      N4PF.                               
      @2365   PRYEAR11                      N4PF.                               
      @2369   PRYEAR12                      N4PF.                               
      @2373   PRYEAR13                      N4PF.                               
      @2377   PRYEAR14                      N4PF.                               
      @2381   PRYEAR15                      N4PF.                               
      @2385   PRYEAR16                      N4PF.                               
      @2389   PRYEAR17                      N4PF.                               
      @2393   PRYEAR18                      N4PF.                               
      @2397   PRYEAR19                      N4PF.                               
      @2401   PRYEAR20                      N4PF.                               
      @2405   PRYEAR21                      N4PF.                               
      @2409   PRYEAR22                      N4PF.                               
      @2413   PRYEAR23                      N4PF.                               
      @2417   PRYEAR24                      N4PF.                               
      @2421   PRYEAR25                      N4PF.                               
      @2425   PRYEAR26                      N4PF.                               
      @2429   PRYEAR27                      N4PF.                               
      @2433   PRYEAR28                      N4PF.                               
      @2437   PRYEAR29                      N4PF.                               
      @2441   PRYEAR30                      N4PF.                               
      @2445   PRYEAR31                      N4PF.                               
      @2449   PRYEAR32                      N4PF.                               
      @2453   PRYEAR33                      N4PF.                               
      @2457   PRYEAR34                      N4PF.                               
      @2461   PRYEAR35                      N4PF.                               
      @2465   PRYEAR36                      N4PF.                               
      @2469   PRYEAR37                      N4PF.                               
      @2473   PRYEAR38                      N4PF.                               
      @2477   PRYEAR39                      N4PF.                               
      @2481   PRYEAR40                      N4PF.                               
      @2485   PRYEAR41                      N4PF.                               
      @2489   PRYEAR42                      N4PF.                               
      @2493   PRYEAR43                      N4PF.                               
      @2497   PRYEAR44                      N4PF.                               
      @2501   PRYEAR45                      N4PF.                               
      @2505   PRYEAR46                      N4PF.                               
      @2509   PRYEAR47                      N4PF.                               
      @2513   PRYEAR48                      N4PF.                               
      @2517   PRYEAR49                      N4PF.                               
      @2521   PRYEAR50                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
