/*******************************************************************            
* Creation Date: 07/09/2021                                                     
*   SD_SEDD_2018_CORE.SAS:                                                      
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
DATA SD_SEDDC_2018_CORE;                                                        
INFILE 'SD_SEDD_2018_CORE.ASC' FIRSTOBS=3 LRECL = 1936;                         
                                                                                
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
                                                                                
  CPT83                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 83"                                           
                                                                                
  CPT84                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 84"                                           
                                                                                
  CPT85                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 85"                                           
                                                                                
  CPT86                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 86"                                           
                                                                                
  CPT87                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 87"                                           
                                                                                
  CPT88                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 88"                                           
                                                                                
  CPT89                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 89"                                           
                                                                                
  CPT90                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 90"                                           
                                                                                
  CPT91                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 91"                                           
                                                                                
  CPT92                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 92"                                           
                                                                                
  CPT93                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 93"                                           
                                                                                
  CPT94                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 94"                                           
                                                                                
  CPT95                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 95"                                           
                                                                                
  CPT96                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 96"                                           
                                                                                
  CPT97                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 97"                                           
                                                                                
  CPT98                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 98"                                           
                                                                                
  CPT99                      LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 99"                                           
                                                                                
  CPT100                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 100"                                          
                                                                                
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
                                                                                
  CPTCCS83                   LENGTH=4                                           
  LABEL="CCS: CPT 83"                                                           
                                                                                
  CPTCCS84                   LENGTH=4                                           
  LABEL="CCS: CPT 84"                                                           
                                                                                
  CPTCCS85                   LENGTH=4                                           
  LABEL="CCS: CPT 85"                                                           
                                                                                
  CPTCCS86                   LENGTH=4                                           
  LABEL="CCS: CPT 86"                                                           
                                                                                
  CPTCCS87                   LENGTH=4                                           
  LABEL="CCS: CPT 87"                                                           
                                                                                
  CPTCCS88                   LENGTH=4                                           
  LABEL="CCS: CPT 88"                                                           
                                                                                
  CPTCCS89                   LENGTH=4                                           
  LABEL="CCS: CPT 89"                                                           
                                                                                
  CPTCCS90                   LENGTH=4                                           
  LABEL="CCS: CPT 90"                                                           
                                                                                
  CPTCCS91                   LENGTH=4                                           
  LABEL="CCS: CPT 91"                                                           
                                                                                
  CPTCCS92                   LENGTH=4                                           
  LABEL="CCS: CPT 92"                                                           
                                                                                
  CPTCCS93                   LENGTH=4                                           
  LABEL="CCS: CPT 93"                                                           
                                                                                
  CPTCCS94                   LENGTH=4                                           
  LABEL="CCS: CPT 94"                                                           
                                                                                
  CPTCCS95                   LENGTH=4                                           
  LABEL="CCS: CPT 95"                                                           
                                                                                
  CPTCCS96                   LENGTH=4                                           
  LABEL="CCS: CPT 96"                                                           
                                                                                
  CPTCCS97                   LENGTH=4                                           
  LABEL="CCS: CPT 97"                                                           
                                                                                
  CPTCCS98                   LENGTH=4                                           
  LABEL="CCS: CPT 98"                                                           
                                                                                
  CPTCCS99                   LENGTH=4                                           
  LABEL="CCS: CPT 99"                                                           
                                                                                
  CPTCCS100                  LENGTH=4                                           
  LABEL="CCS: CPT 100"                                                          
                                                                                
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
                                                                                
  CPTDAY77                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT77"                                
                                                                                
  CPTDAY78                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT78"                                
                                                                                
  CPTDAY79                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT79"                                
                                                                                
  CPTDAY80                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT80"                                
                                                                                
  CPTDAY81                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT81"                                
                                                                                
  CPTDAY82                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT82"                                
                                                                                
  CPTDAY83                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT83"                                
                                                                                
  CPTDAY84                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT84"                                
                                                                                
  CPTDAY85                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT85"                                
                                                                                
  CPTDAY86                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT86"                                
                                                                                
  CPTDAY87                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT87"                                
                                                                                
  CPTDAY88                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT88"                                
                                                                                
  CPTDAY89                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT89"                                
                                                                                
  CPTDAY90                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT90"                                
                                                                                
  CPTDAY91                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT91"                                
                                                                                
  CPTDAY92                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT92"                                
                                                                                
  CPTDAY93                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT93"                                
                                                                                
  CPTDAY94                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT94"                                
                                                                                
  CPTDAY95                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT95"                                
                                                                                
  CPTDAY96                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT96"                                
                                                                                
  CPTDAY97                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT97"                                
                                                                                
  CPTDAY98                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT98"                                
                                                                                
  CPTDAY99                   LENGTH=4                                           
  LABEL="Number of days from admission to CPT99"                                
                                                                                
  CPTDAY100                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT100"                               
                                                                                
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
                                                                                
  CPTM1_83                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 83"                                         
                                                                                
  CPTM1_84                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 84"                                         
                                                                                
  CPTM1_85                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 85"                                         
                                                                                
  CPTM1_86                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 86"                                         
                                                                                
  CPTM1_87                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 87"                                         
                                                                                
  CPTM1_88                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 88"                                         
                                                                                
  CPTM1_89                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 89"                                         
                                                                                
  CPTM1_90                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 90"                                         
                                                                                
  CPTM1_91                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 91"                                         
                                                                                
  CPTM1_92                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 92"                                         
                                                                                
  CPTM1_93                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 93"                                         
                                                                                
  CPTM1_94                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 94"                                         
                                                                                
  CPTM1_95                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 95"                                         
                                                                                
  CPTM1_96                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 96"                                         
                                                                                
  CPTM1_97                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 97"                                         
                                                                                
  CPTM1_98                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 98"                                         
                                                                                
  CPTM1_99                   LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 99"                                         
                                                                                
  CPTM1_100                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 100"                                        
                                                                                
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
                                                                                
  CPTM2_83                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 83"                                        
                                                                                
  CPTM2_84                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 84"                                        
                                                                                
  CPTM2_85                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 85"                                        
                                                                                
  CPTM2_86                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 86"                                        
                                                                                
  CPTM2_87                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 87"                                        
                                                                                
  CPTM2_88                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 88"                                        
                                                                                
  CPTM2_89                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 89"                                        
                                                                                
  CPTM2_90                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 90"                                        
                                                                                
  CPTM2_91                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 91"                                        
                                                                                
  CPTM2_92                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 92"                                        
                                                                                
  CPTM2_93                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 93"                                        
                                                                                
  CPTM2_94                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 94"                                        
                                                                                
  CPTM2_95                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 95"                                        
                                                                                
  CPTM2_96                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 96"                                        
                                                                                
  CPTM2_97                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 97"                                        
                                                                                
  CPTM2_98                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 98"                                        
                                                                                
  CPTM2_99                   LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 99"                                        
                                                                                
  CPTM2_100                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 100"                                       
                                                                                
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
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_NCHS                    LENGTH=3                                           
  LABEL="Patient Location: NCHS Urban-Rural Code"                               
                                                                                
  PL_RUCC                    LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Continuum Codes (RUCC)"                  
                                                                                
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
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  ZIP                        LENGTH=$5                                          
  LABEL="Patient ZIP Code"                                                      
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  HOSPID                     LENGTH=4                      FORMAT=Z5.           
  LABEL="HCUP hospital identification number"                                   
                                                                                
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
      @396    CPT77                         $CHAR5.                             
      @401    CPT78                         $CHAR5.                             
      @406    CPT79                         $CHAR5.                             
      @411    CPT80                         $CHAR5.                             
      @416    CPT81                         $CHAR5.                             
      @421    CPT82                         $CHAR5.                             
      @426    CPT83                         $CHAR5.                             
      @431    CPT84                         $CHAR5.                             
      @436    CPT85                         $CHAR5.                             
      @441    CPT86                         $CHAR5.                             
      @446    CPT87                         $CHAR5.                             
      @451    CPT88                         $CHAR5.                             
      @456    CPT89                         $CHAR5.                             
      @461    CPT90                         $CHAR5.                             
      @466    CPT91                         $CHAR5.                             
      @471    CPT92                         $CHAR5.                             
      @476    CPT93                         $CHAR5.                             
      @481    CPT94                         $CHAR5.                             
      @486    CPT95                         $CHAR5.                             
      @491    CPT96                         $CHAR5.                             
      @496    CPT97                         $CHAR5.                             
      @501    CPT98                         $CHAR5.                             
      @506    CPT99                         $CHAR5.                             
      @511    CPT100                        $CHAR5.                             
      @516    CPTCCS1                       N3PF.                               
      @519    CPTCCS2                       N3PF.                               
      @522    CPTCCS3                       N3PF.                               
      @525    CPTCCS4                       N3PF.                               
      @528    CPTCCS5                       N3PF.                               
      @531    CPTCCS6                       N3PF.                               
      @534    CPTCCS7                       N3PF.                               
      @537    CPTCCS8                       N3PF.                               
      @540    CPTCCS9                       N3PF.                               
      @543    CPTCCS10                      N3PF.                               
      @546    CPTCCS11                      N3PF.                               
      @549    CPTCCS12                      N3PF.                               
      @552    CPTCCS13                      N3PF.                               
      @555    CPTCCS14                      N3PF.                               
      @558    CPTCCS15                      N3PF.                               
      @561    CPTCCS16                      N3PF.                               
      @564    CPTCCS17                      N3PF.                               
      @567    CPTCCS18                      N3PF.                               
      @570    CPTCCS19                      N3PF.                               
      @573    CPTCCS20                      N3PF.                               
      @576    CPTCCS21                      N3PF.                               
      @579    CPTCCS22                      N3PF.                               
      @582    CPTCCS23                      N3PF.                               
      @585    CPTCCS24                      N3PF.                               
      @588    CPTCCS25                      N3PF.                               
      @591    CPTCCS26                      N3PF.                               
      @594    CPTCCS27                      N3PF.                               
      @597    CPTCCS28                      N3PF.                               
      @600    CPTCCS29                      N3PF.                               
      @603    CPTCCS30                      N3PF.                               
      @606    CPTCCS31                      N3PF.                               
      @609    CPTCCS32                      N3PF.                               
      @612    CPTCCS33                      N3PF.                               
      @615    CPTCCS34                      N3PF.                               
      @618    CPTCCS35                      N3PF.                               
      @621    CPTCCS36                      N3PF.                               
      @624    CPTCCS37                      N3PF.                               
      @627    CPTCCS38                      N3PF.                               
      @630    CPTCCS39                      N3PF.                               
      @633    CPTCCS40                      N3PF.                               
      @636    CPTCCS41                      N3PF.                               
      @639    CPTCCS42                      N3PF.                               
      @642    CPTCCS43                      N3PF.                               
      @645    CPTCCS44                      N3PF.                               
      @648    CPTCCS45                      N3PF.                               
      @651    CPTCCS46                      N3PF.                               
      @654    CPTCCS47                      N3PF.                               
      @657    CPTCCS48                      N3PF.                               
      @660    CPTCCS49                      N3PF.                               
      @663    CPTCCS50                      N3PF.                               
      @666    CPTCCS51                      N3PF.                               
      @669    CPTCCS52                      N3PF.                               
      @672    CPTCCS53                      N3PF.                               
      @675    CPTCCS54                      N3PF.                               
      @678    CPTCCS55                      N3PF.                               
      @681    CPTCCS56                      N3PF.                               
      @684    CPTCCS57                      N3PF.                               
      @687    CPTCCS58                      N3PF.                               
      @690    CPTCCS59                      N3PF.                               
      @693    CPTCCS60                      N3PF.                               
      @696    CPTCCS61                      N3PF.                               
      @699    CPTCCS62                      N3PF.                               
      @702    CPTCCS63                      N3PF.                               
      @705    CPTCCS64                      N3PF.                               
      @708    CPTCCS65                      N3PF.                               
      @711    CPTCCS66                      N3PF.                               
      @714    CPTCCS67                      N3PF.                               
      @717    CPTCCS68                      N3PF.                               
      @720    CPTCCS69                      N3PF.                               
      @723    CPTCCS70                      N3PF.                               
      @726    CPTCCS71                      N3PF.                               
      @729    CPTCCS72                      N3PF.                               
      @732    CPTCCS73                      N3PF.                               
      @735    CPTCCS74                      N3PF.                               
      @738    CPTCCS75                      N3PF.                               
      @741    CPTCCS76                      N3PF.                               
      @744    CPTCCS77                      N3PF.                               
      @747    CPTCCS78                      N3PF.                               
      @750    CPTCCS79                      N3PF.                               
      @753    CPTCCS80                      N3PF.                               
      @756    CPTCCS81                      N3PF.                               
      @759    CPTCCS82                      N3PF.                               
      @762    CPTCCS83                      N3PF.                               
      @765    CPTCCS84                      N3PF.                               
      @768    CPTCCS85                      N3PF.                               
      @771    CPTCCS86                      N3PF.                               
      @774    CPTCCS87                      N3PF.                               
      @777    CPTCCS88                      N3PF.                               
      @780    CPTCCS89                      N3PF.                               
      @783    CPTCCS90                      N3PF.                               
      @786    CPTCCS91                      N3PF.                               
      @789    CPTCCS92                      N3PF.                               
      @792    CPTCCS93                      N3PF.                               
      @795    CPTCCS94                      N3PF.                               
      @798    CPTCCS95                      N3PF.                               
      @801    CPTCCS96                      N3PF.                               
      @804    CPTCCS97                      N3PF.                               
      @807    CPTCCS98                      N3PF.                               
      @810    CPTCCS99                      N3PF.                               
      @813    CPTCCS100                     N3PF.                               
      @816    CPTDAY1                       N3PF.                               
      @819    CPTDAY2                       N3PF.                               
      @822    CPTDAY3                       N3PF.                               
      @825    CPTDAY4                       N3PF.                               
      @828    CPTDAY5                       N3PF.                               
      @831    CPTDAY6                       N3PF.                               
      @834    CPTDAY7                       N3PF.                               
      @837    CPTDAY8                       N3PF.                               
      @840    CPTDAY9                       N3PF.                               
      @843    CPTDAY10                      N3PF.                               
      @846    CPTDAY11                      N3PF.                               
      @849    CPTDAY12                      N3PF.                               
      @852    CPTDAY13                      N3PF.                               
      @855    CPTDAY14                      N3PF.                               
      @858    CPTDAY15                      N3PF.                               
      @861    CPTDAY16                      N3PF.                               
      @864    CPTDAY17                      N3PF.                               
      @867    CPTDAY18                      N3PF.                               
      @870    CPTDAY19                      N3PF.                               
      @873    CPTDAY20                      N3PF.                               
      @876    CPTDAY21                      N3PF.                               
      @879    CPTDAY22                      N3PF.                               
      @882    CPTDAY23                      N3PF.                               
      @885    CPTDAY24                      N3PF.                               
      @888    CPTDAY25                      N3PF.                               
      @891    CPTDAY26                      N3PF.                               
      @894    CPTDAY27                      N3PF.                               
      @897    CPTDAY28                      N3PF.                               
      @900    CPTDAY29                      N3PF.                               
      @903    CPTDAY30                      N3PF.                               
      @906    CPTDAY31                      N3PF.                               
      @909    CPTDAY32                      N3PF.                               
      @912    CPTDAY33                      N3PF.                               
      @915    CPTDAY34                      N3PF.                               
      @918    CPTDAY35                      N3PF.                               
      @921    CPTDAY36                      N3PF.                               
      @924    CPTDAY37                      N3PF.                               
      @927    CPTDAY38                      N3PF.                               
      @930    CPTDAY39                      N3PF.                               
      @933    CPTDAY40                      N3PF.                               
      @936    CPTDAY41                      N3PF.                               
      @939    CPTDAY42                      N3PF.                               
      @942    CPTDAY43                      N3PF.                               
      @945    CPTDAY44                      N3PF.                               
      @948    CPTDAY45                      N3PF.                               
      @951    CPTDAY46                      N3PF.                               
      @954    CPTDAY47                      N3PF.                               
      @957    CPTDAY48                      N3PF.                               
      @960    CPTDAY49                      N3PF.                               
      @963    CPTDAY50                      N3PF.                               
      @966    CPTDAY51                      N3PF.                               
      @969    CPTDAY52                      N3PF.                               
      @972    CPTDAY53                      N3PF.                               
      @975    CPTDAY54                      N3PF.                               
      @978    CPTDAY55                      N3PF.                               
      @981    CPTDAY56                      N3PF.                               
      @984    CPTDAY57                      N3PF.                               
      @987    CPTDAY58                      N3PF.                               
      @990    CPTDAY59                      N3PF.                               
      @993    CPTDAY60                      N3PF.                               
      @996    CPTDAY61                      N3PF.                               
      @999    CPTDAY62                      N3PF.                               
      @1002   CPTDAY63                      N3PF.                               
      @1005   CPTDAY64                      N3PF.                               
      @1008   CPTDAY65                      N3PF.                               
      @1011   CPTDAY66                      N3PF.                               
      @1014   CPTDAY67                      N3PF.                               
      @1017   CPTDAY68                      N3PF.                               
      @1020   CPTDAY69                      N3PF.                               
      @1023   CPTDAY70                      N3PF.                               
      @1026   CPTDAY71                      N3PF.                               
      @1029   CPTDAY72                      N3PF.                               
      @1032   CPTDAY73                      N3PF.                               
      @1035   CPTDAY74                      N3PF.                               
      @1038   CPTDAY75                      N3PF.                               
      @1041   CPTDAY76                      N3PF.                               
      @1044   CPTDAY77                      N3PF.                               
      @1047   CPTDAY78                      N3PF.                               
      @1050   CPTDAY79                      N3PF.                               
      @1053   CPTDAY80                      N3PF.                               
      @1056   CPTDAY81                      N3PF.                               
      @1059   CPTDAY82                      N3PF.                               
      @1062   CPTDAY83                      N3PF.                               
      @1065   CPTDAY84                      N3PF.                               
      @1068   CPTDAY85                      N3PF.                               
      @1071   CPTDAY86                      N3PF.                               
      @1074   CPTDAY87                      N3PF.                               
      @1077   CPTDAY88                      N3PF.                               
      @1080   CPTDAY89                      N3PF.                               
      @1083   CPTDAY90                      N3PF.                               
      @1086   CPTDAY91                      N3PF.                               
      @1089   CPTDAY92                      N3PF.                               
      @1092   CPTDAY93                      N3PF.                               
      @1095   CPTDAY94                      N3PF.                               
      @1098   CPTDAY95                      N3PF.                               
      @1101   CPTDAY96                      N3PF.                               
      @1104   CPTDAY97                      N3PF.                               
      @1107   CPTDAY98                      N3PF.                               
      @1110   CPTDAY99                      N3PF.                               
      @1113   CPTDAY100                     N3PF.                               
      @1116   CPTM1_1                       $CHAR2.                             
      @1118   CPTM1_2                       $CHAR2.                             
      @1120   CPTM1_3                       $CHAR2.                             
      @1122   CPTM1_4                       $CHAR2.                             
      @1124   CPTM1_5                       $CHAR2.                             
      @1126   CPTM1_6                       $CHAR2.                             
      @1128   CPTM1_7                       $CHAR2.                             
      @1130   CPTM1_8                       $CHAR2.                             
      @1132   CPTM1_9                       $CHAR2.                             
      @1134   CPTM1_10                      $CHAR2.                             
      @1136   CPTM1_11                      $CHAR2.                             
      @1138   CPTM1_12                      $CHAR2.                             
      @1140   CPTM1_13                      $CHAR2.                             
      @1142   CPTM1_14                      $CHAR2.                             
      @1144   CPTM1_15                      $CHAR2.                             
      @1146   CPTM1_16                      $CHAR2.                             
      @1148   CPTM1_17                      $CHAR2.                             
      @1150   CPTM1_18                      $CHAR2.                             
      @1152   CPTM1_19                      $CHAR2.                             
      @1154   CPTM1_20                      $CHAR2.                             
      @1156   CPTM1_21                      $CHAR2.                             
      @1158   CPTM1_22                      $CHAR2.                             
      @1160   CPTM1_23                      $CHAR2.                             
      @1162   CPTM1_24                      $CHAR2.                             
      @1164   CPTM1_25                      $CHAR2.                             
      @1166   CPTM1_26                      $CHAR2.                             
      @1168   CPTM1_27                      $CHAR2.                             
      @1170   CPTM1_28                      $CHAR2.                             
      @1172   CPTM1_29                      $CHAR2.                             
      @1174   CPTM1_30                      $CHAR2.                             
      @1176   CPTM1_31                      $CHAR2.                             
      @1178   CPTM1_32                      $CHAR2.                             
      @1180   CPTM1_33                      $CHAR2.                             
      @1182   CPTM1_34                      $CHAR2.                             
      @1184   CPTM1_35                      $CHAR2.                             
      @1186   CPTM1_36                      $CHAR2.                             
      @1188   CPTM1_37                      $CHAR2.                             
      @1190   CPTM1_38                      $CHAR2.                             
      @1192   CPTM1_39                      $CHAR2.                             
      @1194   CPTM1_40                      $CHAR2.                             
      @1196   CPTM1_41                      $CHAR2.                             
      @1198   CPTM1_42                      $CHAR2.                             
      @1200   CPTM1_43                      $CHAR2.                             
      @1202   CPTM1_44                      $CHAR2.                             
      @1204   CPTM1_45                      $CHAR2.                             
      @1206   CPTM1_46                      $CHAR2.                             
      @1208   CPTM1_47                      $CHAR2.                             
      @1210   CPTM1_48                      $CHAR2.                             
      @1212   CPTM1_49                      $CHAR2.                             
      @1214   CPTM1_50                      $CHAR2.                             
      @1216   CPTM1_51                      $CHAR2.                             
      @1218   CPTM1_52                      $CHAR2.                             
      @1220   CPTM1_53                      $CHAR2.                             
      @1222   CPTM1_54                      $CHAR2.                             
      @1224   CPTM1_55                      $CHAR2.                             
      @1226   CPTM1_56                      $CHAR2.                             
      @1228   CPTM1_57                      $CHAR2.                             
      @1230   CPTM1_58                      $CHAR2.                             
      @1232   CPTM1_59                      $CHAR2.                             
      @1234   CPTM1_60                      $CHAR2.                             
      @1236   CPTM1_61                      $CHAR2.                             
      @1238   CPTM1_62                      $CHAR2.                             
      @1240   CPTM1_63                      $CHAR2.                             
      @1242   CPTM1_64                      $CHAR2.                             
      @1244   CPTM1_65                      $CHAR2.                             
      @1246   CPTM1_66                      $CHAR2.                             
      @1248   CPTM1_67                      $CHAR2.                             
      @1250   CPTM1_68                      $CHAR2.                             
      @1252   CPTM1_69                      $CHAR2.                             
      @1254   CPTM1_70                      $CHAR2.                             
      @1256   CPTM1_71                      $CHAR2.                             
      @1258   CPTM1_72                      $CHAR2.                             
      @1260   CPTM1_73                      $CHAR2.                             
      @1262   CPTM1_74                      $CHAR2.                             
      @1264   CPTM1_75                      $CHAR2.                             
      @1266   CPTM1_76                      $CHAR2.                             
      @1268   CPTM1_77                      $CHAR2.                             
      @1270   CPTM1_78                      $CHAR2.                             
      @1272   CPTM1_79                      $CHAR2.                             
      @1274   CPTM1_80                      $CHAR2.                             
      @1276   CPTM1_81                      $CHAR2.                             
      @1278   CPTM1_82                      $CHAR2.                             
      @1280   CPTM1_83                      $CHAR2.                             
      @1282   CPTM1_84                      $CHAR2.                             
      @1284   CPTM1_85                      $CHAR2.                             
      @1286   CPTM1_86                      $CHAR2.                             
      @1288   CPTM1_87                      $CHAR2.                             
      @1290   CPTM1_88                      $CHAR2.                             
      @1292   CPTM1_89                      $CHAR2.                             
      @1294   CPTM1_90                      $CHAR2.                             
      @1296   CPTM1_91                      $CHAR2.                             
      @1298   CPTM1_92                      $CHAR2.                             
      @1300   CPTM1_93                      $CHAR2.                             
      @1302   CPTM1_94                      $CHAR2.                             
      @1304   CPTM1_95                      $CHAR2.                             
      @1306   CPTM1_96                      $CHAR2.                             
      @1308   CPTM1_97                      $CHAR2.                             
      @1310   CPTM1_98                      $CHAR2.                             
      @1312   CPTM1_99                      $CHAR2.                             
      @1314   CPTM1_100                     $CHAR2.                             
      @1316   CPTM2_1                       $CHAR2.                             
      @1318   CPTM2_2                       $CHAR2.                             
      @1320   CPTM2_3                       $CHAR2.                             
      @1322   CPTM2_4                       $CHAR2.                             
      @1324   CPTM2_5                       $CHAR2.                             
      @1326   CPTM2_6                       $CHAR2.                             
      @1328   CPTM2_7                       $CHAR2.                             
      @1330   CPTM2_8                       $CHAR2.                             
      @1332   CPTM2_9                       $CHAR2.                             
      @1334   CPTM2_10                      $CHAR2.                             
      @1336   CPTM2_11                      $CHAR2.                             
      @1338   CPTM2_12                      $CHAR2.                             
      @1340   CPTM2_13                      $CHAR2.                             
      @1342   CPTM2_14                      $CHAR2.                             
      @1344   CPTM2_15                      $CHAR2.                             
      @1346   CPTM2_16                      $CHAR2.                             
      @1348   CPTM2_17                      $CHAR2.                             
      @1350   CPTM2_18                      $CHAR2.                             
      @1352   CPTM2_19                      $CHAR2.                             
      @1354   CPTM2_20                      $CHAR2.                             
      @1356   CPTM2_21                      $CHAR2.                             
      @1358   CPTM2_22                      $CHAR2.                             
      @1360   CPTM2_23                      $CHAR2.                             
      @1362   CPTM2_24                      $CHAR2.                             
      @1364   CPTM2_25                      $CHAR2.                             
      @1366   CPTM2_26                      $CHAR2.                             
      @1368   CPTM2_27                      $CHAR2.                             
      @1370   CPTM2_28                      $CHAR2.                             
      @1372   CPTM2_29                      $CHAR2.                             
      @1374   CPTM2_30                      $CHAR2.                             
      @1376   CPTM2_31                      $CHAR2.                             
      @1378   CPTM2_32                      $CHAR2.                             
      @1380   CPTM2_33                      $CHAR2.                             
      @1382   CPTM2_34                      $CHAR2.                             
      @1384   CPTM2_35                      $CHAR2.                             
      @1386   CPTM2_36                      $CHAR2.                             
      @1388   CPTM2_37                      $CHAR2.                             
      @1390   CPTM2_38                      $CHAR2.                             
      @1392   CPTM2_39                      $CHAR2.                             
      @1394   CPTM2_40                      $CHAR2.                             
      @1396   CPTM2_41                      $CHAR2.                             
      @1398   CPTM2_42                      $CHAR2.                             
      @1400   CPTM2_43                      $CHAR2.                             
      @1402   CPTM2_44                      $CHAR2.                             
      @1404   CPTM2_45                      $CHAR2.                             
      @1406   CPTM2_46                      $CHAR2.                             
      @1408   CPTM2_47                      $CHAR2.                             
      @1410   CPTM2_48                      $CHAR2.                             
      @1412   CPTM2_49                      $CHAR2.                             
      @1414   CPTM2_50                      $CHAR2.                             
      @1416   CPTM2_51                      $CHAR2.                             
      @1418   CPTM2_52                      $CHAR2.                             
      @1420   CPTM2_53                      $CHAR2.                             
      @1422   CPTM2_54                      $CHAR2.                             
      @1424   CPTM2_55                      $CHAR2.                             
      @1426   CPTM2_56                      $CHAR2.                             
      @1428   CPTM2_57                      $CHAR2.                             
      @1430   CPTM2_58                      $CHAR2.                             
      @1432   CPTM2_59                      $CHAR2.                             
      @1434   CPTM2_60                      $CHAR2.                             
      @1436   CPTM2_61                      $CHAR2.                             
      @1438   CPTM2_62                      $CHAR2.                             
      @1440   CPTM2_63                      $CHAR2.                             
      @1442   CPTM2_64                      $CHAR2.                             
      @1444   CPTM2_65                      $CHAR2.                             
      @1446   CPTM2_66                      $CHAR2.                             
      @1448   CPTM2_67                      $CHAR2.                             
      @1450   CPTM2_68                      $CHAR2.                             
      @1452   CPTM2_69                      $CHAR2.                             
      @1454   CPTM2_70                      $CHAR2.                             
      @1456   CPTM2_71                      $CHAR2.                             
      @1458   CPTM2_72                      $CHAR2.                             
      @1460   CPTM2_73                      $CHAR2.                             
      @1462   CPTM2_74                      $CHAR2.                             
      @1464   CPTM2_75                      $CHAR2.                             
      @1466   CPTM2_76                      $CHAR2.                             
      @1468   CPTM2_77                      $CHAR2.                             
      @1470   CPTM2_78                      $CHAR2.                             
      @1472   CPTM2_79                      $CHAR2.                             
      @1474   CPTM2_80                      $CHAR2.                             
      @1476   CPTM2_81                      $CHAR2.                             
      @1478   CPTM2_82                      $CHAR2.                             
      @1480   CPTM2_83                      $CHAR2.                             
      @1482   CPTM2_84                      $CHAR2.                             
      @1484   CPTM2_85                      $CHAR2.                             
      @1486   CPTM2_86                      $CHAR2.                             
      @1488   CPTM2_87                      $CHAR2.                             
      @1490   CPTM2_88                      $CHAR2.                             
      @1492   CPTM2_89                      $CHAR2.                             
      @1494   CPTM2_90                      $CHAR2.                             
      @1496   CPTM2_91                      $CHAR2.                             
      @1498   CPTM2_92                      $CHAR2.                             
      @1500   CPTM2_93                      $CHAR2.                             
      @1502   CPTM2_94                      $CHAR2.                             
      @1504   CPTM2_95                      $CHAR2.                             
      @1506   CPTM2_96                      $CHAR2.                             
      @1508   CPTM2_97                      $CHAR2.                             
      @1510   CPTM2_98                      $CHAR2.                             
      @1512   CPTM2_99                      $CHAR2.                             
      @1514   CPTM2_100                     $CHAR2.                             
      @1516   DIED                          N2PF.                               
      @1518   DISP_X                        $CHAR2.                             
      @1520   DISPUB04                      N2PF.                               
      @1522   DISPUNIFORM                   N2PF.                               
      @1524   DMONTH                        N2PF.                               
      @1526   DQTR                          N2PF.                               
      @1528   FEMALE                        N2PF.                               
      @1530   HCUP_ED                       N2PF.                               
      @1532   HCUP_OS                       N2PF.                               
      @1534   HISPANIC                      N2PF.                               
      @1536   HISPANIC_X                    $CHAR1.                             
      @1537   HOSPST                        $CHAR2.                             
      @1539   I10_DX_Visit_Reason1          $CHAR7.                             
      @1546   I10_DX_Visit_Reason2          $CHAR7.                             
      @1553   I10_DX_Visit_Reason3          $CHAR7.                             
      @1560   I10_DX1                       $CHAR7.                             
      @1567   I10_DX2                       $CHAR7.                             
      @1574   I10_DX3                       $CHAR7.                             
      @1581   I10_DX4                       $CHAR7.                             
      @1588   I10_DX5                       $CHAR7.                             
      @1595   I10_DX6                       $CHAR7.                             
      @1602   I10_DX7                       $CHAR7.                             
      @1609   I10_DX8                       $CHAR7.                             
      @1616   I10_DX9                       $CHAR7.                             
      @1623   I10_DX10                      $CHAR7.                             
      @1630   I10_DX11                      $CHAR7.                             
      @1637   I10_DX12                      $CHAR7.                             
      @1644   I10_DX13                      $CHAR7.                             
      @1651   I10_DX14                      $CHAR7.                             
      @1658   I10_DX15                      $CHAR7.                             
      @1665   I10_DX16                      $CHAR7.                             
      @1672   I10_DX17                      $CHAR7.                             
      @1679   I10_DX18                      $CHAR7.                             
      @1686   I10_DX19                      $CHAR7.                             
      @1693   I10_DX20                      $CHAR7.                             
      @1700   I10_DX21                      $CHAR7.                             
      @1707   I10_DX22                      $CHAR7.                             
      @1714   I10_DX23                      $CHAR7.                             
      @1721   I10_DX24                      $CHAR7.                             
      @1728   I10_DX25                      $CHAR7.                             
      @1735   I10_DX26                      $CHAR7.                             
      @1742   I10_DX27                      $CHAR7.                             
      @1749   I10_DX28                      $CHAR7.                             
      @1756   I10_NDX                       N3PF.                               
      @1759   I10_PROCTYPE                  N3PF.                               
      @1762   KEY                           15.                                 
      @1777   LOS                           N5PF.                               
      @1782   LOS_X                         N6PF.                               
      @1788   MDNUM1_R                      N9PF.                               
      @1797   MDNUM2_R                      N9PF.                               
      @1806   MDNUM3_R                      N9PF.                               
      @1815   MEDINCSTQ                     N2PF.                               
      @1817   MRN_R                         N9PF.                               
      @1826   NCPT                          N4PF.                               
      @1830   OPservice                     $CHAR5.                             
      @1835   OS_TIME                       N11P2F.                             
      @1846   PAY1                          N2PF.                               
      @1848   PL_CBSA                       N3PF.                               
      @1851   PL_NCHS                       N2PF.                               
      @1853   PL_RUCC                       N2PF.                               
      @1855   PL_UIC                        N2PF.                               
      @1857   PL_UR_CAT4                    N2PF.                               
      @1859   PointOfOrigin_X               $CHAR1.                             
      @1860   PointOfOriginUB04             $CHAR1.                             
      @1861   PSTATE                        $CHAR2.                             
      @1863   PSTCO                         N5PF.                               
      @1868   PSTCO2                        N5PF.                               
      @1873   RACE                          N2PF.                               
      @1875   RACE_X                        $CHAR1.                             
      @1876   STATE_AS                      N2PF.                               
      @1878   STATE_ED                      N2PF.                               
      @1880   STATE_OS                      N2PF.                               
      @1882   TOTCHG                        N10PF.                              
      @1892   TOTCHG_X                      N15P2F.                             
      @1907   YEAR                          N4PF.                               
      @1911   ZIP                           $CHAR5.                             
      @1916   ZIP3                          $CHAR3.                             
      @1919   ZIPINC_QRTL                   N3PF.                               
      @1922   HOSPID                        N5PF.                               
      @1927   AYEAR                         N4PF.                               
      @1931   BMONTH                        N2PF.                               
      @1933   BYEAR                         N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
