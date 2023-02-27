/*******************************************************************            
* Creation Date: 06/04/2020                                                     
*   AR_SEDD_2015q4_CORE.SAS:                                                    
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
DATA AR_SEDDC_2015q4_CORE;                                                      
INFILE 'AR_SEDD_2015q4_CORE.ASC' FIRSTOBS=3 LRECL = 1464;                       
                                                                                
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
                                                                                
  DaysToEvent                LENGTH=8                                           
  LABEL="Days from 'start date' to admission"                                   
                                                                                
  DHOUR                      LENGTH=3                      FORMAT=Z4.           
  LABEL="Discharge Hour"                                                        
                                                                                
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
                                                                                
  DSHOSPID                   LENGTH=$17                                         
  LABEL="Data source hospital identifier"                                       
                                                                                
  DURATION                   LENGTH=4                                           
  LABEL="Elapsed time for hospital care in hours and minutes"                   
                                                                                
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
                                                                                
  I10_DXCCS1                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 1"                                            
                                                                                
  I10_DXCCS2                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 2"                                            
                                                                                
  I10_DXCCS3                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 3"                                            
                                                                                
  I10_DXCCS4                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 4"                                            
                                                                                
  I10_DXCCS5                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 5"                                            
                                                                                
  I10_DXCCS6                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 6"                                            
                                                                                
  I10_DXCCS7                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 7"                                            
                                                                                
  I10_DXCCS8                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 8"                                            
                                                                                
  I10_DXCCS9                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 9"                                            
                                                                                
  I10_DXCCS10                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 10"                                           
                                                                                
  I10_DXCCS11                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 11"                                           
                                                                                
  I10_DXCCS12                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 12"                                           
                                                                                
  I10_DXCCS13                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 13"                                           
                                                                                
  I10_DXCCS14                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 14"                                           
                                                                                
  I10_DXCCS15                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 15"                                           
                                                                                
  I10_DXCCS16                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 16"                                           
                                                                                
  I10_DXCCS17                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 17"                                           
                                                                                
  I10_DXCCS18                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 18"                                           
                                                                                
  I10_DXCCS19                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 19"                                           
                                                                                
  I10_DXCCS20                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 20"                                           
                                                                                
  I10_DXCCS21                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 21"                                           
                                                                                
  I10_DXCCS22                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 22"                                           
                                                                                
  I10_DXCCS23                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 23"                                           
                                                                                
  I10_DXCCS24                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 24"                                           
                                                                                
  I10_DXCCS25                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 25"                                           
                                                                                
  I10_DXCCS26                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 26"                                           
                                                                                
  I10_DXCCS27                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 27"                                           
                                                                                
  I10_ECAUSE1                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 1"                                                   
                                                                                
  I10_ECAUSE2                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 2"                                                   
                                                                                
  I10_ECAUSE3                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 3"                                                   
                                                                                
  I10_ECAUSE4                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 4"                                                   
                                                                                
  I10_ECAUSE5                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 5"                                                   
                                                                                
  I10_ECAUSE6                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 6"                                                   
                                                                                
  I10_ECAUSE7                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 7"                                                   
                                                                                
  I10_ECAUSE8                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 8"                                                   
                                                                                
  I10_ECAUSE9                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 9"                                                   
                                                                                
  I10_ECAUSE10               LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 10"                                                  
                                                                                
  I10_ECauseCCS1             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 1"                                              
                                                                                
  I10_ECauseCCS2             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 2"                                              
                                                                                
  I10_ECauseCCS3             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 3"                                              
                                                                                
  I10_ECauseCCS4             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 4"                                              
                                                                                
  I10_ECauseCCS5             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 5"                                              
                                                                                
  I10_ECauseCCS6             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 6"                                              
                                                                                
  I10_ECauseCCS7             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 7"                                              
                                                                                
  I10_ECauseCCS8             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 8"                                              
                                                                                
  I10_ECauseCCS9             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 9"                                              
                                                                                
  I10_ECauseCCS10            LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 10"                                             
                                                                                
  I10_HOSPBRTH               LENGTH=3                                           
  LABEL="ICD-10-CM Indicator of birth in this hospital"                         
                                                                                
  I10_NCHRONIC               LENGTH=3                                           
  LABEL="ICD-10-CM Number of chronic conditions"                                
                                                                                
  I10_NDX                    LENGTH=3                                           
  LABEL="ICD-10-CM Number of diagnoses on this record"                          
                                                                                
  I10_NECAUSE                LENGTH=3                                           
  LABEL="ICD-10-CM Number of E Causes on this record"                           
                                                                                
  I10_NEOMAT                 LENGTH=3                                           
  LABEL="ICD-10-CM/PCS Neonatal and/or maternal I10_DX and/or I10_PR"           
                                                                                
  I10_NPR                    LENGTH=3                                           
  LABEL="ICD-10-PCS Number of procedures on this record"                        
                                                                                
  I10_ORPROC                 LENGTH=3                                           
  LABEL="ICD-10-PCS Major operating room procedure indicator"                   
                                                                                
  I10_PR1                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 1"                                                
                                                                                
  I10_PR2                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 2"                                                
                                                                                
  I10_PR3                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 3"                                                
                                                                                
  I10_PR4                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 4"                                                
                                                                                
  I10_PR5                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 5"                                                
                                                                                
  I10_PR6                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 6"                                                
                                                                                
  I10_PR7                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 7"                                                
                                                                                
  I10_PR8                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 8"                                                
                                                                                
  I10_PRCCS1                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 1"                                           
                                                                                
  I10_PRCCS2                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 2"                                           
                                                                                
  I10_PRCCS3                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 3"                                           
                                                                                
  I10_PRCCS4                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 4"                                           
                                                                                
  I10_PRCCS5                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 5"                                           
                                                                                
  I10_PRCCS6                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 6"                                           
                                                                                
  I10_PRCCS7                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 7"                                           
                                                                                
  I10_PRCCS8                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 8"                                           
                                                                                
  I10_PROCTYPE               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure type indicator"                                   
                                                                                
  KEY                        LENGTH=8                      FORMAT=Z15.          
  LABEL="HCUP record identifier"                                                
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MARITALSTATUS_X            LENGTH=$1                                          
  LABEL="Patient's marital status (as received from source)"                    
                                                                                
  MARITALSTATUSUB04          LENGTH=$1                                          
  LABEL="Patient's marital status, UB-04 standard coding"                       
                                                                                
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
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures for this visit"                         
                                                                                
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
                                                                                
  PRDAY1                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR1"                              
                                                                                
  PRDAY2                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR2"                              
                                                                                
  PRDAY3                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR3"                              
                                                                                
  PRDAY4                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR4"                              
                                                                                
  PRDAY5                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR5"                              
                                                                                
  PRDAY6                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR6"                              
                                                                                
  PRDAY7                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR7"                              
                                                                                
  PRDAY8                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR8"                              
                                                                                
  PRVER                      LENGTH=3                                           
  LABEL="Procedure Version"                                                     
                                                                                
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
      @16     ATYPE                         N2PF.                               
      @18     AWEEKEND                      N2PF.                               
      @20     BILLTYPE                      $CHAR4.                             
      @24     CPT1                          $CHAR5.                             
      @29     CPT2                          $CHAR5.                             
      @34     CPT3                          $CHAR5.                             
      @39     CPT4                          $CHAR5.                             
      @44     CPT5                          $CHAR5.                             
      @49     CPT6                          $CHAR5.                             
      @54     CPT7                          $CHAR5.                             
      @59     CPT8                          $CHAR5.                             
      @64     CPT9                          $CHAR5.                             
      @69     CPT10                         $CHAR5.                             
      @74     CPT11                         $CHAR5.                             
      @79     CPT12                         $CHAR5.                             
      @84     CPT13                         $CHAR5.                             
      @89     CPT14                         $CHAR5.                             
      @94     CPT15                         $CHAR5.                             
      @99     CPT16                         $CHAR5.                             
      @104    CPT17                         $CHAR5.                             
      @109    CPT18                         $CHAR5.                             
      @114    CPT19                         $CHAR5.                             
      @119    CPT20                         $CHAR5.                             
      @124    CPT21                         $CHAR5.                             
      @129    CPT22                         $CHAR5.                             
      @134    CPT23                         $CHAR5.                             
      @139    CPT24                         $CHAR5.                             
      @144    CPT25                         $CHAR5.                             
      @149    CPT26                         $CHAR5.                             
      @154    CPT27                         $CHAR5.                             
      @159    CPT28                         $CHAR5.                             
      @164    CPT29                         $CHAR5.                             
      @169    CPT30                         $CHAR5.                             
      @174    CPT31                         $CHAR5.                             
      @179    CPT32                         $CHAR5.                             
      @184    CPT33                         $CHAR5.                             
      @189    CPT34                         $CHAR5.                             
      @194    CPT35                         $CHAR5.                             
      @199    CPT36                         $CHAR5.                             
      @204    CPT37                         $CHAR5.                             
      @209    CPT38                         $CHAR5.                             
      @214    CPT39                         $CHAR5.                             
      @219    CPT40                         $CHAR5.                             
      @224    CPT41                         $CHAR5.                             
      @229    CPT42                         $CHAR5.                             
      @234    CPT43                         $CHAR5.                             
      @239    CPT44                         $CHAR5.                             
      @244    CPT45                         $CHAR5.                             
      @249    CPT46                         $CHAR5.                             
      @254    CPT47                         $CHAR5.                             
      @259    CPT48                         $CHAR5.                             
      @264    CPT49                         $CHAR5.                             
      @269    CPT50                         $CHAR5.                             
      @274    CPT51                         $CHAR5.                             
      @279    CPT52                         $CHAR5.                             
      @284    CPT53                         $CHAR5.                             
      @289    CPT54                         $CHAR5.                             
      @294    CPT55                         $CHAR5.                             
      @299    CPT56                         $CHAR5.                             
      @304    CPT57                         $CHAR5.                             
      @309    CPT58                         $CHAR5.                             
      @314    CPT59                         $CHAR5.                             
      @319    CPT60                         $CHAR5.                             
      @324    CPT61                         $CHAR5.                             
      @329    CPT62                         $CHAR5.                             
      @334    CPT63                         $CHAR5.                             
      @339    CPT64                         $CHAR5.                             
      @344    CPT65                         $CHAR5.                             
      @349    CPT66                         $CHAR5.                             
      @354    CPT67                         $CHAR5.                             
      @359    CPT68                         $CHAR5.                             
      @364    CPT69                         $CHAR5.                             
      @369    CPT70                         $CHAR5.                             
      @374    CPT71                         $CHAR5.                             
      @379    CPT72                         $CHAR5.                             
      @384    CPT73                         $CHAR5.                             
      @389    CPT74                         $CHAR5.                             
      @394    CPT75                         $CHAR5.                             
      @399    CPTCCS1                       N3PF.                               
      @402    CPTCCS2                       N3PF.                               
      @405    CPTCCS3                       N3PF.                               
      @408    CPTCCS4                       N3PF.                               
      @411    CPTCCS5                       N3PF.                               
      @414    CPTCCS6                       N3PF.                               
      @417    CPTCCS7                       N3PF.                               
      @420    CPTCCS8                       N3PF.                               
      @423    CPTCCS9                       N3PF.                               
      @426    CPTCCS10                      N3PF.                               
      @429    CPTCCS11                      N3PF.                               
      @432    CPTCCS12                      N3PF.                               
      @435    CPTCCS13                      N3PF.                               
      @438    CPTCCS14                      N3PF.                               
      @441    CPTCCS15                      N3PF.                               
      @444    CPTCCS16                      N3PF.                               
      @447    CPTCCS17                      N3PF.                               
      @450    CPTCCS18                      N3PF.                               
      @453    CPTCCS19                      N3PF.                               
      @456    CPTCCS20                      N3PF.                               
      @459    CPTCCS21                      N3PF.                               
      @462    CPTCCS22                      N3PF.                               
      @465    CPTCCS23                      N3PF.                               
      @468    CPTCCS24                      N3PF.                               
      @471    CPTCCS25                      N3PF.                               
      @474    CPTCCS26                      N3PF.                               
      @477    CPTCCS27                      N3PF.                               
      @480    CPTCCS28                      N3PF.                               
      @483    CPTCCS29                      N3PF.                               
      @486    CPTCCS30                      N3PF.                               
      @489    CPTCCS31                      N3PF.                               
      @492    CPTCCS32                      N3PF.                               
      @495    CPTCCS33                      N3PF.                               
      @498    CPTCCS34                      N3PF.                               
      @501    CPTCCS35                      N3PF.                               
      @504    CPTCCS36                      N3PF.                               
      @507    CPTCCS37                      N3PF.                               
      @510    CPTCCS38                      N3PF.                               
      @513    CPTCCS39                      N3PF.                               
      @516    CPTCCS40                      N3PF.                               
      @519    CPTCCS41                      N3PF.                               
      @522    CPTCCS42                      N3PF.                               
      @525    CPTCCS43                      N3PF.                               
      @528    CPTCCS44                      N3PF.                               
      @531    CPTCCS45                      N3PF.                               
      @534    CPTCCS46                      N3PF.                               
      @537    CPTCCS47                      N3PF.                               
      @540    CPTCCS48                      N3PF.                               
      @543    CPTCCS49                      N3PF.                               
      @546    CPTCCS50                      N3PF.                               
      @549    CPTCCS51                      N3PF.                               
      @552    CPTCCS52                      N3PF.                               
      @555    CPTCCS53                      N3PF.                               
      @558    CPTCCS54                      N3PF.                               
      @561    CPTCCS55                      N3PF.                               
      @564    CPTCCS56                      N3PF.                               
      @567    CPTCCS57                      N3PF.                               
      @570    CPTCCS58                      N3PF.                               
      @573    CPTCCS59                      N3PF.                               
      @576    CPTCCS60                      N3PF.                               
      @579    CPTCCS61                      N3PF.                               
      @582    CPTCCS62                      N3PF.                               
      @585    CPTCCS63                      N3PF.                               
      @588    CPTCCS64                      N3PF.                               
      @591    CPTCCS65                      N3PF.                               
      @594    CPTCCS66                      N3PF.                               
      @597    CPTCCS67                      N3PF.                               
      @600    CPTCCS68                      N3PF.                               
      @603    CPTCCS69                      N3PF.                               
      @606    CPTCCS70                      N3PF.                               
      @609    CPTCCS71                      N3PF.                               
      @612    CPTCCS72                      N3PF.                               
      @615    CPTCCS73                      N3PF.                               
      @618    CPTCCS74                      N3PF.                               
      @621    CPTCCS75                      N3PF.                               
      @624    DaysToEvent                   N6PF.                               
      @630    DHOUR                         N4PF.                               
      @634    DIED                          N2PF.                               
      @636    DISP_X                        $CHAR2.                             
      @638    DISPUB04                      N2PF.                               
      @640    DISPUNIFORM                   N2PF.                               
      @642    DMONTH                        N2PF.                               
      @644    DQTR                          N2PF.                               
      @646    DSHOSPID                      $CHAR17.                            
      @663    DURATION                      N6PF.                               
      @669    DXVER                         N3PF.                               
      @672    FEMALE                        N2PF.                               
      @674    HCUP_ED                       N2PF.                               
      @676    HCUP_OS                       N2PF.                               
      @678    HISPANIC                      N2PF.                               
      @680    HISPANIC_X                    $CHAR1.                             
      @681    HOSPST                        $CHAR2.                             
      @683    I10_DX_Visit_Reason1          $CHAR7.                             
      @690    I10_DX1                       $CHAR7.                             
      @697    I10_DX2                       $CHAR7.                             
      @704    I10_DX3                       $CHAR7.                             
      @711    I10_DX4                       $CHAR7.                             
      @718    I10_DX5                       $CHAR7.                             
      @725    I10_DX6                       $CHAR7.                             
      @732    I10_DX7                       $CHAR7.                             
      @739    I10_DX8                       $CHAR7.                             
      @746    I10_DX9                       $CHAR7.                             
      @753    I10_DX10                      $CHAR7.                             
      @760    I10_DX11                      $CHAR7.                             
      @767    I10_DX12                      $CHAR7.                             
      @774    I10_DX13                      $CHAR7.                             
      @781    I10_DX14                      $CHAR7.                             
      @788    I10_DX15                      $CHAR7.                             
      @795    I10_DX16                      $CHAR7.                             
      @802    I10_DX17                      $CHAR7.                             
      @809    I10_DX18                      $CHAR7.                             
      @816    I10_DX19                      $CHAR7.                             
      @823    I10_DX20                      $CHAR7.                             
      @830    I10_DX21                      $CHAR7.                             
      @837    I10_DX22                      $CHAR7.                             
      @844    I10_DX23                      $CHAR7.                             
      @851    I10_DX24                      $CHAR7.                             
      @858    I10_DX25                      $CHAR7.                             
      @865    I10_DX26                      $CHAR7.                             
      @872    I10_DX27                      $CHAR7.                             
      @879    I10_DXCCS1                    N4PF.                               
      @883    I10_DXCCS2                    N4PF.                               
      @887    I10_DXCCS3                    N4PF.                               
      @891    I10_DXCCS4                    N4PF.                               
      @895    I10_DXCCS5                    N4PF.                               
      @899    I10_DXCCS6                    N4PF.                               
      @903    I10_DXCCS7                    N4PF.                               
      @907    I10_DXCCS8                    N4PF.                               
      @911    I10_DXCCS9                    N4PF.                               
      @915    I10_DXCCS10                   N4PF.                               
      @919    I10_DXCCS11                   N4PF.                               
      @923    I10_DXCCS12                   N4PF.                               
      @927    I10_DXCCS13                   N4PF.                               
      @931    I10_DXCCS14                   N4PF.                               
      @935    I10_DXCCS15                   N4PF.                               
      @939    I10_DXCCS16                   N4PF.                               
      @943    I10_DXCCS17                   N4PF.                               
      @947    I10_DXCCS18                   N4PF.                               
      @951    I10_DXCCS19                   N4PF.                               
      @955    I10_DXCCS20                   N4PF.                               
      @959    I10_DXCCS21                   N4PF.                               
      @963    I10_DXCCS22                   N4PF.                               
      @967    I10_DXCCS23                   N4PF.                               
      @971    I10_DXCCS24                   N4PF.                               
      @975    I10_DXCCS25                   N4PF.                               
      @979    I10_DXCCS26                   N4PF.                               
      @983    I10_DXCCS27                   N4PF.                               
      @987    I10_ECAUSE1                   $CHAR7.                             
      @994    I10_ECAUSE2                   $CHAR7.                             
      @1001   I10_ECAUSE3                   $CHAR7.                             
      @1008   I10_ECAUSE4                   $CHAR7.                             
      @1015   I10_ECAUSE5                   $CHAR7.                             
      @1022   I10_ECAUSE6                   $CHAR7.                             
      @1029   I10_ECAUSE7                   $CHAR7.                             
      @1036   I10_ECAUSE8                   $CHAR7.                             
      @1043   I10_ECAUSE9                   $CHAR7.                             
      @1050   I10_ECAUSE10                  $CHAR7.                             
      @1057   I10_ECauseCCS1                N4PF.                               
      @1061   I10_ECauseCCS2                N4PF.                               
      @1065   I10_ECauseCCS3                N4PF.                               
      @1069   I10_ECauseCCS4                N4PF.                               
      @1073   I10_ECauseCCS5                N4PF.                               
      @1077   I10_ECauseCCS6                N4PF.                               
      @1081   I10_ECauseCCS7                N4PF.                               
      @1085   I10_ECauseCCS8                N4PF.                               
      @1089   I10_ECauseCCS9                N4PF.                               
      @1093   I10_ECauseCCS10               N4PF.                               
      @1097   I10_HOSPBRTH                  N3PF.                               
      @1100   I10_NCHRONIC                  N3PF.                               
      @1103   I10_NDX                       N3PF.                               
      @1106   I10_NECAUSE                   N2PF.                               
      @1108   I10_NEOMAT                    N2PF.                               
      @1110   I10_NPR                       N3PF.                               
      @1113   I10_ORPROC                    N2PF.                               
      @1115   I10_PR1                       $CHAR7.                             
      @1122   I10_PR2                       $CHAR7.                             
      @1129   I10_PR3                       $CHAR7.                             
      @1136   I10_PR4                       $CHAR7.                             
      @1143   I10_PR5                       $CHAR7.                             
      @1150   I10_PR6                       $CHAR7.                             
      @1157   I10_PR7                       $CHAR7.                             
      @1164   I10_PR8                       $CHAR7.                             
      @1171   I10_PRCCS1                    N3PF.                               
      @1174   I10_PRCCS2                    N3PF.                               
      @1177   I10_PRCCS3                    N3PF.                               
      @1180   I10_PRCCS4                    N3PF.                               
      @1183   I10_PRCCS5                    N3PF.                               
      @1186   I10_PRCCS6                    N3PF.                               
      @1189   I10_PRCCS7                    N3PF.                               
      @1192   I10_PRCCS8                    N3PF.                               
      @1195   I10_PROCTYPE                  N3PF.                               
      @1198   KEY                           15.                                 
      @1213   LOS                           N5PF.                               
      @1218   LOS_X                         N6PF.                               
      @1224   MARITALSTATUS_X               $CHAR1.                             
      @1225   MARITALSTATUSUB04             $CHAR1.                             
      @1226   MDNUM1_R                      N9PF.                               
      @1235   MDNUM2_R                      N9PF.                               
      @1244   MDNUM3_R                      N9PF.                               
      @1253   MDNUM4_R                      N9PF.                               
      @1262   MDNUMTYPE1                    $CHAR1.                             
      @1263   MEDINCSTQ                     N2PF.                               
      @1265   MRN_R                         N9PF.                               
      @1274   NCPT                          N4PF.                               
      @1278   OS_TIME                       N11P2F.                             
      @1289   PAY1                          N2PF.                               
      @1291   PAY1_X                        $CHAR1.                             
      @1292   PAY2                          N2PF.                               
      @1294   PAY2_X                        $CHAR1.                             
      @1295   PAY3                          N2PF.                               
      @1297   PAY3_X                        $CHAR1.                             
      @1298   PL_CBSA                       N3PF.                               
      @1301   PL_NCHS                       N2PF.                               
      @1303   PL_RUCC                       N2PF.                               
      @1305   PL_UIC                        N2PF.                               
      @1307   PL_UR_CAT4                    N2PF.                               
      @1309   PointOfOrigin_X               $CHAR1.                             
      @1310   PointOfOriginUB04             $CHAR1.                             
      @1311   PRDAY1                        N5PF.                               
      @1316   PRDAY2                        N5PF.                               
      @1321   PRDAY3                        N5PF.                               
      @1326   PRDAY4                        N5PF.                               
      @1331   PRDAY5                        N5PF.                               
      @1336   PRDAY6                        N5PF.                               
      @1341   PRDAY7                        N5PF.                               
      @1346   PRDAY8                        N5PF.                               
      @1351   PRVER                         N3PF.                               
      @1354   PSTATE                        $CHAR2.                             
      @1356   PSTCO                         N5PF.                               
      @1361   PSTCO2                        N5PF.                               
      @1366   RACE                          N2PF.                               
      @1368   RACE_X                        $CHAR1.                             
      @1369   STATE_AS                      N2PF.                               
      @1371   STATE_ED                      N2PF.                               
      @1373   STATE_OS                      N2PF.                               
      @1375   TOTCHG                        N10PF.                              
      @1385   TOTCHG_X                      N15P2F.                             
      @1400   VisitLink                     N9PF.                               
      @1409   YEAR                          N4PF.                               
      @1413   ZIP3                          $CHAR3.                             
      @1416   ZIPINC_QRTL                   N3PF.                               
      @1419   AYEAR                         N4PF.                               
      @1423   BMONTH                        N2PF.                               
      @1425   BYEAR                         N4PF.                               
      @1429   PRMONTH1                      N2PF.                               
      @1431   PRMONTH2                      N2PF.                               
      @1433   PRMONTH3                      N2PF.                               
      @1435   PRMONTH4                      N2PF.                               
      @1437   PRMONTH5                      N2PF.                               
      @1439   PRMONTH6                      N2PF.                               
      @1441   PRYEAR1                       N4PF.                               
      @1445   PRYEAR2                       N4PF.                               
      @1449   PRYEAR3                       N4PF.                               
      @1453   PRYEAR4                       N4PF.                               
      @1457   PRYEAR5                       N4PF.                               
      @1461   PRYEAR6                       N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
