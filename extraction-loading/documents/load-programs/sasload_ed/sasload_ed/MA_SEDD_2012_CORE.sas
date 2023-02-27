/*******************************************************************            
* Creation Date: 09/05/2014                                                     
*   MA_SEDD_2012_CORE.SAS:                                                      
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
DATA MA_SEDDC_2012_CORE;                                                        
INFILE 'MA_SEDD_2012_CORE.ASC' FIRSTOBS=3 LRECL = 1300;                         
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AHOUR                      LENGTH=3                 FORMAT=Z4.                
  LABEL="Admission Hour"                                                        
                                                                                
  AMONTH                     LENGTH=3                                           
  LABEL="Admission month"                                                       
                                                                                
  ASOURCE                    LENGTH=3                                           
  LABEL="Admission source (uniform)"                                            
                                                                                
  ASOURCE_X                  LENGTH=$1                                          
  LABEL="Admission source (as received from source)"                            
                                                                                
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
                                                                                
  CPT101                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 101"                                          
                                                                                
  CPT102                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 102"                                          
                                                                                
  CPT103                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 103"                                          
                                                                                
  CPT104                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 104"                                          
                                                                                
  CPT105                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 105"                                          
                                                                                
  CPT106                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 106"                                          
                                                                                
  CPT107                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 107"                                          
                                                                                
  CPT108                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 108"                                          
                                                                                
  CPT109                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 109"                                          
                                                                                
  CPT110                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 110"                                          
                                                                                
  CPT111                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 111"                                          
                                                                                
  CPT112                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 112"                                          
                                                                                
  CPT113                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 113"                                          
                                                                                
  CPT114                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 114"                                          
                                                                                
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
                                                                                
  CPTCCS101                  LENGTH=4                                           
  LABEL="CCS: CPT 101"                                                          
                                                                                
  CPTCCS102                  LENGTH=4                                           
  LABEL="CCS: CPT 102"                                                          
                                                                                
  CPTCCS103                  LENGTH=4                                           
  LABEL="CCS: CPT 103"                                                          
                                                                                
  CPTCCS104                  LENGTH=4                                           
  LABEL="CCS: CPT 104"                                                          
                                                                                
  CPTCCS105                  LENGTH=4                                           
  LABEL="CCS: CPT 105"                                                          
                                                                                
  CPTCCS106                  LENGTH=4                                           
  LABEL="CCS: CPT 106"                                                          
                                                                                
  CPTCCS107                  LENGTH=4                                           
  LABEL="CCS: CPT 107"                                                          
                                                                                
  CPTCCS108                  LENGTH=4                                           
  LABEL="CCS: CPT 108"                                                          
                                                                                
  CPTCCS109                  LENGTH=4                                           
  LABEL="CCS: CPT 109"                                                          
                                                                                
  CPTCCS110                  LENGTH=4                                           
  LABEL="CCS: CPT 110"                                                          
                                                                                
  CPTCCS111                  LENGTH=4                                           
  LABEL="CCS: CPT 111"                                                          
                                                                                
  CPTCCS112                  LENGTH=4                                           
  LABEL="CCS: CPT 112"                                                          
                                                                                
  CPTCCS113                  LENGTH=4                                           
  LABEL="CCS: CPT 113"                                                          
                                                                                
  CPTCCS114                  LENGTH=4                                           
  LABEL="CCS: CPT 114"                                                          
                                                                                
  DHOUR                      LENGTH=3                 FORMAT=Z4.                
  LABEL="Discharge Hour"                                                        
                                                                                
  DIED                       LENGTH=3                                           
  LABEL="Died during hospitalization"                                           
                                                                                
  DISPUNIFORM                LENGTH=3                                           
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
  DISP_X                     LENGTH=$1                                          
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DSHOSPID                   LENGTH=$17                                         
  LABEL="Data source hospital identifier"                                       
                                                                                
  DURATION                   LENGTH=4                                           
  LABEL="Elapsed time for hospital care in hours"                               
                                                                                
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
                                                                                
  DaysBetweenVisits          LENGTH=3                                           
  LABEL="Number of days between visits"                                         
                                                                                
  DaysToEvent                LENGTH=8                                           
  LABEL="Days from 'start date' to admission"                                   
                                                                                
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
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HISPANIC_X                 LENGTH=$15                                         
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  HOSPBRTH                   LENGTH=3                                           
  LABEL="Indicator of birth in this hospital"                                   
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  Homeless                   LENGTH=3                                           
  LABEL="Indicator that patient is homeless"                                    
                                                                                
  KEY                        LENGTH=8                 FORMAT=Z15.               
  LABEL="HCUP record identifier"                                                
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
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
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$5                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$5                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_MSA1993                 LENGTH=3                                           
  LABEL="Patient location: Metropolitan Statistical Area (MSA), 1993"           
                                                                                
  PL_RUCA10_2005             LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, ten levels" 
                                                                                
  PL_RUCA2005                LENGTH=4                 FORMAT=4.1                
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes"             
                                                                                
  PL_RUCA4_2005              LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, four levels"
                                                                                
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
                                                                                
  PRCCS1                     LENGTH=3                                           
  LABEL="CCS: procedure 1"                                                      
                                                                                
  PRCCS2                     LENGTH=3                                           
  LABEL="CCS: procedure 2"                                                      
                                                                                
  PRCCS3                     LENGTH=3                                           
  LABEL="CCS: procedure 3"                                                      
                                                                                
  PRCCS4                     LENGTH=3                                           
  LABEL="CCS: procedure 4"                                                      
                                                                                
  PROCTYPE                   LENGTH=3                                           
  LABEL="Procedure type indicator"                                              
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO2                     LENGTH=4                 FORMAT=Z5.                
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X                     LENGTH=$5                                          
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
                                                                                
  TransportToHosp            LENGTH=3                                           
  LABEL="Method of transportation to hospita"                                   
                                                                                
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
                                                                                
  DMONTH                     LENGTH=3                                           
  LABEL="Discharge month"                                                       
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                      N3PF.                                    
      @4      AGEMONTH                 N3PF.                                    
      @7      AHOUR                    N4PF.                                    
      @11     AMONTH                   N2PF.                                    
      @13     ASOURCE                  N2PF.                                    
      @15     ASOURCE_X                $CHAR1.                                  
      @16     ATYPE                    N2PF.                                    
      @18     AWEEKEND                 N2PF.                                    
      @20     CPT1                     $CHAR5.                                  
      @25     CPT2                     $CHAR5.                                  
      @30     CPT3                     $CHAR5.                                  
      @35     CPT4                     $CHAR5.                                  
      @40     CPT5                     $CHAR5.                                  
      @45     CPT6                     $CHAR5.                                  
      @50     CPT7                     $CHAR5.                                  
      @55     CPT8                     $CHAR5.                                  
      @60     CPT9                     $CHAR5.                                  
      @65     CPT10                    $CHAR5.                                  
      @70     CPT11                    $CHAR5.                                  
      @75     CPT12                    $CHAR5.                                  
      @80     CPT13                    $CHAR5.                                  
      @85     CPT14                    $CHAR5.                                  
      @90     CPT15                    $CHAR5.                                  
      @95     CPT16                    $CHAR5.                                  
      @100    CPT17                    $CHAR5.                                  
      @105    CPT18                    $CHAR5.                                  
      @110    CPT19                    $CHAR5.                                  
      @115    CPT20                    $CHAR5.                                  
      @120    CPT21                    $CHAR5.                                  
      @125    CPT22                    $CHAR5.                                  
      @130    CPT23                    $CHAR5.                                  
      @135    CPT24                    $CHAR5.                                  
      @140    CPT25                    $CHAR5.                                  
      @145    CPT26                    $CHAR5.                                  
      @150    CPT27                    $CHAR5.                                  
      @155    CPT28                    $CHAR5.                                  
      @160    CPT29                    $CHAR5.                                  
      @165    CPT30                    $CHAR5.                                  
      @170    CPT31                    $CHAR5.                                  
      @175    CPT32                    $CHAR5.                                  
      @180    CPT33                    $CHAR5.                                  
      @185    CPT34                    $CHAR5.                                  
      @190    CPT35                    $CHAR5.                                  
      @195    CPT36                    $CHAR5.                                  
      @200    CPT37                    $CHAR5.                                  
      @205    CPT38                    $CHAR5.                                  
      @210    CPT39                    $CHAR5.                                  
      @215    CPT40                    $CHAR5.                                  
      @220    CPT41                    $CHAR5.                                  
      @225    CPT42                    $CHAR5.                                  
      @230    CPT43                    $CHAR5.                                  
      @235    CPT44                    $CHAR5.                                  
      @240    CPT45                    $CHAR5.                                  
      @245    CPT46                    $CHAR5.                                  
      @250    CPT47                    $CHAR5.                                  
      @255    CPT48                    $CHAR5.                                  
      @260    CPT49                    $CHAR5.                                  
      @265    CPT50                    $CHAR5.                                  
      @270    CPT51                    $CHAR5.                                  
      @275    CPT52                    $CHAR5.                                  
      @280    CPT53                    $CHAR5.                                  
      @285    CPT54                    $CHAR5.                                  
      @290    CPT55                    $CHAR5.                                  
      @295    CPT56                    $CHAR5.                                  
      @300    CPT57                    $CHAR5.                                  
      @305    CPT58                    $CHAR5.                                  
      @310    CPT59                    $CHAR5.                                  
      @315    CPT60                    $CHAR5.                                  
      @320    CPT61                    $CHAR5.                                  
      @325    CPT62                    $CHAR5.                                  
      @330    CPT63                    $CHAR5.                                  
      @335    CPT64                    $CHAR5.                                  
      @340    CPT65                    $CHAR5.                                  
      @345    CPT66                    $CHAR5.                                  
      @350    CPT67                    $CHAR5.                                  
      @355    CPT68                    $CHAR5.                                  
      @360    CPT69                    $CHAR5.                                  
      @365    CPT70                    $CHAR5.                                  
      @370    CPT71                    $CHAR5.                                  
      @375    CPT72                    $CHAR5.                                  
      @380    CPT73                    $CHAR5.                                  
      @385    CPT74                    $CHAR5.                                  
      @390    CPT75                    $CHAR5.                                  
      @395    CPT76                    $CHAR5.                                  
      @400    CPT77                    $CHAR5.                                  
      @405    CPT78                    $CHAR5.                                  
      @410    CPT79                    $CHAR5.                                  
      @415    CPT80                    $CHAR5.                                  
      @420    CPT81                    $CHAR5.                                  
      @425    CPT82                    $CHAR5.                                  
      @430    CPT83                    $CHAR5.                                  
      @435    CPT84                    $CHAR5.                                  
      @440    CPT85                    $CHAR5.                                  
      @445    CPT86                    $CHAR5.                                  
      @450    CPT87                    $CHAR5.                                  
      @455    CPT88                    $CHAR5.                                  
      @460    CPT89                    $CHAR5.                                  
      @465    CPT90                    $CHAR5.                                  
      @470    CPT91                    $CHAR5.                                  
      @475    CPT92                    $CHAR5.                                  
      @480    CPT93                    $CHAR5.                                  
      @485    CPT94                    $CHAR5.                                  
      @490    CPT95                    $CHAR5.                                  
      @495    CPT96                    $CHAR5.                                  
      @500    CPT97                    $CHAR5.                                  
      @505    CPT98                    $CHAR5.                                  
      @510    CPT99                    $CHAR5.                                  
      @515    CPT100                   $CHAR5.                                  
      @520    CPT101                   $CHAR5.                                  
      @525    CPT102                   $CHAR5.                                  
      @530    CPT103                   $CHAR5.                                  
      @535    CPT104                   $CHAR5.                                  
      @540    CPT105                   $CHAR5.                                  
      @545    CPT106                   $CHAR5.                                  
      @550    CPT107                   $CHAR5.                                  
      @555    CPT108                   $CHAR5.                                  
      @560    CPT109                   $CHAR5.                                  
      @565    CPT110                   $CHAR5.                                  
      @570    CPT111                   $CHAR5.                                  
      @575    CPT112                   $CHAR5.                                  
      @580    CPT113                   $CHAR5.                                  
      @585    CPT114                   $CHAR5.                                  
      @590    CPTCCS1                  N3PF.                                    
      @593    CPTCCS2                  N3PF.                                    
      @596    CPTCCS3                  N3PF.                                    
      @599    CPTCCS4                  N3PF.                                    
      @602    CPTCCS5                  N3PF.                                    
      @605    CPTCCS6                  N3PF.                                    
      @608    CPTCCS7                  N3PF.                                    
      @611    CPTCCS8                  N3PF.                                    
      @614    CPTCCS9                  N3PF.                                    
      @617    CPTCCS10                 N3PF.                                    
      @620    CPTCCS11                 N3PF.                                    
      @623    CPTCCS12                 N3PF.                                    
      @626    CPTCCS13                 N3PF.                                    
      @629    CPTCCS14                 N3PF.                                    
      @632    CPTCCS15                 N3PF.                                    
      @635    CPTCCS16                 N3PF.                                    
      @638    CPTCCS17                 N3PF.                                    
      @641    CPTCCS18                 N3PF.                                    
      @644    CPTCCS19                 N3PF.                                    
      @647    CPTCCS20                 N3PF.                                    
      @650    CPTCCS21                 N3PF.                                    
      @653    CPTCCS22                 N3PF.                                    
      @656    CPTCCS23                 N3PF.                                    
      @659    CPTCCS24                 N3PF.                                    
      @662    CPTCCS25                 N3PF.                                    
      @665    CPTCCS26                 N3PF.                                    
      @668    CPTCCS27                 N3PF.                                    
      @671    CPTCCS28                 N3PF.                                    
      @674    CPTCCS29                 N3PF.                                    
      @677    CPTCCS30                 N3PF.                                    
      @680    CPTCCS31                 N3PF.                                    
      @683    CPTCCS32                 N3PF.                                    
      @686    CPTCCS33                 N3PF.                                    
      @689    CPTCCS34                 N3PF.                                    
      @692    CPTCCS35                 N3PF.                                    
      @695    CPTCCS36                 N3PF.                                    
      @698    CPTCCS37                 N3PF.                                    
      @701    CPTCCS38                 N3PF.                                    
      @704    CPTCCS39                 N3PF.                                    
      @707    CPTCCS40                 N3PF.                                    
      @710    CPTCCS41                 N3PF.                                    
      @713    CPTCCS42                 N3PF.                                    
      @716    CPTCCS43                 N3PF.                                    
      @719    CPTCCS44                 N3PF.                                    
      @722    CPTCCS45                 N3PF.                                    
      @725    CPTCCS46                 N3PF.                                    
      @728    CPTCCS47                 N3PF.                                    
      @731    CPTCCS48                 N3PF.                                    
      @734    CPTCCS49                 N3PF.                                    
      @737    CPTCCS50                 N3PF.                                    
      @740    CPTCCS51                 N3PF.                                    
      @743    CPTCCS52                 N3PF.                                    
      @746    CPTCCS53                 N3PF.                                    
      @749    CPTCCS54                 N3PF.                                    
      @752    CPTCCS55                 N3PF.                                    
      @755    CPTCCS56                 N3PF.                                    
      @758    CPTCCS57                 N3PF.                                    
      @761    CPTCCS58                 N3PF.                                    
      @764    CPTCCS59                 N3PF.                                    
      @767    CPTCCS60                 N3PF.                                    
      @770    CPTCCS61                 N3PF.                                    
      @773    CPTCCS62                 N3PF.                                    
      @776    CPTCCS63                 N3PF.                                    
      @779    CPTCCS64                 N3PF.                                    
      @782    CPTCCS65                 N3PF.                                    
      @785    CPTCCS66                 N3PF.                                    
      @788    CPTCCS67                 N3PF.                                    
      @791    CPTCCS68                 N3PF.                                    
      @794    CPTCCS69                 N3PF.                                    
      @797    CPTCCS70                 N3PF.                                    
      @800    CPTCCS71                 N3PF.                                    
      @803    CPTCCS72                 N3PF.                                    
      @806    CPTCCS73                 N3PF.                                    
      @809    CPTCCS74                 N3PF.                                    
      @812    CPTCCS75                 N3PF.                                    
      @815    CPTCCS76                 N3PF.                                    
      @818    CPTCCS77                 N3PF.                                    
      @821    CPTCCS78                 N3PF.                                    
      @824    CPTCCS79                 N3PF.                                    
      @827    CPTCCS80                 N3PF.                                    
      @830    CPTCCS81                 N3PF.                                    
      @833    CPTCCS82                 N3PF.                                    
      @836    CPTCCS83                 N3PF.                                    
      @839    CPTCCS84                 N3PF.                                    
      @842    CPTCCS85                 N3PF.                                    
      @845    CPTCCS86                 N3PF.                                    
      @848    CPTCCS87                 N3PF.                                    
      @851    CPTCCS88                 N3PF.                                    
      @854    CPTCCS89                 N3PF.                                    
      @857    CPTCCS90                 N3PF.                                    
      @860    CPTCCS91                 N3PF.                                    
      @863    CPTCCS92                 N3PF.                                    
      @866    CPTCCS93                 N3PF.                                    
      @869    CPTCCS94                 N3PF.                                    
      @872    CPTCCS95                 N3PF.                                    
      @875    CPTCCS96                 N3PF.                                    
      @878    CPTCCS97                 N3PF.                                    
      @881    CPTCCS98                 N3PF.                                    
      @884    CPTCCS99                 N3PF.                                    
      @887    CPTCCS100                N3PF.                                    
      @890    CPTCCS101                N3PF.                                    
      @893    CPTCCS102                N3PF.                                    
      @896    CPTCCS103                N3PF.                                    
      @899    CPTCCS104                N3PF.                                    
      @902    CPTCCS105                N3PF.                                    
      @905    CPTCCS106                N3PF.                                    
      @908    CPTCCS107                N3PF.                                    
      @911    CPTCCS108                N3PF.                                    
      @914    CPTCCS109                N3PF.                                    
      @917    CPTCCS110                N3PF.                                    
      @920    CPTCCS111                N3PF.                                    
      @923    CPTCCS112                N3PF.                                    
      @926    CPTCCS113                N3PF.                                    
      @929    CPTCCS114                N3PF.                                    
      @932    DHOUR                    N4PF.                                    
      @936    DIED                     N2PF.                                    
      @938    DISPUNIFORM              N2PF.                                    
      @940    DISP_X                   $CHAR1.                                  
      @941    DQTR                     N2PF.                                    
      @943    DSHOSPID                 $CHAR17.                                 
      @960    DURATION                 N6PF.                                    
      @966    DX1                      $CHAR5.                                  
      @971    DX2                      $CHAR5.                                  
      @976    DX3                      $CHAR5.                                  
      @981    DX4                      $CHAR5.                                  
      @986    DX5                      $CHAR5.                                  
      @991    DX6                      $CHAR5.                                  
      @996    DXCCS1                   N4PF.                                    
      @1000   DXCCS2                   N4PF.                                    
      @1004   DXCCS3                   N4PF.                                    
      @1008   DXCCS4                   N4PF.                                    
      @1012   DXCCS5                   N4PF.                                    
      @1016   DXCCS6                   N4PF.                                    
      @1020   DXPOA1                   $CHAR1.                                  
      @1021   DXPOA2                   $CHAR1.                                  
      @1022   DXPOA3                   $CHAR1.                                  
      @1023   DXPOA4                   $CHAR1.                                  
      @1024   DXPOA5                   $CHAR1.                                  
      @1025   DXPOA6                   $CHAR1.                                  
      @1026   DaysBetweenVisits        N4PF.                                    
      @1030   DaysToEvent              N6PF.                                    
      @1036   ECODE1                   $CHAR5.                                  
      @1041   ECODE2                   $CHAR5.                                  
      @1046   ECODE3                   $CHAR5.                                  
      @1051   ECODE4                   $CHAR5.                                  
      @1056   ECODE5                   $CHAR5.                                  
      @1061   ECODE6                   $CHAR5.                                  
      @1066   E_CCS1                   N4PF.                                    
      @1070   E_CCS2                   N4PF.                                    
      @1074   E_CCS3                   N4PF.                                    
      @1078   E_CCS4                   N4PF.                                    
      @1082   E_CCS5                   N4PF.                                    
      @1086   E_CCS6                   N4PF.                                    
      @1090   E_POA1                   $CHAR1.                                  
      @1091   E_POA2                   $CHAR1.                                  
      @1092   E_POA3                   $CHAR1.                                  
      @1093   E_POA4                   $CHAR1.                                  
      @1094   E_POA5                   $CHAR1.                                  
      @1095   E_POA6                   $CHAR1.                                  
      @1096   FEMALE                   N2PF.                                    
      @1098   HCUP_ED                  N2PF.                                    
      @1100   HCUP_OS                  N2PF.                                    
      @1102   HISPANIC_X               $CHAR15.                                 
      @1117   HOSPBRTH                 N3PF.                                    
      @1120   HOSPST                   $CHAR2.                                  
      @1122   Homeless                 N2PF.                                    
      @1124   KEY                      15.                                      
      @1139   LOS                      N5PF.                                    
      @1144   LOS_X                    N6PF.                                    
      @1150   MEDINCSTQ                N2PF.                                    
      @1152   NCHRONIC                 N3PF.                                    
      @1155   NCPT                     N3PF.                                    
      @1158   NDX                      N2PF.                                    
      @1160   NECODE                   N2PF.                                    
      @1162   NEOMAT                   N2PF.                                    
      @1164   NPR                      N2PF.                                    
      @1166   ORPROC                   N2PF.                                    
      @1168   PAY1                     N2PF.                                    
      @1170   PAY1_X                   $CHAR5.                                  
      @1175   PAY2                     N2PF.                                    
      @1177   PAY2_X                   $CHAR5.                                  
      @1182   PL_CBSA                  N3PF.                                    
      @1185   PL_MSA1993               N3PF.                                    
      @1188   PL_RUCA10_2005           N2PF.                                    
      @1190   PL_RUCA2005              N4P1F.                                   
      @1194   PL_RUCA4_2005            N2PF.                                    
      @1196   PL_UR_CAT4               N2PF.                                    
      @1198   PR1                      $CHAR4.                                  
      @1202   PR2                      $CHAR4.                                  
      @1206   PR3                      $CHAR4.                                  
      @1210   PR4                      $CHAR4.                                  
      @1214   PRCCS1                   N3PF.                                    
      @1217   PRCCS2                   N3PF.                                    
      @1220   PRCCS3                   N3PF.                                    
      @1223   PRCCS4                   N3PF.                                    
      @1226   PROCTYPE                 N3PF.                                    
      @1229   PSTATE                   $CHAR2.                                  
      @1231   PSTCO2                   N5PF.                                    
      @1236   RACE                     N2PF.                                    
      @1238   RACE_X                   $CHAR5.                                  
      @1243   STATE_AS                 N2PF.                                    
      @1245   STATE_ED                 N2PF.                                    
      @1247   STATE_OS                 N2PF.                                    
      @1249   TOTCHG                   N10PF.                                   
      @1259   TOTCHG_X                 N15P2F.                                  
      @1274   TransportToHosp          N2PF.                                    
      @1276   VisitLink                N9PF.                                    
      @1285   YEAR                     N4PF.                                    
      @1289   ZIP3                     $CHAR3.                                  
      @1292   ZIPINC_QRTL              N3PF.                                    
      @1295   AYEAR                    N4PF.                                    
      @1299   DMONTH                   N2PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
