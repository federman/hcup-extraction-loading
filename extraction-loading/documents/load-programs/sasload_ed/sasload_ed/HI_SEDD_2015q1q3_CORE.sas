/*******************************************************************            
* Creation Date: 12/07/2017                                                     
*   HI_SEDD_2015q1q3_CORE.SAS:                                                  
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
DATA HI_SEDDC_2015q1q3_CORE;                                                    
INFILE 'HI_SEDD_2015q1q3_CORE.ASC' FIRSTOBS=3 LRECL = 2103;                     
                                                                                
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
                                                                                
  CPT79                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 79"                                           
                                                                                
  CPT80                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 80"                                           
                                                                                
  CPT81                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 81"                                           
                                                                                
  CPT82                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 82"                                           
                                                                                
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
                                                                                
  CPTCCS79                   LENGTH=4                                           
  LABEL="CCS: CPT 79"                                                           
                                                                                
  CPTCCS80                   LENGTH=4                                           
  LABEL="CCS: CPT 80"                                                           
                                                                                
  CPTCCS81                   LENGTH=4                                           
  LABEL="CCS: CPT 81"                                                           
                                                                                
  CPTCCS82                   LENGTH=4                                           
  LABEL="CCS: CPT 82"                                                           
                                                                                
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
                                                                                
  CPTM1_79                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 79"                                         
                                                                                
  CPTM1_80                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 80"                                         
                                                                                
  CPTM1_81                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 81"                                         
                                                                                
  CPTM1_82                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 82"                                         
                                                                                
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
                                                                                
  CPTM2_79                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 79"                                        
                                                                                
  CPTM2_80                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 80"                                        
                                                                                
  CPTM2_81                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 81"                                        
                                                                                
  CPTM2_82                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 82"                                        
                                                                                
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
                                                                                
  DXVER                      LENGTH=3                                           
  LABEL="Diagnosis Version"                                                     
                                                                                
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
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
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
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
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
                                                                                
  PRVER                      LENGTH=3                                           
  LABEL="Procedure Version"                                                     
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
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
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  HOSPID                     LENGTH=4                      FORMAT=Z5.           
  LABEL="HCUP hospital identification number"                                   
                                                                                
  AGEGROUP                   LENGTH=3                                           
  LABEL="Age Group"                                                             
                                                                                
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
      @403    CPT79                         $CHAR5.                             
      @408    CPT80                         $CHAR5.                             
      @413    CPT81                         $CHAR5.                             
      @418    CPT82                         $CHAR5.                             
      @423    CPTCCS1                       N3PF.                               
      @426    CPTCCS2                       N3PF.                               
      @429    CPTCCS3                       N3PF.                               
      @432    CPTCCS4                       N3PF.                               
      @435    CPTCCS5                       N3PF.                               
      @438    CPTCCS6                       N3PF.                               
      @441    CPTCCS7                       N3PF.                               
      @444    CPTCCS8                       N3PF.                               
      @447    CPTCCS9                       N3PF.                               
      @450    CPTCCS10                      N3PF.                               
      @453    CPTCCS11                      N3PF.                               
      @456    CPTCCS12                      N3PF.                               
      @459    CPTCCS13                      N3PF.                               
      @462    CPTCCS14                      N3PF.                               
      @465    CPTCCS15                      N3PF.                               
      @468    CPTCCS16                      N3PF.                               
      @471    CPTCCS17                      N3PF.                               
      @474    CPTCCS18                      N3PF.                               
      @477    CPTCCS19                      N3PF.                               
      @480    CPTCCS20                      N3PF.                               
      @483    CPTCCS21                      N3PF.                               
      @486    CPTCCS22                      N3PF.                               
      @489    CPTCCS23                      N3PF.                               
      @492    CPTCCS24                      N3PF.                               
      @495    CPTCCS25                      N3PF.                               
      @498    CPTCCS26                      N3PF.                               
      @501    CPTCCS27                      N3PF.                               
      @504    CPTCCS28                      N3PF.                               
      @507    CPTCCS29                      N3PF.                               
      @510    CPTCCS30                      N3PF.                               
      @513    CPTCCS31                      N3PF.                               
      @516    CPTCCS32                      N3PF.                               
      @519    CPTCCS33                      N3PF.                               
      @522    CPTCCS34                      N3PF.                               
      @525    CPTCCS35                      N3PF.                               
      @528    CPTCCS36                      N3PF.                               
      @531    CPTCCS37                      N3PF.                               
      @534    CPTCCS38                      N3PF.                               
      @537    CPTCCS39                      N3PF.                               
      @540    CPTCCS40                      N3PF.                               
      @543    CPTCCS41                      N3PF.                               
      @546    CPTCCS42                      N3PF.                               
      @549    CPTCCS43                      N3PF.                               
      @552    CPTCCS44                      N3PF.                               
      @555    CPTCCS45                      N3PF.                               
      @558    CPTCCS46                      N3PF.                               
      @561    CPTCCS47                      N3PF.                               
      @564    CPTCCS48                      N3PF.                               
      @567    CPTCCS49                      N3PF.                               
      @570    CPTCCS50                      N3PF.                               
      @573    CPTCCS51                      N3PF.                               
      @576    CPTCCS52                      N3PF.                               
      @579    CPTCCS53                      N3PF.                               
      @582    CPTCCS54                      N3PF.                               
      @585    CPTCCS55                      N3PF.                               
      @588    CPTCCS56                      N3PF.                               
      @591    CPTCCS57                      N3PF.                               
      @594    CPTCCS58                      N3PF.                               
      @597    CPTCCS59                      N3PF.                               
      @600    CPTCCS60                      N3PF.                               
      @603    CPTCCS61                      N3PF.                               
      @606    CPTCCS62                      N3PF.                               
      @609    CPTCCS63                      N3PF.                               
      @612    CPTCCS64                      N3PF.                               
      @615    CPTCCS65                      N3PF.                               
      @618    CPTCCS66                      N3PF.                               
      @621    CPTCCS67                      N3PF.                               
      @624    CPTCCS68                      N3PF.                               
      @627    CPTCCS69                      N3PF.                               
      @630    CPTCCS70                      N3PF.                               
      @633    CPTCCS71                      N3PF.                               
      @636    CPTCCS72                      N3PF.                               
      @639    CPTCCS73                      N3PF.                               
      @642    CPTCCS74                      N3PF.                               
      @645    CPTCCS75                      N3PF.                               
      @648    CPTCCS76                      N3PF.                               
      @651    CPTCCS77                      N3PF.                               
      @654    CPTCCS78                      N3PF.                               
      @657    CPTCCS79                      N3PF.                               
      @660    CPTCCS80                      N3PF.                               
      @663    CPTCCS81                      N3PF.                               
      @666    CPTCCS82                      N3PF.                               
      @669    CPTM1_1                       $CHAR2.                             
      @671    CPTM1_2                       $CHAR2.                             
      @673    CPTM1_3                       $CHAR2.                             
      @675    CPTM1_4                       $CHAR2.                             
      @677    CPTM1_5                       $CHAR2.                             
      @679    CPTM1_6                       $CHAR2.                             
      @681    CPTM1_7                       $CHAR2.                             
      @683    CPTM1_8                       $CHAR2.                             
      @685    CPTM1_9                       $CHAR2.                             
      @687    CPTM1_10                      $CHAR2.                             
      @689    CPTM1_11                      $CHAR2.                             
      @691    CPTM1_12                      $CHAR2.                             
      @693    CPTM1_13                      $CHAR2.                             
      @695    CPTM1_14                      $CHAR2.                             
      @697    CPTM1_15                      $CHAR2.                             
      @699    CPTM1_16                      $CHAR2.                             
      @701    CPTM1_17                      $CHAR2.                             
      @703    CPTM1_18                      $CHAR2.                             
      @705    CPTM1_19                      $CHAR2.                             
      @707    CPTM1_20                      $CHAR2.                             
      @709    CPTM1_21                      $CHAR2.                             
      @711    CPTM1_22                      $CHAR2.                             
      @713    CPTM1_23                      $CHAR2.                             
      @715    CPTM1_24                      $CHAR2.                             
      @717    CPTM1_25                      $CHAR2.                             
      @719    CPTM1_26                      $CHAR2.                             
      @721    CPTM1_27                      $CHAR2.                             
      @723    CPTM1_28                      $CHAR2.                             
      @725    CPTM1_29                      $CHAR2.                             
      @727    CPTM1_30                      $CHAR2.                             
      @729    CPTM1_31                      $CHAR2.                             
      @731    CPTM1_32                      $CHAR2.                             
      @733    CPTM1_33                      $CHAR2.                             
      @735    CPTM1_34                      $CHAR2.                             
      @737    CPTM1_35                      $CHAR2.                             
      @739    CPTM1_36                      $CHAR2.                             
      @741    CPTM1_37                      $CHAR2.                             
      @743    CPTM1_38                      $CHAR2.                             
      @745    CPTM1_39                      $CHAR2.                             
      @747    CPTM1_40                      $CHAR2.                             
      @749    CPTM1_41                      $CHAR2.                             
      @751    CPTM1_42                      $CHAR2.                             
      @753    CPTM1_43                      $CHAR2.                             
      @755    CPTM1_44                      $CHAR2.                             
      @757    CPTM1_45                      $CHAR2.                             
      @759    CPTM1_46                      $CHAR2.                             
      @761    CPTM1_47                      $CHAR2.                             
      @763    CPTM1_48                      $CHAR2.                             
      @765    CPTM1_49                      $CHAR2.                             
      @767    CPTM1_50                      $CHAR2.                             
      @769    CPTM1_51                      $CHAR2.                             
      @771    CPTM1_52                      $CHAR2.                             
      @773    CPTM1_53                      $CHAR2.                             
      @775    CPTM1_54                      $CHAR2.                             
      @777    CPTM1_55                      $CHAR2.                             
      @779    CPTM1_56                      $CHAR2.                             
      @781    CPTM1_57                      $CHAR2.                             
      @783    CPTM1_58                      $CHAR2.                             
      @785    CPTM1_59                      $CHAR2.                             
      @787    CPTM1_60                      $CHAR2.                             
      @789    CPTM1_61                      $CHAR2.                             
      @791    CPTM1_62                      $CHAR2.                             
      @793    CPTM1_63                      $CHAR2.                             
      @795    CPTM1_64                      $CHAR2.                             
      @797    CPTM1_65                      $CHAR2.                             
      @799    CPTM1_66                      $CHAR2.                             
      @801    CPTM1_67                      $CHAR2.                             
      @803    CPTM1_68                      $CHAR2.                             
      @805    CPTM1_69                      $CHAR2.                             
      @807    CPTM1_70                      $CHAR2.                             
      @809    CPTM1_71                      $CHAR2.                             
      @811    CPTM1_72                      $CHAR2.                             
      @813    CPTM1_73                      $CHAR2.                             
      @815    CPTM1_74                      $CHAR2.                             
      @817    CPTM1_75                      $CHAR2.                             
      @819    CPTM1_76                      $CHAR2.                             
      @821    CPTM1_77                      $CHAR2.                             
      @823    CPTM1_78                      $CHAR2.                             
      @825    CPTM1_79                      $CHAR2.                             
      @827    CPTM1_80                      $CHAR2.                             
      @829    CPTM1_81                      $CHAR2.                             
      @831    CPTM1_82                      $CHAR2.                             
      @833    CPTM2_1                       $CHAR2.                             
      @835    CPTM2_2                       $CHAR2.                             
      @837    CPTM2_3                       $CHAR2.                             
      @839    CPTM2_4                       $CHAR2.                             
      @841    CPTM2_5                       $CHAR2.                             
      @843    CPTM2_6                       $CHAR2.                             
      @845    CPTM2_7                       $CHAR2.                             
      @847    CPTM2_8                       $CHAR2.                             
      @849    CPTM2_9                       $CHAR2.                             
      @851    CPTM2_10                      $CHAR2.                             
      @853    CPTM2_11                      $CHAR2.                             
      @855    CPTM2_12                      $CHAR2.                             
      @857    CPTM2_13                      $CHAR2.                             
      @859    CPTM2_14                      $CHAR2.                             
      @861    CPTM2_15                      $CHAR2.                             
      @863    CPTM2_16                      $CHAR2.                             
      @865    CPTM2_17                      $CHAR2.                             
      @867    CPTM2_18                      $CHAR2.                             
      @869    CPTM2_19                      $CHAR2.                             
      @871    CPTM2_20                      $CHAR2.                             
      @873    CPTM2_21                      $CHAR2.                             
      @875    CPTM2_22                      $CHAR2.                             
      @877    CPTM2_23                      $CHAR2.                             
      @879    CPTM2_24                      $CHAR2.                             
      @881    CPTM2_25                      $CHAR2.                             
      @883    CPTM2_26                      $CHAR2.                             
      @885    CPTM2_27                      $CHAR2.                             
      @887    CPTM2_28                      $CHAR2.                             
      @889    CPTM2_29                      $CHAR2.                             
      @891    CPTM2_30                      $CHAR2.                             
      @893    CPTM2_31                      $CHAR2.                             
      @895    CPTM2_32                      $CHAR2.                             
      @897    CPTM2_33                      $CHAR2.                             
      @899    CPTM2_34                      $CHAR2.                             
      @901    CPTM2_35                      $CHAR2.                             
      @903    CPTM2_36                      $CHAR2.                             
      @905    CPTM2_37                      $CHAR2.                             
      @907    CPTM2_38                      $CHAR2.                             
      @909    CPTM2_39                      $CHAR2.                             
      @911    CPTM2_40                      $CHAR2.                             
      @913    CPTM2_41                      $CHAR2.                             
      @915    CPTM2_42                      $CHAR2.                             
      @917    CPTM2_43                      $CHAR2.                             
      @919    CPTM2_44                      $CHAR2.                             
      @921    CPTM2_45                      $CHAR2.                             
      @923    CPTM2_46                      $CHAR2.                             
      @925    CPTM2_47                      $CHAR2.                             
      @927    CPTM2_48                      $CHAR2.                             
      @929    CPTM2_49                      $CHAR2.                             
      @931    CPTM2_50                      $CHAR2.                             
      @933    CPTM2_51                      $CHAR2.                             
      @935    CPTM2_52                      $CHAR2.                             
      @937    CPTM2_53                      $CHAR2.                             
      @939    CPTM2_54                      $CHAR2.                             
      @941    CPTM2_55                      $CHAR2.                             
      @943    CPTM2_56                      $CHAR2.                             
      @945    CPTM2_57                      $CHAR2.                             
      @947    CPTM2_58                      $CHAR2.                             
      @949    CPTM2_59                      $CHAR2.                             
      @951    CPTM2_60                      $CHAR2.                             
      @953    CPTM2_61                      $CHAR2.                             
      @955    CPTM2_62                      $CHAR2.                             
      @957    CPTM2_63                      $CHAR2.                             
      @959    CPTM2_64                      $CHAR2.                             
      @961    CPTM2_65                      $CHAR2.                             
      @963    CPTM2_66                      $CHAR2.                             
      @965    CPTM2_67                      $CHAR2.                             
      @967    CPTM2_68                      $CHAR2.                             
      @969    CPTM2_69                      $CHAR2.                             
      @971    CPTM2_70                      $CHAR2.                             
      @973    CPTM2_71                      $CHAR2.                             
      @975    CPTM2_72                      $CHAR2.                             
      @977    CPTM2_73                      $CHAR2.                             
      @979    CPTM2_74                      $CHAR2.                             
      @981    CPTM2_75                      $CHAR2.                             
      @983    CPTM2_76                      $CHAR2.                             
      @985    CPTM2_77                      $CHAR2.                             
      @987    CPTM2_78                      $CHAR2.                             
      @989    CPTM2_79                      $CHAR2.                             
      @991    CPTM2_80                      $CHAR2.                             
      @993    CPTM2_81                      $CHAR2.                             
      @995    CPTM2_82                      $CHAR2.                             
      @997    DIED                          N2PF.                               
      @999    DISP_X                        $CHAR2.                             
      @1001   DISPUB04                      N2PF.                               
      @1003   DISPUNIFORM                   N2PF.                               
      @1005   DMONTH                        N2PF.                               
      @1007   DQTR                          N2PF.                               
      @1009   DX1                           $CHAR7.                             
      @1016   DX2                           $CHAR7.                             
      @1023   DX3                           $CHAR7.                             
      @1030   DX4                           $CHAR7.                             
      @1037   DX5                           $CHAR7.                             
      @1044   DX6                           $CHAR7.                             
      @1051   DX7                           $CHAR7.                             
      @1058   DX8                           $CHAR7.                             
      @1065   DX9                           $CHAR7.                             
      @1072   DX10                          $CHAR7.                             
      @1079   DX11                          $CHAR7.                             
      @1086   DX12                          $CHAR7.                             
      @1093   DX13                          $CHAR7.                             
      @1100   DX14                          $CHAR7.                             
      @1107   DX15                          $CHAR7.                             
      @1114   DX16                          $CHAR7.                             
      @1121   DX17                          $CHAR7.                             
      @1128   DX18                          $CHAR7.                             
      @1135   DX19                          $CHAR7.                             
      @1142   DX20                          $CHAR7.                             
      @1149   DX21                          $CHAR7.                             
      @1156   DX22                          $CHAR7.                             
      @1163   DX23                          $CHAR7.                             
      @1170   DX24                          $CHAR7.                             
      @1177   DX25                          $CHAR7.                             
      @1184   DX26                          $CHAR7.                             
      @1191   DX27                          $CHAR7.                             
      @1198   DX28                          $CHAR7.                             
      @1205   DXCCS1                        N4PF.                               
      @1209   DXCCS2                        N4PF.                               
      @1213   DXCCS3                        N4PF.                               
      @1217   DXCCS4                        N4PF.                               
      @1221   DXCCS5                        N4PF.                               
      @1225   DXCCS6                        N4PF.                               
      @1229   DXCCS7                        N4PF.                               
      @1233   DXCCS8                        N4PF.                               
      @1237   DXCCS9                        N4PF.                               
      @1241   DXCCS10                       N4PF.                               
      @1245   DXCCS11                       N4PF.                               
      @1249   DXCCS12                       N4PF.                               
      @1253   DXCCS13                       N4PF.                               
      @1257   DXCCS14                       N4PF.                               
      @1261   DXCCS15                       N4PF.                               
      @1265   DXCCS16                       N4PF.                               
      @1269   DXCCS17                       N4PF.                               
      @1273   DXCCS18                       N4PF.                               
      @1277   DXCCS19                       N4PF.                               
      @1281   DXCCS20                       N4PF.                               
      @1285   DXCCS21                       N4PF.                               
      @1289   DXCCS22                       N4PF.                               
      @1293   DXCCS23                       N4PF.                               
      @1297   DXCCS24                       N4PF.                               
      @1301   DXCCS25                       N4PF.                               
      @1305   DXCCS26                       N4PF.                               
      @1309   DXCCS27                       N4PF.                               
      @1313   DXCCS28                       N4PF.                               
      @1317   DXVER                         N3PF.                               
      @1320   E_CCS1                        N4PF.                               
      @1324   E_CCS2                        N4PF.                               
      @1328   E_CCS3                        N4PF.                               
      @1332   E_CCS4                        N4PF.                               
      @1336   E_CCS5                        N4PF.                               
      @1340   E_CCS6                        N4PF.                               
      @1344   E_CCS7                        N4PF.                               
      @1348   E_CCS8                        N4PF.                               
      @1352   ECODE1                        $CHAR7.                             
      @1359   ECODE2                        $CHAR7.                             
      @1366   ECODE3                        $CHAR7.                             
      @1373   ECODE4                        $CHAR7.                             
      @1380   ECODE5                        $CHAR7.                             
      @1387   ECODE6                        $CHAR7.                             
      @1394   ECODE7                        $CHAR7.                             
      @1401   ECODE8                        $CHAR7.                             
      @1408   FEMALE                        N2PF.                               
      @1410   HCUP_ED                       N2PF.                               
      @1412   HCUP_OS                       N2PF.                               
      @1414   HOSPBRTH                      N3PF.                               
      @1417   HOSPST                        $CHAR2.                             
      @1419   KEY                           15.                                 
      @1434   LOS                           N5PF.                               
      @1439   LOS_X                         N6PF.                               
      @1445   MEDINCSTQ                     N2PF.                               
      @1447   MRN_R                         N9PF.                               
      @1456   NCHRONIC                      N3PF.                               
      @1459   NCPT                          N4PF.                               
      @1463   NDX                           N3PF.                               
      @1466   NECODE                        N2PF.                               
      @1468   NEOMAT                        N2PF.                               
      @1470   NPR                           N3PF.                               
      @1473   ORPROC                        N2PF.                               
      @1475   OS_TIME                       N11P2F.                             
      @1486   PAY1                          N2PF.                               
      @1488   PAY1_X                        $CHAR2.                             
      @1490   PL_CBSA                       N3PF.                               
      @1493   PL_NCHS                       N2PF.                               
      @1495   PL_RUCC                       N2PF.                               
      @1497   PL_UIC                        N2PF.                               
      @1499   PL_UR_CAT4                    N2PF.                               
      @1501   PointOfOrigin_X               $CHAR1.                             
      @1502   PointOfOriginUB04             $CHAR1.                             
      @1503   PR1                           $CHAR7.                             
      @1510   PR2                           $CHAR7.                             
      @1517   PR3                           $CHAR7.                             
      @1524   PR4                           $CHAR7.                             
      @1531   PR5                           $CHAR7.                             
      @1538   PR6                           $CHAR7.                             
      @1545   PR7                           $CHAR7.                             
      @1552   PR8                           $CHAR7.                             
      @1559   PR9                           $CHAR7.                             
      @1566   PR10                          $CHAR7.                             
      @1573   PR11                          $CHAR7.                             
      @1580   PR12                          $CHAR7.                             
      @1587   PR13                          $CHAR7.                             
      @1594   PR14                          $CHAR7.                             
      @1601   PR15                          $CHAR7.                             
      @1608   PR16                          $CHAR7.                             
      @1615   PR17                          $CHAR7.                             
      @1622   PR18                          $CHAR7.                             
      @1629   PR19                          $CHAR7.                             
      @1636   PR20                          $CHAR7.                             
      @1643   PR21                          $CHAR7.                             
      @1650   PR22                          $CHAR7.                             
      @1657   PR23                          $CHAR7.                             
      @1664   PR24                          $CHAR7.                             
      @1671   PR25                          $CHAR7.                             
      @1678   PRCCS1                        N3PF.                               
      @1681   PRCCS2                        N3PF.                               
      @1684   PRCCS3                        N3PF.                               
      @1687   PRCCS4                        N3PF.                               
      @1690   PRCCS5                        N3PF.                               
      @1693   PRCCS6                        N3PF.                               
      @1696   PRCCS7                        N3PF.                               
      @1699   PRCCS8                        N3PF.                               
      @1702   PRCCS9                        N3PF.                               
      @1705   PRCCS10                       N3PF.                               
      @1708   PRCCS11                       N3PF.                               
      @1711   PRCCS12                       N3PF.                               
      @1714   PRCCS13                       N3PF.                               
      @1717   PRCCS14                       N3PF.                               
      @1720   PRCCS15                       N3PF.                               
      @1723   PRCCS16                       N3PF.                               
      @1726   PRCCS17                       N3PF.                               
      @1729   PRCCS18                       N3PF.                               
      @1732   PRCCS19                       N3PF.                               
      @1735   PRCCS20                       N3PF.                               
      @1738   PRCCS21                       N3PF.                               
      @1741   PRCCS22                       N3PF.                               
      @1744   PRCCS23                       N3PF.                               
      @1747   PRCCS24                       N3PF.                               
      @1750   PRCCS25                       N3PF.                               
      @1753   PRDAY1                        N5PF.                               
      @1758   PRDAY2                        N5PF.                               
      @1763   PRDAY3                        N5PF.                               
      @1768   PRDAY4                        N5PF.                               
      @1773   PRDAY5                        N5PF.                               
      @1778   PRDAY6                        N5PF.                               
      @1783   PRDAY7                        N5PF.                               
      @1788   PRDAY8                        N5PF.                               
      @1793   PRDAY9                        N5PF.                               
      @1798   PRDAY10                       N5PF.                               
      @1803   PRDAY11                       N5PF.                               
      @1808   PRDAY12                       N5PF.                               
      @1813   PRDAY13                       N5PF.                               
      @1818   PRDAY14                       N5PF.                               
      @1823   PRDAY15                       N5PF.                               
      @1828   PRDAY16                       N5PF.                               
      @1833   PRDAY17                       N5PF.                               
      @1838   PRDAY18                       N5PF.                               
      @1843   PRDAY19                       N5PF.                               
      @1848   PRDAY20                       N5PF.                               
      @1853   PRDAY21                       N5PF.                               
      @1858   PRDAY22                       N5PF.                               
      @1863   PRDAY23                       N5PF.                               
      @1868   PRDAY24                       N5PF.                               
      @1873   PRDAY25                       N5PF.                               
      @1878   PROCTYPE                      N3PF.                               
      @1881   PRVER                         N3PF.                               
      @1884   PSTATE                        $CHAR2.                             
      @1886   PSTCO2                        N5PF.                               
      @1891   RACE                          N2PF.                               
      @1893   RACE_X                        $CHAR2.                             
      @1895   STATE_AS                      N2PF.                               
      @1897   STATE_ED                      N2PF.                               
      @1899   STATE_OS                      N2PF.                               
      @1901   TOTCHG                        N10PF.                              
      @1911   TOTCHG_X                      N15P2F.                             
      @1926   YEAR                          N4PF.                               
      @1930   ZIP3                          $CHAR3.                             
      @1933   ZIPINC_QRTL                   N3PF.                               
      @1936   HOSPID                        N5PF.                               
      @1941   AGEGROUP                      N3PF.                               
      @1944   AYEAR                         N4PF.                               
      @1948   BMONTH                        N2PF.                               
      @1950   BYEAR                         N4PF.                               
      @1954   PRMONTH1                      N2PF.                               
      @1956   PRMONTH2                      N2PF.                               
      @1958   PRMONTH3                      N2PF.                               
      @1960   PRMONTH4                      N2PF.                               
      @1962   PRMONTH5                      N2PF.                               
      @1964   PRMONTH6                      N2PF.                               
      @1966   PRMONTH7                      N2PF.                               
      @1968   PRMONTH8                      N2PF.                               
      @1970   PRMONTH9                      N2PF.                               
      @1972   PRMONTH10                     N2PF.                               
      @1974   PRMONTH11                     N2PF.                               
      @1976   PRMONTH12                     N2PF.                               
      @1978   PRMONTH13                     N2PF.                               
      @1980   PRMONTH14                     N2PF.                               
      @1982   PRMONTH15                     N2PF.                               
      @1984   PRMONTH16                     N2PF.                               
      @1986   PRMONTH17                     N2PF.                               
      @1988   PRMONTH18                     N2PF.                               
      @1990   PRMONTH19                     N2PF.                               
      @1992   PRMONTH20                     N2PF.                               
      @1994   PRMONTH21                     N2PF.                               
      @1996   PRMONTH22                     N2PF.                               
      @1998   PRMONTH23                     N2PF.                               
      @2000   PRMONTH24                     N2PF.                               
      @2002   PRMONTH25                     N2PF.                               
      @2004   PRYEAR1                       N4PF.                               
      @2008   PRYEAR2                       N4PF.                               
      @2012   PRYEAR3                       N4PF.                               
      @2016   PRYEAR4                       N4PF.                               
      @2020   PRYEAR5                       N4PF.                               
      @2024   PRYEAR6                       N4PF.                               
      @2028   PRYEAR7                       N4PF.                               
      @2032   PRYEAR8                       N4PF.                               
      @2036   PRYEAR9                       N4PF.                               
      @2040   PRYEAR10                      N4PF.                               
      @2044   PRYEAR11                      N4PF.                               
      @2048   PRYEAR12                      N4PF.                               
      @2052   PRYEAR13                      N4PF.                               
      @2056   PRYEAR14                      N4PF.                               
      @2060   PRYEAR15                      N4PF.                               
      @2064   PRYEAR16                      N4PF.                               
      @2068   PRYEAR17                      N4PF.                               
      @2072   PRYEAR18                      N4PF.                               
      @2076   PRYEAR19                      N4PF.                               
      @2080   PRYEAR20                      N4PF.                               
      @2084   PRYEAR21                      N4PF.                               
      @2088   PRYEAR22                      N4PF.                               
      @2092   PRYEAR23                      N4PF.                               
      @2096   PRYEAR24                      N4PF.                               
      @2100   PRYEAR25                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
