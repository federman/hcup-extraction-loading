/*******************************************************************            
* Creation Date: 02/02/2017                                                     
*   HI_SEDD_2011_CORE.SAS:                                                      
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
DATA HI_SEDDC_2011_CORE;                                                        
INFILE 'HI_SEDD_2011_CORE.ASC' FIRSTOBS=3 LRECL = 1553;                         
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
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
                                                                                
  CPT77                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 77"                                           
                                                                                
  CPT78                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 78"                                           
                                                                                
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
                                                                                
  CPTCCS77                   LENGTH=4                                           
  LABEL="CCS: CPT 77"                                                           
                                                                                
  CPTCCS78                   LENGTH=4                                           
  LABEL="CCS: CPT 78"                                                           
                                                                                
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
                                                                                
  CPTM1_77                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 77"                                         
                                                                                
  CPTM1_78                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 78"                                         
                                                                                
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
                                                                                
  CPTM2_77                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 77"                                        
                                                                                
  CPTM2_78                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 78"                                        
                                                                                
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
                                                                                
  PAY1_X                     LENGTH=$2                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
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
                                                                                
  RACE_X                     LENGTH=$2                                          
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
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  ZIP_S                      LENGTH=$5                                          
  LABEL="Patient ZIP Code (synthetic)"                                          
                                                                                
  HOSPID                     LENGTH=4                      FORMAT=Z5.           
  LABEL="HCUP hospital identification number"                                   
                                                                                
  AGEGROUP                   LENGTH=3                                           
  LABEL="Age Group"                                                             
                                                                                
  AYEAR                      LENGTH=3                                           
  LABEL="Admission year"                                                        
                                                                                
  DMONTH                     LENGTH=3                                           
  LABEL="Discharge month"                                                       
                                                                                
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGEDAY                        N3PF.                               
      @4      AGEMONTH                      N3PF.                               
      @7      AMONTH                        N2PF.                               
      @9      ATYPE                         N2PF.                               
      @11     AWEEKEND                      N2PF.                               
      @13     CPT1                          $CHAR5.                             
      @18     CPT2                          $CHAR5.                             
      @23     CPT3                          $CHAR5.                             
      @28     CPT4                          $CHAR5.                             
      @33     CPT5                          $CHAR5.                             
      @38     CPT6                          $CHAR5.                             
      @43     CPT7                          $CHAR5.                             
      @48     CPT8                          $CHAR5.                             
      @53     CPT9                          $CHAR5.                             
      @58     CPT10                         $CHAR5.                             
      @63     CPT11                         $CHAR5.                             
      @68     CPT12                         $CHAR5.                             
      @73     CPT13                         $CHAR5.                             
      @78     CPT14                         $CHAR5.                             
      @83     CPT15                         $CHAR5.                             
      @88     CPT16                         $CHAR5.                             
      @93     CPT17                         $CHAR5.                             
      @98     CPT18                         $CHAR5.                             
      @103    CPT19                         $CHAR5.                             
      @108    CPT20                         $CHAR5.                             
      @113    CPT21                         $CHAR5.                             
      @118    CPT22                         $CHAR5.                             
      @123    CPT23                         $CHAR5.                             
      @128    CPT24                         $CHAR5.                             
      @133    CPT25                         $CHAR5.                             
      @138    CPT26                         $CHAR5.                             
      @143    CPT27                         $CHAR5.                             
      @148    CPT28                         $CHAR5.                             
      @153    CPT29                         $CHAR5.                             
      @158    CPT30                         $CHAR5.                             
      @163    CPT31                         $CHAR5.                             
      @168    CPT32                         $CHAR5.                             
      @173    CPT33                         $CHAR5.                             
      @178    CPT34                         $CHAR5.                             
      @183    CPT35                         $CHAR5.                             
      @188    CPT36                         $CHAR5.                             
      @193    CPT37                         $CHAR5.                             
      @198    CPT38                         $CHAR5.                             
      @203    CPT39                         $CHAR5.                             
      @208    CPT40                         $CHAR5.                             
      @213    CPT41                         $CHAR5.                             
      @218    CPT42                         $CHAR5.                             
      @223    CPT43                         $CHAR5.                             
      @228    CPT44                         $CHAR5.                             
      @233    CPT45                         $CHAR5.                             
      @238    CPT46                         $CHAR5.                             
      @243    CPT47                         $CHAR5.                             
      @248    CPT48                         $CHAR5.                             
      @253    CPT49                         $CHAR5.                             
      @258    CPT50                         $CHAR5.                             
      @263    CPT51                         $CHAR5.                             
      @268    CPT52                         $CHAR5.                             
      @273    CPT53                         $CHAR5.                             
      @278    CPT54                         $CHAR5.                             
      @283    CPT55                         $CHAR5.                             
      @288    CPT56                         $CHAR5.                             
      @293    CPT57                         $CHAR5.                             
      @298    CPT58                         $CHAR5.                             
      @303    CPT59                         $CHAR5.                             
      @308    CPT60                         $CHAR5.                             
      @313    CPT61                         $CHAR5.                             
      @318    CPT62                         $CHAR5.                             
      @323    CPT63                         $CHAR5.                             
      @328    CPT64                         $CHAR5.                             
      @333    CPT65                         $CHAR5.                             
      @338    CPT66                         $CHAR5.                             
      @343    CPT67                         $CHAR5.                             
      @348    CPT68                         $CHAR5.                             
      @353    CPT69                         $CHAR5.                             
      @358    CPT70                         $CHAR5.                             
      @363    CPT71                         $CHAR5.                             
      @368    CPT72                         $CHAR5.                             
      @373    CPT73                         $CHAR5.                             
      @378    CPT74                         $CHAR5.                             
      @383    CPT75                         $CHAR5.                             
      @388    CPT76                         $CHAR5.                             
      @393    CPT77                         $CHAR5.                             
      @398    CPT78                         $CHAR5.                             
      @403    CPTCCS1                       N3PF.                               
      @406    CPTCCS2                       N3PF.                               
      @409    CPTCCS3                       N3PF.                               
      @412    CPTCCS4                       N3PF.                               
      @415    CPTCCS5                       N3PF.                               
      @418    CPTCCS6                       N3PF.                               
      @421    CPTCCS7                       N3PF.                               
      @424    CPTCCS8                       N3PF.                               
      @427    CPTCCS9                       N3PF.                               
      @430    CPTCCS10                      N3PF.                               
      @433    CPTCCS11                      N3PF.                               
      @436    CPTCCS12                      N3PF.                               
      @439    CPTCCS13                      N3PF.                               
      @442    CPTCCS14                      N3PF.                               
      @445    CPTCCS15                      N3PF.                               
      @448    CPTCCS16                      N3PF.                               
      @451    CPTCCS17                      N3PF.                               
      @454    CPTCCS18                      N3PF.                               
      @457    CPTCCS19                      N3PF.                               
      @460    CPTCCS20                      N3PF.                               
      @463    CPTCCS21                      N3PF.                               
      @466    CPTCCS22                      N3PF.                               
      @469    CPTCCS23                      N3PF.                               
      @472    CPTCCS24                      N3PF.                               
      @475    CPTCCS25                      N3PF.                               
      @478    CPTCCS26                      N3PF.                               
      @481    CPTCCS27                      N3PF.                               
      @484    CPTCCS28                      N3PF.                               
      @487    CPTCCS29                      N3PF.                               
      @490    CPTCCS30                      N3PF.                               
      @493    CPTCCS31                      N3PF.                               
      @496    CPTCCS32                      N3PF.                               
      @499    CPTCCS33                      N3PF.                               
      @502    CPTCCS34                      N3PF.                               
      @505    CPTCCS35                      N3PF.                               
      @508    CPTCCS36                      N3PF.                               
      @511    CPTCCS37                      N3PF.                               
      @514    CPTCCS38                      N3PF.                               
      @517    CPTCCS39                      N3PF.                               
      @520    CPTCCS40                      N3PF.                               
      @523    CPTCCS41                      N3PF.                               
      @526    CPTCCS42                      N3PF.                               
      @529    CPTCCS43                      N3PF.                               
      @532    CPTCCS44                      N3PF.                               
      @535    CPTCCS45                      N3PF.                               
      @538    CPTCCS46                      N3PF.                               
      @541    CPTCCS47                      N3PF.                               
      @544    CPTCCS48                      N3PF.                               
      @547    CPTCCS49                      N3PF.                               
      @550    CPTCCS50                      N3PF.                               
      @553    CPTCCS51                      N3PF.                               
      @556    CPTCCS52                      N3PF.                               
      @559    CPTCCS53                      N3PF.                               
      @562    CPTCCS54                      N3PF.                               
      @565    CPTCCS55                      N3PF.                               
      @568    CPTCCS56                      N3PF.                               
      @571    CPTCCS57                      N3PF.                               
      @574    CPTCCS58                      N3PF.                               
      @577    CPTCCS59                      N3PF.                               
      @580    CPTCCS60                      N3PF.                               
      @583    CPTCCS61                      N3PF.                               
      @586    CPTCCS62                      N3PF.                               
      @589    CPTCCS63                      N3PF.                               
      @592    CPTCCS64                      N3PF.                               
      @595    CPTCCS65                      N3PF.                               
      @598    CPTCCS66                      N3PF.                               
      @601    CPTCCS67                      N3PF.                               
      @604    CPTCCS68                      N3PF.                               
      @607    CPTCCS69                      N3PF.                               
      @610    CPTCCS70                      N3PF.                               
      @613    CPTCCS71                      N3PF.                               
      @616    CPTCCS72                      N3PF.                               
      @619    CPTCCS73                      N3PF.                               
      @622    CPTCCS74                      N3PF.                               
      @625    CPTCCS75                      N3PF.                               
      @628    CPTCCS76                      N3PF.                               
      @631    CPTCCS77                      N3PF.                               
      @634    CPTCCS78                      N3PF.                               
      @637    CPTM1_1                       $CHAR2.                             
      @639    CPTM1_2                       $CHAR2.                             
      @641    CPTM1_3                       $CHAR2.                             
      @643    CPTM1_4                       $CHAR2.                             
      @645    CPTM1_5                       $CHAR2.                             
      @647    CPTM1_6                       $CHAR2.                             
      @649    CPTM1_7                       $CHAR2.                             
      @651    CPTM1_8                       $CHAR2.                             
      @653    CPTM1_9                       $CHAR2.                             
      @655    CPTM1_10                      $CHAR2.                             
      @657    CPTM1_11                      $CHAR2.                             
      @659    CPTM1_12                      $CHAR2.                             
      @661    CPTM1_13                      $CHAR2.                             
      @663    CPTM1_14                      $CHAR2.                             
      @665    CPTM1_15                      $CHAR2.                             
      @667    CPTM1_16                      $CHAR2.                             
      @669    CPTM1_17                      $CHAR2.                             
      @671    CPTM1_18                      $CHAR2.                             
      @673    CPTM1_19                      $CHAR2.                             
      @675    CPTM1_20                      $CHAR2.                             
      @677    CPTM1_21                      $CHAR2.                             
      @679    CPTM1_22                      $CHAR2.                             
      @681    CPTM1_23                      $CHAR2.                             
      @683    CPTM1_24                      $CHAR2.                             
      @685    CPTM1_25                      $CHAR2.                             
      @687    CPTM1_26                      $CHAR2.                             
      @689    CPTM1_27                      $CHAR2.                             
      @691    CPTM1_28                      $CHAR2.                             
      @693    CPTM1_29                      $CHAR2.                             
      @695    CPTM1_30                      $CHAR2.                             
      @697    CPTM1_31                      $CHAR2.                             
      @699    CPTM1_32                      $CHAR2.                             
      @701    CPTM1_33                      $CHAR2.                             
      @703    CPTM1_34                      $CHAR2.                             
      @705    CPTM1_35                      $CHAR2.                             
      @707    CPTM1_36                      $CHAR2.                             
      @709    CPTM1_37                      $CHAR2.                             
      @711    CPTM1_38                      $CHAR2.                             
      @713    CPTM1_39                      $CHAR2.                             
      @715    CPTM1_40                      $CHAR2.                             
      @717    CPTM1_41                      $CHAR2.                             
      @719    CPTM1_42                      $CHAR2.                             
      @721    CPTM1_43                      $CHAR2.                             
      @723    CPTM1_44                      $CHAR2.                             
      @725    CPTM1_45                      $CHAR2.                             
      @727    CPTM1_46                      $CHAR2.                             
      @729    CPTM1_47                      $CHAR2.                             
      @731    CPTM1_48                      $CHAR2.                             
      @733    CPTM1_49                      $CHAR2.                             
      @735    CPTM1_50                      $CHAR2.                             
      @737    CPTM1_51                      $CHAR2.                             
      @739    CPTM1_52                      $CHAR2.                             
      @741    CPTM1_53                      $CHAR2.                             
      @743    CPTM1_54                      $CHAR2.                             
      @745    CPTM1_55                      $CHAR2.                             
      @747    CPTM1_56                      $CHAR2.                             
      @749    CPTM1_57                      $CHAR2.                             
      @751    CPTM1_58                      $CHAR2.                             
      @753    CPTM1_59                      $CHAR2.                             
      @755    CPTM1_60                      $CHAR2.                             
      @757    CPTM1_61                      $CHAR2.                             
      @759    CPTM1_62                      $CHAR2.                             
      @761    CPTM1_63                      $CHAR2.                             
      @763    CPTM1_64                      $CHAR2.                             
      @765    CPTM1_65                      $CHAR2.                             
      @767    CPTM1_66                      $CHAR2.                             
      @769    CPTM1_67                      $CHAR2.                             
      @771    CPTM1_68                      $CHAR2.                             
      @773    CPTM1_69                      $CHAR2.                             
      @775    CPTM1_70                      $CHAR2.                             
      @777    CPTM1_71                      $CHAR2.                             
      @779    CPTM1_72                      $CHAR2.                             
      @781    CPTM1_73                      $CHAR2.                             
      @783    CPTM1_74                      $CHAR2.                             
      @785    CPTM1_75                      $CHAR2.                             
      @787    CPTM1_76                      $CHAR2.                             
      @789    CPTM1_77                      $CHAR2.                             
      @791    CPTM1_78                      $CHAR2.                             
      @793    CPTM2_1                       $CHAR2.                             
      @795    CPTM2_2                       $CHAR2.                             
      @797    CPTM2_3                       $CHAR2.                             
      @799    CPTM2_4                       $CHAR2.                             
      @801    CPTM2_5                       $CHAR2.                             
      @803    CPTM2_6                       $CHAR2.                             
      @805    CPTM2_7                       $CHAR2.                             
      @807    CPTM2_8                       $CHAR2.                             
      @809    CPTM2_9                       $CHAR2.                             
      @811    CPTM2_10                      $CHAR2.                             
      @813    CPTM2_11                      $CHAR2.                             
      @815    CPTM2_12                      $CHAR2.                             
      @817    CPTM2_13                      $CHAR2.                             
      @819    CPTM2_14                      $CHAR2.                             
      @821    CPTM2_15                      $CHAR2.                             
      @823    CPTM2_16                      $CHAR2.                             
      @825    CPTM2_17                      $CHAR2.                             
      @827    CPTM2_18                      $CHAR2.                             
      @829    CPTM2_19                      $CHAR2.                             
      @831    CPTM2_20                      $CHAR2.                             
      @833    CPTM2_21                      $CHAR2.                             
      @835    CPTM2_22                      $CHAR2.                             
      @837    CPTM2_23                      $CHAR2.                             
      @839    CPTM2_24                      $CHAR2.                             
      @841    CPTM2_25                      $CHAR2.                             
      @843    CPTM2_26                      $CHAR2.                             
      @845    CPTM2_27                      $CHAR2.                             
      @847    CPTM2_28                      $CHAR2.                             
      @849    CPTM2_29                      $CHAR2.                             
      @851    CPTM2_30                      $CHAR2.                             
      @853    CPTM2_31                      $CHAR2.                             
      @855    CPTM2_32                      $CHAR2.                             
      @857    CPTM2_33                      $CHAR2.                             
      @859    CPTM2_34                      $CHAR2.                             
      @861    CPTM2_35                      $CHAR2.                             
      @863    CPTM2_36                      $CHAR2.                             
      @865    CPTM2_37                      $CHAR2.                             
      @867    CPTM2_38                      $CHAR2.                             
      @869    CPTM2_39                      $CHAR2.                             
      @871    CPTM2_40                      $CHAR2.                             
      @873    CPTM2_41                      $CHAR2.                             
      @875    CPTM2_42                      $CHAR2.                             
      @877    CPTM2_43                      $CHAR2.                             
      @879    CPTM2_44                      $CHAR2.                             
      @881    CPTM2_45                      $CHAR2.                             
      @883    CPTM2_46                      $CHAR2.                             
      @885    CPTM2_47                      $CHAR2.                             
      @887    CPTM2_48                      $CHAR2.                             
      @889    CPTM2_49                      $CHAR2.                             
      @891    CPTM2_50                      $CHAR2.                             
      @893    CPTM2_51                      $CHAR2.                             
      @895    CPTM2_52                      $CHAR2.                             
      @897    CPTM2_53                      $CHAR2.                             
      @899    CPTM2_54                      $CHAR2.                             
      @901    CPTM2_55                      $CHAR2.                             
      @903    CPTM2_56                      $CHAR2.                             
      @905    CPTM2_57                      $CHAR2.                             
      @907    CPTM2_58                      $CHAR2.                             
      @909    CPTM2_59                      $CHAR2.                             
      @911    CPTM2_60                      $CHAR2.                             
      @913    CPTM2_61                      $CHAR2.                             
      @915    CPTM2_62                      $CHAR2.                             
      @917    CPTM2_63                      $CHAR2.                             
      @919    CPTM2_64                      $CHAR2.                             
      @921    CPTM2_65                      $CHAR2.                             
      @923    CPTM2_66                      $CHAR2.                             
      @925    CPTM2_67                      $CHAR2.                             
      @927    CPTM2_68                      $CHAR2.                             
      @929    CPTM2_69                      $CHAR2.                             
      @931    CPTM2_70                      $CHAR2.                             
      @933    CPTM2_71                      $CHAR2.                             
      @935    CPTM2_72                      $CHAR2.                             
      @937    CPTM2_73                      $CHAR2.                             
      @939    CPTM2_74                      $CHAR2.                             
      @941    CPTM2_75                      $CHAR2.                             
      @943    CPTM2_76                      $CHAR2.                             
      @945    CPTM2_77                      $CHAR2.                             
      @947    CPTM2_78                      $CHAR2.                             
      @949    DIED                          N2PF.                               
      @951    DISPUB04                      N2PF.                               
      @953    DISPUNIFORM                   N2PF.                               
      @955    DISP_X                        $CHAR2.                             
      @957    DQTR                          N2PF.                               
      @959    DX1                           $CHAR7.                             
      @966    DX2                           $CHAR7.                             
      @973    DX3                           $CHAR7.                             
      @980    DX4                           $CHAR7.                             
      @987    DX5                           $CHAR7.                             
      @994    DX6                           $CHAR7.                             
      @1001   DX7                           $CHAR7.                             
      @1008   DX8                           $CHAR7.                             
      @1015   DX9                           $CHAR7.                             
      @1022   DX10                          $CHAR7.                             
      @1029   DXCCS1                        N4PF.                               
      @1033   DXCCS2                        N4PF.                               
      @1037   DXCCS3                        N4PF.                               
      @1041   DXCCS4                        N4PF.                               
      @1045   DXCCS5                        N4PF.                               
      @1049   DXCCS6                        N4PF.                               
      @1053   DXCCS7                        N4PF.                               
      @1057   DXCCS8                        N4PF.                               
      @1061   DXCCS9                        N4PF.                               
      @1065   DXCCS10                       N4PF.                               
      @1069   ECODE1                        $CHAR7.                             
      @1076   ECODE2                        $CHAR7.                             
      @1083   ECODE3                        $CHAR7.                             
      @1090   ECODE4                        $CHAR7.                             
      @1097   ECODE5                        $CHAR7.                             
      @1104   ECODE6                        $CHAR7.                             
      @1111   ECODE7                        $CHAR7.                             
      @1118   ECODE8                        $CHAR7.                             
      @1125   E_CCS1                        N4PF.                               
      @1129   E_CCS2                        N4PF.                               
      @1133   E_CCS3                        N4PF.                               
      @1137   E_CCS4                        N4PF.                               
      @1141   E_CCS5                        N4PF.                               
      @1145   E_CCS6                        N4PF.                               
      @1149   E_CCS7                        N4PF.                               
      @1153   E_CCS8                        N4PF.                               
      @1157   FEMALE                        N2PF.                               
      @1159   HCUP_ED                       N2PF.                               
      @1161   HCUP_OS                       N2PF.                               
      @1163   HCUP_SURGERY_BROAD            N2PF.                               
      @1165   HCUP_SURGERY_NARROW           N2PF.                               
      @1167   HOSPBRTH                      N3PF.                               
      @1170   HOSPST                        $CHAR2.                             
      @1172   KEY                           15.                                 
      @1187   LOS                           N5PF.                               
      @1192   LOS_X                         N6PF.                               
      @1198   MEDINCSTQ                     N2PF.                               
      @1200   MRN_R                         N9PF.                               
      @1209   NCHRONIC                      N3PF.                               
      @1212   NCPT                          N4PF.                               
      @1216   NDX                           N3PF.                               
      @1219   NECODE                        N2PF.                               
      @1221   NEOMAT                        N2PF.                               
      @1223   NPR                           N3PF.                               
      @1226   ORPROC                        N2PF.                               
      @1228   OS_TIME                       N11P2F.                             
      @1239   PAY1                          N2PF.                               
      @1241   PAY1_X                        $CHAR2.                             
      @1243   PL_CBSA                       N3PF.                               
      @1246   PL_MSA1993                    N3PF.                               
      @1249   PL_NCHS2006                   N2PF.                               
      @1251   PL_RUCA10_2005                N2PF.                               
      @1253   PL_RUCA2005                   N4P1F.                              
      @1257   PL_RUCA4_2005                 N2PF.                               
      @1259   PL_RUCC2003                   N2PF.                               
      @1261   PL_UIC2003                    N2PF.                               
      @1263   PL_UR_CAT4                    N2PF.                               
      @1265   PR1                           $CHAR7.                             
      @1272   PR2                           $CHAR7.                             
      @1279   PR3                           $CHAR7.                             
      @1286   PR4                           $CHAR7.                             
      @1293   PR5                           $CHAR7.                             
      @1300   PR6                           $CHAR7.                             
      @1307   PR7                           $CHAR7.                             
      @1314   PR8                           $CHAR7.                             
      @1321   PR9                           $CHAR7.                             
      @1328   PR10                          $CHAR7.                             
      @1335   PRCCS1                        N3PF.                               
      @1338   PRCCS2                        N3PF.                               
      @1341   PRCCS3                        N3PF.                               
      @1344   PRCCS4                        N3PF.                               
      @1347   PRCCS5                        N3PF.                               
      @1350   PRCCS6                        N3PF.                               
      @1353   PRCCS7                        N3PF.                               
      @1356   PRCCS8                        N3PF.                               
      @1359   PRCCS9                        N3PF.                               
      @1362   PRCCS10                       N3PF.                               
      @1365   PRDAY1                        N5PF.                               
      @1370   PRDAY2                        N5PF.                               
      @1375   PRDAY3                        N5PF.                               
      @1380   PRDAY4                        N5PF.                               
      @1385   PRDAY5                        N5PF.                               
      @1390   PRDAY6                        N5PF.                               
      @1395   PRDAY7                        N5PF.                               
      @1400   PRDAY8                        N5PF.                               
      @1405   PRDAY9                        N5PF.                               
      @1410   PRDAY10                       N5PF.                               
      @1415   PROCTYPE                      N3PF.                               
      @1418   PSTATE                        $CHAR2.                             
      @1420   PSTCO2                        N5PF.                               
      @1425   PointOfOriginUB04             $CHAR1.                             
      @1426   PointOfOrigin_X               $CHAR1.                             
      @1427   RACE                          N2PF.                               
      @1429   RACE_X                        $CHAR2.                             
      @1431   STATE_AS                      N2PF.                               
      @1433   STATE_ED                      N2PF.                               
      @1435   STATE_OS                      N2PF.                               
      @1437   TOTCHG                        N10PF.                              
      @1447   TOTCHG_X                      N15P2F.                             
      @1462   YEAR                          N4PF.                               
      @1466   ZIPINC_QRTL                   N3PF.                               
      @1469   ZIP_S                         $CHAR5.                             
      @1474   HOSPID                        N5PF.                               
      @1479   AGEGROUP                      N3PF.                               
      @1482   AYEAR                         N4PF.                               
      @1486   DMONTH                        N2PF.                               
      @1488   BMONTH                        N2PF.                               
      @1490   BYEAR                         N4PF.                               
      @1494   PRMONTH1                      N2PF.                               
      @1496   PRMONTH2                      N2PF.                               
      @1498   PRMONTH3                      N2PF.                               
      @1500   PRMONTH4                      N2PF.                               
      @1502   PRMONTH5                      N2PF.                               
      @1504   PRMONTH6                      N2PF.                               
      @1506   PRMONTH7                      N2PF.                               
      @1508   PRMONTH8                      N2PF.                               
      @1510   PRMONTH9                      N2PF.                               
      @1512   PRMONTH10                     N2PF.                               
      @1514   PRYEAR1                       N4PF.                               
      @1518   PRYEAR2                       N4PF.                               
      @1522   PRYEAR3                       N4PF.                               
      @1526   PRYEAR4                       N4PF.                               
      @1530   PRYEAR5                       N4PF.                               
      @1534   PRYEAR6                       N4PF.                               
      @1538   PRYEAR7                       N4PF.                               
      @1542   PRYEAR8                       N4PF.                               
      @1546   PRYEAR9                       N4PF.                               
      @1550   PRYEAR10                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
