/*******************************************************************            
* Creation Date: 09/29/2022                                                     
*   OR_SEDD_2021_CORE.SAS:                                                      
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
DATA OR_SEDDC_2021_CORE;                                                        
INFILE 'OR_SEDD_2021_CORE.ASC' FIRSTOBS=3 LRECL = 2315;                         
                                                                                
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
                                                                                
  CPT115                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 115"                                          
                                                                                
  CPT116                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 116"                                          
                                                                                
  CPT117                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 117"                                          
                                                                                
  CPT118                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 118"                                          
                                                                                
  CPT119                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 119"                                          
                                                                                
  CPT120                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 120"                                          
                                                                                
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
                                                                                
  CPTCCS115                  LENGTH=4                                           
  LABEL="CCS: CPT 115"                                                          
                                                                                
  CPTCCS116                  LENGTH=4                                           
  LABEL="CCS: CPT 116"                                                          
                                                                                
  CPTCCS117                  LENGTH=4                                           
  LABEL="CCS: CPT 117"                                                          
                                                                                
  CPTCCS118                  LENGTH=4                                           
  LABEL="CCS: CPT 118"                                                          
                                                                                
  CPTCCS119                  LENGTH=4                                           
  LABEL="CCS: CPT 119"                                                          
                                                                                
  CPTCCS120                  LENGTH=4                                           
  LABEL="CCS: CPT 120"                                                          
                                                                                
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
                                                                                
  CPTDAY101                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT101"                               
                                                                                
  CPTDAY102                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT102"                               
                                                                                
  CPTDAY103                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT103"                               
                                                                                
  CPTDAY104                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT104"                               
                                                                                
  CPTDAY105                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT105"                               
                                                                                
  CPTDAY106                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT106"                               
                                                                                
  CPTDAY107                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT107"                               
                                                                                
  CPTDAY108                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT108"                               
                                                                                
  CPTDAY109                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT109"                               
                                                                                
  CPTDAY110                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT110"                               
                                                                                
  CPTDAY111                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT111"                               
                                                                                
  CPTDAY112                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT112"                               
                                                                                
  CPTDAY113                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT113"                               
                                                                                
  CPTDAY114                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT114"                               
                                                                                
  CPTDAY115                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT115"                               
                                                                                
  CPTDAY116                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT116"                               
                                                                                
  CPTDAY117                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT117"                               
                                                                                
  CPTDAY118                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT118"                               
                                                                                
  CPTDAY119                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT119"                               
                                                                                
  CPTDAY120                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT120"                               
                                                                                
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
                                                                                
  CPTM1_101                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 101"                                        
                                                                                
  CPTM1_102                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 102"                                        
                                                                                
  CPTM1_103                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 103"                                        
                                                                                
  CPTM1_104                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 104"                                        
                                                                                
  CPTM1_105                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 105"                                        
                                                                                
  CPTM1_106                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 106"                                        
                                                                                
  CPTM1_107                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 107"                                        
                                                                                
  CPTM1_108                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 108"                                        
                                                                                
  CPTM1_109                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 109"                                        
                                                                                
  CPTM1_110                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 110"                                        
                                                                                
  CPTM1_111                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 111"                                        
                                                                                
  CPTM1_112                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 112"                                        
                                                                                
  CPTM1_113                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 113"                                        
                                                                                
  CPTM1_114                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 114"                                        
                                                                                
  CPTM1_115                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 115"                                        
                                                                                
  CPTM1_116                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 116"                                        
                                                                                
  CPTM1_117                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 117"                                        
                                                                                
  CPTM1_118                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 118"                                        
                                                                                
  CPTM1_119                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 119"                                        
                                                                                
  CPTM1_120                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 120"                                        
                                                                                
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
                                                                                
  CPTM2_101                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 101"                                       
                                                                                
  CPTM2_102                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 102"                                       
                                                                                
  CPTM2_103                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 103"                                       
                                                                                
  CPTM2_104                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 104"                                       
                                                                                
  CPTM2_105                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 105"                                       
                                                                                
  CPTM2_106                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 106"                                       
                                                                                
  CPTM2_107                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 107"                                       
                                                                                
  CPTM2_108                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 108"                                       
                                                                                
  CPTM2_109                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 109"                                       
                                                                                
  CPTM2_110                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 110"                                       
                                                                                
  CPTM2_111                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 111"                                       
                                                                                
  CPTM2_112                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 112"                                       
                                                                                
  CPTM2_113                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 113"                                       
                                                                                
  CPTM2_114                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 114"                                       
                                                                                
  CPTM2_115                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 115"                                       
                                                                                
  CPTM2_116                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 116"                                       
                                                                                
  CPTM2_117                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 117"                                       
                                                                                
  CPTM2_118                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 118"                                       
                                                                                
  CPTM2_119                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 119"                                       
                                                                                
  CPTM2_120                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 120"                                       
                                                                                
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
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HCUP_SURGERY_BROAD_CPT     LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Number of reported CPT procedures that qualify as a surgery using a broad defin
ition"                                                                          
                                                                                
  HCUP_SURGERY_NARROW_CPT    LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Number of reported CPT procedures that qualify as a surgery using a narrow defi
nition"                                                                         
                                                                                
  HISPANIC                   LENGTH=3                                           
  LABEL="Hispanic ethnicity (uniform)"                                          
                                                                                
  HISPANIC_X                 LENGTH=$2                                          
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  Homeless                   LENGTH=3                                           
  LABEL="Indicator that patient is homeless"                                    
                                                                                
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
                                                                                
  MDNUM4_R                   LENGTH=5                                           
  LABEL="Physician 4 number (re-identified)"                                    
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures for this visit"                         
                                                                                
  OPservice                  LENGTH=$1                                          
  LABEL="Indicator of outpatient service (as received from source)"             
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$9                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$9                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$9                                          
  LABEL="Tertiary expected payer (as received from source)"                     
                                                                                
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
                                                                                
  PointOfOrigin_X            LENGTH=$2                                          
  LABEL="Point of origin for admission or visit, as received from source"       
                                                                                
  PointOfOriginUB04          LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, UB-04 standard coding"         
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTATE_GEO                 LENGTH=$2                                          
  LABEL="Patient State postal code assigned from ZIP Code"                      
                                                                                
  PSTCO                      LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO_GEO                  LENGTH=4                      FORMAT=Z5.           
  LABEL="Counties assigned based on ZIP Code geographic centroids"              
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_PCT_MISS_HOSP         LENGTH=4                      FORMAT=6.2           
  LABEL="Hospital percentage of missing or invalid race values"                 
                                                                                
  RACE_X                     LENGTH=$2                                          
  LABEL="Race (as received from source)"                                        
                                                                                
  SASD_SEDD                  LENGTH=3                                           
  LABEL="SASD and SEDD indicator"                                               
                                                                                
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
      @10     AHOUR                         N4PF.                               
      @14     AMONTH                        N2PF.                               
      @16     ATYPE                         N2PF.                               
      @18     AWEEKEND                      N2PF.                               
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
      @270    CPT51                         $CHAR5.                             
      @275    CPT52                         $CHAR5.                             
      @280    CPT53                         $CHAR5.                             
      @285    CPT54                         $CHAR5.                             
      @290    CPT55                         $CHAR5.                             
      @295    CPT56                         $CHAR5.                             
      @300    CPT57                         $CHAR5.                             
      @305    CPT58                         $CHAR5.                             
      @310    CPT59                         $CHAR5.                             
      @315    CPT60                         $CHAR5.                             
      @320    CPT61                         $CHAR5.                             
      @325    CPT62                         $CHAR5.                             
      @330    CPT63                         $CHAR5.                             
      @335    CPT64                         $CHAR5.                             
      @340    CPT65                         $CHAR5.                             
      @345    CPT66                         $CHAR5.                             
      @350    CPT67                         $CHAR5.                             
      @355    CPT68                         $CHAR5.                             
      @360    CPT69                         $CHAR5.                             
      @365    CPT70                         $CHAR5.                             
      @370    CPT71                         $CHAR5.                             
      @375    CPT72                         $CHAR5.                             
      @380    CPT73                         $CHAR5.                             
      @385    CPT74                         $CHAR5.                             
      @390    CPT75                         $CHAR5.                             
      @395    CPT76                         $CHAR5.                             
      @400    CPT77                         $CHAR5.                             
      @405    CPT78                         $CHAR5.                             
      @410    CPT79                         $CHAR5.                             
      @415    CPT80                         $CHAR5.                             
      @420    CPT81                         $CHAR5.                             
      @425    CPT82                         $CHAR5.                             
      @430    CPT83                         $CHAR5.                             
      @435    CPT84                         $CHAR5.                             
      @440    CPT85                         $CHAR5.                             
      @445    CPT86                         $CHAR5.                             
      @450    CPT87                         $CHAR5.                             
      @455    CPT88                         $CHAR5.                             
      @460    CPT89                         $CHAR5.                             
      @465    CPT90                         $CHAR5.                             
      @470    CPT91                         $CHAR5.                             
      @475    CPT92                         $CHAR5.                             
      @480    CPT93                         $CHAR5.                             
      @485    CPT94                         $CHAR5.                             
      @490    CPT95                         $CHAR5.                             
      @495    CPT96                         $CHAR5.                             
      @500    CPT97                         $CHAR5.                             
      @505    CPT98                         $CHAR5.                             
      @510    CPT99                         $CHAR5.                             
      @515    CPT100                        $CHAR5.                             
      @520    CPT101                        $CHAR5.                             
      @525    CPT102                        $CHAR5.                             
      @530    CPT103                        $CHAR5.                             
      @535    CPT104                        $CHAR5.                             
      @540    CPT105                        $CHAR5.                             
      @545    CPT106                        $CHAR5.                             
      @550    CPT107                        $CHAR5.                             
      @555    CPT108                        $CHAR5.                             
      @560    CPT109                        $CHAR5.                             
      @565    CPT110                        $CHAR5.                             
      @570    CPT111                        $CHAR5.                             
      @575    CPT112                        $CHAR5.                             
      @580    CPT113                        $CHAR5.                             
      @585    CPT114                        $CHAR5.                             
      @590    CPT115                        $CHAR5.                             
      @595    CPT116                        $CHAR5.                             
      @600    CPT117                        $CHAR5.                             
      @605    CPT118                        $CHAR5.                             
      @610    CPT119                        $CHAR5.                             
      @615    CPT120                        $CHAR5.                             
      @620    CPTCCS1                       N3PF.                               
      @623    CPTCCS2                       N3PF.                               
      @626    CPTCCS3                       N3PF.                               
      @629    CPTCCS4                       N3PF.                               
      @632    CPTCCS5                       N3PF.                               
      @635    CPTCCS6                       N3PF.                               
      @638    CPTCCS7                       N3PF.                               
      @641    CPTCCS8                       N3PF.                               
      @644    CPTCCS9                       N3PF.                               
      @647    CPTCCS10                      N3PF.                               
      @650    CPTCCS11                      N3PF.                               
      @653    CPTCCS12                      N3PF.                               
      @656    CPTCCS13                      N3PF.                               
      @659    CPTCCS14                      N3PF.                               
      @662    CPTCCS15                      N3PF.                               
      @665    CPTCCS16                      N3PF.                               
      @668    CPTCCS17                      N3PF.                               
      @671    CPTCCS18                      N3PF.                               
      @674    CPTCCS19                      N3PF.                               
      @677    CPTCCS20                      N3PF.                               
      @680    CPTCCS21                      N3PF.                               
      @683    CPTCCS22                      N3PF.                               
      @686    CPTCCS23                      N3PF.                               
      @689    CPTCCS24                      N3PF.                               
      @692    CPTCCS25                      N3PF.                               
      @695    CPTCCS26                      N3PF.                               
      @698    CPTCCS27                      N3PF.                               
      @701    CPTCCS28                      N3PF.                               
      @704    CPTCCS29                      N3PF.                               
      @707    CPTCCS30                      N3PF.                               
      @710    CPTCCS31                      N3PF.                               
      @713    CPTCCS32                      N3PF.                               
      @716    CPTCCS33                      N3PF.                               
      @719    CPTCCS34                      N3PF.                               
      @722    CPTCCS35                      N3PF.                               
      @725    CPTCCS36                      N3PF.                               
      @728    CPTCCS37                      N3PF.                               
      @731    CPTCCS38                      N3PF.                               
      @734    CPTCCS39                      N3PF.                               
      @737    CPTCCS40                      N3PF.                               
      @740    CPTCCS41                      N3PF.                               
      @743    CPTCCS42                      N3PF.                               
      @746    CPTCCS43                      N3PF.                               
      @749    CPTCCS44                      N3PF.                               
      @752    CPTCCS45                      N3PF.                               
      @755    CPTCCS46                      N3PF.                               
      @758    CPTCCS47                      N3PF.                               
      @761    CPTCCS48                      N3PF.                               
      @764    CPTCCS49                      N3PF.                               
      @767    CPTCCS50                      N3PF.                               
      @770    CPTCCS51                      N3PF.                               
      @773    CPTCCS52                      N3PF.                               
      @776    CPTCCS53                      N3PF.                               
      @779    CPTCCS54                      N3PF.                               
      @782    CPTCCS55                      N3PF.                               
      @785    CPTCCS56                      N3PF.                               
      @788    CPTCCS57                      N3PF.                               
      @791    CPTCCS58                      N3PF.                               
      @794    CPTCCS59                      N3PF.                               
      @797    CPTCCS60                      N3PF.                               
      @800    CPTCCS61                      N3PF.                               
      @803    CPTCCS62                      N3PF.                               
      @806    CPTCCS63                      N3PF.                               
      @809    CPTCCS64                      N3PF.                               
      @812    CPTCCS65                      N3PF.                               
      @815    CPTCCS66                      N3PF.                               
      @818    CPTCCS67                      N3PF.                               
      @821    CPTCCS68                      N3PF.                               
      @824    CPTCCS69                      N3PF.                               
      @827    CPTCCS70                      N3PF.                               
      @830    CPTCCS71                      N3PF.                               
      @833    CPTCCS72                      N3PF.                               
      @836    CPTCCS73                      N3PF.                               
      @839    CPTCCS74                      N3PF.                               
      @842    CPTCCS75                      N3PF.                               
      @845    CPTCCS76                      N3PF.                               
      @848    CPTCCS77                      N3PF.                               
      @851    CPTCCS78                      N3PF.                               
      @854    CPTCCS79                      N3PF.                               
      @857    CPTCCS80                      N3PF.                               
      @860    CPTCCS81                      N3PF.                               
      @863    CPTCCS82                      N3PF.                               
      @866    CPTCCS83                      N3PF.                               
      @869    CPTCCS84                      N3PF.                               
      @872    CPTCCS85                      N3PF.                               
      @875    CPTCCS86                      N3PF.                               
      @878    CPTCCS87                      N3PF.                               
      @881    CPTCCS88                      N3PF.                               
      @884    CPTCCS89                      N3PF.                               
      @887    CPTCCS90                      N3PF.                               
      @890    CPTCCS91                      N3PF.                               
      @893    CPTCCS92                      N3PF.                               
      @896    CPTCCS93                      N3PF.                               
      @899    CPTCCS94                      N3PF.                               
      @902    CPTCCS95                      N3PF.                               
      @905    CPTCCS96                      N3PF.                               
      @908    CPTCCS97                      N3PF.                               
      @911    CPTCCS98                      N3PF.                               
      @914    CPTCCS99                      N3PF.                               
      @917    CPTCCS100                     N3PF.                               
      @920    CPTCCS101                     N3PF.                               
      @923    CPTCCS102                     N3PF.                               
      @926    CPTCCS103                     N3PF.                               
      @929    CPTCCS104                     N3PF.                               
      @932    CPTCCS105                     N3PF.                               
      @935    CPTCCS106                     N3PF.                               
      @938    CPTCCS107                     N3PF.                               
      @941    CPTCCS108                     N3PF.                               
      @944    CPTCCS109                     N3PF.                               
      @947    CPTCCS110                     N3PF.                               
      @950    CPTCCS111                     N3PF.                               
      @953    CPTCCS112                     N3PF.                               
      @956    CPTCCS113                     N3PF.                               
      @959    CPTCCS114                     N3PF.                               
      @962    CPTCCS115                     N3PF.                               
      @965    CPTCCS116                     N3PF.                               
      @968    CPTCCS117                     N3PF.                               
      @971    CPTCCS118                     N3PF.                               
      @974    CPTCCS119                     N3PF.                               
      @977    CPTCCS120                     N3PF.                               
      @980    CPTDAY1                       N3PF.                               
      @983    CPTDAY2                       N3PF.                               
      @986    CPTDAY3                       N3PF.                               
      @989    CPTDAY4                       N3PF.                               
      @992    CPTDAY5                       N3PF.                               
      @995    CPTDAY6                       N3PF.                               
      @998    CPTDAY7                       N3PF.                               
      @1001   CPTDAY8                       N3PF.                               
      @1004   CPTDAY9                       N3PF.                               
      @1007   CPTDAY10                      N3PF.                               
      @1010   CPTDAY11                      N3PF.                               
      @1013   CPTDAY12                      N3PF.                               
      @1016   CPTDAY13                      N3PF.                               
      @1019   CPTDAY14                      N3PF.                               
      @1022   CPTDAY15                      N3PF.                               
      @1025   CPTDAY16                      N3PF.                               
      @1028   CPTDAY17                      N3PF.                               
      @1031   CPTDAY18                      N3PF.                               
      @1034   CPTDAY19                      N3PF.                               
      @1037   CPTDAY20                      N3PF.                               
      @1040   CPTDAY21                      N3PF.                               
      @1043   CPTDAY22                      N3PF.                               
      @1046   CPTDAY23                      N3PF.                               
      @1049   CPTDAY24                      N3PF.                               
      @1052   CPTDAY25                      N3PF.                               
      @1055   CPTDAY26                      N3PF.                               
      @1058   CPTDAY27                      N3PF.                               
      @1061   CPTDAY28                      N3PF.                               
      @1064   CPTDAY29                      N3PF.                               
      @1067   CPTDAY30                      N3PF.                               
      @1070   CPTDAY31                      N3PF.                               
      @1073   CPTDAY32                      N3PF.                               
      @1076   CPTDAY33                      N3PF.                               
      @1079   CPTDAY34                      N3PF.                               
      @1082   CPTDAY35                      N3PF.                               
      @1085   CPTDAY36                      N3PF.                               
      @1088   CPTDAY37                      N3PF.                               
      @1091   CPTDAY38                      N3PF.                               
      @1094   CPTDAY39                      N3PF.                               
      @1097   CPTDAY40                      N3PF.                               
      @1100   CPTDAY41                      N3PF.                               
      @1103   CPTDAY42                      N3PF.                               
      @1106   CPTDAY43                      N3PF.                               
      @1109   CPTDAY44                      N3PF.                               
      @1112   CPTDAY45                      N3PF.                               
      @1115   CPTDAY46                      N3PF.                               
      @1118   CPTDAY47                      N3PF.                               
      @1121   CPTDAY48                      N3PF.                               
      @1124   CPTDAY49                      N3PF.                               
      @1127   CPTDAY50                      N3PF.                               
      @1130   CPTDAY51                      N3PF.                               
      @1133   CPTDAY52                      N3PF.                               
      @1136   CPTDAY53                      N3PF.                               
      @1139   CPTDAY54                      N3PF.                               
      @1142   CPTDAY55                      N3PF.                               
      @1145   CPTDAY56                      N3PF.                               
      @1148   CPTDAY57                      N3PF.                               
      @1151   CPTDAY58                      N3PF.                               
      @1154   CPTDAY59                      N3PF.                               
      @1157   CPTDAY60                      N3PF.                               
      @1160   CPTDAY61                      N3PF.                               
      @1163   CPTDAY62                      N3PF.                               
      @1166   CPTDAY63                      N3PF.                               
      @1169   CPTDAY64                      N3PF.                               
      @1172   CPTDAY65                      N3PF.                               
      @1175   CPTDAY66                      N3PF.                               
      @1178   CPTDAY67                      N3PF.                               
      @1181   CPTDAY68                      N3PF.                               
      @1184   CPTDAY69                      N3PF.                               
      @1187   CPTDAY70                      N3PF.                               
      @1190   CPTDAY71                      N3PF.                               
      @1193   CPTDAY72                      N3PF.                               
      @1196   CPTDAY73                      N3PF.                               
      @1199   CPTDAY74                      N3PF.                               
      @1202   CPTDAY75                      N3PF.                               
      @1205   CPTDAY76                      N3PF.                               
      @1208   CPTDAY77                      N3PF.                               
      @1211   CPTDAY78                      N3PF.                               
      @1214   CPTDAY79                      N3PF.                               
      @1217   CPTDAY80                      N3PF.                               
      @1220   CPTDAY81                      N3PF.                               
      @1223   CPTDAY82                      N3PF.                               
      @1226   CPTDAY83                      N3PF.                               
      @1229   CPTDAY84                      N3PF.                               
      @1232   CPTDAY85                      N3PF.                               
      @1235   CPTDAY86                      N3PF.                               
      @1238   CPTDAY87                      N3PF.                               
      @1241   CPTDAY88                      N3PF.                               
      @1244   CPTDAY89                      N3PF.                               
      @1247   CPTDAY90                      N3PF.                               
      @1250   CPTDAY91                      N3PF.                               
      @1253   CPTDAY92                      N3PF.                               
      @1256   CPTDAY93                      N3PF.                               
      @1259   CPTDAY94                      N3PF.                               
      @1262   CPTDAY95                      N3PF.                               
      @1265   CPTDAY96                      N3PF.                               
      @1268   CPTDAY97                      N3PF.                               
      @1271   CPTDAY98                      N3PF.                               
      @1274   CPTDAY99                      N3PF.                               
      @1277   CPTDAY100                     N3PF.                               
      @1280   CPTDAY101                     N3PF.                               
      @1283   CPTDAY102                     N3PF.                               
      @1286   CPTDAY103                     N3PF.                               
      @1289   CPTDAY104                     N3PF.                               
      @1292   CPTDAY105                     N3PF.                               
      @1295   CPTDAY106                     N3PF.                               
      @1298   CPTDAY107                     N3PF.                               
      @1301   CPTDAY108                     N3PF.                               
      @1304   CPTDAY109                     N3PF.                               
      @1307   CPTDAY110                     N3PF.                               
      @1310   CPTDAY111                     N3PF.                               
      @1313   CPTDAY112                     N3PF.                               
      @1316   CPTDAY113                     N3PF.                               
      @1319   CPTDAY114                     N3PF.                               
      @1322   CPTDAY115                     N3PF.                               
      @1325   CPTDAY116                     N3PF.                               
      @1328   CPTDAY117                     N3PF.                               
      @1331   CPTDAY118                     N3PF.                               
      @1334   CPTDAY119                     N3PF.                               
      @1337   CPTDAY120                     N3PF.                               
      @1340   CPTM1_1                       $CHAR2.                             
      @1342   CPTM1_2                       $CHAR2.                             
      @1344   CPTM1_3                       $CHAR2.                             
      @1346   CPTM1_4                       $CHAR2.                             
      @1348   CPTM1_5                       $CHAR2.                             
      @1350   CPTM1_6                       $CHAR2.                             
      @1352   CPTM1_7                       $CHAR2.                             
      @1354   CPTM1_8                       $CHAR2.                             
      @1356   CPTM1_9                       $CHAR2.                             
      @1358   CPTM1_10                      $CHAR2.                             
      @1360   CPTM1_11                      $CHAR2.                             
      @1362   CPTM1_12                      $CHAR2.                             
      @1364   CPTM1_13                      $CHAR2.                             
      @1366   CPTM1_14                      $CHAR2.                             
      @1368   CPTM1_15                      $CHAR2.                             
      @1370   CPTM1_16                      $CHAR2.                             
      @1372   CPTM1_17                      $CHAR2.                             
      @1374   CPTM1_18                      $CHAR2.                             
      @1376   CPTM1_19                      $CHAR2.                             
      @1378   CPTM1_20                      $CHAR2.                             
      @1380   CPTM1_21                      $CHAR2.                             
      @1382   CPTM1_22                      $CHAR2.                             
      @1384   CPTM1_23                      $CHAR2.                             
      @1386   CPTM1_24                      $CHAR2.                             
      @1388   CPTM1_25                      $CHAR2.                             
      @1390   CPTM1_26                      $CHAR2.                             
      @1392   CPTM1_27                      $CHAR2.                             
      @1394   CPTM1_28                      $CHAR2.                             
      @1396   CPTM1_29                      $CHAR2.                             
      @1398   CPTM1_30                      $CHAR2.                             
      @1400   CPTM1_31                      $CHAR2.                             
      @1402   CPTM1_32                      $CHAR2.                             
      @1404   CPTM1_33                      $CHAR2.                             
      @1406   CPTM1_34                      $CHAR2.                             
      @1408   CPTM1_35                      $CHAR2.                             
      @1410   CPTM1_36                      $CHAR2.                             
      @1412   CPTM1_37                      $CHAR2.                             
      @1414   CPTM1_38                      $CHAR2.                             
      @1416   CPTM1_39                      $CHAR2.                             
      @1418   CPTM1_40                      $CHAR2.                             
      @1420   CPTM1_41                      $CHAR2.                             
      @1422   CPTM1_42                      $CHAR2.                             
      @1424   CPTM1_43                      $CHAR2.                             
      @1426   CPTM1_44                      $CHAR2.                             
      @1428   CPTM1_45                      $CHAR2.                             
      @1430   CPTM1_46                      $CHAR2.                             
      @1432   CPTM1_47                      $CHAR2.                             
      @1434   CPTM1_48                      $CHAR2.                             
      @1436   CPTM1_49                      $CHAR2.                             
      @1438   CPTM1_50                      $CHAR2.                             
      @1440   CPTM1_51                      $CHAR2.                             
      @1442   CPTM1_52                      $CHAR2.                             
      @1444   CPTM1_53                      $CHAR2.                             
      @1446   CPTM1_54                      $CHAR2.                             
      @1448   CPTM1_55                      $CHAR2.                             
      @1450   CPTM1_56                      $CHAR2.                             
      @1452   CPTM1_57                      $CHAR2.                             
      @1454   CPTM1_58                      $CHAR2.                             
      @1456   CPTM1_59                      $CHAR2.                             
      @1458   CPTM1_60                      $CHAR2.                             
      @1460   CPTM1_61                      $CHAR2.                             
      @1462   CPTM1_62                      $CHAR2.                             
      @1464   CPTM1_63                      $CHAR2.                             
      @1466   CPTM1_64                      $CHAR2.                             
      @1468   CPTM1_65                      $CHAR2.                             
      @1470   CPTM1_66                      $CHAR2.                             
      @1472   CPTM1_67                      $CHAR2.                             
      @1474   CPTM1_68                      $CHAR2.                             
      @1476   CPTM1_69                      $CHAR2.                             
      @1478   CPTM1_70                      $CHAR2.                             
      @1480   CPTM1_71                      $CHAR2.                             
      @1482   CPTM1_72                      $CHAR2.                             
      @1484   CPTM1_73                      $CHAR2.                             
      @1486   CPTM1_74                      $CHAR2.                             
      @1488   CPTM1_75                      $CHAR2.                             
      @1490   CPTM1_76                      $CHAR2.                             
      @1492   CPTM1_77                      $CHAR2.                             
      @1494   CPTM1_78                      $CHAR2.                             
      @1496   CPTM1_79                      $CHAR2.                             
      @1498   CPTM1_80                      $CHAR2.                             
      @1500   CPTM1_81                      $CHAR2.                             
      @1502   CPTM1_82                      $CHAR2.                             
      @1504   CPTM1_83                      $CHAR2.                             
      @1506   CPTM1_84                      $CHAR2.                             
      @1508   CPTM1_85                      $CHAR2.                             
      @1510   CPTM1_86                      $CHAR2.                             
      @1512   CPTM1_87                      $CHAR2.                             
      @1514   CPTM1_88                      $CHAR2.                             
      @1516   CPTM1_89                      $CHAR2.                             
      @1518   CPTM1_90                      $CHAR2.                             
      @1520   CPTM1_91                      $CHAR2.                             
      @1522   CPTM1_92                      $CHAR2.                             
      @1524   CPTM1_93                      $CHAR2.                             
      @1526   CPTM1_94                      $CHAR2.                             
      @1528   CPTM1_95                      $CHAR2.                             
      @1530   CPTM1_96                      $CHAR2.                             
      @1532   CPTM1_97                      $CHAR2.                             
      @1534   CPTM1_98                      $CHAR2.                             
      @1536   CPTM1_99                      $CHAR2.                             
      @1538   CPTM1_100                     $CHAR2.                             
      @1540   CPTM1_101                     $CHAR2.                             
      @1542   CPTM1_102                     $CHAR2.                             
      @1544   CPTM1_103                     $CHAR2.                             
      @1546   CPTM1_104                     $CHAR2.                             
      @1548   CPTM1_105                     $CHAR2.                             
      @1550   CPTM1_106                     $CHAR2.                             
      @1552   CPTM1_107                     $CHAR2.                             
      @1554   CPTM1_108                     $CHAR2.                             
      @1556   CPTM1_109                     $CHAR2.                             
      @1558   CPTM1_110                     $CHAR2.                             
      @1560   CPTM1_111                     $CHAR2.                             
      @1562   CPTM1_112                     $CHAR2.                             
      @1564   CPTM1_113                     $CHAR2.                             
      @1566   CPTM1_114                     $CHAR2.                             
      @1568   CPTM1_115                     $CHAR2.                             
      @1570   CPTM1_116                     $CHAR2.                             
      @1572   CPTM1_117                     $CHAR2.                             
      @1574   CPTM1_118                     $CHAR2.                             
      @1576   CPTM1_119                     $CHAR2.                             
      @1578   CPTM1_120                     $CHAR2.                             
      @1580   CPTM2_1                       $CHAR2.                             
      @1582   CPTM2_2                       $CHAR2.                             
      @1584   CPTM2_3                       $CHAR2.                             
      @1586   CPTM2_4                       $CHAR2.                             
      @1588   CPTM2_5                       $CHAR2.                             
      @1590   CPTM2_6                       $CHAR2.                             
      @1592   CPTM2_7                       $CHAR2.                             
      @1594   CPTM2_8                       $CHAR2.                             
      @1596   CPTM2_9                       $CHAR2.                             
      @1598   CPTM2_10                      $CHAR2.                             
      @1600   CPTM2_11                      $CHAR2.                             
      @1602   CPTM2_12                      $CHAR2.                             
      @1604   CPTM2_13                      $CHAR2.                             
      @1606   CPTM2_14                      $CHAR2.                             
      @1608   CPTM2_15                      $CHAR2.                             
      @1610   CPTM2_16                      $CHAR2.                             
      @1612   CPTM2_17                      $CHAR2.                             
      @1614   CPTM2_18                      $CHAR2.                             
      @1616   CPTM2_19                      $CHAR2.                             
      @1618   CPTM2_20                      $CHAR2.                             
      @1620   CPTM2_21                      $CHAR2.                             
      @1622   CPTM2_22                      $CHAR2.                             
      @1624   CPTM2_23                      $CHAR2.                             
      @1626   CPTM2_24                      $CHAR2.                             
      @1628   CPTM2_25                      $CHAR2.                             
      @1630   CPTM2_26                      $CHAR2.                             
      @1632   CPTM2_27                      $CHAR2.                             
      @1634   CPTM2_28                      $CHAR2.                             
      @1636   CPTM2_29                      $CHAR2.                             
      @1638   CPTM2_30                      $CHAR2.                             
      @1640   CPTM2_31                      $CHAR2.                             
      @1642   CPTM2_32                      $CHAR2.                             
      @1644   CPTM2_33                      $CHAR2.                             
      @1646   CPTM2_34                      $CHAR2.                             
      @1648   CPTM2_35                      $CHAR2.                             
      @1650   CPTM2_36                      $CHAR2.                             
      @1652   CPTM2_37                      $CHAR2.                             
      @1654   CPTM2_38                      $CHAR2.                             
      @1656   CPTM2_39                      $CHAR2.                             
      @1658   CPTM2_40                      $CHAR2.                             
      @1660   CPTM2_41                      $CHAR2.                             
      @1662   CPTM2_42                      $CHAR2.                             
      @1664   CPTM2_43                      $CHAR2.                             
      @1666   CPTM2_44                      $CHAR2.                             
      @1668   CPTM2_45                      $CHAR2.                             
      @1670   CPTM2_46                      $CHAR2.                             
      @1672   CPTM2_47                      $CHAR2.                             
      @1674   CPTM2_48                      $CHAR2.                             
      @1676   CPTM2_49                      $CHAR2.                             
      @1678   CPTM2_50                      $CHAR2.                             
      @1680   CPTM2_51                      $CHAR2.                             
      @1682   CPTM2_52                      $CHAR2.                             
      @1684   CPTM2_53                      $CHAR2.                             
      @1686   CPTM2_54                      $CHAR2.                             
      @1688   CPTM2_55                      $CHAR2.                             
      @1690   CPTM2_56                      $CHAR2.                             
      @1692   CPTM2_57                      $CHAR2.                             
      @1694   CPTM2_58                      $CHAR2.                             
      @1696   CPTM2_59                      $CHAR2.                             
      @1698   CPTM2_60                      $CHAR2.                             
      @1700   CPTM2_61                      $CHAR2.                             
      @1702   CPTM2_62                      $CHAR2.                             
      @1704   CPTM2_63                      $CHAR2.                             
      @1706   CPTM2_64                      $CHAR2.                             
      @1708   CPTM2_65                      $CHAR2.                             
      @1710   CPTM2_66                      $CHAR2.                             
      @1712   CPTM2_67                      $CHAR2.                             
      @1714   CPTM2_68                      $CHAR2.                             
      @1716   CPTM2_69                      $CHAR2.                             
      @1718   CPTM2_70                      $CHAR2.                             
      @1720   CPTM2_71                      $CHAR2.                             
      @1722   CPTM2_72                      $CHAR2.                             
      @1724   CPTM2_73                      $CHAR2.                             
      @1726   CPTM2_74                      $CHAR2.                             
      @1728   CPTM2_75                      $CHAR2.                             
      @1730   CPTM2_76                      $CHAR2.                             
      @1732   CPTM2_77                      $CHAR2.                             
      @1734   CPTM2_78                      $CHAR2.                             
      @1736   CPTM2_79                      $CHAR2.                             
      @1738   CPTM2_80                      $CHAR2.                             
      @1740   CPTM2_81                      $CHAR2.                             
      @1742   CPTM2_82                      $CHAR2.                             
      @1744   CPTM2_83                      $CHAR2.                             
      @1746   CPTM2_84                      $CHAR2.                             
      @1748   CPTM2_85                      $CHAR2.                             
      @1750   CPTM2_86                      $CHAR2.                             
      @1752   CPTM2_87                      $CHAR2.                             
      @1754   CPTM2_88                      $CHAR2.                             
      @1756   CPTM2_89                      $CHAR2.                             
      @1758   CPTM2_90                      $CHAR2.                             
      @1760   CPTM2_91                      $CHAR2.                             
      @1762   CPTM2_92                      $CHAR2.                             
      @1764   CPTM2_93                      $CHAR2.                             
      @1766   CPTM2_94                      $CHAR2.                             
      @1768   CPTM2_95                      $CHAR2.                             
      @1770   CPTM2_96                      $CHAR2.                             
      @1772   CPTM2_97                      $CHAR2.                             
      @1774   CPTM2_98                      $CHAR2.                             
      @1776   CPTM2_99                      $CHAR2.                             
      @1778   CPTM2_100                     $CHAR2.                             
      @1780   CPTM2_101                     $CHAR2.                             
      @1782   CPTM2_102                     $CHAR2.                             
      @1784   CPTM2_103                     $CHAR2.                             
      @1786   CPTM2_104                     $CHAR2.                             
      @1788   CPTM2_105                     $CHAR2.                             
      @1790   CPTM2_106                     $CHAR2.                             
      @1792   CPTM2_107                     $CHAR2.                             
      @1794   CPTM2_108                     $CHAR2.                             
      @1796   CPTM2_109                     $CHAR2.                             
      @1798   CPTM2_110                     $CHAR2.                             
      @1800   CPTM2_111                     $CHAR2.                             
      @1802   CPTM2_112                     $CHAR2.                             
      @1804   CPTM2_113                     $CHAR2.                             
      @1806   CPTM2_114                     $CHAR2.                             
      @1808   CPTM2_115                     $CHAR2.                             
      @1810   CPTM2_116                     $CHAR2.                             
      @1812   CPTM2_117                     $CHAR2.                             
      @1814   CPTM2_118                     $CHAR2.                             
      @1816   CPTM2_119                     $CHAR2.                             
      @1818   CPTM2_120                     $CHAR2.                             
      @1820   DHOUR                         N4PF.                               
      @1824   DIED                          N2PF.                               
      @1826   DISP_X                        $CHAR2.                             
      @1828   DISPUB04                      N2PF.                               
      @1830   DISPUNIFORM                   N2PF.                               
      @1832   DMONTH                        N2PF.                               
      @1834   DQTR                          N2PF.                               
      @1836   DSHOSPID                      $CHAR17.                            
      @1853   DURATION                      N6PF.                               
      @1859   FEMALE                        N2PF.                               
      @1861   HCUP_ED                       N2PF.                               
      @1863   HCUP_OS                       N2PF.                               
      @1865   HCUP_SURGERY_BROAD_CPT        N5PF.                               
      @1870   HCUP_SURGERY_NARROW_CPT       N5PF.                               
      @1875   HISPANIC                      N2PF.                               
      @1877   HISPANIC_X                    $CHAR2.                             
      @1879   Homeless                      N2PF.                               
      @1881   HOSPST                        $CHAR2.                             
      @1883   I10_DX_Visit_Reason1          $CHAR7.                             
      @1890   I10_DX_Visit_Reason2          $CHAR7.                             
      @1897   I10_DX_Visit_Reason3          $CHAR7.                             
      @1904   I10_DX1                       $CHAR7.                             
      @1911   I10_DX2                       $CHAR7.                             
      @1918   I10_DX3                       $CHAR7.                             
      @1925   I10_DX4                       $CHAR7.                             
      @1932   I10_DX5                       $CHAR7.                             
      @1939   I10_DX6                       $CHAR7.                             
      @1946   I10_DX7                       $CHAR7.                             
      @1953   I10_DX8                       $CHAR7.                             
      @1960   I10_DX9                       $CHAR7.                             
      @1967   I10_DX10                      $CHAR7.                             
      @1974   I10_DX11                      $CHAR7.                             
      @1981   I10_DX12                      $CHAR7.                             
      @1988   I10_DX13                      $CHAR7.                             
      @1995   I10_DX14                      $CHAR7.                             
      @2002   I10_DX15                      $CHAR7.                             
      @2009   I10_DX16                      $CHAR7.                             
      @2016   I10_DX17                      $CHAR7.                             
      @2023   I10_DX18                      $CHAR7.                             
      @2030   I10_DX19                      $CHAR7.                             
      @2037   I10_DX20                      $CHAR7.                             
      @2044   I10_DX21                      $CHAR7.                             
      @2051   I10_DX22                      $CHAR7.                             
      @2058   I10_DX23                      $CHAR7.                             
      @2065   I10_DX24                      $CHAR7.                             
      @2072   I10_DX25                      $CHAR7.                             
      @2079   I10_DX26                      $CHAR7.                             
      @2086   I10_DX27                      $CHAR7.                             
      @2093   I10_DX28                      $CHAR7.                             
      @2100   I10_NDX                       N3PF.                               
      @2103   I10_PROCTYPE                  N3PF.                               
      @2106   KEY                           15.                                 
      @2121   LOS                           N5PF.                               
      @2126   LOS_X                         N6PF.                               
      @2132   MDNUM1_R                      N9PF.                               
      @2141   MDNUM2_R                      N9PF.                               
      @2150   MDNUM3_R                      N9PF.                               
      @2159   MDNUM4_R                      N9PF.                               
      @2168   MEDINCSTQ                     N2PF.                               
      @2170   NCPT                          N4PF.                               
      @2174   OPservice                     $CHAR1.                             
      @2175   OS_TIME                       N11P2F.                             
      @2186   PAY1                          N2PF.                               
      @2188   PAY1_X                        $CHAR9.                             
      @2197   PAY2                          N2PF.                               
      @2199   PAY2_X                        $CHAR9.                             
      @2208   PAY3                          N2PF.                               
      @2210   PAY3_X                        $CHAR9.                             
      @2219   PL_CBSA                       N3PF.                               
      @2222   PL_NCHS                       N2PF.                               
      @2224   PL_RUCC                       N2PF.                               
      @2226   PL_UIC                        N2PF.                               
      @2228   PL_UR_CAT4                    N2PF.                               
      @2230   PointOfOrigin_X               $CHAR2.                             
      @2232   PointOfOriginUB04             $CHAR1.                             
      @2233   PSTATE                        $CHAR2.                             
      @2235   PSTATE_GEO                    $CHAR2.                             
      @2237   PSTCO                         N5PF.                               
      @2242   PSTCO_GEO                     N5PF.                               
      @2247   RACE                          N2PF.                               
      @2249   RACE_PCT_MISS_HOSP            N7P2F.                              
      @2256   RACE_X                        $CHAR2.                             
      @2258   SASD_SEDD                     N2PF.                               
      @2260   STATE_AS                      N2PF.                               
      @2262   STATE_ED                      N2PF.                               
      @2264   STATE_OS                      N2PF.                               
      @2266   TOTCHG                        N10PF.                              
      @2276   TOTCHG_X                      N15P2F.                             
      @2291   YEAR                          N4PF.                               
      @2295   ZIP                           $CHAR5.                             
      @2300   ZIP3                          $CHAR3.                             
      @2303   ZIPINC_QRTL                   N3PF.                               
      @2306   AYEAR                         N4PF.                               
      @2310   BMONTH                        N2PF.                               
      @2312   BYEAR                         N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
