/*******************************************************************            
* Creation Date: 02/26/2019                                                     
*   GA_SID_2017_CORE.SAS:                                                       
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
DATA GA_SIDC_2017_CORE;                                                         
INFILE 'GA_SID_2017_CORE.ASC' FIRSTOBS=3 LRECL = 3563;                          
                                                                                
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
                                                                                
  DRG                        LENGTH=3                                           
  LABEL="DRG in effect on discharge date"                                       
                                                                                
  DRG_NoPOA                  LENGTH=3                                           
  LABEL="DRG in use on discharge date, calculated without POA"                  
                                                                                
  DRGVER                     LENGTH=3                                           
  LABEL="DRG grouper version used on discharge date"                            
                                                                                
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
                                                                                
  DXPOA46                    LENGTH=$1                                          
  LABEL="Diagnosis 46, present on admission indicator"                          
                                                                                
  DXPOA47                    LENGTH=$1                                          
  LABEL="Diagnosis 47, present on admission indicator"                          
                                                                                
  DXPOA48                    LENGTH=$1                                          
  LABEL="Diagnosis 48, present on admission indicator"                          
                                                                                
  DXPOA49                    LENGTH=$1                                          
  LABEL="Diagnosis 49, present on admission indicator"                          
                                                                                
  DXPOA50                    LENGTH=$1                                          
  LABEL="Diagnosis 50, present on admission indicator"                          
                                                                                
  DXPOA51                    LENGTH=$1                                          
  LABEL="Diagnosis 51, present on admission indicator"                          
                                                                                
  DXPOA52                    LENGTH=$1                                          
  LABEL="Diagnosis 52, present on admission indicator"                          
                                                                                
  DXPOA53                    LENGTH=$1                                          
  LABEL="Diagnosis 53, present on admission indicator"                          
                                                                                
  DXPOA54                    LENGTH=$1                                          
  LABEL="Diagnosis 54, present on admission indicator"                          
                                                                                
  DXPOA55                    LENGTH=$1                                          
  LABEL="Diagnosis 55, present on admission indicator"                          
                                                                                
  DXPOA56                    LENGTH=$1                                          
  LABEL="Diagnosis 56, present on admission indicator"                          
                                                                                
  DXPOA57                    LENGTH=$1                                          
  LABEL="Diagnosis 57, present on admission indicator"                          
                                                                                
  DXPOA58                    LENGTH=$1                                          
  LABEL="Diagnosis 58, present on admission indicator"                          
                                                                                
  DXPOA59                    LENGTH=$1                                          
  LABEL="Diagnosis 59, present on admission indicator"                          
                                                                                
  DXPOA60                    LENGTH=$1                                          
  LABEL="Diagnosis 60, present on admission indicator"                          
                                                                                
  DXPOA61                    LENGTH=$1                                          
  LABEL="Diagnosis 61, present on admission indicator"                          
                                                                                
  DXPOA62                    LENGTH=$1                                          
  LABEL="Diagnosis 62, present on admission indicator"                          
                                                                                
  DXPOA63                    LENGTH=$1                                          
  LABEL="Diagnosis 63, present on admission indicator"                          
                                                                                
  DXPOA64                    LENGTH=$1                                          
  LABEL="Diagnosis 64, present on admission indicator"                          
                                                                                
  DXPOA65                    LENGTH=$1                                          
  LABEL="Diagnosis 65, present on admission indicator"                          
                                                                                
  DXPOA66                    LENGTH=$1                                          
  LABEL="Diagnosis 66, present on admission indicator"                          
                                                                                
  DXPOA67                    LENGTH=$1                                          
  LABEL="Diagnosis 67, present on admission indicator"                          
                                                                                
  DXPOA68                    LENGTH=$1                                          
  LABEL="Diagnosis 68, present on admission indicator"                          
                                                                                
  DXPOA69                    LENGTH=$1                                          
  LABEL="Diagnosis 69, present on admission indicator"                          
                                                                                
  DXPOA70                    LENGTH=$1                                          
  LABEL="Diagnosis 70, present on admission indicator"                          
                                                                                
  DXPOA71                    LENGTH=$1                                          
  LABEL="Diagnosis 71, present on admission indicator"                          
                                                                                
  DXPOA72                    LENGTH=$1                                          
  LABEL="Diagnosis 72, present on admission indicator"                          
                                                                                
  DXPOA73                    LENGTH=$1                                          
  LABEL="Diagnosis 73, present on admission indicator"                          
                                                                                
  DXPOA74                    LENGTH=$1                                          
  LABEL="Diagnosis 74, present on admission indicator"                          
                                                                                
  DXPOA75                    LENGTH=$1                                          
  LABEL="Diagnosis 75, present on admission indicator"                          
                                                                                
  DXPOA76                    LENGTH=$1                                          
  LABEL="Diagnosis 76, present on admission indicator"                          
                                                                                
  DXPOA77                    LENGTH=$1                                          
  LABEL="Diagnosis 77, present on admission indicator"                          
                                                                                
  DXPOA78                    LENGTH=$1                                          
  LABEL="Diagnosis 78, present on admission indicator"                          
                                                                                
  DXPOA79                    LENGTH=$1                                          
  LABEL="Diagnosis 79, present on admission indicator"                          
                                                                                
  DXPOA80                    LENGTH=$1                                          
  LABEL="Diagnosis 80, present on admission indicator"                          
                                                                                
  DXPOA81                    LENGTH=$1                                          
  LABEL="Diagnosis 81, present on admission indicator"                          
                                                                                
  DXPOA82                    LENGTH=$1                                          
  LABEL="Diagnosis 82, present on admission indicator"                          
                                                                                
  DXPOA83                    LENGTH=$1                                          
  LABEL="Diagnosis 83, present on admission indicator"                          
                                                                                
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
                                                                                
  Homeless                   LENGTH=3                                           
  LABEL="Indicator that patient is homeless"                                    
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
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
                                                                                
  I10_DX45                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 45"                                                
                                                                                
  I10_DX46                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 46"                                                
                                                                                
  I10_DX47                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 47"                                                
                                                                                
  I10_DX48                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 48"                                                
                                                                                
  I10_DX49                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 49"                                                
                                                                                
  I10_DX50                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 50"                                                
                                                                                
  I10_DX51                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 51"                                                
                                                                                
  I10_DX52                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 52"                                                
                                                                                
  I10_DX53                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 53"                                                
                                                                                
  I10_DX54                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 54"                                                
                                                                                
  I10_DX55                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 55"                                                
                                                                                
  I10_DX56                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 56"                                                
                                                                                
  I10_DX57                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 57"                                                
                                                                                
  I10_DX58                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 58"                                                
                                                                                
  I10_DX59                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 59"                                                
                                                                                
  I10_DX60                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 60"                                                
                                                                                
  I10_DX61                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 61"                                                
                                                                                
  I10_DX62                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 62"                                                
                                                                                
  I10_DX63                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 63"                                                
                                                                                
  I10_DX64                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 64"                                                
                                                                                
  I10_DX65                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 65"                                                
                                                                                
  I10_DX66                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 66"                                                
                                                                                
  I10_DX67                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 67"                                                
                                                                                
  I10_DX68                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 68"                                                
                                                                                
  I10_DX69                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 69"                                                
                                                                                
  I10_DX70                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 70"                                                
                                                                                
  I10_DX71                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 71"                                                
                                                                                
  I10_DX72                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 72"                                                
                                                                                
  I10_DX73                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 73"                                                
                                                                                
  I10_DX74                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 74"                                                
                                                                                
  I10_DX75                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 75"                                                
                                                                                
  I10_DX76                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 76"                                                
                                                                                
  I10_DX77                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 77"                                                
                                                                                
  I10_DX78                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 78"                                                
                                                                                
  I10_DX79                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 79"                                                
                                                                                
  I10_DX80                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 80"                                                
                                                                                
  I10_DX81                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 81"                                                
                                                                                
  I10_DX82                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 82"                                                
                                                                                
  I10_DX83                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 83"                                                
                                                                                
  I10_NDX                    LENGTH=3                                           
  LABEL="ICD-10-CM Number of diagnoses on this record"                          
                                                                                
  I10_NPR                    LENGTH=3                                           
  LABEL="ICD-10-PCS Number of procedures on this record"                        
                                                                                
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
                                                                                
  I10_PR9                    LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 9"                                                
                                                                                
  I10_PR10                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 10"                                               
                                                                                
  I10_PR11                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 11"                                               
                                                                                
  I10_PR12                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 12"                                               
                                                                                
  I10_PR13                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 13"                                               
                                                                                
  I10_PR14                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 14"                                               
                                                                                
  I10_PR15                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 15"                                               
                                                                                
  I10_PR16                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 16"                                               
                                                                                
  I10_PR17                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 17"                                               
                                                                                
  I10_PR18                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 18"                                               
                                                                                
  I10_PR19                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 19"                                               
                                                                                
  I10_PR20                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 20"                                               
                                                                                
  I10_PR21                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 21"                                               
                                                                                
  I10_PR22                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 22"                                               
                                                                                
  I10_PR23                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 23"                                               
                                                                                
  I10_PR24                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 24"                                               
                                                                                
  I10_PR25                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 25"                                               
                                                                                
  I10_PR26                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 26"                                               
                                                                                
  I10_PR27                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 27"                                               
                                                                                
  I10_PR28                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 28"                                               
                                                                                
  I10_PR29                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 29"                                               
                                                                                
  I10_PR30                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 30"                                               
                                                                                
  I10_PR31                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 31"                                               
                                                                                
  I10_PR32                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 32"                                               
                                                                                
  I10_PR33                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 33"                                               
                                                                                
  I10_PR34                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 34"                                               
                                                                                
  I10_PR35                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 35"                                               
                                                                                
  I10_PR36                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 36"                                               
                                                                                
  I10_PR37                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 37"                                               
                                                                                
  I10_PR38                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 38"                                               
                                                                                
  I10_PR39                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 39"                                               
                                                                                
  I10_PR40                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 40"                                               
                                                                                
  I10_PR41                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 41"                                               
                                                                                
  I10_PR42                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 42"                                               
                                                                                
  I10_PR43                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 43"                                               
                                                                                
  I10_PR44                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 44"                                               
                                                                                
  I10_PR45                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 45"                                               
                                                                                
  I10_PR46                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 46"                                               
                                                                                
  I10_PR47                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 47"                                               
                                                                                
  I10_PR48                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 48"                                               
                                                                                
  I10_PR49                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 49"                                               
                                                                                
  I10_PR50                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 50"                                               
                                                                                
  I10_PR51                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 51"                                               
                                                                                
  I10_PR52                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 52"                                               
                                                                                
  I10_PR53                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 53"                                               
                                                                                
  I10_PR54                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 54"                                               
                                                                                
  I10_PR55                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 55"                                               
                                                                                
  I10_PR56                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 56"                                               
                                                                                
  I10_PR57                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 57"                                               
                                                                                
  I10_PR58                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 58"                                               
                                                                                
  I10_PR59                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 59"                                               
                                                                                
  I10_PR60                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 60"                                               
                                                                                
  I10_PR61                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 61"                                               
                                                                                
  I10_PR62                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 62"                                               
                                                                                
  I10_PR63                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 63"                                               
                                                                                
  I10_PR64                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 64"                                               
                                                                                
  I10_PR65                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 65"                                               
                                                                                
  I10_PR66                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 66"                                               
                                                                                
  I10_PR67                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 67"                                               
                                                                                
  I10_PR68                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 68"                                               
                                                                                
  I10_PR69                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 69"                                               
                                                                                
  I10_PR70                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 70"                                               
                                                                                
  I10_PR71                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 71"                                               
                                                                                
  I10_PR72                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 72"                                               
                                                                                
  I10_PR73                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 73"                                               
                                                                                
  I10_PR74                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 74"                                               
                                                                                
  I10_PR75                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 75"                                               
                                                                                
  I10_PR76                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 76"                                               
                                                                                
  I10_PR77                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 77"                                               
                                                                                
  I10_PR78                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 78"                                               
                                                                                
  I10_PR79                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 79"                                               
                                                                                
  I10_PR80                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 80"                                               
                                                                                
  I10_PR81                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 81"                                               
                                                                                
  I10_PR82                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 82"                                               
                                                                                
  I10_PR83                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 83"                                               
                                                                                
  I10_PR84                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 84"                                               
                                                                                
  I10_PR85                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 85"                                               
                                                                                
  I10_PR86                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 86"                                               
                                                                                
  I10_PR87                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 87"                                               
                                                                                
  I10_PR88                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 88"                                               
                                                                                
  I10_PR89                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 89"                                               
                                                                                
  I10_PR90                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 90"                                               
                                                                                
  I10_PR91                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 91"                                               
                                                                                
  I10_PR92                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 92"                                               
                                                                                
  I10_PR93                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 93"                                               
                                                                                
  I10_PR94                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 94"                                               
                                                                                
  I10_PR95                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 95"                                               
                                                                                
  I10_PR96                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 96"                                               
                                                                                
  I10_PR97                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 97"                                               
                                                                                
  I10_PR98                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 98"                                               
                                                                                
  I10_PR99                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 99"                                               
                                                                                
  I10_PR100                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 100"                                              
                                                                                
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
                                                                                
  MDC                        LENGTH=3                                           
  LABEL="MDC in effect on discharge date"                                       
                                                                                
  MDC_NoPOA                  LENGTH=3                                           
  LABEL="MDC in use on discharge date, calculated without POA"                  
                                                                                
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
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures for this visit"                         
                                                                                
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
                                                                                
  POA_Disch_Edit1            LENGTH=3                                           
  LABEL="Discharge has POA missing on all nonexempt diagnoses"                  
                                                                                
  POA_Disch_Edit2            LENGTH=3                                           
  LABEL="Discharge has POA missing on all nonexempt secondary diagnoses"        
                                                                                
  POA_Hosp_Edit1             LENGTH=3                                           
  LABEL="Hospital reported POA as Y on all diagnoses on all discharges"         
                                                                                
  POA_Hosp_Edit2             LENGTH=3                                           
  LABEL="Hospital reported POA as missing on all non-Medicare discharges"       
                                                                                
  POA_Hosp_Edit3             LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Hospital reported POA as missing on all nonexempt diagnoses for 15% or more of 
discharges"                                                                     
                                                                                
  POA_Hosp_Edit3_Value       LENGTH=8                                           
  LABEL=                                                                        
  "Percentage of discharges with all nonexempt diagnoses missing POA indicators"
                                                                                
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
                                                                                
  PRDAY9                     LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR9"                              
                                                                                
  PRDAY10                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR10"                             
                                                                                
  PRDAY11                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR11"                             
                                                                                
  PRDAY12                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR12"                             
                                                                                
  PRDAY13                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR13"                             
                                                                                
  PRDAY14                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR14"                             
                                                                                
  PRDAY15                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR15"                             
                                                                                
  PRDAY16                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR16"                             
                                                                                
  PRDAY17                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR17"                             
                                                                                
  PRDAY18                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR18"                             
                                                                                
  PRDAY19                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR19"                             
                                                                                
  PRDAY20                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR20"                             
                                                                                
  PRDAY21                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR21"                             
                                                                                
  PRDAY22                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR22"                             
                                                                                
  PRDAY23                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR23"                             
                                                                                
  PRDAY24                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR24"                             
                                                                                
  PRDAY25                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR25"                             
                                                                                
  PRDAY26                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR26"                             
                                                                                
  PRDAY27                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR27"                             
                                                                                
  PRDAY28                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR28"                             
                                                                                
  PRDAY29                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR29"                             
                                                                                
  PRDAY30                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR30"                             
                                                                                
  PRDAY31                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR31"                             
                                                                                
  PRDAY32                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR32"                             
                                                                                
  PRDAY33                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR33"                             
                                                                                
  PRDAY34                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR34"                             
                                                                                
  PRDAY35                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR35"                             
                                                                                
  PRDAY36                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR36"                             
                                                                                
  PRDAY37                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR37"                             
                                                                                
  PRDAY38                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR38"                             
                                                                                
  PRDAY39                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR39"                             
                                                                                
  PRDAY40                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR40"                             
                                                                                
  PRDAY41                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR41"                             
                                                                                
  PRDAY42                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR42"                             
                                                                                
  PRDAY43                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR43"                             
                                                                                
  PRDAY44                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR44"                             
                                                                                
  PRDAY45                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR45"                             
                                                                                
  PRDAY46                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR46"                             
                                                                                
  PRDAY47                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR47"                             
                                                                                
  PRDAY48                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR48"                             
                                                                                
  PRDAY49                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR49"                             
                                                                                
  PRDAY50                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR50"                             
                                                                                
  PRDAY51                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR51"                             
                                                                                
  PRDAY52                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR52"                             
                                                                                
  PRDAY53                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR53"                             
                                                                                
  PRDAY54                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR54"                             
                                                                                
  PRDAY55                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR55"                             
                                                                                
  PRDAY56                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR56"                             
                                                                                
  PRDAY57                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR57"                             
                                                                                
  PRDAY58                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR58"                             
                                                                                
  PRDAY59                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR59"                             
                                                                                
  PRDAY60                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR60"                             
                                                                                
  PRDAY61                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR61"                             
                                                                                
  PRDAY62                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR62"                             
                                                                                
  PRDAY63                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR63"                             
                                                                                
  PRDAY64                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR64"                             
                                                                                
  PRDAY65                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR65"                             
                                                                                
  PRDAY66                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR66"                             
                                                                                
  PRDAY67                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR67"                             
                                                                                
  PRDAY68                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR68"                             
                                                                                
  PRDAY69                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR69"                             
                                                                                
  PRDAY70                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR70"                             
                                                                                
  PRDAY71                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR71"                             
                                                                                
  PRDAY72                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR72"                             
                                                                                
  PRDAY73                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR73"                             
                                                                                
  PRDAY74                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR74"                             
                                                                                
  PRDAY75                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR75"                             
                                                                                
  PRDAY76                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR76"                             
                                                                                
  PRDAY77                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR77"                             
                                                                                
  PRDAY78                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR78"                             
                                                                                
  PRDAY79                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR79"                             
                                                                                
  PRDAY80                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR80"                             
                                                                                
  PRDAY81                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR81"                             
                                                                                
  PRDAY82                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR82"                             
                                                                                
  PRDAY83                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR83"                             
                                                                                
  PRDAY84                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR84"                             
                                                                                
  PRDAY85                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR85"                             
                                                                                
  PRDAY86                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR86"                             
                                                                                
  PRDAY87                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR87"                             
                                                                                
  PRDAY88                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR88"                             
                                                                                
  PRDAY89                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR89"                             
                                                                                
  PRDAY90                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR90"                             
                                                                                
  PRDAY91                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR91"                             
                                                                                
  PRDAY92                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR92"                             
                                                                                
  PRDAY93                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR93"                             
                                                                                
  PRDAY94                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR94"                             
                                                                                
  PRDAY95                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR95"                             
                                                                                
  PRDAY96                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR96"                             
                                                                                
  PRDAY97                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR97"                             
                                                                                
  PRDAY98                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR98"                             
                                                                                
  PRDAY99                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR99"                             
                                                                                
  PRDAY100                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR100"                            
                                                                                
  PrimLang                   LENGTH=$3                                          
  LABEL="Primary language of patient"                                           
                                                                                
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
                                                                                
  RACE_EDIT                  LENGTH=3                                           
  LABEL="Race Edit Checks"                                                      
                                                                                
  RACE_X                     LENGTH=$1                                          
  LABEL="Race (as received from source)"                                        
                                                                                
  TOTCHG                     LENGTH=6                                           
  LABEL="Total charges (cleaned)"                                               
                                                                                
  TOTCHG_X                   LENGTH=7                                           
  LABEL="Total charges (as received from source)"                               
                                                                                
  TRAN_IN                    LENGTH=3                                           
  LABEL="Transfer in indicator"                                                 
                                                                                
  TRAN_OUT                   LENGTH=3                                           
  LABEL="Transfer out indicator"                                                
                                                                                
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
                                                                                
  HOSPID                     LENGTH=4                      FORMAT=Z5.           
  LABEL="HCUP hospital identification number"                                   
                                                                                
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
                                                                                
  PRMONTH51                  LENGTH=3                                           
  LABEL="Month of procedure 51"                                                 
                                                                                
  PRMONTH52                  LENGTH=3                                           
  LABEL="Month of procedure 52"                                                 
                                                                                
  PRMONTH53                  LENGTH=3                                           
  LABEL="Month of procedure 53"                                                 
                                                                                
  PRMONTH54                  LENGTH=3                                           
  LABEL="Month of procedure 54"                                                 
                                                                                
  PRMONTH55                  LENGTH=3                                           
  LABEL="Month of procedure 55"                                                 
                                                                                
  PRMONTH56                  LENGTH=3                                           
  LABEL="Month of procedure 56"                                                 
                                                                                
  PRMONTH57                  LENGTH=3                                           
  LABEL="Month of procedure 57"                                                 
                                                                                
  PRMONTH58                  LENGTH=3                                           
  LABEL="Month of procedure 58"                                                 
                                                                                
  PRMONTH59                  LENGTH=3                                           
  LABEL="Month of procedure 59"                                                 
                                                                                
  PRMONTH60                  LENGTH=3                                           
  LABEL="Month of procedure 60"                                                 
                                                                                
  PRMONTH61                  LENGTH=3                                           
  LABEL="Month of procedure 61"                                                 
                                                                                
  PRMONTH62                  LENGTH=3                                           
  LABEL="Month of procedure 62"                                                 
                                                                                
  PRMONTH63                  LENGTH=3                                           
  LABEL="Month of procedure 63"                                                 
                                                                                
  PRMONTH64                  LENGTH=3                                           
  LABEL="Month of procedure 64"                                                 
                                                                                
  PRMONTH65                  LENGTH=3                                           
  LABEL="Month of procedure 65"                                                 
                                                                                
  PRMONTH66                  LENGTH=3                                           
  LABEL="Month of procedure 66"                                                 
                                                                                
  PRMONTH67                  LENGTH=3                                           
  LABEL="Month of procedure 67"                                                 
                                                                                
  PRMONTH68                  LENGTH=3                                           
  LABEL="Month of procedure 68"                                                 
                                                                                
  PRMONTH69                  LENGTH=3                                           
  LABEL="Month of procedure 69"                                                 
                                                                                
  PRMONTH70                  LENGTH=3                                           
  LABEL="Month of procedure 70"                                                 
                                                                                
  PRMONTH71                  LENGTH=3                                           
  LABEL="Month of procedure 71"                                                 
                                                                                
  PRMONTH72                  LENGTH=3                                           
  LABEL="Month of procedure 72"                                                 
                                                                                
  PRMONTH73                  LENGTH=3                                           
  LABEL="Month of procedure 73"                                                 
                                                                                
  PRMONTH74                  LENGTH=3                                           
  LABEL="Month of procedure 74"                                                 
                                                                                
  PRMONTH75                  LENGTH=3                                           
  LABEL="Month of procedure 75"                                                 
                                                                                
  PRMONTH76                  LENGTH=3                                           
  LABEL="Month of procedure 76"                                                 
                                                                                
  PRMONTH77                  LENGTH=3                                           
  LABEL="Month of procedure 77"                                                 
                                                                                
  PRMONTH78                  LENGTH=3                                           
  LABEL="Month of procedure 78"                                                 
                                                                                
  PRMONTH79                  LENGTH=3                                           
  LABEL="Month of procedure 79"                                                 
                                                                                
  PRMONTH80                  LENGTH=3                                           
  LABEL="Month of procedure 80"                                                 
                                                                                
  PRMONTH81                  LENGTH=3                                           
  LABEL="Month of procedure 81"                                                 
                                                                                
  PRMONTH82                  LENGTH=3                                           
  LABEL="Month of procedure 82"                                                 
                                                                                
  PRMONTH83                  LENGTH=3                                           
  LABEL="Month of procedure 83"                                                 
                                                                                
  PRMONTH84                  LENGTH=3                                           
  LABEL="Month of procedure 84"                                                 
                                                                                
  PRMONTH85                  LENGTH=3                                           
  LABEL="Month of procedure 85"                                                 
                                                                                
  PRMONTH86                  LENGTH=3                                           
  LABEL="Month of procedure 86"                                                 
                                                                                
  PRMONTH87                  LENGTH=3                                           
  LABEL="Month of procedure 87"                                                 
                                                                                
  PRMONTH88                  LENGTH=3                                           
  LABEL="Month of procedure 88"                                                 
                                                                                
  PRMONTH89                  LENGTH=3                                           
  LABEL="Month of procedure 89"                                                 
                                                                                
  PRMONTH90                  LENGTH=3                                           
  LABEL="Month of procedure 90"                                                 
                                                                                
  PRMONTH91                  LENGTH=3                                           
  LABEL="Month of procedure 91"                                                 
                                                                                
  PRMONTH92                  LENGTH=3                                           
  LABEL="Month of procedure 92"                                                 
                                                                                
  PRMONTH93                  LENGTH=3                                           
  LABEL="Month of procedure 93"                                                 
                                                                                
  PRMONTH94                  LENGTH=3                                           
  LABEL="Month of procedure 94"                                                 
                                                                                
  PRMONTH95                  LENGTH=3                                           
  LABEL="Month of procedure 95"                                                 
                                                                                
  PRMONTH96                  LENGTH=3                                           
  LABEL="Month of procedure 96"                                                 
                                                                                
  PRMONTH97                  LENGTH=3                                           
  LABEL="Month of procedure 97"                                                 
                                                                                
  PRMONTH98                  LENGTH=3                                           
  LABEL="Month of procedure 98"                                                 
                                                                                
  PRMONTH99                  LENGTH=3                                           
  LABEL="Month of procedure 99"                                                 
                                                                                
  PRMONTH100                 LENGTH=3                                           
  LABEL="Month of procedure 100"                                                
                                                                                
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
                                                                                
  PRYEAR51                   LENGTH=3                                           
  LABEL="Year of procedure 51"                                                  
                                                                                
  PRYEAR52                   LENGTH=3                                           
  LABEL="Year of procedure 52"                                                  
                                                                                
  PRYEAR53                   LENGTH=3                                           
  LABEL="Year of procedure 53"                                                  
                                                                                
  PRYEAR54                   LENGTH=3                                           
  LABEL="Year of procedure 54"                                                  
                                                                                
  PRYEAR55                   LENGTH=3                                           
  LABEL="Year of procedure 55"                                                  
                                                                                
  PRYEAR56                   LENGTH=3                                           
  LABEL="Year of procedure 56"                                                  
                                                                                
  PRYEAR57                   LENGTH=3                                           
  LABEL="Year of procedure 57"                                                  
                                                                                
  PRYEAR58                   LENGTH=3                                           
  LABEL="Year of procedure 58"                                                  
                                                                                
  PRYEAR59                   LENGTH=3                                           
  LABEL="Year of procedure 59"                                                  
                                                                                
  PRYEAR60                   LENGTH=3                                           
  LABEL="Year of procedure 60"                                                  
                                                                                
  PRYEAR61                   LENGTH=3                                           
  LABEL="Year of procedure 61"                                                  
                                                                                
  PRYEAR62                   LENGTH=3                                           
  LABEL="Year of procedure 62"                                                  
                                                                                
  PRYEAR63                   LENGTH=3                                           
  LABEL="Year of procedure 63"                                                  
                                                                                
  PRYEAR64                   LENGTH=3                                           
  LABEL="Year of procedure 64"                                                  
                                                                                
  PRYEAR65                   LENGTH=3                                           
  LABEL="Year of procedure 65"                                                  
                                                                                
  PRYEAR66                   LENGTH=3                                           
  LABEL="Year of procedure 66"                                                  
                                                                                
  PRYEAR67                   LENGTH=3                                           
  LABEL="Year of procedure 67"                                                  
                                                                                
  PRYEAR68                   LENGTH=3                                           
  LABEL="Year of procedure 68"                                                  
                                                                                
  PRYEAR69                   LENGTH=3                                           
  LABEL="Year of procedure 69"                                                  
                                                                                
  PRYEAR70                   LENGTH=3                                           
  LABEL="Year of procedure 70"                                                  
                                                                                
  PRYEAR71                   LENGTH=3                                           
  LABEL="Year of procedure 71"                                                  
                                                                                
  PRYEAR72                   LENGTH=3                                           
  LABEL="Year of procedure 72"                                                  
                                                                                
  PRYEAR73                   LENGTH=3                                           
  LABEL="Year of procedure 73"                                                  
                                                                                
  PRYEAR74                   LENGTH=3                                           
  LABEL="Year of procedure 74"                                                  
                                                                                
  PRYEAR75                   LENGTH=3                                           
  LABEL="Year of procedure 75"                                                  
                                                                                
  PRYEAR76                   LENGTH=3                                           
  LABEL="Year of procedure 76"                                                  
                                                                                
  PRYEAR77                   LENGTH=3                                           
  LABEL="Year of procedure 77"                                                  
                                                                                
  PRYEAR78                   LENGTH=3                                           
  LABEL="Year of procedure 78"                                                  
                                                                                
  PRYEAR79                   LENGTH=3                                           
  LABEL="Year of procedure 79"                                                  
                                                                                
  PRYEAR80                   LENGTH=3                                           
  LABEL="Year of procedure 80"                                                  
                                                                                
  PRYEAR81                   LENGTH=3                                           
  LABEL="Year of procedure 81"                                                  
                                                                                
  PRYEAR82                   LENGTH=3                                           
  LABEL="Year of procedure 82"                                                  
                                                                                
  PRYEAR83                   LENGTH=3                                           
  LABEL="Year of procedure 83"                                                  
                                                                                
  PRYEAR84                   LENGTH=3                                           
  LABEL="Year of procedure 84"                                                  
                                                                                
  PRYEAR85                   LENGTH=3                                           
  LABEL="Year of procedure 85"                                                  
                                                                                
  PRYEAR86                   LENGTH=3                                           
  LABEL="Year of procedure 86"                                                  
                                                                                
  PRYEAR87                   LENGTH=3                                           
  LABEL="Year of procedure 87"                                                  
                                                                                
  PRYEAR88                   LENGTH=3                                           
  LABEL="Year of procedure 88"                                                  
                                                                                
  PRYEAR89                   LENGTH=3                                           
  LABEL="Year of procedure 89"                                                  
                                                                                
  PRYEAR90                   LENGTH=3                                           
  LABEL="Year of procedure 90"                                                  
                                                                                
  PRYEAR91                   LENGTH=3                                           
  LABEL="Year of procedure 91"                                                  
                                                                                
  PRYEAR92                   LENGTH=3                                           
  LABEL="Year of procedure 92"                                                  
                                                                                
  PRYEAR93                   LENGTH=3                                           
  LABEL="Year of procedure 93"                                                  
                                                                                
  PRYEAR94                   LENGTH=3                                           
  LABEL="Year of procedure 94"                                                  
                                                                                
  PRYEAR95                   LENGTH=3                                           
  LABEL="Year of procedure 95"                                                  
                                                                                
  PRYEAR96                   LENGTH=3                                           
  LABEL="Year of procedure 96"                                                  
                                                                                
  PRYEAR97                   LENGTH=3                                           
  LABEL="Year of procedure 97"                                                  
                                                                                
  PRYEAR98                   LENGTH=3                                           
  LABEL="Year of procedure 98"                                                  
                                                                                
  PRYEAR99                   LENGTH=3                                           
  LABEL="Year of procedure 99"                                                  
                                                                                
  PRYEAR100                  LENGTH=3                                           
  LABEL="Year of procedure 100"                                                 
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
      @20     BWT                           N4PF.                               
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
      @399    CPT76                         $CHAR5.                             
      @404    CPT77                         $CHAR5.                             
      @409    CPT78                         $CHAR5.                             
      @414    CPT79                         $CHAR5.                             
      @419    CPT80                         $CHAR5.                             
      @424    CPT81                         $CHAR5.                             
      @429    CPT82                         $CHAR5.                             
      @434    CPT83                         $CHAR5.                             
      @439    CPT84                         $CHAR5.                             
      @444    CPT85                         $CHAR5.                             
      @449    CPT86                         $CHAR5.                             
      @454    CPT87                         $CHAR5.                             
      @459    CPT88                         $CHAR5.                             
      @464    CPT89                         $CHAR5.                             
      @469    CPT90                         $CHAR5.                             
      @474    CPT91                         $CHAR5.                             
      @479    CPT92                         $CHAR5.                             
      @484    CPT93                         $CHAR5.                             
      @489    CPT94                         $CHAR5.                             
      @494    CPT95                         $CHAR5.                             
      @499    CPT96                         $CHAR5.                             
      @504    CPT97                         $CHAR5.                             
      @509    CPT98                         $CHAR5.                             
      @514    CPT99                         $CHAR5.                             
      @519    CPT100                        $CHAR5.                             
      @524    CPTCCS1                       N3PF.                               
      @527    CPTCCS2                       N3PF.                               
      @530    CPTCCS3                       N3PF.                               
      @533    CPTCCS4                       N3PF.                               
      @536    CPTCCS5                       N3PF.                               
      @539    CPTCCS6                       N3PF.                               
      @542    CPTCCS7                       N3PF.                               
      @545    CPTCCS8                       N3PF.                               
      @548    CPTCCS9                       N3PF.                               
      @551    CPTCCS10                      N3PF.                               
      @554    CPTCCS11                      N3PF.                               
      @557    CPTCCS12                      N3PF.                               
      @560    CPTCCS13                      N3PF.                               
      @563    CPTCCS14                      N3PF.                               
      @566    CPTCCS15                      N3PF.                               
      @569    CPTCCS16                      N3PF.                               
      @572    CPTCCS17                      N3PF.                               
      @575    CPTCCS18                      N3PF.                               
      @578    CPTCCS19                      N3PF.                               
      @581    CPTCCS20                      N3PF.                               
      @584    CPTCCS21                      N3PF.                               
      @587    CPTCCS22                      N3PF.                               
      @590    CPTCCS23                      N3PF.                               
      @593    CPTCCS24                      N3PF.                               
      @596    CPTCCS25                      N3PF.                               
      @599    CPTCCS26                      N3PF.                               
      @602    CPTCCS27                      N3PF.                               
      @605    CPTCCS28                      N3PF.                               
      @608    CPTCCS29                      N3PF.                               
      @611    CPTCCS30                      N3PF.                               
      @614    CPTCCS31                      N3PF.                               
      @617    CPTCCS32                      N3PF.                               
      @620    CPTCCS33                      N3PF.                               
      @623    CPTCCS34                      N3PF.                               
      @626    CPTCCS35                      N3PF.                               
      @629    CPTCCS36                      N3PF.                               
      @632    CPTCCS37                      N3PF.                               
      @635    CPTCCS38                      N3PF.                               
      @638    CPTCCS39                      N3PF.                               
      @641    CPTCCS40                      N3PF.                               
      @644    CPTCCS41                      N3PF.                               
      @647    CPTCCS42                      N3PF.                               
      @650    CPTCCS43                      N3PF.                               
      @653    CPTCCS44                      N3PF.                               
      @656    CPTCCS45                      N3PF.                               
      @659    CPTCCS46                      N3PF.                               
      @662    CPTCCS47                      N3PF.                               
      @665    CPTCCS48                      N3PF.                               
      @668    CPTCCS49                      N3PF.                               
      @671    CPTCCS50                      N3PF.                               
      @674    CPTCCS51                      N3PF.                               
      @677    CPTCCS52                      N3PF.                               
      @680    CPTCCS53                      N3PF.                               
      @683    CPTCCS54                      N3PF.                               
      @686    CPTCCS55                      N3PF.                               
      @689    CPTCCS56                      N3PF.                               
      @692    CPTCCS57                      N3PF.                               
      @695    CPTCCS58                      N3PF.                               
      @698    CPTCCS59                      N3PF.                               
      @701    CPTCCS60                      N3PF.                               
      @704    CPTCCS61                      N3PF.                               
      @707    CPTCCS62                      N3PF.                               
      @710    CPTCCS63                      N3PF.                               
      @713    CPTCCS64                      N3PF.                               
      @716    CPTCCS65                      N3PF.                               
      @719    CPTCCS66                      N3PF.                               
      @722    CPTCCS67                      N3PF.                               
      @725    CPTCCS68                      N3PF.                               
      @728    CPTCCS69                      N3PF.                               
      @731    CPTCCS70                      N3PF.                               
      @734    CPTCCS71                      N3PF.                               
      @737    CPTCCS72                      N3PF.                               
      @740    CPTCCS73                      N3PF.                               
      @743    CPTCCS74                      N3PF.                               
      @746    CPTCCS75                      N3PF.                               
      @749    CPTCCS76                      N3PF.                               
      @752    CPTCCS77                      N3PF.                               
      @755    CPTCCS78                      N3PF.                               
      @758    CPTCCS79                      N3PF.                               
      @761    CPTCCS80                      N3PF.                               
      @764    CPTCCS81                      N3PF.                               
      @767    CPTCCS82                      N3PF.                               
      @770    CPTCCS83                      N3PF.                               
      @773    CPTCCS84                      N3PF.                               
      @776    CPTCCS85                      N3PF.                               
      @779    CPTCCS86                      N3PF.                               
      @782    CPTCCS87                      N3PF.                               
      @785    CPTCCS88                      N3PF.                               
      @788    CPTCCS89                      N3PF.                               
      @791    CPTCCS90                      N3PF.                               
      @794    CPTCCS91                      N3PF.                               
      @797    CPTCCS92                      N3PF.                               
      @800    CPTCCS93                      N3PF.                               
      @803    CPTCCS94                      N3PF.                               
      @806    CPTCCS95                      N3PF.                               
      @809    CPTCCS96                      N3PF.                               
      @812    CPTCCS97                      N3PF.                               
      @815    CPTCCS98                      N3PF.                               
      @818    CPTCCS99                      N3PF.                               
      @821    CPTCCS100                     N3PF.                               
      @824    DaysToEvent                   N6PF.                               
      @830    DIED                          N2PF.                               
      @832    DISP_X                        $CHAR2.                             
      @834    DISPUB04                      N2PF.                               
      @836    DISPUNIFORM                   N2PF.                               
      @838    DMONTH                        N2PF.                               
      @840    DQTR                          N2PF.                               
      @842    DRG                           N3PF.                               
      @845    DRG_NoPOA                     N3PF.                               
      @848    DRGVER                        N2PF.                               
      @850    DXPOA1                        $CHAR1.                             
      @851    DXPOA2                        $CHAR1.                             
      @852    DXPOA3                        $CHAR1.                             
      @853    DXPOA4                        $CHAR1.                             
      @854    DXPOA5                        $CHAR1.                             
      @855    DXPOA6                        $CHAR1.                             
      @856    DXPOA7                        $CHAR1.                             
      @857    DXPOA8                        $CHAR1.                             
      @858    DXPOA9                        $CHAR1.                             
      @859    DXPOA10                       $CHAR1.                             
      @860    DXPOA11                       $CHAR1.                             
      @861    DXPOA12                       $CHAR1.                             
      @862    DXPOA13                       $CHAR1.                             
      @863    DXPOA14                       $CHAR1.                             
      @864    DXPOA15                       $CHAR1.                             
      @865    DXPOA16                       $CHAR1.                             
      @866    DXPOA17                       $CHAR1.                             
      @867    DXPOA18                       $CHAR1.                             
      @868    DXPOA19                       $CHAR1.                             
      @869    DXPOA20                       $CHAR1.                             
      @870    DXPOA21                       $CHAR1.                             
      @871    DXPOA22                       $CHAR1.                             
      @872    DXPOA23                       $CHAR1.                             
      @873    DXPOA24                       $CHAR1.                             
      @874    DXPOA25                       $CHAR1.                             
      @875    DXPOA26                       $CHAR1.                             
      @876    DXPOA27                       $CHAR1.                             
      @877    DXPOA28                       $CHAR1.                             
      @878    DXPOA29                       $CHAR1.                             
      @879    DXPOA30                       $CHAR1.                             
      @880    DXPOA31                       $CHAR1.                             
      @881    DXPOA32                       $CHAR1.                             
      @882    DXPOA33                       $CHAR1.                             
      @883    DXPOA34                       $CHAR1.                             
      @884    DXPOA35                       $CHAR1.                             
      @885    DXPOA36                       $CHAR1.                             
      @886    DXPOA37                       $CHAR1.                             
      @887    DXPOA38                       $CHAR1.                             
      @888    DXPOA39                       $CHAR1.                             
      @889    DXPOA40                       $CHAR1.                             
      @890    DXPOA41                       $CHAR1.                             
      @891    DXPOA42                       $CHAR1.                             
      @892    DXPOA43                       $CHAR1.                             
      @893    DXPOA44                       $CHAR1.                             
      @894    DXPOA45                       $CHAR1.                             
      @895    DXPOA46                       $CHAR1.                             
      @896    DXPOA47                       $CHAR1.                             
      @897    DXPOA48                       $CHAR1.                             
      @898    DXPOA49                       $CHAR1.                             
      @899    DXPOA50                       $CHAR1.                             
      @900    DXPOA51                       $CHAR1.                             
      @901    DXPOA52                       $CHAR1.                             
      @902    DXPOA53                       $CHAR1.                             
      @903    DXPOA54                       $CHAR1.                             
      @904    DXPOA55                       $CHAR1.                             
      @905    DXPOA56                       $CHAR1.                             
      @906    DXPOA57                       $CHAR1.                             
      @907    DXPOA58                       $CHAR1.                             
      @908    DXPOA59                       $CHAR1.                             
      @909    DXPOA60                       $CHAR1.                             
      @910    DXPOA61                       $CHAR1.                             
      @911    DXPOA62                       $CHAR1.                             
      @912    DXPOA63                       $CHAR1.                             
      @913    DXPOA64                       $CHAR1.                             
      @914    DXPOA65                       $CHAR1.                             
      @915    DXPOA66                       $CHAR1.                             
      @916    DXPOA67                       $CHAR1.                             
      @917    DXPOA68                       $CHAR1.                             
      @918    DXPOA69                       $CHAR1.                             
      @919    DXPOA70                       $CHAR1.                             
      @920    DXPOA71                       $CHAR1.                             
      @921    DXPOA72                       $CHAR1.                             
      @922    DXPOA73                       $CHAR1.                             
      @923    DXPOA74                       $CHAR1.                             
      @924    DXPOA75                       $CHAR1.                             
      @925    DXPOA76                       $CHAR1.                             
      @926    DXPOA77                       $CHAR1.                             
      @927    DXPOA78                       $CHAR1.                             
      @928    DXPOA79                       $CHAR1.                             
      @929    DXPOA80                       $CHAR1.                             
      @930    DXPOA81                       $CHAR1.                             
      @931    DXPOA82                       $CHAR1.                             
      @932    DXPOA83                       $CHAR1.                             
      @933    DXVER                         N3PF.                               
      @936    FEMALE                        N2PF.                               
      @938    HCUP_ED                       N2PF.                               
      @940    HCUP_OS                       N2PF.                               
      @942    HISPANIC                      N2PF.                               
      @944    HISPANIC_X                    $CHAR1.                             
      @945    Homeless                      N2PF.                               
      @947    HOSPST                        $CHAR2.                             
      @949    I10_DX1                       $CHAR7.                             
      @956    I10_DX2                       $CHAR7.                             
      @963    I10_DX3                       $CHAR7.                             
      @970    I10_DX4                       $CHAR7.                             
      @977    I10_DX5                       $CHAR7.                             
      @984    I10_DX6                       $CHAR7.                             
      @991    I10_DX7                       $CHAR7.                             
      @998    I10_DX8                       $CHAR7.                             
      @1005   I10_DX9                       $CHAR7.                             
      @1012   I10_DX10                      $CHAR7.                             
      @1019   I10_DX11                      $CHAR7.                             
      @1026   I10_DX12                      $CHAR7.                             
      @1033   I10_DX13                      $CHAR7.                             
      @1040   I10_DX14                      $CHAR7.                             
      @1047   I10_DX15                      $CHAR7.                             
      @1054   I10_DX16                      $CHAR7.                             
      @1061   I10_DX17                      $CHAR7.                             
      @1068   I10_DX18                      $CHAR7.                             
      @1075   I10_DX19                      $CHAR7.                             
      @1082   I10_DX20                      $CHAR7.                             
      @1089   I10_DX21                      $CHAR7.                             
      @1096   I10_DX22                      $CHAR7.                             
      @1103   I10_DX23                      $CHAR7.                             
      @1110   I10_DX24                      $CHAR7.                             
      @1117   I10_DX25                      $CHAR7.                             
      @1124   I10_DX26                      $CHAR7.                             
      @1131   I10_DX27                      $CHAR7.                             
      @1138   I10_DX28                      $CHAR7.                             
      @1145   I10_DX29                      $CHAR7.                             
      @1152   I10_DX30                      $CHAR7.                             
      @1159   I10_DX31                      $CHAR7.                             
      @1166   I10_DX32                      $CHAR7.                             
      @1173   I10_DX33                      $CHAR7.                             
      @1180   I10_DX34                      $CHAR7.                             
      @1187   I10_DX35                      $CHAR7.                             
      @1194   I10_DX36                      $CHAR7.                             
      @1201   I10_DX37                      $CHAR7.                             
      @1208   I10_DX38                      $CHAR7.                             
      @1215   I10_DX39                      $CHAR7.                             
      @1222   I10_DX40                      $CHAR7.                             
      @1229   I10_DX41                      $CHAR7.                             
      @1236   I10_DX42                      $CHAR7.                             
      @1243   I10_DX43                      $CHAR7.                             
      @1250   I10_DX44                      $CHAR7.                             
      @1257   I10_DX45                      $CHAR7.                             
      @1264   I10_DX46                      $CHAR7.                             
      @1271   I10_DX47                      $CHAR7.                             
      @1278   I10_DX48                      $CHAR7.                             
      @1285   I10_DX49                      $CHAR7.                             
      @1292   I10_DX50                      $CHAR7.                             
      @1299   I10_DX51                      $CHAR7.                             
      @1306   I10_DX52                      $CHAR7.                             
      @1313   I10_DX53                      $CHAR7.                             
      @1320   I10_DX54                      $CHAR7.                             
      @1327   I10_DX55                      $CHAR7.                             
      @1334   I10_DX56                      $CHAR7.                             
      @1341   I10_DX57                      $CHAR7.                             
      @1348   I10_DX58                      $CHAR7.                             
      @1355   I10_DX59                      $CHAR7.                             
      @1362   I10_DX60                      $CHAR7.                             
      @1369   I10_DX61                      $CHAR7.                             
      @1376   I10_DX62                      $CHAR7.                             
      @1383   I10_DX63                      $CHAR7.                             
      @1390   I10_DX64                      $CHAR7.                             
      @1397   I10_DX65                      $CHAR7.                             
      @1404   I10_DX66                      $CHAR7.                             
      @1411   I10_DX67                      $CHAR7.                             
      @1418   I10_DX68                      $CHAR7.                             
      @1425   I10_DX69                      $CHAR7.                             
      @1432   I10_DX70                      $CHAR7.                             
      @1439   I10_DX71                      $CHAR7.                             
      @1446   I10_DX72                      $CHAR7.                             
      @1453   I10_DX73                      $CHAR7.                             
      @1460   I10_DX74                      $CHAR7.                             
      @1467   I10_DX75                      $CHAR7.                             
      @1474   I10_DX76                      $CHAR7.                             
      @1481   I10_DX77                      $CHAR7.                             
      @1488   I10_DX78                      $CHAR7.                             
      @1495   I10_DX79                      $CHAR7.                             
      @1502   I10_DX80                      $CHAR7.                             
      @1509   I10_DX81                      $CHAR7.                             
      @1516   I10_DX82                      $CHAR7.                             
      @1523   I10_DX83                      $CHAR7.                             
      @1530   I10_NDX                       N3PF.                               
      @1533   I10_NPR                       N3PF.                               
      @1536   I10_PR1                       $CHAR7.                             
      @1543   I10_PR2                       $CHAR7.                             
      @1550   I10_PR3                       $CHAR7.                             
      @1557   I10_PR4                       $CHAR7.                             
      @1564   I10_PR5                       $CHAR7.                             
      @1571   I10_PR6                       $CHAR7.                             
      @1578   I10_PR7                       $CHAR7.                             
      @1585   I10_PR8                       $CHAR7.                             
      @1592   I10_PR9                       $CHAR7.                             
      @1599   I10_PR10                      $CHAR7.                             
      @1606   I10_PR11                      $CHAR7.                             
      @1613   I10_PR12                      $CHAR7.                             
      @1620   I10_PR13                      $CHAR7.                             
      @1627   I10_PR14                      $CHAR7.                             
      @1634   I10_PR15                      $CHAR7.                             
      @1641   I10_PR16                      $CHAR7.                             
      @1648   I10_PR17                      $CHAR7.                             
      @1655   I10_PR18                      $CHAR7.                             
      @1662   I10_PR19                      $CHAR7.                             
      @1669   I10_PR20                      $CHAR7.                             
      @1676   I10_PR21                      $CHAR7.                             
      @1683   I10_PR22                      $CHAR7.                             
      @1690   I10_PR23                      $CHAR7.                             
      @1697   I10_PR24                      $CHAR7.                             
      @1704   I10_PR25                      $CHAR7.                             
      @1711   I10_PR26                      $CHAR7.                             
      @1718   I10_PR27                      $CHAR7.                             
      @1725   I10_PR28                      $CHAR7.                             
      @1732   I10_PR29                      $CHAR7.                             
      @1739   I10_PR30                      $CHAR7.                             
      @1746   I10_PR31                      $CHAR7.                             
      @1753   I10_PR32                      $CHAR7.                             
      @1760   I10_PR33                      $CHAR7.                             
      @1767   I10_PR34                      $CHAR7.                             
      @1774   I10_PR35                      $CHAR7.                             
      @1781   I10_PR36                      $CHAR7.                             
      @1788   I10_PR37                      $CHAR7.                             
      @1795   I10_PR38                      $CHAR7.                             
      @1802   I10_PR39                      $CHAR7.                             
      @1809   I10_PR40                      $CHAR7.                             
      @1816   I10_PR41                      $CHAR7.                             
      @1823   I10_PR42                      $CHAR7.                             
      @1830   I10_PR43                      $CHAR7.                             
      @1837   I10_PR44                      $CHAR7.                             
      @1844   I10_PR45                      $CHAR7.                             
      @1851   I10_PR46                      $CHAR7.                             
      @1858   I10_PR47                      $CHAR7.                             
      @1865   I10_PR48                      $CHAR7.                             
      @1872   I10_PR49                      $CHAR7.                             
      @1879   I10_PR50                      $CHAR7.                             
      @1886   I10_PR51                      $CHAR7.                             
      @1893   I10_PR52                      $CHAR7.                             
      @1900   I10_PR53                      $CHAR7.                             
      @1907   I10_PR54                      $CHAR7.                             
      @1914   I10_PR55                      $CHAR7.                             
      @1921   I10_PR56                      $CHAR7.                             
      @1928   I10_PR57                      $CHAR7.                             
      @1935   I10_PR58                      $CHAR7.                             
      @1942   I10_PR59                      $CHAR7.                             
      @1949   I10_PR60                      $CHAR7.                             
      @1956   I10_PR61                      $CHAR7.                             
      @1963   I10_PR62                      $CHAR7.                             
      @1970   I10_PR63                      $CHAR7.                             
      @1977   I10_PR64                      $CHAR7.                             
      @1984   I10_PR65                      $CHAR7.                             
      @1991   I10_PR66                      $CHAR7.                             
      @1998   I10_PR67                      $CHAR7.                             
      @2005   I10_PR68                      $CHAR7.                             
      @2012   I10_PR69                      $CHAR7.                             
      @2019   I10_PR70                      $CHAR7.                             
      @2026   I10_PR71                      $CHAR7.                             
      @2033   I10_PR72                      $CHAR7.                             
      @2040   I10_PR73                      $CHAR7.                             
      @2047   I10_PR74                      $CHAR7.                             
      @2054   I10_PR75                      $CHAR7.                             
      @2061   I10_PR76                      $CHAR7.                             
      @2068   I10_PR77                      $CHAR7.                             
      @2075   I10_PR78                      $CHAR7.                             
      @2082   I10_PR79                      $CHAR7.                             
      @2089   I10_PR80                      $CHAR7.                             
      @2096   I10_PR81                      $CHAR7.                             
      @2103   I10_PR82                      $CHAR7.                             
      @2110   I10_PR83                      $CHAR7.                             
      @2117   I10_PR84                      $CHAR7.                             
      @2124   I10_PR85                      $CHAR7.                             
      @2131   I10_PR86                      $CHAR7.                             
      @2138   I10_PR87                      $CHAR7.                             
      @2145   I10_PR88                      $CHAR7.                             
      @2152   I10_PR89                      $CHAR7.                             
      @2159   I10_PR90                      $CHAR7.                             
      @2166   I10_PR91                      $CHAR7.                             
      @2173   I10_PR92                      $CHAR7.                             
      @2180   I10_PR93                      $CHAR7.                             
      @2187   I10_PR94                      $CHAR7.                             
      @2194   I10_PR95                      $CHAR7.                             
      @2201   I10_PR96                      $CHAR7.                             
      @2208   I10_PR97                      $CHAR7.                             
      @2215   I10_PR98                      $CHAR7.                             
      @2222   I10_PR99                      $CHAR7.                             
      @2229   I10_PR100                     $CHAR7.                             
      @2236   I10_PROCTYPE                  N3PF.                               
      @2239   KEY                           15.                                 
      @2254   LOS                           N5PF.                               
      @2259   LOS_X                         N6PF.                               
      @2265   MARITALSTATUS_X               $CHAR1.                             
      @2266   MARITALSTATUSUB04             $CHAR1.                             
      @2267   MDC                           N2PF.                               
      @2269   MDC_NoPOA                     N2PF.                               
      @2271   MDNUM1_R                      N9PF.                               
      @2280   MDNUM2_R                      N9PF.                               
      @2289   MDNUM3_R                      N9PF.                               
      @2298   MDNUM4_R                      N9PF.                               
      @2307   MEDINCSTQ                     N2PF.                               
      @2309   NCPT                          N4PF.                               
      @2313   OS_TIME                       N11P2F.                             
      @2324   PAY1                          N2PF.                               
      @2326   PAY1_X                        $CHAR4.                             
      @2330   PAY2                          N2PF.                               
      @2332   PAY2_X                        $CHAR4.                             
      @2336   PAY3                          N2PF.                               
      @2338   PAY3_X                        $CHAR4.                             
      @2342   PL_CBSA                       N3PF.                               
      @2345   PL_NCHS                       N2PF.                               
      @2347   PL_RUCC                       N2PF.                               
      @2349   PL_UIC                        N2PF.                               
      @2351   PL_UR_CAT4                    N2PF.                               
      @2353   POA_Disch_Edit1               N2PF.                               
      @2355   POA_Disch_Edit2               N2PF.                               
      @2357   POA_Hosp_Edit1                N2PF.                               
      @2359   POA_Hosp_Edit2                N2PF.                               
      @2361   POA_Hosp_Edit3                N2PF.                               
      @2363   POA_Hosp_Edit3_Value          N8P2F.                              
      @2371   PointOfOrigin_X               $CHAR1.                             
      @2372   PointOfOriginUB04             $CHAR1.                             
      @2373   PRDAY1                        N5PF.                               
      @2378   PRDAY2                        N5PF.                               
      @2383   PRDAY3                        N5PF.                               
      @2388   PRDAY4                        N5PF.                               
      @2393   PRDAY5                        N5PF.                               
      @2398   PRDAY6                        N5PF.                               
      @2403   PRDAY7                        N5PF.                               
      @2408   PRDAY8                        N5PF.                               
      @2413   PRDAY9                        N5PF.                               
      @2418   PRDAY10                       N5PF.                               
      @2423   PRDAY11                       N5PF.                               
      @2428   PRDAY12                       N5PF.                               
      @2433   PRDAY13                       N5PF.                               
      @2438   PRDAY14                       N5PF.                               
      @2443   PRDAY15                       N5PF.                               
      @2448   PRDAY16                       N5PF.                               
      @2453   PRDAY17                       N5PF.                               
      @2458   PRDAY18                       N5PF.                               
      @2463   PRDAY19                       N5PF.                               
      @2468   PRDAY20                       N5PF.                               
      @2473   PRDAY21                       N5PF.                               
      @2478   PRDAY22                       N5PF.                               
      @2483   PRDAY23                       N5PF.                               
      @2488   PRDAY24                       N5PF.                               
      @2493   PRDAY25                       N5PF.                               
      @2498   PRDAY26                       N5PF.                               
      @2503   PRDAY27                       N5PF.                               
      @2508   PRDAY28                       N5PF.                               
      @2513   PRDAY29                       N5PF.                               
      @2518   PRDAY30                       N5PF.                               
      @2523   PRDAY31                       N5PF.                               
      @2528   PRDAY32                       N5PF.                               
      @2533   PRDAY33                       N5PF.                               
      @2538   PRDAY34                       N5PF.                               
      @2543   PRDAY35                       N5PF.                               
      @2548   PRDAY36                       N5PF.                               
      @2553   PRDAY37                       N5PF.                               
      @2558   PRDAY38                       N5PF.                               
      @2563   PRDAY39                       N5PF.                               
      @2568   PRDAY40                       N5PF.                               
      @2573   PRDAY41                       N5PF.                               
      @2578   PRDAY42                       N5PF.                               
      @2583   PRDAY43                       N5PF.                               
      @2588   PRDAY44                       N5PF.                               
      @2593   PRDAY45                       N5PF.                               
      @2598   PRDAY46                       N5PF.                               
      @2603   PRDAY47                       N5PF.                               
      @2608   PRDAY48                       N5PF.                               
      @2613   PRDAY49                       N5PF.                               
      @2618   PRDAY50                       N5PF.                               
      @2623   PRDAY51                       N5PF.                               
      @2628   PRDAY52                       N5PF.                               
      @2633   PRDAY53                       N5PF.                               
      @2638   PRDAY54                       N5PF.                               
      @2643   PRDAY55                       N5PF.                               
      @2648   PRDAY56                       N5PF.                               
      @2653   PRDAY57                       N5PF.                               
      @2658   PRDAY58                       N5PF.                               
      @2663   PRDAY59                       N5PF.                               
      @2668   PRDAY60                       N5PF.                               
      @2673   PRDAY61                       N5PF.                               
      @2678   PRDAY62                       N5PF.                               
      @2683   PRDAY63                       N5PF.                               
      @2688   PRDAY64                       N5PF.                               
      @2693   PRDAY65                       N5PF.                               
      @2698   PRDAY66                       N5PF.                               
      @2703   PRDAY67                       N5PF.                               
      @2708   PRDAY68                       N5PF.                               
      @2713   PRDAY69                       N5PF.                               
      @2718   PRDAY70                       N5PF.                               
      @2723   PRDAY71                       N5PF.                               
      @2728   PRDAY72                       N5PF.                               
      @2733   PRDAY73                       N5PF.                               
      @2738   PRDAY74                       N5PF.                               
      @2743   PRDAY75                       N5PF.                               
      @2748   PRDAY76                       N5PF.                               
      @2753   PRDAY77                       N5PF.                               
      @2758   PRDAY78                       N5PF.                               
      @2763   PRDAY79                       N5PF.                               
      @2768   PRDAY80                       N5PF.                               
      @2773   PRDAY81                       N5PF.                               
      @2778   PRDAY82                       N5PF.                               
      @2783   PRDAY83                       N5PF.                               
      @2788   PRDAY84                       N5PF.                               
      @2793   PRDAY85                       N5PF.                               
      @2798   PRDAY86                       N5PF.                               
      @2803   PRDAY87                       N5PF.                               
      @2808   PRDAY88                       N5PF.                               
      @2813   PRDAY89                       N5PF.                               
      @2818   PRDAY90                       N5PF.                               
      @2823   PRDAY91                       N5PF.                               
      @2828   PRDAY92                       N5PF.                               
      @2833   PRDAY93                       N5PF.                               
      @2838   PRDAY94                       N5PF.                               
      @2843   PRDAY95                       N5PF.                               
      @2848   PRDAY96                       N5PF.                               
      @2853   PRDAY97                       N5PF.                               
      @2858   PRDAY98                       N5PF.                               
      @2863   PRDAY99                       N5PF.                               
      @2868   PRDAY100                      N5PF.                               
      @2873   PrimLang                      $CHAR3.                             
      @2876   PRVER                         N3PF.                               
      @2879   PSTATE                        $CHAR2.                             
      @2881   PSTCO                         N5PF.                               
      @2886   PSTCO2                        N5PF.                               
      @2891   RACE                          N2PF.                               
      @2893   RACE_EDIT                     N2PF.                               
      @2895   RACE_X                        $CHAR1.                             
      @2896   TOTCHG                        N10PF.                              
      @2906   TOTCHG_X                      N15P2F.                             
      @2921   TRAN_IN                       N2PF.                               
      @2923   TRAN_OUT                      N2PF.                               
      @2925   VisitLink                     N9PF.                               
      @2934   YEAR                          N4PF.                               
      @2938   ZIP                           $CHAR5.                             
      @2943   ZIP3                          $CHAR3.                             
      @2946   ZIPINC_QRTL                   N3PF.                               
      @2949   HOSPID                        N5PF.                               
      @2954   AYEAR                         N4PF.                               
      @2958   BMONTH                        N2PF.                               
      @2960   BYEAR                         N4PF.                               
      @2964   PRMONTH1                      N2PF.                               
      @2966   PRMONTH2                      N2PF.                               
      @2968   PRMONTH3                      N2PF.                               
      @2970   PRMONTH4                      N2PF.                               
      @2972   PRMONTH5                      N2PF.                               
      @2974   PRMONTH6                      N2PF.                               
      @2976   PRMONTH7                      N2PF.                               
      @2978   PRMONTH8                      N2PF.                               
      @2980   PRMONTH9                      N2PF.                               
      @2982   PRMONTH10                     N2PF.                               
      @2984   PRMONTH11                     N2PF.                               
      @2986   PRMONTH12                     N2PF.                               
      @2988   PRMONTH13                     N2PF.                               
      @2990   PRMONTH14                     N2PF.                               
      @2992   PRMONTH15                     N2PF.                               
      @2994   PRMONTH16                     N2PF.                               
      @2996   PRMONTH17                     N2PF.                               
      @2998   PRMONTH18                     N2PF.                               
      @3000   PRMONTH19                     N2PF.                               
      @3002   PRMONTH20                     N2PF.                               
      @3004   PRMONTH21                     N2PF.                               
      @3006   PRMONTH22                     N2PF.                               
      @3008   PRMONTH23                     N2PF.                               
      @3010   PRMONTH24                     N2PF.                               
      @3012   PRMONTH25                     N2PF.                               
      @3014   PRMONTH26                     N2PF.                               
      @3016   PRMONTH27                     N2PF.                               
      @3018   PRMONTH28                     N2PF.                               
      @3020   PRMONTH29                     N2PF.                               
      @3022   PRMONTH30                     N2PF.                               
      @3024   PRMONTH31                     N2PF.                               
      @3026   PRMONTH32                     N2PF.                               
      @3028   PRMONTH33                     N2PF.                               
      @3030   PRMONTH34                     N2PF.                               
      @3032   PRMONTH35                     N2PF.                               
      @3034   PRMONTH36                     N2PF.                               
      @3036   PRMONTH37                     N2PF.                               
      @3038   PRMONTH38                     N2PF.                               
      @3040   PRMONTH39                     N2PF.                               
      @3042   PRMONTH40                     N2PF.                               
      @3044   PRMONTH41                     N2PF.                               
      @3046   PRMONTH42                     N2PF.                               
      @3048   PRMONTH43                     N2PF.                               
      @3050   PRMONTH44                     N2PF.                               
      @3052   PRMONTH45                     N2PF.                               
      @3054   PRMONTH46                     N2PF.                               
      @3056   PRMONTH47                     N2PF.                               
      @3058   PRMONTH48                     N2PF.                               
      @3060   PRMONTH49                     N2PF.                               
      @3062   PRMONTH50                     N2PF.                               
      @3064   PRMONTH51                     N2PF.                               
      @3066   PRMONTH52                     N2PF.                               
      @3068   PRMONTH53                     N2PF.                               
      @3070   PRMONTH54                     N2PF.                               
      @3072   PRMONTH55                     N2PF.                               
      @3074   PRMONTH56                     N2PF.                               
      @3076   PRMONTH57                     N2PF.                               
      @3078   PRMONTH58                     N2PF.                               
      @3080   PRMONTH59                     N2PF.                               
      @3082   PRMONTH60                     N2PF.                               
      @3084   PRMONTH61                     N2PF.                               
      @3086   PRMONTH62                     N2PF.                               
      @3088   PRMONTH63                     N2PF.                               
      @3090   PRMONTH64                     N2PF.                               
      @3092   PRMONTH65                     N2PF.                               
      @3094   PRMONTH66                     N2PF.                               
      @3096   PRMONTH67                     N2PF.                               
      @3098   PRMONTH68                     N2PF.                               
      @3100   PRMONTH69                     N2PF.                               
      @3102   PRMONTH70                     N2PF.                               
      @3104   PRMONTH71                     N2PF.                               
      @3106   PRMONTH72                     N2PF.                               
      @3108   PRMONTH73                     N2PF.                               
      @3110   PRMONTH74                     N2PF.                               
      @3112   PRMONTH75                     N2PF.                               
      @3114   PRMONTH76                     N2PF.                               
      @3116   PRMONTH77                     N2PF.                               
      @3118   PRMONTH78                     N2PF.                               
      @3120   PRMONTH79                     N2PF.                               
      @3122   PRMONTH80                     N2PF.                               
      @3124   PRMONTH81                     N2PF.                               
      @3126   PRMONTH82                     N2PF.                               
      @3128   PRMONTH83                     N2PF.                               
      @3130   PRMONTH84                     N2PF.                               
      @3132   PRMONTH85                     N2PF.                               
      @3134   PRMONTH86                     N2PF.                               
      @3136   PRMONTH87                     N2PF.                               
      @3138   PRMONTH88                     N2PF.                               
      @3140   PRMONTH89                     N2PF.                               
      @3142   PRMONTH90                     N2PF.                               
      @3144   PRMONTH91                     N2PF.                               
      @3146   PRMONTH92                     N2PF.                               
      @3148   PRMONTH93                     N2PF.                               
      @3150   PRMONTH94                     N2PF.                               
      @3152   PRMONTH95                     N2PF.                               
      @3154   PRMONTH96                     N2PF.                               
      @3156   PRMONTH97                     N2PF.                               
      @3158   PRMONTH98                     N2PF.                               
      @3160   PRMONTH99                     N2PF.                               
      @3162   PRMONTH100                    N2PF.                               
      @3164   PRYEAR1                       N4PF.                               
      @3168   PRYEAR2                       N4PF.                               
      @3172   PRYEAR3                       N4PF.                               
      @3176   PRYEAR4                       N4PF.                               
      @3180   PRYEAR5                       N4PF.                               
      @3184   PRYEAR6                       N4PF.                               
      @3188   PRYEAR7                       N4PF.                               
      @3192   PRYEAR8                       N4PF.                               
      @3196   PRYEAR9                       N4PF.                               
      @3200   PRYEAR10                      N4PF.                               
      @3204   PRYEAR11                      N4PF.                               
      @3208   PRYEAR12                      N4PF.                               
      @3212   PRYEAR13                      N4PF.                               
      @3216   PRYEAR14                      N4PF.                               
      @3220   PRYEAR15                      N4PF.                               
      @3224   PRYEAR16                      N4PF.                               
      @3228   PRYEAR17                      N4PF.                               
      @3232   PRYEAR18                      N4PF.                               
      @3236   PRYEAR19                      N4PF.                               
      @3240   PRYEAR20                      N4PF.                               
      @3244   PRYEAR21                      N4PF.                               
      @3248   PRYEAR22                      N4PF.                               
      @3252   PRYEAR23                      N4PF.                               
      @3256   PRYEAR24                      N4PF.                               
      @3260   PRYEAR25                      N4PF.                               
      @3264   PRYEAR26                      N4PF.                               
      @3268   PRYEAR27                      N4PF.                               
      @3272   PRYEAR28                      N4PF.                               
      @3276   PRYEAR29                      N4PF.                               
      @3280   PRYEAR30                      N4PF.                               
      @3284   PRYEAR31                      N4PF.                               
      @3288   PRYEAR32                      N4PF.                               
      @3292   PRYEAR33                      N4PF.                               
      @3296   PRYEAR34                      N4PF.                               
      @3300   PRYEAR35                      N4PF.                               
      @3304   PRYEAR36                      N4PF.                               
      @3308   PRYEAR37                      N4PF.                               
      @3312   PRYEAR38                      N4PF.                               
      @3316   PRYEAR39                      N4PF.                               
      @3320   PRYEAR40                      N4PF.                               
      @3324   PRYEAR41                      N4PF.                               
      @3328   PRYEAR42                      N4PF.                               
      @3332   PRYEAR43                      N4PF.                               
      @3336   PRYEAR44                      N4PF.                               
      @3340   PRYEAR45                      N4PF.                               
      @3344   PRYEAR46                      N4PF.                               
      @3348   PRYEAR47                      N4PF.                               
      @3352   PRYEAR48                      N4PF.                               
      @3356   PRYEAR49                      N4PF.                               
      @3360   PRYEAR50                      N4PF.                               
      @3364   PRYEAR51                      N4PF.                               
      @3368   PRYEAR52                      N4PF.                               
      @3372   PRYEAR53                      N4PF.                               
      @3376   PRYEAR54                      N4PF.                               
      @3380   PRYEAR55                      N4PF.                               
      @3384   PRYEAR56                      N4PF.                               
      @3388   PRYEAR57                      N4PF.                               
      @3392   PRYEAR58                      N4PF.                               
      @3396   PRYEAR59                      N4PF.                               
      @3400   PRYEAR60                      N4PF.                               
      @3404   PRYEAR61                      N4PF.                               
      @3408   PRYEAR62                      N4PF.                               
      @3412   PRYEAR63                      N4PF.                               
      @3416   PRYEAR64                      N4PF.                               
      @3420   PRYEAR65                      N4PF.                               
      @3424   PRYEAR66                      N4PF.                               
      @3428   PRYEAR67                      N4PF.                               
      @3432   PRYEAR68                      N4PF.                               
      @3436   PRYEAR69                      N4PF.                               
      @3440   PRYEAR70                      N4PF.                               
      @3444   PRYEAR71                      N4PF.                               
      @3448   PRYEAR72                      N4PF.                               
      @3452   PRYEAR73                      N4PF.                               
      @3456   PRYEAR74                      N4PF.                               
      @3460   PRYEAR75                      N4PF.                               
      @3464   PRYEAR76                      N4PF.                               
      @3468   PRYEAR77                      N4PF.                               
      @3472   PRYEAR78                      N4PF.                               
      @3476   PRYEAR79                      N4PF.                               
      @3480   PRYEAR80                      N4PF.                               
      @3484   PRYEAR81                      N4PF.                               
      @3488   PRYEAR82                      N4PF.                               
      @3492   PRYEAR83                      N4PF.                               
      @3496   PRYEAR84                      N4PF.                               
      @3500   PRYEAR85                      N4PF.                               
      @3504   PRYEAR86                      N4PF.                               
      @3508   PRYEAR87                      N4PF.                               
      @3512   PRYEAR88                      N4PF.                               
      @3516   PRYEAR89                      N4PF.                               
      @3520   PRYEAR90                      N4PF.                               
      @3524   PRYEAR91                      N4PF.                               
      @3528   PRYEAR92                      N4PF.                               
      @3532   PRYEAR93                      N4PF.                               
      @3536   PRYEAR94                      N4PF.                               
      @3540   PRYEAR95                      N4PF.                               
      @3544   PRYEAR96                      N4PF.                               
      @3548   PRYEAR97                      N4PF.                               
      @3552   PRYEAR98                      N4PF.                               
      @3556   PRYEAR99                      N4PF.                               
      @3560   PRYEAR100                     N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
