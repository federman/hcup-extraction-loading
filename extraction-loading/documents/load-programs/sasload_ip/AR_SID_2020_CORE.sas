/*******************************************************************            
* Creation Date: 03/31/2022                                                     
*   AR_SID_2020_CORE.SAS:                                                       
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
DATA AR_SIDC_2020_CORE;                                                         
INFILE 'AR_SID_2020_CORE.ASC' FIRSTOBS=3 LRECL = 2321;                          
                                                                                
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
                                                                                
  APGAR1                     LENGTH=3                                           
  LABEL="One-minute APGAR score"                                                
                                                                                
  APGAR5                     LENGTH=3                                           
  LABEL="Five-minute APGAR score"                                               
                                                                                
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
                                                                                
  CPT121                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 121"                                          
                                                                                
  CPT122                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 122"                                          
                                                                                
  CPT123                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 123"                                          
                                                                                
  CPT124                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 124"                                          
                                                                                
  CPT125                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 125"                                          
                                                                                
  CPT126                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 126"                                          
                                                                                
  CPT127                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 127"                                          
                                                                                
  CPT128                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 128"                                          
                                                                                
  CPT129                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 129"                                          
                                                                                
  CPT130                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 130"                                          
                                                                                
  CPT131                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 131"                                          
                                                                                
  CPT132                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 132"                                          
                                                                                
  CPT133                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 133"                                          
                                                                                
  CPT134                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 134"                                          
                                                                                
  CPT135                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 135"                                          
                                                                                
  CPT136                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 136"                                          
                                                                                
  CPT137                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 137"                                          
                                                                                
  CPT138                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 138"                                          
                                                                                
  CPT139                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 139"                                          
                                                                                
  CPT140                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 140"                                          
                                                                                
  CPT141                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 141"                                          
                                                                                
  CPT142                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 142"                                          
                                                                                
  CPT143                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 143"                                          
                                                                                
  CPT144                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 144"                                          
                                                                                
  CPT145                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 145"                                          
                                                                                
  CPT146                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 146"                                          
                                                                                
  CPT147                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 147"                                          
                                                                                
  CPT148                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 148"                                          
                                                                                
  CPT149                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 149"                                          
                                                                                
  CPT150                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 150"                                          
                                                                                
  CPT151                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 151"                                          
                                                                                
  CPT152                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 152"                                          
                                                                                
  CPT153                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 153"                                          
                                                                                
  CPT154                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 154"                                          
                                                                                
  CPT155                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 155"                                          
                                                                                
  CPT156                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 156"                                          
                                                                                
  CPT157                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 157"                                          
                                                                                
  CPT158                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 158"                                          
                                                                                
  CPT159                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 159"                                          
                                                                                
  CPT160                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 160"                                          
                                                                                
  CPT161                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 161"                                          
                                                                                
  CPT162                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 162"                                          
                                                                                
  CPT163                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 163"                                          
                                                                                
  CPT164                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 164"                                          
                                                                                
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
                                                                                
  CPTCCS121                  LENGTH=4                                           
  LABEL="CCS: CPT 121"                                                          
                                                                                
  CPTCCS122                  LENGTH=4                                           
  LABEL="CCS: CPT 122"                                                          
                                                                                
  CPTCCS123                  LENGTH=4                                           
  LABEL="CCS: CPT 123"                                                          
                                                                                
  CPTCCS124                  LENGTH=4                                           
  LABEL="CCS: CPT 124"                                                          
                                                                                
  CPTCCS125                  LENGTH=4                                           
  LABEL="CCS: CPT 125"                                                          
                                                                                
  CPTCCS126                  LENGTH=4                                           
  LABEL="CCS: CPT 126"                                                          
                                                                                
  CPTCCS127                  LENGTH=4                                           
  LABEL="CCS: CPT 127"                                                          
                                                                                
  CPTCCS128                  LENGTH=4                                           
  LABEL="CCS: CPT 128"                                                          
                                                                                
  CPTCCS129                  LENGTH=4                                           
  LABEL="CCS: CPT 129"                                                          
                                                                                
  CPTCCS130                  LENGTH=4                                           
  LABEL="CCS: CPT 130"                                                          
                                                                                
  CPTCCS131                  LENGTH=4                                           
  LABEL="CCS: CPT 131"                                                          
                                                                                
  CPTCCS132                  LENGTH=4                                           
  LABEL="CCS: CPT 132"                                                          
                                                                                
  CPTCCS133                  LENGTH=4                                           
  LABEL="CCS: CPT 133"                                                          
                                                                                
  CPTCCS134                  LENGTH=4                                           
  LABEL="CCS: CPT 134"                                                          
                                                                                
  CPTCCS135                  LENGTH=4                                           
  LABEL="CCS: CPT 135"                                                          
                                                                                
  CPTCCS136                  LENGTH=4                                           
  LABEL="CCS: CPT 136"                                                          
                                                                                
  CPTCCS137                  LENGTH=4                                           
  LABEL="CCS: CPT 137"                                                          
                                                                                
  CPTCCS138                  LENGTH=4                                           
  LABEL="CCS: CPT 138"                                                          
                                                                                
  CPTCCS139                  LENGTH=4                                           
  LABEL="CCS: CPT 139"                                                          
                                                                                
  CPTCCS140                  LENGTH=4                                           
  LABEL="CCS: CPT 140"                                                          
                                                                                
  CPTCCS141                  LENGTH=4                                           
  LABEL="CCS: CPT 141"                                                          
                                                                                
  CPTCCS142                  LENGTH=4                                           
  LABEL="CCS: CPT 142"                                                          
                                                                                
  CPTCCS143                  LENGTH=4                                           
  LABEL="CCS: CPT 143"                                                          
                                                                                
  CPTCCS144                  LENGTH=4                                           
  LABEL="CCS: CPT 144"                                                          
                                                                                
  CPTCCS145                  LENGTH=4                                           
  LABEL="CCS: CPT 145"                                                          
                                                                                
  CPTCCS146                  LENGTH=4                                           
  LABEL="CCS: CPT 146"                                                          
                                                                                
  CPTCCS147                  LENGTH=4                                           
  LABEL="CCS: CPT 147"                                                          
                                                                                
  CPTCCS148                  LENGTH=4                                           
  LABEL="CCS: CPT 148"                                                          
                                                                                
  CPTCCS149                  LENGTH=4                                           
  LABEL="CCS: CPT 149"                                                          
                                                                                
  CPTCCS150                  LENGTH=4                                           
  LABEL="CCS: CPT 150"                                                          
                                                                                
  CPTCCS151                  LENGTH=4                                           
  LABEL="CCS: CPT 151"                                                          
                                                                                
  CPTCCS152                  LENGTH=4                                           
  LABEL="CCS: CPT 152"                                                          
                                                                                
  CPTCCS153                  LENGTH=4                                           
  LABEL="CCS: CPT 153"                                                          
                                                                                
  CPTCCS154                  LENGTH=4                                           
  LABEL="CCS: CPT 154"                                                          
                                                                                
  CPTCCS155                  LENGTH=4                                           
  LABEL="CCS: CPT 155"                                                          
                                                                                
  CPTCCS156                  LENGTH=4                                           
  LABEL="CCS: CPT 156"                                                          
                                                                                
  CPTCCS157                  LENGTH=4                                           
  LABEL="CCS: CPT 157"                                                          
                                                                                
  CPTCCS158                  LENGTH=4                                           
  LABEL="CCS: CPT 158"                                                          
                                                                                
  CPTCCS159                  LENGTH=4                                           
  LABEL="CCS: CPT 159"                                                          
                                                                                
  CPTCCS160                  LENGTH=4                                           
  LABEL="CCS: CPT 160"                                                          
                                                                                
  CPTCCS161                  LENGTH=4                                           
  LABEL="CCS: CPT 161"                                                          
                                                                                
  CPTCCS162                  LENGTH=4                                           
  LABEL="CCS: CPT 162"                                                          
                                                                                
  CPTCCS163                  LENGTH=4                                           
  LABEL="CCS: CPT 163"                                                          
                                                                                
  CPTCCS164                  LENGTH=4                                           
  LABEL="CCS: CPT 164"                                                          
                                                                                
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
                                                                                
  DNR                        LENGTH=3                                           
  LABEL="Do not resuscitate indicator"                                          
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DRG                        LENGTH=3                                           
  LABEL="DRG in effect on discharge date"                                       
                                                                                
  DRG_NoPOA                  LENGTH=3                                           
  LABEL="DRG in use on discharge date, calculated without POA"                  
                                                                                
  DRGVER                     LENGTH=3                                           
  LABEL="DRG grouper version used on discharge date"                            
                                                                                
  DSHOSPID                   LENGTH=$17                                         
  LABEL="Data source hospital identifier"                                       
                                                                                
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
                                                                                
  I10_BIRTH                  LENGTH=3                                           
  LABEL="ICD-10-CM Birth Indicator"                                             
                                                                                
  I10_DELIVERY               LENGTH=3                                           
  LABEL="ICD-10-CM Delivery Indicator"                                          
                                                                                
  I10_DX_Admitting           LENGTH=$7                                          
  LABEL="ICD-10-CM Admitting Diagnosis Code"                                    
                                                                                
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
                                                                                
  I10_PROCTYPE               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure type indicator"                                   
                                                                                
  I10_SERVICELINE            LENGTH=3                                           
  LABEL="ICD-10-CM/PCS Hospital Service Line"                                   
                                                                                
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
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures for this visit"                         
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  P7EDSRC_X                  LENGTH=$2                                          
  LABEL="Condition Code P7, Direct Inpatient Admission from Emergency Room"     
                                                                                
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
                                                                                
  PCLASS_ORPROC              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indicates operating room (major diagnostic or therapeutic) procedure on the rec
ord"                                                                            
                                                                                
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                           N3PF.                               
      @4      AGEDAY                        N3PF.                               
      @7      AGEMONTH                      N3PF.                               
      @10     AHOUR                         N4PF.                               
      @14     AMONTH                        N2PF.                               
      @16     APGAR1                        N2PF.                               
      @18     APGAR5                        N2PF.                               
      @20     ATYPE                         N2PF.                               
      @22     AWEEKEND                      N2PF.                               
      @24     BILLTYPE                      $CHAR4.                             
      @28     BWT                           N4PF.                               
      @32     CPT1                          $CHAR5.                             
      @37     CPT2                          $CHAR5.                             
      @42     CPT3                          $CHAR5.                             
      @47     CPT4                          $CHAR5.                             
      @52     CPT5                          $CHAR5.                             
      @57     CPT6                          $CHAR5.                             
      @62     CPT7                          $CHAR5.                             
      @67     CPT8                          $CHAR5.                             
      @72     CPT9                          $CHAR5.                             
      @77     CPT10                         $CHAR5.                             
      @82     CPT11                         $CHAR5.                             
      @87     CPT12                         $CHAR5.                             
      @92     CPT13                         $CHAR5.                             
      @97     CPT14                         $CHAR5.                             
      @102    CPT15                         $CHAR5.                             
      @107    CPT16                         $CHAR5.                             
      @112    CPT17                         $CHAR5.                             
      @117    CPT18                         $CHAR5.                             
      @122    CPT19                         $CHAR5.                             
      @127    CPT20                         $CHAR5.                             
      @132    CPT21                         $CHAR5.                             
      @137    CPT22                         $CHAR5.                             
      @142    CPT23                         $CHAR5.                             
      @147    CPT24                         $CHAR5.                             
      @152    CPT25                         $CHAR5.                             
      @157    CPT26                         $CHAR5.                             
      @162    CPT27                         $CHAR5.                             
      @167    CPT28                         $CHAR5.                             
      @172    CPT29                         $CHAR5.                             
      @177    CPT30                         $CHAR5.                             
      @182    CPT31                         $CHAR5.                             
      @187    CPT32                         $CHAR5.                             
      @192    CPT33                         $CHAR5.                             
      @197    CPT34                         $CHAR5.                             
      @202    CPT35                         $CHAR5.                             
      @207    CPT36                         $CHAR5.                             
      @212    CPT37                         $CHAR5.                             
      @217    CPT38                         $CHAR5.                             
      @222    CPT39                         $CHAR5.                             
      @227    CPT40                         $CHAR5.                             
      @232    CPT41                         $CHAR5.                             
      @237    CPT42                         $CHAR5.                             
      @242    CPT43                         $CHAR5.                             
      @247    CPT44                         $CHAR5.                             
      @252    CPT45                         $CHAR5.                             
      @257    CPT46                         $CHAR5.                             
      @262    CPT47                         $CHAR5.                             
      @267    CPT48                         $CHAR5.                             
      @272    CPT49                         $CHAR5.                             
      @277    CPT50                         $CHAR5.                             
      @282    CPT51                         $CHAR5.                             
      @287    CPT52                         $CHAR5.                             
      @292    CPT53                         $CHAR5.                             
      @297    CPT54                         $CHAR5.                             
      @302    CPT55                         $CHAR5.                             
      @307    CPT56                         $CHAR5.                             
      @312    CPT57                         $CHAR5.                             
      @317    CPT58                         $CHAR5.                             
      @322    CPT59                         $CHAR5.                             
      @327    CPT60                         $CHAR5.                             
      @332    CPT61                         $CHAR5.                             
      @337    CPT62                         $CHAR5.                             
      @342    CPT63                         $CHAR5.                             
      @347    CPT64                         $CHAR5.                             
      @352    CPT65                         $CHAR5.                             
      @357    CPT66                         $CHAR5.                             
      @362    CPT67                         $CHAR5.                             
      @367    CPT68                         $CHAR5.                             
      @372    CPT69                         $CHAR5.                             
      @377    CPT70                         $CHAR5.                             
      @382    CPT71                         $CHAR5.                             
      @387    CPT72                         $CHAR5.                             
      @392    CPT73                         $CHAR5.                             
      @397    CPT74                         $CHAR5.                             
      @402    CPT75                         $CHAR5.                             
      @407    CPT76                         $CHAR5.                             
      @412    CPT77                         $CHAR5.                             
      @417    CPT78                         $CHAR5.                             
      @422    CPT79                         $CHAR5.                             
      @427    CPT80                         $CHAR5.                             
      @432    CPT81                         $CHAR5.                             
      @437    CPT82                         $CHAR5.                             
      @442    CPT83                         $CHAR5.                             
      @447    CPT84                         $CHAR5.                             
      @452    CPT85                         $CHAR5.                             
      @457    CPT86                         $CHAR5.                             
      @462    CPT87                         $CHAR5.                             
      @467    CPT88                         $CHAR5.                             
      @472    CPT89                         $CHAR5.                             
      @477    CPT90                         $CHAR5.                             
      @482    CPT91                         $CHAR5.                             
      @487    CPT92                         $CHAR5.                             
      @492    CPT93                         $CHAR5.                             
      @497    CPT94                         $CHAR5.                             
      @502    CPT95                         $CHAR5.                             
      @507    CPT96                         $CHAR5.                             
      @512    CPT97                         $CHAR5.                             
      @517    CPT98                         $CHAR5.                             
      @522    CPT99                         $CHAR5.                             
      @527    CPT100                        $CHAR5.                             
      @532    CPT101                        $CHAR5.                             
      @537    CPT102                        $CHAR5.                             
      @542    CPT103                        $CHAR5.                             
      @547    CPT104                        $CHAR5.                             
      @552    CPT105                        $CHAR5.                             
      @557    CPT106                        $CHAR5.                             
      @562    CPT107                        $CHAR5.                             
      @567    CPT108                        $CHAR5.                             
      @572    CPT109                        $CHAR5.                             
      @577    CPT110                        $CHAR5.                             
      @582    CPT111                        $CHAR5.                             
      @587    CPT112                        $CHAR5.                             
      @592    CPT113                        $CHAR5.                             
      @597    CPT114                        $CHAR5.                             
      @602    CPT115                        $CHAR5.                             
      @607    CPT116                        $CHAR5.                             
      @612    CPT117                        $CHAR5.                             
      @617    CPT118                        $CHAR5.                             
      @622    CPT119                        $CHAR5.                             
      @627    CPT120                        $CHAR5.                             
      @632    CPT121                        $CHAR5.                             
      @637    CPT122                        $CHAR5.                             
      @642    CPT123                        $CHAR5.                             
      @647    CPT124                        $CHAR5.                             
      @652    CPT125                        $CHAR5.                             
      @657    CPT126                        $CHAR5.                             
      @662    CPT127                        $CHAR5.                             
      @667    CPT128                        $CHAR5.                             
      @672    CPT129                        $CHAR5.                             
      @677    CPT130                        $CHAR5.                             
      @682    CPT131                        $CHAR5.                             
      @687    CPT132                        $CHAR5.                             
      @692    CPT133                        $CHAR5.                             
      @697    CPT134                        $CHAR5.                             
      @702    CPT135                        $CHAR5.                             
      @707    CPT136                        $CHAR5.                             
      @712    CPT137                        $CHAR5.                             
      @717    CPT138                        $CHAR5.                             
      @722    CPT139                        $CHAR5.                             
      @727    CPT140                        $CHAR5.                             
      @732    CPT141                        $CHAR5.                             
      @737    CPT142                        $CHAR5.                             
      @742    CPT143                        $CHAR5.                             
      @747    CPT144                        $CHAR5.                             
      @752    CPT145                        $CHAR5.                             
      @757    CPT146                        $CHAR5.                             
      @762    CPT147                        $CHAR5.                             
      @767    CPT148                        $CHAR5.                             
      @772    CPT149                        $CHAR5.                             
      @777    CPT150                        $CHAR5.                             
      @782    CPT151                        $CHAR5.                             
      @787    CPT152                        $CHAR5.                             
      @792    CPT153                        $CHAR5.                             
      @797    CPT154                        $CHAR5.                             
      @802    CPT155                        $CHAR5.                             
      @807    CPT156                        $CHAR5.                             
      @812    CPT157                        $CHAR5.                             
      @817    CPT158                        $CHAR5.                             
      @822    CPT159                        $CHAR5.                             
      @827    CPT160                        $CHAR5.                             
      @832    CPT161                        $CHAR5.                             
      @837    CPT162                        $CHAR5.                             
      @842    CPT163                        $CHAR5.                             
      @847    CPT164                        $CHAR5.                             
      @852    CPTCCS1                       N3PF.                               
      @855    CPTCCS2                       N3PF.                               
      @858    CPTCCS3                       N3PF.                               
      @861    CPTCCS4                       N3PF.                               
      @864    CPTCCS5                       N3PF.                               
      @867    CPTCCS6                       N3PF.                               
      @870    CPTCCS7                       N3PF.                               
      @873    CPTCCS8                       N3PF.                               
      @876    CPTCCS9                       N3PF.                               
      @879    CPTCCS10                      N3PF.                               
      @882    CPTCCS11                      N3PF.                               
      @885    CPTCCS12                      N3PF.                               
      @888    CPTCCS13                      N3PF.                               
      @891    CPTCCS14                      N3PF.                               
      @894    CPTCCS15                      N3PF.                               
      @897    CPTCCS16                      N3PF.                               
      @900    CPTCCS17                      N3PF.                               
      @903    CPTCCS18                      N3PF.                               
      @906    CPTCCS19                      N3PF.                               
      @909    CPTCCS20                      N3PF.                               
      @912    CPTCCS21                      N3PF.                               
      @915    CPTCCS22                      N3PF.                               
      @918    CPTCCS23                      N3PF.                               
      @921    CPTCCS24                      N3PF.                               
      @924    CPTCCS25                      N3PF.                               
      @927    CPTCCS26                      N3PF.                               
      @930    CPTCCS27                      N3PF.                               
      @933    CPTCCS28                      N3PF.                               
      @936    CPTCCS29                      N3PF.                               
      @939    CPTCCS30                      N3PF.                               
      @942    CPTCCS31                      N3PF.                               
      @945    CPTCCS32                      N3PF.                               
      @948    CPTCCS33                      N3PF.                               
      @951    CPTCCS34                      N3PF.                               
      @954    CPTCCS35                      N3PF.                               
      @957    CPTCCS36                      N3PF.                               
      @960    CPTCCS37                      N3PF.                               
      @963    CPTCCS38                      N3PF.                               
      @966    CPTCCS39                      N3PF.                               
      @969    CPTCCS40                      N3PF.                               
      @972    CPTCCS41                      N3PF.                               
      @975    CPTCCS42                      N3PF.                               
      @978    CPTCCS43                      N3PF.                               
      @981    CPTCCS44                      N3PF.                               
      @984    CPTCCS45                      N3PF.                               
      @987    CPTCCS46                      N3PF.                               
      @990    CPTCCS47                      N3PF.                               
      @993    CPTCCS48                      N3PF.                               
      @996    CPTCCS49                      N3PF.                               
      @999    CPTCCS50                      N3PF.                               
      @1002   CPTCCS51                      N3PF.                               
      @1005   CPTCCS52                      N3PF.                               
      @1008   CPTCCS53                      N3PF.                               
      @1011   CPTCCS54                      N3PF.                               
      @1014   CPTCCS55                      N3PF.                               
      @1017   CPTCCS56                      N3PF.                               
      @1020   CPTCCS57                      N3PF.                               
      @1023   CPTCCS58                      N3PF.                               
      @1026   CPTCCS59                      N3PF.                               
      @1029   CPTCCS60                      N3PF.                               
      @1032   CPTCCS61                      N3PF.                               
      @1035   CPTCCS62                      N3PF.                               
      @1038   CPTCCS63                      N3PF.                               
      @1041   CPTCCS64                      N3PF.                               
      @1044   CPTCCS65                      N3PF.                               
      @1047   CPTCCS66                      N3PF.                               
      @1050   CPTCCS67                      N3PF.                               
      @1053   CPTCCS68                      N3PF.                               
      @1056   CPTCCS69                      N3PF.                               
      @1059   CPTCCS70                      N3PF.                               
      @1062   CPTCCS71                      N3PF.                               
      @1065   CPTCCS72                      N3PF.                               
      @1068   CPTCCS73                      N3PF.                               
      @1071   CPTCCS74                      N3PF.                               
      @1074   CPTCCS75                      N3PF.                               
      @1077   CPTCCS76                      N3PF.                               
      @1080   CPTCCS77                      N3PF.                               
      @1083   CPTCCS78                      N3PF.                               
      @1086   CPTCCS79                      N3PF.                               
      @1089   CPTCCS80                      N3PF.                               
      @1092   CPTCCS81                      N3PF.                               
      @1095   CPTCCS82                      N3PF.                               
      @1098   CPTCCS83                      N3PF.                               
      @1101   CPTCCS84                      N3PF.                               
      @1104   CPTCCS85                      N3PF.                               
      @1107   CPTCCS86                      N3PF.                               
      @1110   CPTCCS87                      N3PF.                               
      @1113   CPTCCS88                      N3PF.                               
      @1116   CPTCCS89                      N3PF.                               
      @1119   CPTCCS90                      N3PF.                               
      @1122   CPTCCS91                      N3PF.                               
      @1125   CPTCCS92                      N3PF.                               
      @1128   CPTCCS93                      N3PF.                               
      @1131   CPTCCS94                      N3PF.                               
      @1134   CPTCCS95                      N3PF.                               
      @1137   CPTCCS96                      N3PF.                               
      @1140   CPTCCS97                      N3PF.                               
      @1143   CPTCCS98                      N3PF.                               
      @1146   CPTCCS99                      N3PF.                               
      @1149   CPTCCS100                     N3PF.                               
      @1152   CPTCCS101                     N3PF.                               
      @1155   CPTCCS102                     N3PF.                               
      @1158   CPTCCS103                     N3PF.                               
      @1161   CPTCCS104                     N3PF.                               
      @1164   CPTCCS105                     N3PF.                               
      @1167   CPTCCS106                     N3PF.                               
      @1170   CPTCCS107                     N3PF.                               
      @1173   CPTCCS108                     N3PF.                               
      @1176   CPTCCS109                     N3PF.                               
      @1179   CPTCCS110                     N3PF.                               
      @1182   CPTCCS111                     N3PF.                               
      @1185   CPTCCS112                     N3PF.                               
      @1188   CPTCCS113                     N3PF.                               
      @1191   CPTCCS114                     N3PF.                               
      @1194   CPTCCS115                     N3PF.                               
      @1197   CPTCCS116                     N3PF.                               
      @1200   CPTCCS117                     N3PF.                               
      @1203   CPTCCS118                     N3PF.                               
      @1206   CPTCCS119                     N3PF.                               
      @1209   CPTCCS120                     N3PF.                               
      @1212   CPTCCS121                     N3PF.                               
      @1215   CPTCCS122                     N3PF.                               
      @1218   CPTCCS123                     N3PF.                               
      @1221   CPTCCS124                     N3PF.                               
      @1224   CPTCCS125                     N3PF.                               
      @1227   CPTCCS126                     N3PF.                               
      @1230   CPTCCS127                     N3PF.                               
      @1233   CPTCCS128                     N3PF.                               
      @1236   CPTCCS129                     N3PF.                               
      @1239   CPTCCS130                     N3PF.                               
      @1242   CPTCCS131                     N3PF.                               
      @1245   CPTCCS132                     N3PF.                               
      @1248   CPTCCS133                     N3PF.                               
      @1251   CPTCCS134                     N3PF.                               
      @1254   CPTCCS135                     N3PF.                               
      @1257   CPTCCS136                     N3PF.                               
      @1260   CPTCCS137                     N3PF.                               
      @1263   CPTCCS138                     N3PF.                               
      @1266   CPTCCS139                     N3PF.                               
      @1269   CPTCCS140                     N3PF.                               
      @1272   CPTCCS141                     N3PF.                               
      @1275   CPTCCS142                     N3PF.                               
      @1278   CPTCCS143                     N3PF.                               
      @1281   CPTCCS144                     N3PF.                               
      @1284   CPTCCS145                     N3PF.                               
      @1287   CPTCCS146                     N3PF.                               
      @1290   CPTCCS147                     N3PF.                               
      @1293   CPTCCS148                     N3PF.                               
      @1296   CPTCCS149                     N3PF.                               
      @1299   CPTCCS150                     N3PF.                               
      @1302   CPTCCS151                     N3PF.                               
      @1305   CPTCCS152                     N3PF.                               
      @1308   CPTCCS153                     N3PF.                               
      @1311   CPTCCS154                     N3PF.                               
      @1314   CPTCCS155                     N3PF.                               
      @1317   CPTCCS156                     N3PF.                               
      @1320   CPTCCS157                     N3PF.                               
      @1323   CPTCCS158                     N3PF.                               
      @1326   CPTCCS159                     N3PF.                               
      @1329   CPTCCS160                     N3PF.                               
      @1332   CPTCCS161                     N3PF.                               
      @1335   CPTCCS162                     N3PF.                               
      @1338   CPTCCS163                     N3PF.                               
      @1341   CPTCCS164                     N3PF.                               
      @1344   DaysToEvent                   N6PF.                               
      @1350   DHOUR                         N4PF.                               
      @1354   DIED                          N2PF.                               
      @1356   DISP_X                        $CHAR2.                             
      @1358   DISPUB04                      N2PF.                               
      @1360   DISPUNIFORM                   N2PF.                               
      @1362   DMONTH                        N2PF.                               
      @1364   DNR                           N2PF.                               
      @1366   DQTR                          N2PF.                               
      @1368   DRG                           N3PF.                               
      @1371   DRG_NoPOA                     N3PF.                               
      @1374   DRGVER                        N2PF.                               
      @1376   DSHOSPID                      $CHAR17.                            
      @1393   DXPOA1                        $CHAR1.                             
      @1394   DXPOA2                        $CHAR1.                             
      @1395   DXPOA3                        $CHAR1.                             
      @1396   DXPOA4                        $CHAR1.                             
      @1397   DXPOA5                        $CHAR1.                             
      @1398   DXPOA6                        $CHAR1.                             
      @1399   DXPOA7                        $CHAR1.                             
      @1400   DXPOA8                        $CHAR1.                             
      @1401   DXPOA9                        $CHAR1.                             
      @1402   DXPOA10                       $CHAR1.                             
      @1403   DXPOA11                       $CHAR1.                             
      @1404   DXPOA12                       $CHAR1.                             
      @1405   DXPOA13                       $CHAR1.                             
      @1406   DXPOA14                       $CHAR1.                             
      @1407   DXPOA15                       $CHAR1.                             
      @1408   DXPOA16                       $CHAR1.                             
      @1409   DXPOA17                       $CHAR1.                             
      @1410   DXPOA18                       $CHAR1.                             
      @1411   DXPOA19                       $CHAR1.                             
      @1412   DXPOA20                       $CHAR1.                             
      @1413   DXPOA21                       $CHAR1.                             
      @1414   DXPOA22                       $CHAR1.                             
      @1415   DXPOA23                       $CHAR1.                             
      @1416   DXPOA24                       $CHAR1.                             
      @1417   DXPOA25                       $CHAR1.                             
      @1418   DXPOA26                       $CHAR1.                             
      @1419   DXPOA27                       $CHAR1.                             
      @1420   DXPOA28                       $CHAR1.                             
      @1421   DXPOA29                       $CHAR1.                             
      @1422   DXPOA30                       $CHAR1.                             
      @1423   FEMALE                        N2PF.                               
      @1425   HCUP_ED                       N2PF.                               
      @1427   HCUP_OS                       N2PF.                               
      @1429   HISPANIC                      N2PF.                               
      @1431   HISPANIC_X                    $CHAR1.                             
      @1432   HOSPST                        $CHAR2.                             
      @1434   I10_BIRTH                     N3PF.                               
      @1437   I10_DELIVERY                  N3PF.                               
      @1440   I10_DX_Admitting              $CHAR7.                             
      @1447   I10_DX1                       $CHAR7.                             
      @1454   I10_DX2                       $CHAR7.                             
      @1461   I10_DX3                       $CHAR7.                             
      @1468   I10_DX4                       $CHAR7.                             
      @1475   I10_DX5                       $CHAR7.                             
      @1482   I10_DX6                       $CHAR7.                             
      @1489   I10_DX7                       $CHAR7.                             
      @1496   I10_DX8                       $CHAR7.                             
      @1503   I10_DX9                       $CHAR7.                             
      @1510   I10_DX10                      $CHAR7.                             
      @1517   I10_DX11                      $CHAR7.                             
      @1524   I10_DX12                      $CHAR7.                             
      @1531   I10_DX13                      $CHAR7.                             
      @1538   I10_DX14                      $CHAR7.                             
      @1545   I10_DX15                      $CHAR7.                             
      @1552   I10_DX16                      $CHAR7.                             
      @1559   I10_DX17                      $CHAR7.                             
      @1566   I10_DX18                      $CHAR7.                             
      @1573   I10_DX19                      $CHAR7.                             
      @1580   I10_DX20                      $CHAR7.                             
      @1587   I10_DX21                      $CHAR7.                             
      @1594   I10_DX22                      $CHAR7.                             
      @1601   I10_DX23                      $CHAR7.                             
      @1608   I10_DX24                      $CHAR7.                             
      @1615   I10_DX25                      $CHAR7.                             
      @1622   I10_DX26                      $CHAR7.                             
      @1629   I10_DX27                      $CHAR7.                             
      @1636   I10_DX28                      $CHAR7.                             
      @1643   I10_DX29                      $CHAR7.                             
      @1650   I10_DX30                      $CHAR7.                             
      @1657   I10_DX31                      $CHAR7.                             
      @1664   I10_DX32                      $CHAR7.                             
      @1671   I10_DX33                      $CHAR7.                             
      @1678   I10_DX34                      $CHAR7.                             
      @1685   I10_DX35                      $CHAR7.                             
      @1692   I10_DX36                      $CHAR7.                             
      @1699   I10_DX37                      $CHAR7.                             
      @1706   I10_DX38                      $CHAR7.                             
      @1713   I10_NDX                       N3PF.                               
      @1716   I10_NPR                       N3PF.                               
      @1719   I10_PR1                       $CHAR7.                             
      @1726   I10_PR2                       $CHAR7.                             
      @1733   I10_PR3                       $CHAR7.                             
      @1740   I10_PR4                       $CHAR7.                             
      @1747   I10_PR5                       $CHAR7.                             
      @1754   I10_PR6                       $CHAR7.                             
      @1761   I10_PR7                       $CHAR7.                             
      @1768   I10_PR8                       $CHAR7.                             
      @1775   I10_PR9                       $CHAR7.                             
      @1782   I10_PR10                      $CHAR7.                             
      @1789   I10_PR11                      $CHAR7.                             
      @1796   I10_PR12                      $CHAR7.                             
      @1803   I10_PR13                      $CHAR7.                             
      @1810   I10_PR14                      $CHAR7.                             
      @1817   I10_PR15                      $CHAR7.                             
      @1824   I10_PR16                      $CHAR7.                             
      @1831   I10_PR17                      $CHAR7.                             
      @1838   I10_PR18                      $CHAR7.                             
      @1845   I10_PR19                      $CHAR7.                             
      @1852   I10_PR20                      $CHAR7.                             
      @1859   I10_PR21                      $CHAR7.                             
      @1866   I10_PROCTYPE                  N3PF.                               
      @1869   I10_SERVICELINE               N2PF.                               
      @1871   KEY                           15.                                 
      @1886   LOS                           N5PF.                               
      @1891   LOS_X                         N6PF.                               
      @1897   MARITALSTATUS_X               $CHAR1.                             
      @1898   MARITALSTATUSUB04             $CHAR1.                             
      @1899   MDC                           N2PF.                               
      @1901   MDC_NoPOA                     N2PF.                               
      @1903   MDNUM1_R                      N9PF.                               
      @1912   MDNUM2_R                      N9PF.                               
      @1921   MDNUM3_R                      N9PF.                               
      @1930   MDNUM4_R                      N9PF.                               
      @1939   MEDINCSTQ                     N2PF.                               
      @1941   MRN_R                         N9PF.                               
      @1950   NCPT                          N4PF.                               
      @1954   OS_TIME                       N11P2F.                             
      @1965   P7EDSRC_X                     $CHAR2.                             
      @1967   PAY1                          N2PF.                               
      @1969   PAY1_X                        $CHAR1.                             
      @1970   PAY2                          N2PF.                               
      @1972   PAY2_X                        $CHAR1.                             
      @1973   PAY3                          N2PF.                               
      @1975   PAY3_X                        $CHAR1.                             
      @1976   PCLASS_ORPROC                 N2PF.                               
      @1978   PL_CBSA                       N3PF.                               
      @1981   PL_NCHS                       N2PF.                               
      @1983   PL_RUCC                       N2PF.                               
      @1985   PL_UIC                        N2PF.                               
      @1987   PL_UR_CAT4                    N2PF.                               
      @1989   POA_Disch_Edit1               N2PF.                               
      @1991   POA_Disch_Edit2               N2PF.                               
      @1993   POA_Hosp_Edit1                N2PF.                               
      @1995   POA_Hosp_Edit2                N2PF.                               
      @1997   POA_Hosp_Edit3                N2PF.                               
      @1999   POA_Hosp_Edit3_Value          N8P2F.                              
      @2007   PointOfOrigin_X               $CHAR1.                             
      @2008   PointOfOriginUB04             $CHAR1.                             
      @2009   PRDAY1                        N5PF.                               
      @2014   PRDAY2                        N5PF.                               
      @2019   PRDAY3                        N5PF.                               
      @2024   PRDAY4                        N5PF.                               
      @2029   PRDAY5                        N5PF.                               
      @2034   PRDAY6                        N5PF.                               
      @2039   PRDAY7                        N5PF.                               
      @2044   PRDAY8                        N5PF.                               
      @2049   PRDAY9                        N5PF.                               
      @2054   PRDAY10                       N5PF.                               
      @2059   PRDAY11                       N5PF.                               
      @2064   PRDAY12                       N5PF.                               
      @2069   PRDAY13                       N5PF.                               
      @2074   PRDAY14                       N5PF.                               
      @2079   PRDAY15                       N5PF.                               
      @2084   PRDAY16                       N5PF.                               
      @2089   PRDAY17                       N5PF.                               
      @2094   PRDAY18                       N5PF.                               
      @2099   PRDAY19                       N5PF.                               
      @2104   PRDAY20                       N5PF.                               
      @2109   PRDAY21                       N5PF.                               
      @2114   PSTATE                        $CHAR2.                             
      @2116   PSTATE_GEO                    $CHAR2.                             
      @2118   PSTCO                         N5PF.                               
      @2123   PSTCO_GEO                     N5PF.                               
      @2128   RACE                          N2PF.                               
      @2130   RACE_PCT_MISS_HOSP            N7P2F.                              
      @2137   RACE_X                        $CHAR1.                             
      @2138   TOTCHG                        N10PF.                              
      @2148   TOTCHG_X                      N15P2F.                             
      @2163   TRAN_IN                       N2PF.                               
      @2165   TRAN_OUT                      N2PF.                               
      @2167   VisitLink                     N9PF.                               
      @2176   YEAR                          N4PF.                               
      @2180   ZIP3                          $CHAR3.                             
      @2183   ZIPINC_QRTL                   N3PF.                               
      @2186   AYEAR                         N4PF.                               
      @2190   BMONTH                        N2PF.                               
      @2192   BYEAR                         N4PF.                               
      @2196   PRMONTH1                      N2PF.                               
      @2198   PRMONTH2                      N2PF.                               
      @2200   PRMONTH3                      N2PF.                               
      @2202   PRMONTH4                      N2PF.                               
      @2204   PRMONTH5                      N2PF.                               
      @2206   PRMONTH6                      N2PF.                               
      @2208   PRMONTH7                      N2PF.                               
      @2210   PRMONTH8                      N2PF.                               
      @2212   PRMONTH9                      N2PF.                               
      @2214   PRMONTH10                     N2PF.                               
      @2216   PRMONTH11                     N2PF.                               
      @2218   PRMONTH12                     N2PF.                               
      @2220   PRMONTH13                     N2PF.                               
      @2222   PRMONTH14                     N2PF.                               
      @2224   PRMONTH15                     N2PF.                               
      @2226   PRMONTH16                     N2PF.                               
      @2228   PRMONTH17                     N2PF.                               
      @2230   PRMONTH18                     N2PF.                               
      @2232   PRMONTH19                     N2PF.                               
      @2234   PRMONTH20                     N2PF.                               
      @2236   PRMONTH21                     N2PF.                               
      @2238   PRYEAR1                       N4PF.                               
      @2242   PRYEAR2                       N4PF.                               
      @2246   PRYEAR3                       N4PF.                               
      @2250   PRYEAR4                       N4PF.                               
      @2254   PRYEAR5                       N4PF.                               
      @2258   PRYEAR6                       N4PF.                               
      @2262   PRYEAR7                       N4PF.                               
      @2266   PRYEAR8                       N4PF.                               
      @2270   PRYEAR9                       N4PF.                               
      @2274   PRYEAR10                      N4PF.                               
      @2278   PRYEAR11                      N4PF.                               
      @2282   PRYEAR12                      N4PF.                               
      @2286   PRYEAR13                      N4PF.                               
      @2290   PRYEAR14                      N4PF.                               
      @2294   PRYEAR15                      N4PF.                               
      @2298   PRYEAR16                      N4PF.                               
      @2302   PRYEAR17                      N4PF.                               
      @2306   PRYEAR18                      N4PF.                               
      @2310   PRYEAR19                      N4PF.                               
      @2314   PRYEAR20                      N4PF.                               
      @2318   PRYEAR21                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
