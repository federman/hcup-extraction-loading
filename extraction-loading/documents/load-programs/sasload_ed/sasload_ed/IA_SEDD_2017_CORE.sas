/*******************************************************************            
* Creation Date: 09/06/2018                                                     
*   IA_SEDD_2017_CORE.SAS:                                                      
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
DATA IA_SEDDC_2017_CORE;                                                        
INFILE 'IA_SEDD_2017_CORE.ASC' FIRSTOBS=3 LRECL = 1720;                         
                                                                                
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
                                                                                
  CPT59                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 59"                                           
                                                                                
  CPT60                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 60"                                           
                                                                                
  CPT61                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 61"                                           
                                                                                
  CPT62                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 62"                                           
                                                                                
  CPT63                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 63"                                           
                                                                                
  CPT64                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 64"                                           
                                                                                
  CPT65                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 65"                                           
                                                                                
  CPT66                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 66"                                           
                                                                                
  CPT67                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 67"                                           
                                                                                
  CPT68                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 68"                                           
                                                                                
  CPT69                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 69"                                           
                                                                                
  CPT70                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 70"                                           
                                                                                
  CPT71                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 71"                                           
                                                                                
  CPT72                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 72"                                           
                                                                                
  CPT73                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 73"                                           
                                                                                
  CPT74                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 74"                                           
                                                                                
  CPT75                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 75"                                           
                                                                                
  CPT76                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 76"                                           
                                                                                
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
                                                                                
  CPTCCS59                   LENGTH=4                                           
  LABEL="CCS: CPT 59"                                                           
                                                                                
  CPTCCS60                   LENGTH=4                                           
  LABEL="CCS: CPT 60"                                                           
                                                                                
  CPTCCS61                   LENGTH=4                                           
  LABEL="CCS: CPT 61"                                                           
                                                                                
  CPTCCS62                   LENGTH=4                                           
  LABEL="CCS: CPT 62"                                                           
                                                                                
  CPTCCS63                   LENGTH=4                                           
  LABEL="CCS: CPT 63"                                                           
                                                                                
  CPTCCS64                   LENGTH=4                                           
  LABEL="CCS: CPT 64"                                                           
                                                                                
  CPTCCS65                   LENGTH=4                                           
  LABEL="CCS: CPT 65"                                                           
                                                                                
  CPTCCS66                   LENGTH=4                                           
  LABEL="CCS: CPT 66"                                                           
                                                                                
  CPTCCS67                   LENGTH=4                                           
  LABEL="CCS: CPT 67"                                                           
                                                                                
  CPTCCS68                   LENGTH=4                                           
  LABEL="CCS: CPT 68"                                                           
                                                                                
  CPTCCS69                   LENGTH=4                                           
  LABEL="CCS: CPT 69"                                                           
                                                                                
  CPTCCS70                   LENGTH=4                                           
  LABEL="CCS: CPT 70"                                                           
                                                                                
  CPTCCS71                   LENGTH=4                                           
  LABEL="CCS: CPT 71"                                                           
                                                                                
  CPTCCS72                   LENGTH=4                                           
  LABEL="CCS: CPT 72"                                                           
                                                                                
  CPTCCS73                   LENGTH=4                                           
  LABEL="CCS: CPT 73"                                                           
                                                                                
  CPTCCS74                   LENGTH=4                                           
  LABEL="CCS: CPT 74"                                                           
                                                                                
  CPTCCS75                   LENGTH=4                                           
  LABEL="CCS: CPT 75"                                                           
                                                                                
  CPTCCS76                   LENGTH=4                                           
  LABEL="CCS: CPT 76"                                                           
                                                                                
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
                                                                                
  CPTDAY51                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT51"                                
                                                                                
  CPTDAY52                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT52"                                
                                                                                
  CPTDAY53                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT53"                                
                                                                                
  CPTDAY54                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT54"                                
                                                                                
  CPTDAY55                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT55"                                
                                                                                
  CPTDAY56                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT56"                                
                                                                                
  CPTDAY57                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT57"                                
                                                                                
  CPTDAY58                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT58"                                
                                                                                
  CPTDAY59                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT59"                                
                                                                                
  CPTDAY60                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT60"                                
                                                                                
  CPTDAY61                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT61"                                
                                                                                
  CPTDAY62                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT62"                                
                                                                                
  CPTDAY63                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT63"                                
                                                                                
  CPTDAY64                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT64"                                
                                                                                
  CPTDAY65                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT65"                                
                                                                                
  CPTDAY66                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT66"                                
                                                                                
  CPTDAY67                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT67"                                
                                                                                
  CPTDAY68                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT68"                                
                                                                                
  CPTDAY69                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT69"                                
                                                                                
  CPTDAY70                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT70"                                
                                                                                
  CPTDAY71                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT71"                                
                                                                                
  CPTDAY72                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT72"                                
                                                                                
  CPTDAY73                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT73"                                
                                                                                
  CPTDAY74                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT74"                                
                                                                                
  CPTDAY75                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT75"                                
                                                                                
  CPTDAY76                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT76"                                
                                                                                
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
                                                                                
  CPTM1_51                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 51"                                         
                                                                                
  CPTM1_52                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 52"                                         
                                                                                
  CPTM1_53                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 53"                                         
                                                                                
  CPTM1_54                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 54"                                         
                                                                                
  CPTM1_55                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 55"                                         
                                                                                
  CPTM1_56                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 56"                                         
                                                                                
  CPTM1_57                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 57"                                         
                                                                                
  CPTM1_58                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 58"                                         
                                                                                
  CPTM1_59                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 59"                                         
                                                                                
  CPTM1_60                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 60"                                         
                                                                                
  CPTM1_61                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 61"                                         
                                                                                
  CPTM1_62                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 62"                                         
                                                                                
  CPTM1_63                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 63"                                         
                                                                                
  CPTM1_64                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 64"                                         
                                                                                
  CPTM1_65                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 65"                                         
                                                                                
  CPTM1_66                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 66"                                         
                                                                                
  CPTM1_67                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 67"                                         
                                                                                
  CPTM1_68                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 68"                                         
                                                                                
  CPTM1_69                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 69"                                         
                                                                                
  CPTM1_70                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 70"                                         
                                                                                
  CPTM1_71                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 71"                                         
                                                                                
  CPTM1_72                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 72"                                         
                                                                                
  CPTM1_73                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 73"                                         
                                                                                
  CPTM1_74                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 74"                                         
                                                                                
  CPTM1_75                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 75"                                         
                                                                                
  CPTM1_76                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 76"                                         
                                                                                
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
                                                                                
  CPTM2_51                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 51"                                        
                                                                                
  CPTM2_52                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 52"                                        
                                                                                
  CPTM2_53                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 53"                                        
                                                                                
  CPTM2_54                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 54"                                        
                                                                                
  CPTM2_55                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 55"                                        
                                                                                
  CPTM2_56                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 56"                                        
                                                                                
  CPTM2_57                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 57"                                        
                                                                                
  CPTM2_58                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 58"                                        
                                                                                
  CPTM2_59                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 59"                                        
                                                                                
  CPTM2_60                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 60"                                        
                                                                                
  CPTM2_61                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 61"                                        
                                                                                
  CPTM2_62                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 62"                                        
                                                                                
  CPTM2_63                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 63"                                        
                                                                                
  CPTM2_64                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 64"                                        
                                                                                
  CPTM2_65                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 65"                                        
                                                                                
  CPTM2_66                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 66"                                        
                                                                                
  CPTM2_67                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 67"                                        
                                                                                
  CPTM2_68                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 68"                                        
                                                                                
  CPTM2_69                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 69"                                        
                                                                                
  CPTM2_70                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 70"                                        
                                                                                
  CPTM2_71                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 71"                                        
                                                                                
  CPTM2_72                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 72"                                        
                                                                                
  CPTM2_73                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 73"                                        
                                                                                
  CPTM2_74                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 74"                                        
                                                                                
  CPTM2_75                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 75"                                        
                                                                                
  CPTM2_76                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 76"                                        
                                                                                
  DaysToEvent                LENGTH=8                                           
  LABEL="Days from 'start date' to admission"                                   
                                                                                
  DIED                       LENGTH=3                                           
  LABEL="Died during hospitalization"                                           
                                                                                
  DISP_X                     LENGTH=$2                                          
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DISPUB04                   LENGTH=3                                           
  LABEL="Disposition of patient (UB-04 standard coding)"                        
                                                                                
  DISPUNIFORM                LENGTH=3                                           
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
  DMONTH                     LENGTH=3                                           
  LABEL="Discharge month"                                                       
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DXVER                      LENGTH=3                                           
  LABEL="Diagnosis Version"                                                     
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HISPANIC                   LENGTH=3                                           
  LABEL="Hispanic ethnicity (uniform)"                                          
                                                                                
  HISPANIC_X                 LENGTH=$1                                          
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  I10_DX_Visit_Reason1       LENGTH=$7                                          
  LABEL="ICD-10-CM Reason for visit diagnosis 1"                                
                                                                                
  I10_DX_Visit_Reason2       LENGTH=$7                                          
  LABEL="ICD-10-CM Reason for visit diagnosis 2"                                
                                                                                
  I10_DX_Visit_Reason3       LENGTH=$7                                          
  LABEL="ICD-10-CM Reason for visit diagnosis 3"                                
                                                                                
  I10_DX1                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 1"                                                 
                                                                                
  I10_DX2                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 2"                                                 
                                                                                
  I10_DX3                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 3"                                                 
                                                                                
  I10_DX4                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 4"                                                 
                                                                                
  I10_DX5                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 5"                                                 
                                                                                
  I10_DX6                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 6"                                                 
                                                                                
  I10_DX7                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 7"                                                 
                                                                                
  I10_DX8                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 8"                                                 
                                                                                
  I10_DX9                    LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 9"                                                 
                                                                                
  I10_DX10                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 10"                                                
                                                                                
  I10_DX11                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 11"                                                
                                                                                
  I10_DX12                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 12"                                                
                                                                                
  I10_DX13                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 13"                                                
                                                                                
  I10_DX14                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 14"                                                
                                                                                
  I10_DX15                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 15"                                                
                                                                                
  I10_DX16                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 16"                                                
                                                                                
  I10_DX17                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 17"                                                
                                                                                
  I10_DX18                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 18"                                                
                                                                                
  I10_DX19                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 19"                                                
                                                                                
  I10_DX20                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 20"                                                
                                                                                
  I10_DX21                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 21"                                                
                                                                                
  I10_DX22                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 22"                                                
                                                                                
  I10_DX23                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 23"                                                
                                                                                
  I10_DX24                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 24"                                                
                                                                                
  I10_DX25                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 25"                                                
                                                                                
  I10_DX26                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 26"                                                
                                                                                
  I10_DX27                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 27"                                                
                                                                                
  I10_DX28                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 28"                                                
                                                                                
  I10_DX29                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 29"                                                
                                                                                
  I10_DX30                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 30"                                                
                                                                                
  I10_DX31                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 31"                                                
                                                                                
  I10_DX32                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 32"                                                
                                                                                
  I10_DX33                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 33"                                                
                                                                                
  I10_DX34                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 34"                                                
                                                                                
  I10_DX35                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 35"                                                
                                                                                
  I10_DX36                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 36"                                                
                                                                                
  I10_DX37                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 37"                                                
                                                                                
  I10_DX38                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 38"                                                
                                                                                
  I10_DX39                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 39"                                                
                                                                                
  I10_DX40                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 40"                                                
                                                                                
  I10_DX41                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 41"                                                
                                                                                
  I10_DX42                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 42"                                                
                                                                                
  I10_DX43                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 43"                                                
                                                                                
  I10_DX44                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 44"                                                
                                                                                
  I10_NDX                    LENGTH=3                                           
  LABEL="ICD-10-CM Number of diagnoses on this record"                          
                                                                                
  I10_PROCTYPE               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure type indicator"                                   
                                                                                
  KEY                        LENGTH=8                      FORMAT=Z15.          
  LABEL="HCUP record identifier"                                                
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MDNUM1_R                   LENGTH=5                                           
  LABEL="Physician 1 number (re-identified)"                                    
                                                                                
  MDNUM2_R                   LENGTH=5                                           
  LABEL="Physician 2 number (re-identified)"                                    
                                                                                
  MDNUM3_R                   LENGTH=5                                           
  LABEL="Physician 3 number (re-identified)"                                    
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures for this visit"                         
                                                                                
  OPservice                  LENGTH=$5                                          
  LABEL="Indicator of outpatient service (as received from source)"             
                                                                                
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
                                                                                
  PL_RUCC                    LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Continuum Codes(RUCC)"                   
                                                                                
  PL_UIC                     LENGTH=3                                           
  LABEL="Patient location: Urban Influence Codes"                               
                                                                                
  PL_UR_CAT4                 LENGTH=3                                           
  LABEL="Patient Location: Urban-Rural 4 Categories"                            
                                                                                
  PointOfOrigin_X            LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, as received from source"       
                                                                                
  PointOfOriginUB04          LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, UB-04 standard coding"         
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO                      LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X                     LENGTH=$4                                          
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
                                                                                
  ZIP                        LENGTH=$5                                          
  LABEL="Patient ZIP Code"                                                      
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  AYEAR                      LENGTH=3                                           
  LABEL="Admission year"                                                        
                                                                                
  BMONTH                     LENGTH=3                                           
  LABEL="Birth month"                                                           
                                                                                
  BYEAR                      LENGTH=3                                           
  LABEL="Birth year"                                                            
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                           N3PF.                               
      @4      AGEDAY                        N3PF.                               
      @7      AGEMONTH                      N3PF.                               
      @10     AMONTH                        N2PF.                               
      @12     ATYPE                         N2PF.                               
      @14     AWEEKEND                      N2PF.                               
      @16     CPT1                          $CHAR5.                             
      @21     CPT2                          $CHAR5.                             
      @26     CPT3                          $CHAR5.                             
      @31     CPT4                          $CHAR5.                             
      @36     CPT5                          $CHAR5.                             
      @41     CPT6                          $CHAR5.                             
      @46     CPT7                          $CHAR5.                             
      @51     CPT8                          $CHAR5.                             
      @56     CPT9                          $CHAR5.                             
      @61     CPT10                         $CHAR5.                             
      @66     CPT11                         $CHAR5.                             
      @71     CPT12                         $CHAR5.                             
      @76     CPT13                         $CHAR5.                             
      @81     CPT14                         $CHAR5.                             
      @86     CPT15                         $CHAR5.                             
      @91     CPT16                         $CHAR5.                             
      @96     CPT17                         $CHAR5.                             
      @101    CPT18                         $CHAR5.                             
      @106    CPT19                         $CHAR5.                             
      @111    CPT20                         $CHAR5.                             
      @116    CPT21                         $CHAR5.                             
      @121    CPT22                         $CHAR5.                             
      @126    CPT23                         $CHAR5.                             
      @131    CPT24                         $CHAR5.                             
      @136    CPT25                         $CHAR5.                             
      @141    CPT26                         $CHAR5.                             
      @146    CPT27                         $CHAR5.                             
      @151    CPT28                         $CHAR5.                             
      @156    CPT29                         $CHAR5.                             
      @161    CPT30                         $CHAR5.                             
      @166    CPT31                         $CHAR5.                             
      @171    CPT32                         $CHAR5.                             
      @176    CPT33                         $CHAR5.                             
      @181    CPT34                         $CHAR5.                             
      @186    CPT35                         $CHAR5.                             
      @191    CPT36                         $CHAR5.                             
      @196    CPT37                         $CHAR5.                             
      @201    CPT38                         $CHAR5.                             
      @206    CPT39                         $CHAR5.                             
      @211    CPT40                         $CHAR5.                             
      @216    CPT41                         $CHAR5.                             
      @221    CPT42                         $CHAR5.                             
      @226    CPT43                         $CHAR5.                             
      @231    CPT44                         $CHAR5.                             
      @236    CPT45                         $CHAR5.                             
      @241    CPT46                         $CHAR5.                             
      @246    CPT47                         $CHAR5.                             
      @251    CPT48                         $CHAR5.                             
      @256    CPT49                         $CHAR5.                             
      @261    CPT50                         $CHAR5.                             
      @266    CPT51                         $CHAR5.                             
      @271    CPT52                         $CHAR5.                             
      @276    CPT53                         $CHAR5.                             
      @281    CPT54                         $CHAR5.                             
      @286    CPT55                         $CHAR5.                             
      @291    CPT56                         $CHAR5.                             
      @296    CPT57                         $CHAR5.                             
      @301    CPT58                         $CHAR5.                             
      @306    CPT59                         $CHAR5.                             
      @311    CPT60                         $CHAR5.                             
      @316    CPT61                         $CHAR5.                             
      @321    CPT62                         $CHAR5.                             
      @326    CPT63                         $CHAR5.                             
      @331    CPT64                         $CHAR5.                             
      @336    CPT65                         $CHAR5.                             
      @341    CPT66                         $CHAR5.                             
      @346    CPT67                         $CHAR5.                             
      @351    CPT68                         $CHAR5.                             
      @356    CPT69                         $CHAR5.                             
      @361    CPT70                         $CHAR5.                             
      @366    CPT71                         $CHAR5.                             
      @371    CPT72                         $CHAR5.                             
      @376    CPT73                         $CHAR5.                             
      @381    CPT74                         $CHAR5.                             
      @386    CPT75                         $CHAR5.                             
      @391    CPT76                         $CHAR5.                             
      @396    CPTCCS1                       N3PF.                               
      @399    CPTCCS2                       N3PF.                               
      @402    CPTCCS3                       N3PF.                               
      @405    CPTCCS4                       N3PF.                               
      @408    CPTCCS5                       N3PF.                               
      @411    CPTCCS6                       N3PF.                               
      @414    CPTCCS7                       N3PF.                               
      @417    CPTCCS8                       N3PF.                               
      @420    CPTCCS9                       N3PF.                               
      @423    CPTCCS10                      N3PF.                               
      @426    CPTCCS11                      N3PF.                               
      @429    CPTCCS12                      N3PF.                               
      @432    CPTCCS13                      N3PF.                               
      @435    CPTCCS14                      N3PF.                               
      @438    CPTCCS15                      N3PF.                               
      @441    CPTCCS16                      N3PF.                               
      @444    CPTCCS17                      N3PF.                               
      @447    CPTCCS18                      N3PF.                               
      @450    CPTCCS19                      N3PF.                               
      @453    CPTCCS20                      N3PF.                               
      @456    CPTCCS21                      N3PF.                               
      @459    CPTCCS22                      N3PF.                               
      @462    CPTCCS23                      N3PF.                               
      @465    CPTCCS24                      N3PF.                               
      @468    CPTCCS25                      N3PF.                               
      @471    CPTCCS26                      N3PF.                               
      @474    CPTCCS27                      N3PF.                               
      @477    CPTCCS28                      N3PF.                               
      @480    CPTCCS29                      N3PF.                               
      @483    CPTCCS30                      N3PF.                               
      @486    CPTCCS31                      N3PF.                               
      @489    CPTCCS32                      N3PF.                               
      @492    CPTCCS33                      N3PF.                               
      @495    CPTCCS34                      N3PF.                               
      @498    CPTCCS35                      N3PF.                               
      @501    CPTCCS36                      N3PF.                               
      @504    CPTCCS37                      N3PF.                               
      @507    CPTCCS38                      N3PF.                               
      @510    CPTCCS39                      N3PF.                               
      @513    CPTCCS40                      N3PF.                               
      @516    CPTCCS41                      N3PF.                               
      @519    CPTCCS42                      N3PF.                               
      @522    CPTCCS43                      N3PF.                               
      @525    CPTCCS44                      N3PF.                               
      @528    CPTCCS45                      N3PF.                               
      @531    CPTCCS46                      N3PF.                               
      @534    CPTCCS47                      N3PF.                               
      @537    CPTCCS48                      N3PF.                               
      @540    CPTCCS49                      N3PF.                               
      @543    CPTCCS50                      N3PF.                               
      @546    CPTCCS51                      N3PF.                               
      @549    CPTCCS52                      N3PF.                               
      @552    CPTCCS53                      N3PF.                               
      @555    CPTCCS54                      N3PF.                               
      @558    CPTCCS55                      N3PF.                               
      @561    CPTCCS56                      N3PF.                               
      @564    CPTCCS57                      N3PF.                               
      @567    CPTCCS58                      N3PF.                               
      @570    CPTCCS59                      N3PF.                               
      @573    CPTCCS60                      N3PF.                               
      @576    CPTCCS61                      N3PF.                               
      @579    CPTCCS62                      N3PF.                               
      @582    CPTCCS63                      N3PF.                               
      @585    CPTCCS64                      N3PF.                               
      @588    CPTCCS65                      N3PF.                               
      @591    CPTCCS66                      N3PF.                               
      @594    CPTCCS67                      N3PF.                               
      @597    CPTCCS68                      N3PF.                               
      @600    CPTCCS69                      N3PF.                               
      @603    CPTCCS70                      N3PF.                               
      @606    CPTCCS71                      N3PF.                               
      @609    CPTCCS72                      N3PF.                               
      @612    CPTCCS73                      N3PF.                               
      @615    CPTCCS74                      N3PF.                               
      @618    CPTCCS75                      N3PF.                               
      @621    CPTCCS76                      N3PF.                               
      @624    CPTDAY1                       N3PF.                               
      @627    CPTDAY2                       N3PF.                               
      @630    CPTDAY3                       N3PF.                               
      @633    CPTDAY4                       N3PF.                               
      @636    CPTDAY5                       N3PF.                               
      @639    CPTDAY6                       N3PF.                               
      @642    CPTDAY7                       N3PF.                               
      @645    CPTDAY8                       N3PF.                               
      @648    CPTDAY9                       N3PF.                               
      @651    CPTDAY10                      N3PF.                               
      @654    CPTDAY11                      N3PF.                               
      @657    CPTDAY12                      N3PF.                               
      @660    CPTDAY13                      N3PF.                               
      @663    CPTDAY14                      N3PF.                               
      @666    CPTDAY15                      N3PF.                               
      @669    CPTDAY16                      N3PF.                               
      @672    CPTDAY17                      N3PF.                               
      @675    CPTDAY18                      N3PF.                               
      @678    CPTDAY19                      N3PF.                               
      @681    CPTDAY20                      N3PF.                               
      @684    CPTDAY21                      N3PF.                               
      @687    CPTDAY22                      N3PF.                               
      @690    CPTDAY23                      N3PF.                               
      @693    CPTDAY24                      N3PF.                               
      @696    CPTDAY25                      N3PF.                               
      @699    CPTDAY26                      N3PF.                               
      @702    CPTDAY27                      N3PF.                               
      @705    CPTDAY28                      N3PF.                               
      @708    CPTDAY29                      N3PF.                               
      @711    CPTDAY30                      N3PF.                               
      @714    CPTDAY31                      N3PF.                               
      @717    CPTDAY32                      N3PF.                               
      @720    CPTDAY33                      N3PF.                               
      @723    CPTDAY34                      N3PF.                               
      @726    CPTDAY35                      N3PF.                               
      @729    CPTDAY36                      N3PF.                               
      @732    CPTDAY37                      N3PF.                               
      @735    CPTDAY38                      N3PF.                               
      @738    CPTDAY39                      N3PF.                               
      @741    CPTDAY40                      N3PF.                               
      @744    CPTDAY41                      N3PF.                               
      @747    CPTDAY42                      N3PF.                               
      @750    CPTDAY43                      N3PF.                               
      @753    CPTDAY44                      N3PF.                               
      @756    CPTDAY45                      N3PF.                               
      @759    CPTDAY46                      N3PF.                               
      @762    CPTDAY47                      N3PF.                               
      @765    CPTDAY48                      N3PF.                               
      @768    CPTDAY49                      N3PF.                               
      @771    CPTDAY50                      N3PF.                               
      @774    CPTDAY51                      N3PF.                               
      @777    CPTDAY52                      N3PF.                               
      @780    CPTDAY53                      N3PF.                               
      @783    CPTDAY54                      N3PF.                               
      @786    CPTDAY55                      N3PF.                               
      @789    CPTDAY56                      N3PF.                               
      @792    CPTDAY57                      N3PF.                               
      @795    CPTDAY58                      N3PF.                               
      @798    CPTDAY59                      N3PF.                               
      @801    CPTDAY60                      N3PF.                               
      @804    CPTDAY61                      N3PF.                               
      @807    CPTDAY62                      N3PF.                               
      @810    CPTDAY63                      N3PF.                               
      @813    CPTDAY64                      N3PF.                               
      @816    CPTDAY65                      N3PF.                               
      @819    CPTDAY66                      N3PF.                               
      @822    CPTDAY67                      N3PF.                               
      @825    CPTDAY68                      N3PF.                               
      @828    CPTDAY69                      N3PF.                               
      @831    CPTDAY70                      N3PF.                               
      @834    CPTDAY71                      N3PF.                               
      @837    CPTDAY72                      N3PF.                               
      @840    CPTDAY73                      N3PF.                               
      @843    CPTDAY74                      N3PF.                               
      @846    CPTDAY75                      N3PF.                               
      @849    CPTDAY76                      N3PF.                               
      @852    CPTM1_1                       $CHAR2.                             
      @854    CPTM1_2                       $CHAR2.                             
      @856    CPTM1_3                       $CHAR2.                             
      @858    CPTM1_4                       $CHAR2.                             
      @860    CPTM1_5                       $CHAR2.                             
      @862    CPTM1_6                       $CHAR2.                             
      @864    CPTM1_7                       $CHAR2.                             
      @866    CPTM1_8                       $CHAR2.                             
      @868    CPTM1_9                       $CHAR2.                             
      @870    CPTM1_10                      $CHAR2.                             
      @872    CPTM1_11                      $CHAR2.                             
      @874    CPTM1_12                      $CHAR2.                             
      @876    CPTM1_13                      $CHAR2.                             
      @878    CPTM1_14                      $CHAR2.                             
      @880    CPTM1_15                      $CHAR2.                             
      @882    CPTM1_16                      $CHAR2.                             
      @884    CPTM1_17                      $CHAR2.                             
      @886    CPTM1_18                      $CHAR2.                             
      @888    CPTM1_19                      $CHAR2.                             
      @890    CPTM1_20                      $CHAR2.                             
      @892    CPTM1_21                      $CHAR2.                             
      @894    CPTM1_22                      $CHAR2.                             
      @896    CPTM1_23                      $CHAR2.                             
      @898    CPTM1_24                      $CHAR2.                             
      @900    CPTM1_25                      $CHAR2.                             
      @902    CPTM1_26                      $CHAR2.                             
      @904    CPTM1_27                      $CHAR2.                             
      @906    CPTM1_28                      $CHAR2.                             
      @908    CPTM1_29                      $CHAR2.                             
      @910    CPTM1_30                      $CHAR2.                             
      @912    CPTM1_31                      $CHAR2.                             
      @914    CPTM1_32                      $CHAR2.                             
      @916    CPTM1_33                      $CHAR2.                             
      @918    CPTM1_34                      $CHAR2.                             
      @920    CPTM1_35                      $CHAR2.                             
      @922    CPTM1_36                      $CHAR2.                             
      @924    CPTM1_37                      $CHAR2.                             
      @926    CPTM1_38                      $CHAR2.                             
      @928    CPTM1_39                      $CHAR2.                             
      @930    CPTM1_40                      $CHAR2.                             
      @932    CPTM1_41                      $CHAR2.                             
      @934    CPTM1_42                      $CHAR2.                             
      @936    CPTM1_43                      $CHAR2.                             
      @938    CPTM1_44                      $CHAR2.                             
      @940    CPTM1_45                      $CHAR2.                             
      @942    CPTM1_46                      $CHAR2.                             
      @944    CPTM1_47                      $CHAR2.                             
      @946    CPTM1_48                      $CHAR2.                             
      @948    CPTM1_49                      $CHAR2.                             
      @950    CPTM1_50                      $CHAR2.                             
      @952    CPTM1_51                      $CHAR2.                             
      @954    CPTM1_52                      $CHAR2.                             
      @956    CPTM1_53                      $CHAR2.                             
      @958    CPTM1_54                      $CHAR2.                             
      @960    CPTM1_55                      $CHAR2.                             
      @962    CPTM1_56                      $CHAR2.                             
      @964    CPTM1_57                      $CHAR2.                             
      @966    CPTM1_58                      $CHAR2.                             
      @968    CPTM1_59                      $CHAR2.                             
      @970    CPTM1_60                      $CHAR2.                             
      @972    CPTM1_61                      $CHAR2.                             
      @974    CPTM1_62                      $CHAR2.                             
      @976    CPTM1_63                      $CHAR2.                             
      @978    CPTM1_64                      $CHAR2.                             
      @980    CPTM1_65                      $CHAR2.                             
      @982    CPTM1_66                      $CHAR2.                             
      @984    CPTM1_67                      $CHAR2.                             
      @986    CPTM1_68                      $CHAR2.                             
      @988    CPTM1_69                      $CHAR2.                             
      @990    CPTM1_70                      $CHAR2.                             
      @992    CPTM1_71                      $CHAR2.                             
      @994    CPTM1_72                      $CHAR2.                             
      @996    CPTM1_73                      $CHAR2.                             
      @998    CPTM1_74                      $CHAR2.                             
      @1000   CPTM1_75                      $CHAR2.                             
      @1002   CPTM1_76                      $CHAR2.                             
      @1004   CPTM2_1                       $CHAR2.                             
      @1006   CPTM2_2                       $CHAR2.                             
      @1008   CPTM2_3                       $CHAR2.                             
      @1010   CPTM2_4                       $CHAR2.                             
      @1012   CPTM2_5                       $CHAR2.                             
      @1014   CPTM2_6                       $CHAR2.                             
      @1016   CPTM2_7                       $CHAR2.                             
      @1018   CPTM2_8                       $CHAR2.                             
      @1020   CPTM2_9                       $CHAR2.                             
      @1022   CPTM2_10                      $CHAR2.                             
      @1024   CPTM2_11                      $CHAR2.                             
      @1026   CPTM2_12                      $CHAR2.                             
      @1028   CPTM2_13                      $CHAR2.                             
      @1030   CPTM2_14                      $CHAR2.                             
      @1032   CPTM2_15                      $CHAR2.                             
      @1034   CPTM2_16                      $CHAR2.                             
      @1036   CPTM2_17                      $CHAR2.                             
      @1038   CPTM2_18                      $CHAR2.                             
      @1040   CPTM2_19                      $CHAR2.                             
      @1042   CPTM2_20                      $CHAR2.                             
      @1044   CPTM2_21                      $CHAR2.                             
      @1046   CPTM2_22                      $CHAR2.                             
      @1048   CPTM2_23                      $CHAR2.                             
      @1050   CPTM2_24                      $CHAR2.                             
      @1052   CPTM2_25                      $CHAR2.                             
      @1054   CPTM2_26                      $CHAR2.                             
      @1056   CPTM2_27                      $CHAR2.                             
      @1058   CPTM2_28                      $CHAR2.                             
      @1060   CPTM2_29                      $CHAR2.                             
      @1062   CPTM2_30                      $CHAR2.                             
      @1064   CPTM2_31                      $CHAR2.                             
      @1066   CPTM2_32                      $CHAR2.                             
      @1068   CPTM2_33                      $CHAR2.                             
      @1070   CPTM2_34                      $CHAR2.                             
      @1072   CPTM2_35                      $CHAR2.                             
      @1074   CPTM2_36                      $CHAR2.                             
      @1076   CPTM2_37                      $CHAR2.                             
      @1078   CPTM2_38                      $CHAR2.                             
      @1080   CPTM2_39                      $CHAR2.                             
      @1082   CPTM2_40                      $CHAR2.                             
      @1084   CPTM2_41                      $CHAR2.                             
      @1086   CPTM2_42                      $CHAR2.                             
      @1088   CPTM2_43                      $CHAR2.                             
      @1090   CPTM2_44                      $CHAR2.                             
      @1092   CPTM2_45                      $CHAR2.                             
      @1094   CPTM2_46                      $CHAR2.                             
      @1096   CPTM2_47                      $CHAR2.                             
      @1098   CPTM2_48                      $CHAR2.                             
      @1100   CPTM2_49                      $CHAR2.                             
      @1102   CPTM2_50                      $CHAR2.                             
      @1104   CPTM2_51                      $CHAR2.                             
      @1106   CPTM2_52                      $CHAR2.                             
      @1108   CPTM2_53                      $CHAR2.                             
      @1110   CPTM2_54                      $CHAR2.                             
      @1112   CPTM2_55                      $CHAR2.                             
      @1114   CPTM2_56                      $CHAR2.                             
      @1116   CPTM2_57                      $CHAR2.                             
      @1118   CPTM2_58                      $CHAR2.                             
      @1120   CPTM2_59                      $CHAR2.                             
      @1122   CPTM2_60                      $CHAR2.                             
      @1124   CPTM2_61                      $CHAR2.                             
      @1126   CPTM2_62                      $CHAR2.                             
      @1128   CPTM2_63                      $CHAR2.                             
      @1130   CPTM2_64                      $CHAR2.                             
      @1132   CPTM2_65                      $CHAR2.                             
      @1134   CPTM2_66                      $CHAR2.                             
      @1136   CPTM2_67                      $CHAR2.                             
      @1138   CPTM2_68                      $CHAR2.                             
      @1140   CPTM2_69                      $CHAR2.                             
      @1142   CPTM2_70                      $CHAR2.                             
      @1144   CPTM2_71                      $CHAR2.                             
      @1146   CPTM2_72                      $CHAR2.                             
      @1148   CPTM2_73                      $CHAR2.                             
      @1150   CPTM2_74                      $CHAR2.                             
      @1152   CPTM2_75                      $CHAR2.                             
      @1154   CPTM2_76                      $CHAR2.                             
      @1156   DaysToEvent                   N6PF.                               
      @1162   DIED                          N2PF.                               
      @1164   DISP_X                        $CHAR2.                             
      @1166   DISPUB04                      N2PF.                               
      @1168   DISPUNIFORM                   N2PF.                               
      @1170   DMONTH                        N2PF.                               
      @1172   DQTR                          N2PF.                               
      @1174   DXVER                         N3PF.                               
      @1177   FEMALE                        N2PF.                               
      @1179   HCUP_ED                       N2PF.                               
      @1181   HCUP_OS                       N2PF.                               
      @1183   HISPANIC                      N2PF.                               
      @1185   HISPANIC_X                    $CHAR1.                             
      @1186   HOSPST                        $CHAR2.                             
      @1188   I10_DX_Visit_Reason1          $CHAR7.                             
      @1195   I10_DX_Visit_Reason2          $CHAR7.                             
      @1202   I10_DX_Visit_Reason3          $CHAR7.                             
      @1209   I10_DX1                       $CHAR7.                             
      @1216   I10_DX2                       $CHAR7.                             
      @1223   I10_DX3                       $CHAR7.                             
      @1230   I10_DX4                       $CHAR7.                             
      @1237   I10_DX5                       $CHAR7.                             
      @1244   I10_DX6                       $CHAR7.                             
      @1251   I10_DX7                       $CHAR7.                             
      @1258   I10_DX8                       $CHAR7.                             
      @1265   I10_DX9                       $CHAR7.                             
      @1272   I10_DX10                      $CHAR7.                             
      @1279   I10_DX11                      $CHAR7.                             
      @1286   I10_DX12                      $CHAR7.                             
      @1293   I10_DX13                      $CHAR7.                             
      @1300   I10_DX14                      $CHAR7.                             
      @1307   I10_DX15                      $CHAR7.                             
      @1314   I10_DX16                      $CHAR7.                             
      @1321   I10_DX17                      $CHAR7.                             
      @1328   I10_DX18                      $CHAR7.                             
      @1335   I10_DX19                      $CHAR7.                             
      @1342   I10_DX20                      $CHAR7.                             
      @1349   I10_DX21                      $CHAR7.                             
      @1356   I10_DX22                      $CHAR7.                             
      @1363   I10_DX23                      $CHAR7.                             
      @1370   I10_DX24                      $CHAR7.                             
      @1377   I10_DX25                      $CHAR7.                             
      @1384   I10_DX26                      $CHAR7.                             
      @1391   I10_DX27                      $CHAR7.                             
      @1398   I10_DX28                      $CHAR7.                             
      @1405   I10_DX29                      $CHAR7.                             
      @1412   I10_DX30                      $CHAR7.                             
      @1419   I10_DX31                      $CHAR7.                             
      @1426   I10_DX32                      $CHAR7.                             
      @1433   I10_DX33                      $CHAR7.                             
      @1440   I10_DX34                      $CHAR7.                             
      @1447   I10_DX35                      $CHAR7.                             
      @1454   I10_DX36                      $CHAR7.                             
      @1461   I10_DX37                      $CHAR7.                             
      @1468   I10_DX38                      $CHAR7.                             
      @1475   I10_DX39                      $CHAR7.                             
      @1482   I10_DX40                      $CHAR7.                             
      @1489   I10_DX41                      $CHAR7.                             
      @1496   I10_DX42                      $CHAR7.                             
      @1503   I10_DX43                      $CHAR7.                             
      @1510   I10_DX44                      $CHAR7.                             
      @1517   I10_NDX                       N3PF.                               
      @1520   I10_PROCTYPE                  N3PF.                               
      @1523   KEY                           15.                                 
      @1538   LOS                           N5PF.                               
      @1543   LOS_X                         N6PF.                               
      @1549   MDNUM1_R                      N9PF.                               
      @1558   MDNUM2_R                      N9PF.                               
      @1567   MDNUM3_R                      N9PF.                               
      @1576   MEDINCSTQ                     N2PF.                               
      @1578   MRN_R                         N9PF.                               
      @1587   NCPT                          N4PF.                               
      @1591   OPservice                     $CHAR5.                             
      @1596   OS_TIME                       N11P2F.                             
      @1607   PAY1                          N2PF.                               
      @1609   PAY1_X                        $CHAR4.                             
      @1613   PAY2                          N2PF.                               
      @1615   PAY2_X                        $CHAR4.                             
      @1619   PAY3                          N2PF.                               
      @1621   PAY3_X                        $CHAR4.                             
      @1625   PL_CBSA                       N3PF.                               
      @1628   PL_NCHS                       N2PF.                               
      @1630   PL_RUCC                       N2PF.                               
      @1632   PL_UIC                        N2PF.                               
      @1634   PL_UR_CAT4                    N2PF.                               
      @1636   PointOfOrigin_X               $CHAR1.                             
      @1637   PointOfOriginUB04             $CHAR1.                             
      @1638   PSTATE                        $CHAR2.                             
      @1640   PSTCO                         N5PF.                               
      @1645   PSTCO2                        N5PF.                               
      @1650   RACE                          N2PF.                               
      @1652   RACE_X                        $CHAR4.                             
      @1656   STATE_AS                      N2PF.                               
      @1658   STATE_ED                      N2PF.                               
      @1660   STATE_OS                      N2PF.                               
      @1662   TOTCHG                        N10PF.                              
      @1672   TOTCHG_X                      N15P2F.                             
      @1687   VisitLink                     N9PF.                               
      @1696   YEAR                          N4PF.                               
      @1700   ZIP                           $CHAR5.                             
      @1705   ZIP3                          $CHAR3.                             
      @1708   ZIPINC_QRTL                   N3PF.                               
      @1711   AYEAR                         N4PF.                               
      @1715   BMONTH                        N2PF.                               
      @1717   BYEAR                         N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
