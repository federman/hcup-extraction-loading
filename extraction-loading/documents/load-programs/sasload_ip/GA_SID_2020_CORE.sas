/*******************************************************************            
* Creation Date: 08/18/2022                                                     
*   GA_SID_2020_CORE.SAS:                                                       
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
DATA GA_SIDC_2020_CORE;                                                         
INFILE 'GA_SID_2020_CORE.ASC' FIRSTOBS=3 LRECL = 6454;                          
                                                                                
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
                                                                                
  CPT165                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 165"                                          
                                                                                
  CPT166                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 166"                                          
                                                                                
  CPT167                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 167"                                          
                                                                                
  CPT168                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 168"                                          
                                                                                
  CPT169                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 169"                                          
                                                                                
  CPT170                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 170"                                          
                                                                                
  CPT171                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 171"                                          
                                                                                
  CPT172                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 172"                                          
                                                                                
  CPT173                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 173"                                          
                                                                                
  CPT174                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 174"                                          
                                                                                
  CPT175                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 175"                                          
                                                                                
  CPT176                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 176"                                          
                                                                                
  CPT177                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 177"                                          
                                                                                
  CPT178                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 178"                                          
                                                                                
  CPT179                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 179"                                          
                                                                                
  CPT180                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 180"                                          
                                                                                
  CPT181                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 181"                                          
                                                                                
  CPT182                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 182"                                          
                                                                                
  CPT183                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 183"                                          
                                                                                
  CPT184                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 184"                                          
                                                                                
  CPT185                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 185"                                          
                                                                                
  CPT186                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 186"                                          
                                                                                
  CPT187                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 187"                                          
                                                                                
  CPT188                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 188"                                          
                                                                                
  CPT189                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 189"                                          
                                                                                
  CPT190                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 190"                                          
                                                                                
  CPT191                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 191"                                          
                                                                                
  CPT192                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 192"                                          
                                                                                
  CPT193                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 193"                                          
                                                                                
  CPT194                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 194"                                          
                                                                                
  CPT195                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 195"                                          
                                                                                
  CPT196                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 196"                                          
                                                                                
  CPT197                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 197"                                          
                                                                                
  CPT198                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 198"                                          
                                                                                
  CPT199                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 199"                                          
                                                                                
  CPT200                     LENGTH=$5                                          
  LABEL="CPT/HCPCS procedure code 200"                                          
                                                                                
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
                                                                                
  CPTCCS165                  LENGTH=4                                           
  LABEL="CCS: CPT 165"                                                          
                                                                                
  CPTCCS166                  LENGTH=4                                           
  LABEL="CCS: CPT 166"                                                          
                                                                                
  CPTCCS167                  LENGTH=4                                           
  LABEL="CCS: CPT 167"                                                          
                                                                                
  CPTCCS168                  LENGTH=4                                           
  LABEL="CCS: CPT 168"                                                          
                                                                                
  CPTCCS169                  LENGTH=4                                           
  LABEL="CCS: CPT 169"                                                          
                                                                                
  CPTCCS170                  LENGTH=4                                           
  LABEL="CCS: CPT 170"                                                          
                                                                                
  CPTCCS171                  LENGTH=4                                           
  LABEL="CCS: CPT 171"                                                          
                                                                                
  CPTCCS172                  LENGTH=4                                           
  LABEL="CCS: CPT 172"                                                          
                                                                                
  CPTCCS173                  LENGTH=4                                           
  LABEL="CCS: CPT 173"                                                          
                                                                                
  CPTCCS174                  LENGTH=4                                           
  LABEL="CCS: CPT 174"                                                          
                                                                                
  CPTCCS175                  LENGTH=4                                           
  LABEL="CCS: CPT 175"                                                          
                                                                                
  CPTCCS176                  LENGTH=4                                           
  LABEL="CCS: CPT 176"                                                          
                                                                                
  CPTCCS177                  LENGTH=4                                           
  LABEL="CCS: CPT 177"                                                          
                                                                                
  CPTCCS178                  LENGTH=4                                           
  LABEL="CCS: CPT 178"                                                          
                                                                                
  CPTCCS179                  LENGTH=4                                           
  LABEL="CCS: CPT 179"                                                          
                                                                                
  CPTCCS180                  LENGTH=4                                           
  LABEL="CCS: CPT 180"                                                          
                                                                                
  CPTCCS181                  LENGTH=4                                           
  LABEL="CCS: CPT 181"                                                          
                                                                                
  CPTCCS182                  LENGTH=4                                           
  LABEL="CCS: CPT 182"                                                          
                                                                                
  CPTCCS183                  LENGTH=4                                           
  LABEL="CCS: CPT 183"                                                          
                                                                                
  CPTCCS184                  LENGTH=4                                           
  LABEL="CCS: CPT 184"                                                          
                                                                                
  CPTCCS185                  LENGTH=4                                           
  LABEL="CCS: CPT 185"                                                          
                                                                                
  CPTCCS186                  LENGTH=4                                           
  LABEL="CCS: CPT 186"                                                          
                                                                                
  CPTCCS187                  LENGTH=4                                           
  LABEL="CCS: CPT 187"                                                          
                                                                                
  CPTCCS188                  LENGTH=4                                           
  LABEL="CCS: CPT 188"                                                          
                                                                                
  CPTCCS189                  LENGTH=4                                           
  LABEL="CCS: CPT 189"                                                          
                                                                                
  CPTCCS190                  LENGTH=4                                           
  LABEL="CCS: CPT 190"                                                          
                                                                                
  CPTCCS191                  LENGTH=4                                           
  LABEL="CCS: CPT 191"                                                          
                                                                                
  CPTCCS192                  LENGTH=4                                           
  LABEL="CCS: CPT 192"                                                          
                                                                                
  CPTCCS193                  LENGTH=4                                           
  LABEL="CCS: CPT 193"                                                          
                                                                                
  CPTCCS194                  LENGTH=4                                           
  LABEL="CCS: CPT 194"                                                          
                                                                                
  CPTCCS195                  LENGTH=4                                           
  LABEL="CCS: CPT 195"                                                          
                                                                                
  CPTCCS196                  LENGTH=4                                           
  LABEL="CCS: CPT 196"                                                          
                                                                                
  CPTCCS197                  LENGTH=4                                           
  LABEL="CCS: CPT 197"                                                          
                                                                                
  CPTCCS198                  LENGTH=4                                           
  LABEL="CCS: CPT 198"                                                          
                                                                                
  CPTCCS199                  LENGTH=4                                           
  LABEL="CCS: CPT 199"                                                          
                                                                                
  CPTCCS200                  LENGTH=4                                           
  LABEL="CCS: CPT 200"                                                          
                                                                                
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
                                                                                
  DXPOA84                    LENGTH=$1                                          
  LABEL="Diagnosis 84, present on admission indicator"                          
                                                                                
  DXPOA85                    LENGTH=$1                                          
  LABEL="Diagnosis 85, present on admission indicator"                          
                                                                                
  DXPOA86                    LENGTH=$1                                          
  LABEL="Diagnosis 86, present on admission indicator"                          
                                                                                
  DXPOA87                    LENGTH=$1                                          
  LABEL="Diagnosis 87, present on admission indicator"                          
                                                                                
  DXPOA88                    LENGTH=$1                                          
  LABEL="Diagnosis 88, present on admission indicator"                          
                                                                                
  DXPOA89                    LENGTH=$1                                          
  LABEL="Diagnosis 89, present on admission indicator"                          
                                                                                
  DXPOA90                    LENGTH=$1                                          
  LABEL="Diagnosis 90, present on admission indicator"                          
                                                                                
  DXPOA91                    LENGTH=$1                                          
  LABEL="Diagnosis 91, present on admission indicator"                          
                                                                                
  DXPOA92                    LENGTH=$1                                          
  LABEL="Diagnosis 92, present on admission indicator"                          
                                                                                
  DXPOA93                    LENGTH=$1                                          
  LABEL="Diagnosis 93, present on admission indicator"                          
                                                                                
  DXPOA94                    LENGTH=$1                                          
  LABEL="Diagnosis 94, present on admission indicator"                          
                                                                                
  DXPOA95                    LENGTH=$1                                          
  LABEL="Diagnosis 95, present on admission indicator"                          
                                                                                
  DXPOA96                    LENGTH=$1                                          
  LABEL="Diagnosis 96, present on admission indicator"                          
                                                                                
  DXPOA97                    LENGTH=$1                                          
  LABEL="Diagnosis 97, present on admission indicator"                          
                                                                                
  DXPOA98                    LENGTH=$1                                          
  LABEL="Diagnosis 98, present on admission indicator"                          
                                                                                
  DXPOA99                    LENGTH=$1                                          
  LABEL="Diagnosis 99, present on admission indicator"                          
                                                                                
  DXPOA100                   LENGTH=$1                                          
  LABEL="Diagnosis 100, present on admission indicator"                         
                                                                                
  DXPOA101                   LENGTH=$1                                          
  LABEL="Diagnosis 101, present on admission indicator"                         
                                                                                
  DXPOA102                   LENGTH=$1                                          
  LABEL="Diagnosis 102, present on admission indicator"                         
                                                                                
  DXPOA103                   LENGTH=$1                                          
  LABEL="Diagnosis 103, present on admission indicator"                         
                                                                                
  DXPOA104                   LENGTH=$1                                          
  LABEL="Diagnosis 104, present on admission indicator"                         
                                                                                
  DXPOA105                   LENGTH=$1                                          
  LABEL="Diagnosis 105, present on admission indicator"                         
                                                                                
  DXPOA106                   LENGTH=$1                                          
  LABEL="Diagnosis 106, present on admission indicator"                         
                                                                                
  DXPOA107                   LENGTH=$1                                          
  LABEL="Diagnosis 107, present on admission indicator"                         
                                                                                
  DXPOA108                   LENGTH=$1                                          
  LABEL="Diagnosis 108, present on admission indicator"                         
                                                                                
  DXPOA109                   LENGTH=$1                                          
  LABEL="Diagnosis 109, present on admission indicator"                         
                                                                                
  DXPOA110                   LENGTH=$1                                          
  LABEL="Diagnosis 110, present on admission indicator"                         
                                                                                
  DXPOA111                   LENGTH=$1                                          
  LABEL="Diagnosis 111, present on admission indicator"                         
                                                                                
  DXPOA112                   LENGTH=$1                                          
  LABEL="Diagnosis 112, present on admission indicator"                         
                                                                                
  DXPOA113                   LENGTH=$1                                          
  LABEL="Diagnosis 113, present on admission indicator"                         
                                                                                
  DXPOA114                   LENGTH=$1                                          
  LABEL="Diagnosis 114, present on admission indicator"                         
                                                                                
  DXPOA115                   LENGTH=$1                                          
  LABEL="Diagnosis 115, present on admission indicator"                         
                                                                                
  DXPOA116                   LENGTH=$1                                          
  LABEL="Diagnosis 116, present on admission indicator"                         
                                                                                
  DXPOA117                   LENGTH=$1                                          
  LABEL="Diagnosis 117, present on admission indicator"                         
                                                                                
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
                                                                                
  I10_BIRTH                  LENGTH=3                                           
  LABEL="ICD-10-CM Birth Indicator"                                             
                                                                                
  I10_DELIVERY               LENGTH=3                                           
  LABEL="ICD-10-CM Delivery Indicator"                                          
                                                                                
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
                                                                                
  I10_DX84                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 84"                                                
                                                                                
  I10_DX85                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 85"                                                
                                                                                
  I10_DX86                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 86"                                                
                                                                                
  I10_DX87                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 87"                                                
                                                                                
  I10_DX88                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 88"                                                
                                                                                
  I10_DX89                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 89"                                                
                                                                                
  I10_DX90                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 90"                                                
                                                                                
  I10_DX91                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 91"                                                
                                                                                
  I10_DX92                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 92"                                                
                                                                                
  I10_DX93                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 93"                                                
                                                                                
  I10_DX94                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 94"                                                
                                                                                
  I10_DX95                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 95"                                                
                                                                                
  I10_DX96                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 96"                                                
                                                                                
  I10_DX97                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 97"                                                
                                                                                
  I10_DX98                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 98"                                                
                                                                                
  I10_DX99                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 99"                                                
                                                                                
  I10_DX100                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 100"                                               
                                                                                
  I10_DX101                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 101"                                               
                                                                                
  I10_DX102                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 102"                                               
                                                                                
  I10_DX103                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 103"                                               
                                                                                
  I10_DX104                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 104"                                               
                                                                                
  I10_DX105                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 105"                                               
                                                                                
  I10_DX106                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 106"                                               
                                                                                
  I10_DX107                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 107"                                               
                                                                                
  I10_DX108                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 108"                                               
                                                                                
  I10_DX109                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 109"                                               
                                                                                
  I10_DX110                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 110"                                               
                                                                                
  I10_DX111                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 111"                                               
                                                                                
  I10_DX112                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 112"                                               
                                                                                
  I10_DX113                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 113"                                               
                                                                                
  I10_DX114                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 114"                                               
                                                                                
  I10_DX115                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 115"                                               
                                                                                
  I10_DX116                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 116"                                               
                                                                                
  I10_DX117                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 117"                                               
                                                                                
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
                                                                                
  I10_PR101                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 101"                                              
                                                                                
  I10_PR102                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 102"                                              
                                                                                
  I10_PR103                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 103"                                              
                                                                                
  I10_PR104                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 104"                                              
                                                                                
  I10_PR105                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 105"                                              
                                                                                
  I10_PR106                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 106"                                              
                                                                                
  I10_PR107                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 107"                                              
                                                                                
  I10_PR108                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 108"                                              
                                                                                
  I10_PR109                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 109"                                              
                                                                                
  I10_PR110                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 110"                                              
                                                                                
  I10_PR111                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 111"                                              
                                                                                
  I10_PR112                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 112"                                              
                                                                                
  I10_PR113                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 113"                                              
                                                                                
  I10_PR114                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 114"                                              
                                                                                
  I10_PR115                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 115"                                              
                                                                                
  I10_PR116                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 116"                                              
                                                                                
  I10_PR117                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 117"                                              
                                                                                
  I10_PR118                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 118"                                              
                                                                                
  I10_PR119                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 119"                                              
                                                                                
  I10_PR120                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 120"                                              
                                                                                
  I10_PR121                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 121"                                              
                                                                                
  I10_PR122                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 122"                                              
                                                                                
  I10_PR123                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 123"                                              
                                                                                
  I10_PR124                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 124"                                              
                                                                                
  I10_PR125                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 125"                                              
                                                                                
  I10_PR126                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 126"                                              
                                                                                
  I10_PR127                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 127"                                              
                                                                                
  I10_PR128                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 128"                                              
                                                                                
  I10_PR129                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 129"                                              
                                                                                
  I10_PR130                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 130"                                              
                                                                                
  I10_PR131                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 131"                                              
                                                                                
  I10_PR132                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 132"                                              
                                                                                
  I10_PR133                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 133"                                              
                                                                                
  I10_PR134                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 134"                                              
                                                                                
  I10_PR135                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 135"                                              
                                                                                
  I10_PR136                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 136"                                              
                                                                                
  I10_PR137                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 137"                                              
                                                                                
  I10_PR138                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 138"                                              
                                                                                
  I10_PR139                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 139"                                              
                                                                                
  I10_PR140                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 140"                                              
                                                                                
  I10_PR141                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 141"                                              
                                                                                
  I10_PR142                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 142"                                              
                                                                                
  I10_PR143                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 143"                                              
                                                                                
  I10_PR144                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 144"                                              
                                                                                
  I10_PR145                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 145"                                              
                                                                                
  I10_PR146                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 146"                                              
                                                                                
  I10_PR147                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 147"                                              
                                                                                
  I10_PR148                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 148"                                              
                                                                                
  I10_PR149                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 149"                                              
                                                                                
  I10_PR150                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 150"                                              
                                                                                
  I10_PR151                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 151"                                              
                                                                                
  I10_PR152                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 152"                                              
                                                                                
  I10_PR153                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 153"                                              
                                                                                
  I10_PR154                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 154"                                              
                                                                                
  I10_PR155                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 155"                                              
                                                                                
  I10_PR156                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 156"                                              
                                                                                
  I10_PR157                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 157"                                              
                                                                                
  I10_PR158                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 158"                                              
                                                                                
  I10_PR159                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 159"                                              
                                                                                
  I10_PR160                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 160"                                              
                                                                                
  I10_PR161                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 161"                                              
                                                                                
  I10_PR162                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 162"                                              
                                                                                
  I10_PR163                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 163"                                              
                                                                                
  I10_PR164                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 164"                                              
                                                                                
  I10_PR165                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 165"                                              
                                                                                
  I10_PR166                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 166"                                              
                                                                                
  I10_PR167                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 167"                                              
                                                                                
  I10_PR168                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 168"                                              
                                                                                
  I10_PR169                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 169"                                              
                                                                                
  I10_PR170                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 170"                                              
                                                                                
  I10_PR171                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 171"                                              
                                                                                
  I10_PR172                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 172"                                              
                                                                                
  I10_PR173                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 173"                                              
                                                                                
  I10_PR174                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 174"                                              
                                                                                
  I10_PR175                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 175"                                              
                                                                                
  I10_PR176                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 176"                                              
                                                                                
  I10_PR177                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 177"                                              
                                                                                
  I10_PR178                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 178"                                              
                                                                                
  I10_PR179                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 179"                                              
                                                                                
  I10_PR180                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 180"                                              
                                                                                
  I10_PR181                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 181"                                              
                                                                                
  I10_PR182                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 182"                                              
                                                                                
  I10_PR183                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 183"                                              
                                                                                
  I10_PR184                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 184"                                              
                                                                                
  I10_PR185                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 185"                                              
                                                                                
  I10_PR186                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 186"                                              
                                                                                
  I10_PR187                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 187"                                              
                                                                                
  I10_PR188                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 188"                                              
                                                                                
  I10_PR189                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 189"                                              
                                                                                
  I10_PR190                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 190"                                              
                                                                                
  I10_PR191                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 191"                                              
                                                                                
  I10_PR192                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 192"                                              
                                                                                
  I10_PR193                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 193"                                              
                                                                                
  I10_PR194                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 194"                                              
                                                                                
  I10_PR195                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 195"                                              
                                                                                
  I10_PR196                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 196"                                              
                                                                                
  I10_PR197                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 197"                                              
                                                                                
  I10_PR198                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 198"                                              
                                                                                
  I10_PR199                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 199"                                              
                                                                                
  I10_PR200                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 200"                                              
                                                                                
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
                                                                                
  PRDAY101                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR101"                            
                                                                                
  PRDAY102                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR102"                            
                                                                                
  PRDAY103                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR103"                            
                                                                                
  PRDAY104                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR104"                            
                                                                                
  PRDAY105                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR105"                            
                                                                                
  PRDAY106                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR106"                            
                                                                                
  PRDAY107                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR107"                            
                                                                                
  PRDAY108                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR108"                            
                                                                                
  PRDAY109                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR109"                            
                                                                                
  PRDAY110                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR110"                            
                                                                                
  PRDAY111                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR111"                            
                                                                                
  PRDAY112                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR112"                            
                                                                                
  PRDAY113                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR113"                            
                                                                                
  PRDAY114                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR114"                            
                                                                                
  PRDAY115                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR115"                            
                                                                                
  PRDAY116                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR116"                            
                                                                                
  PRDAY117                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR117"                            
                                                                                
  PRDAY118                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR118"                            
                                                                                
  PRDAY119                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR119"                            
                                                                                
  PRDAY120                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR120"                            
                                                                                
  PRDAY121                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR121"                            
                                                                                
  PRDAY122                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR122"                            
                                                                                
  PRDAY123                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR123"                            
                                                                                
  PRDAY124                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR124"                            
                                                                                
  PRDAY125                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR125"                            
                                                                                
  PRDAY126                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR126"                            
                                                                                
  PRDAY127                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR127"                            
                                                                                
  PRDAY128                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR128"                            
                                                                                
  PRDAY129                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR129"                            
                                                                                
  PRDAY130                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR130"                            
                                                                                
  PRDAY131                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR131"                            
                                                                                
  PRDAY132                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR132"                            
                                                                                
  PRDAY133                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR133"                            
                                                                                
  PRDAY134                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR134"                            
                                                                                
  PRDAY135                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR135"                            
                                                                                
  PRDAY136                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR136"                            
                                                                                
  PRDAY137                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR137"                            
                                                                                
  PRDAY138                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR138"                            
                                                                                
  PRDAY139                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR139"                            
                                                                                
  PRDAY140                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR140"                            
                                                                                
  PRDAY141                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR141"                            
                                                                                
  PRDAY142                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR142"                            
                                                                                
  PRDAY143                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR143"                            
                                                                                
  PRDAY144                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR144"                            
                                                                                
  PRDAY145                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR145"                            
                                                                                
  PRDAY146                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR146"                            
                                                                                
  PRDAY147                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR147"                            
                                                                                
  PRDAY148                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR148"                            
                                                                                
  PRDAY149                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR149"                            
                                                                                
  PRDAY150                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR150"                            
                                                                                
  PRDAY151                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR151"                            
                                                                                
  PRDAY152                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR152"                            
                                                                                
  PRDAY153                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR153"                            
                                                                                
  PRDAY154                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR154"                            
                                                                                
  PRDAY155                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR155"                            
                                                                                
  PRDAY156                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR156"                            
                                                                                
  PRDAY157                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR157"                            
                                                                                
  PRDAY158                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR158"                            
                                                                                
  PRDAY159                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR159"                            
                                                                                
  PRDAY160                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR160"                            
                                                                                
  PRDAY161                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR161"                            
                                                                                
  PRDAY162                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR162"                            
                                                                                
  PRDAY163                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR163"                            
                                                                                
  PRDAY164                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR164"                            
                                                                                
  PRDAY165                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR165"                            
                                                                                
  PRDAY166                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR166"                            
                                                                                
  PRDAY167                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR167"                            
                                                                                
  PRDAY168                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR168"                            
                                                                                
  PRDAY169                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR169"                            
                                                                                
  PRDAY170                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR170"                            
                                                                                
  PRDAY171                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR171"                            
                                                                                
  PRDAY172                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR172"                            
                                                                                
  PRDAY173                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR173"                            
                                                                                
  PRDAY174                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR174"                            
                                                                                
  PRDAY175                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR175"                            
                                                                                
  PRDAY176                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR176"                            
                                                                                
  PRDAY177                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR177"                            
                                                                                
  PRDAY178                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR178"                            
                                                                                
  PRDAY179                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR179"                            
                                                                                
  PRDAY180                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR180"                            
                                                                                
  PRDAY181                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR181"                            
                                                                                
  PRDAY182                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR182"                            
                                                                                
  PRDAY183                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR183"                            
                                                                                
  PRDAY184                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR184"                            
                                                                                
  PRDAY185                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR185"                            
                                                                                
  PRDAY186                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR186"                            
                                                                                
  PRDAY187                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR187"                            
                                                                                
  PRDAY188                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR188"                            
                                                                                
  PRDAY189                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR189"                            
                                                                                
  PRDAY190                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR190"                            
                                                                                
  PRDAY191                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR191"                            
                                                                                
  PRDAY192                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR192"                            
                                                                                
  PRDAY193                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR193"                            
                                                                                
  PRDAY194                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR194"                            
                                                                                
  PRDAY195                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR195"                            
                                                                                
  PRDAY196                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR196"                            
                                                                                
  PRDAY197                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR197"                            
                                                                                
  PRDAY198                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR198"                            
                                                                                
  PRDAY199                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR199"                            
                                                                                
  PRDAY200                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR200"                            
                                                                                
  PrimLang                   LENGTH=$3                                          
  LABEL="Primary language of patient"                                           
                                                                                
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
                                                                                
  PRMONTH101                 LENGTH=3                                           
  LABEL="Month of procedure 101"                                                
                                                                                
  PRMONTH102                 LENGTH=3                                           
  LABEL="Month of procedure 102"                                                
                                                                                
  PRMONTH103                 LENGTH=3                                           
  LABEL="Month of procedure 103"                                                
                                                                                
  PRMONTH104                 LENGTH=3                                           
  LABEL="Month of procedure 104"                                                
                                                                                
  PRMONTH105                 LENGTH=3                                           
  LABEL="Month of procedure 105"                                                
                                                                                
  PRMONTH106                 LENGTH=3                                           
  LABEL="Month of procedure 106"                                                
                                                                                
  PRMONTH107                 LENGTH=3                                           
  LABEL="Month of procedure 107"                                                
                                                                                
  PRMONTH108                 LENGTH=3                                           
  LABEL="Month of procedure 108"                                                
                                                                                
  PRMONTH109                 LENGTH=3                                           
  LABEL="Month of procedure 109"                                                
                                                                                
  PRMONTH110                 LENGTH=3                                           
  LABEL="Month of procedure 110"                                                
                                                                                
  PRMONTH111                 LENGTH=3                                           
  LABEL="Month of procedure 111"                                                
                                                                                
  PRMONTH112                 LENGTH=3                                           
  LABEL="Month of procedure 112"                                                
                                                                                
  PRMONTH113                 LENGTH=3                                           
  LABEL="Month of procedure 113"                                                
                                                                                
  PRMONTH114                 LENGTH=3                                           
  LABEL="Month of procedure 114"                                                
                                                                                
  PRMONTH115                 LENGTH=3                                           
  LABEL="Month of procedure 115"                                                
                                                                                
  PRMONTH116                 LENGTH=3                                           
  LABEL="Month of procedure 116"                                                
                                                                                
  PRMONTH117                 LENGTH=3                                           
  LABEL="Month of procedure 117"                                                
                                                                                
  PRMONTH118                 LENGTH=3                                           
  LABEL="Month of procedure 118"                                                
                                                                                
  PRMONTH119                 LENGTH=3                                           
  LABEL="Month of procedure 119"                                                
                                                                                
  PRMONTH120                 LENGTH=3                                           
  LABEL="Month of procedure 120"                                                
                                                                                
  PRMONTH121                 LENGTH=3                                           
  LABEL="Month of procedure 121"                                                
                                                                                
  PRMONTH122                 LENGTH=3                                           
  LABEL="Month of procedure 122"                                                
                                                                                
  PRMONTH123                 LENGTH=3                                           
  LABEL="Month of procedure 123"                                                
                                                                                
  PRMONTH124                 LENGTH=3                                           
  LABEL="Month of procedure 124"                                                
                                                                                
  PRMONTH125                 LENGTH=3                                           
  LABEL="Month of procedure 125"                                                
                                                                                
  PRMONTH126                 LENGTH=3                                           
  LABEL="Month of procedure 126"                                                
                                                                                
  PRMONTH127                 LENGTH=3                                           
  LABEL="Month of procedure 127"                                                
                                                                                
  PRMONTH128                 LENGTH=3                                           
  LABEL="Month of procedure 128"                                                
                                                                                
  PRMONTH129                 LENGTH=3                                           
  LABEL="Month of procedure 129"                                                
                                                                                
  PRMONTH130                 LENGTH=3                                           
  LABEL="Month of procedure 130"                                                
                                                                                
  PRMONTH131                 LENGTH=3                                           
  LABEL="Month of procedure 131"                                                
                                                                                
  PRMONTH132                 LENGTH=3                                           
  LABEL="Month of procedure 132"                                                
                                                                                
  PRMONTH133                 LENGTH=3                                           
  LABEL="Month of procedure 133"                                                
                                                                                
  PRMONTH134                 LENGTH=3                                           
  LABEL="Month of procedure 134"                                                
                                                                                
  PRMONTH135                 LENGTH=3                                           
  LABEL="Month of procedure 135"                                                
                                                                                
  PRMONTH136                 LENGTH=3                                           
  LABEL="Month of procedure 136"                                                
                                                                                
  PRMONTH137                 LENGTH=3                                           
  LABEL="Month of procedure 137"                                                
                                                                                
  PRMONTH138                 LENGTH=3                                           
  LABEL="Month of procedure 138"                                                
                                                                                
  PRMONTH139                 LENGTH=3                                           
  LABEL="Month of procedure 139"                                                
                                                                                
  PRMONTH140                 LENGTH=3                                           
  LABEL="Month of procedure 140"                                                
                                                                                
  PRMONTH141                 LENGTH=3                                           
  LABEL="Month of procedure 141"                                                
                                                                                
  PRMONTH142                 LENGTH=3                                           
  LABEL="Month of procedure 142"                                                
                                                                                
  PRMONTH143                 LENGTH=3                                           
  LABEL="Month of procedure 143"                                                
                                                                                
  PRMONTH144                 LENGTH=3                                           
  LABEL="Month of procedure 144"                                                
                                                                                
  PRMONTH145                 LENGTH=3                                           
  LABEL="Month of procedure 145"                                                
                                                                                
  PRMONTH146                 LENGTH=3                                           
  LABEL="Month of procedure 146"                                                
                                                                                
  PRMONTH147                 LENGTH=3                                           
  LABEL="Month of procedure 147"                                                
                                                                                
  PRMONTH148                 LENGTH=3                                           
  LABEL="Month of procedure 148"                                                
                                                                                
  PRMONTH149                 LENGTH=3                                           
  LABEL="Month of procedure 149"                                                
                                                                                
  PRMONTH150                 LENGTH=3                                           
  LABEL="Month of procedure 150"                                                
                                                                                
  PRMONTH151                 LENGTH=3                                           
  LABEL="Month of procedure 151"                                                
                                                                                
  PRMONTH152                 LENGTH=3                                           
  LABEL="Month of procedure 152"                                                
                                                                                
  PRMONTH153                 LENGTH=3                                           
  LABEL="Month of procedure 153"                                                
                                                                                
  PRMONTH154                 LENGTH=3                                           
  LABEL="Month of procedure 154"                                                
                                                                                
  PRMONTH155                 LENGTH=3                                           
  LABEL="Month of procedure 155"                                                
                                                                                
  PRMONTH156                 LENGTH=3                                           
  LABEL="Month of procedure 156"                                                
                                                                                
  PRMONTH157                 LENGTH=3                                           
  LABEL="Month of procedure 157"                                                
                                                                                
  PRMONTH158                 LENGTH=3                                           
  LABEL="Month of procedure 158"                                                
                                                                                
  PRMONTH159                 LENGTH=3                                           
  LABEL="Month of procedure 159"                                                
                                                                                
  PRMONTH160                 LENGTH=3                                           
  LABEL="Month of procedure 160"                                                
                                                                                
  PRMONTH161                 LENGTH=3                                           
  LABEL="Month of procedure 161"                                                
                                                                                
  PRMONTH162                 LENGTH=3                                           
  LABEL="Month of procedure 162"                                                
                                                                                
  PRMONTH163                 LENGTH=3                                           
  LABEL="Month of procedure 163"                                                
                                                                                
  PRMONTH164                 LENGTH=3                                           
  LABEL="Month of procedure 164"                                                
                                                                                
  PRMONTH165                 LENGTH=3                                           
  LABEL="Month of procedure 165"                                                
                                                                                
  PRMONTH166                 LENGTH=3                                           
  LABEL="Month of procedure 166"                                                
                                                                                
  PRMONTH167                 LENGTH=3                                           
  LABEL="Month of procedure 167"                                                
                                                                                
  PRMONTH168                 LENGTH=3                                           
  LABEL="Month of procedure 168"                                                
                                                                                
  PRMONTH169                 LENGTH=3                                           
  LABEL="Month of procedure 169"                                                
                                                                                
  PRMONTH170                 LENGTH=3                                           
  LABEL="Month of procedure 170"                                                
                                                                                
  PRMONTH171                 LENGTH=3                                           
  LABEL="Month of procedure 171"                                                
                                                                                
  PRMONTH172                 LENGTH=3                                           
  LABEL="Month of procedure 172"                                                
                                                                                
  PRMONTH173                 LENGTH=3                                           
  LABEL="Month of procedure 173"                                                
                                                                                
  PRMONTH174                 LENGTH=3                                           
  LABEL="Month of procedure 174"                                                
                                                                                
  PRMONTH175                 LENGTH=3                                           
  LABEL="Month of procedure 175"                                                
                                                                                
  PRMONTH176                 LENGTH=3                                           
  LABEL="Month of procedure 176"                                                
                                                                                
  PRMONTH177                 LENGTH=3                                           
  LABEL="Month of procedure 177"                                                
                                                                                
  PRMONTH178                 LENGTH=3                                           
  LABEL="Month of procedure 178"                                                
                                                                                
  PRMONTH179                 LENGTH=3                                           
  LABEL="Month of procedure 179"                                                
                                                                                
  PRMONTH180                 LENGTH=3                                           
  LABEL="Month of procedure 180"                                                
                                                                                
  PRMONTH181                 LENGTH=3                                           
  LABEL="Month of procedure 181"                                                
                                                                                
  PRMONTH182                 LENGTH=3                                           
  LABEL="Month of procedure 182"                                                
                                                                                
  PRMONTH183                 LENGTH=3                                           
  LABEL="Month of procedure 183"                                                
                                                                                
  PRMONTH184                 LENGTH=3                                           
  LABEL="Month of procedure 184"                                                
                                                                                
  PRMONTH185                 LENGTH=3                                           
  LABEL="Month of procedure 185"                                                
                                                                                
  PRMONTH186                 LENGTH=3                                           
  LABEL="Month of procedure 186"                                                
                                                                                
  PRMONTH187                 LENGTH=3                                           
  LABEL="Month of procedure 187"                                                
                                                                                
  PRMONTH188                 LENGTH=3                                           
  LABEL="Month of procedure 188"                                                
                                                                                
  PRMONTH189                 LENGTH=3                                           
  LABEL="Month of procedure 189"                                                
                                                                                
  PRMONTH190                 LENGTH=3                                           
  LABEL="Month of procedure 190"                                                
                                                                                
  PRMONTH191                 LENGTH=3                                           
  LABEL="Month of procedure 191"                                                
                                                                                
  PRMONTH192                 LENGTH=3                                           
  LABEL="Month of procedure 192"                                                
                                                                                
  PRMONTH193                 LENGTH=3                                           
  LABEL="Month of procedure 193"                                                
                                                                                
  PRMONTH194                 LENGTH=3                                           
  LABEL="Month of procedure 194"                                                
                                                                                
  PRMONTH195                 LENGTH=3                                           
  LABEL="Month of procedure 195"                                                
                                                                                
  PRMONTH196                 LENGTH=3                                           
  LABEL="Month of procedure 196"                                                
                                                                                
  PRMONTH197                 LENGTH=3                                           
  LABEL="Month of procedure 197"                                                
                                                                                
  PRMONTH198                 LENGTH=3                                           
  LABEL="Month of procedure 198"                                                
                                                                                
  PRMONTH199                 LENGTH=3                                           
  LABEL="Month of procedure 199"                                                
                                                                                
  PRMONTH200                 LENGTH=3                                           
  LABEL="Month of procedure 200"                                                
                                                                                
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
                                                                                
  PRYEAR101                  LENGTH=3                                           
  LABEL="Year of procedure 101"                                                 
                                                                                
  PRYEAR102                  LENGTH=3                                           
  LABEL="Year of procedure 102"                                                 
                                                                                
  PRYEAR103                  LENGTH=3                                           
  LABEL="Year of procedure 103"                                                 
                                                                                
  PRYEAR104                  LENGTH=3                                           
  LABEL="Year of procedure 104"                                                 
                                                                                
  PRYEAR105                  LENGTH=3                                           
  LABEL="Year of procedure 105"                                                 
                                                                                
  PRYEAR106                  LENGTH=3                                           
  LABEL="Year of procedure 106"                                                 
                                                                                
  PRYEAR107                  LENGTH=3                                           
  LABEL="Year of procedure 107"                                                 
                                                                                
  PRYEAR108                  LENGTH=3                                           
  LABEL="Year of procedure 108"                                                 
                                                                                
  PRYEAR109                  LENGTH=3                                           
  LABEL="Year of procedure 109"                                                 
                                                                                
  PRYEAR110                  LENGTH=3                                           
  LABEL="Year of procedure 110"                                                 
                                                                                
  PRYEAR111                  LENGTH=3                                           
  LABEL="Year of procedure 111"                                                 
                                                                                
  PRYEAR112                  LENGTH=3                                           
  LABEL="Year of procedure 112"                                                 
                                                                                
  PRYEAR113                  LENGTH=3                                           
  LABEL="Year of procedure 113"                                                 
                                                                                
  PRYEAR114                  LENGTH=3                                           
  LABEL="Year of procedure 114"                                                 
                                                                                
  PRYEAR115                  LENGTH=3                                           
  LABEL="Year of procedure 115"                                                 
                                                                                
  PRYEAR116                  LENGTH=3                                           
  LABEL="Year of procedure 116"                                                 
                                                                                
  PRYEAR117                  LENGTH=3                                           
  LABEL="Year of procedure 117"                                                 
                                                                                
  PRYEAR118                  LENGTH=3                                           
  LABEL="Year of procedure 118"                                                 
                                                                                
  PRYEAR119                  LENGTH=3                                           
  LABEL="Year of procedure 119"                                                 
                                                                                
  PRYEAR120                  LENGTH=3                                           
  LABEL="Year of procedure 120"                                                 
                                                                                
  PRYEAR121                  LENGTH=3                                           
  LABEL="Year of procedure 121"                                                 
                                                                                
  PRYEAR122                  LENGTH=3                                           
  LABEL="Year of procedure 122"                                                 
                                                                                
  PRYEAR123                  LENGTH=3                                           
  LABEL="Year of procedure 123"                                                 
                                                                                
  PRYEAR124                  LENGTH=3                                           
  LABEL="Year of procedure 124"                                                 
                                                                                
  PRYEAR125                  LENGTH=3                                           
  LABEL="Year of procedure 125"                                                 
                                                                                
  PRYEAR126                  LENGTH=3                                           
  LABEL="Year of procedure 126"                                                 
                                                                                
  PRYEAR127                  LENGTH=3                                           
  LABEL="Year of procedure 127"                                                 
                                                                                
  PRYEAR128                  LENGTH=3                                           
  LABEL="Year of procedure 128"                                                 
                                                                                
  PRYEAR129                  LENGTH=3                                           
  LABEL="Year of procedure 129"                                                 
                                                                                
  PRYEAR130                  LENGTH=3                                           
  LABEL="Year of procedure 130"                                                 
                                                                                
  PRYEAR131                  LENGTH=3                                           
  LABEL="Year of procedure 131"                                                 
                                                                                
  PRYEAR132                  LENGTH=3                                           
  LABEL="Year of procedure 132"                                                 
                                                                                
  PRYEAR133                  LENGTH=3                                           
  LABEL="Year of procedure 133"                                                 
                                                                                
  PRYEAR134                  LENGTH=3                                           
  LABEL="Year of procedure 134"                                                 
                                                                                
  PRYEAR135                  LENGTH=3                                           
  LABEL="Year of procedure 135"                                                 
                                                                                
  PRYEAR136                  LENGTH=3                                           
  LABEL="Year of procedure 136"                                                 
                                                                                
  PRYEAR137                  LENGTH=3                                           
  LABEL="Year of procedure 137"                                                 
                                                                                
  PRYEAR138                  LENGTH=3                                           
  LABEL="Year of procedure 138"                                                 
                                                                                
  PRYEAR139                  LENGTH=3                                           
  LABEL="Year of procedure 139"                                                 
                                                                                
  PRYEAR140                  LENGTH=3                                           
  LABEL="Year of procedure 140"                                                 
                                                                                
  PRYEAR141                  LENGTH=3                                           
  LABEL="Year of procedure 141"                                                 
                                                                                
  PRYEAR142                  LENGTH=3                                           
  LABEL="Year of procedure 142"                                                 
                                                                                
  PRYEAR143                  LENGTH=3                                           
  LABEL="Year of procedure 143"                                                 
                                                                                
  PRYEAR144                  LENGTH=3                                           
  LABEL="Year of procedure 144"                                                 
                                                                                
  PRYEAR145                  LENGTH=3                                           
  LABEL="Year of procedure 145"                                                 
                                                                                
  PRYEAR146                  LENGTH=3                                           
  LABEL="Year of procedure 146"                                                 
                                                                                
  PRYEAR147                  LENGTH=3                                           
  LABEL="Year of procedure 147"                                                 
                                                                                
  PRYEAR148                  LENGTH=3                                           
  LABEL="Year of procedure 148"                                                 
                                                                                
  PRYEAR149                  LENGTH=3                                           
  LABEL="Year of procedure 149"                                                 
                                                                                
  PRYEAR150                  LENGTH=3                                           
  LABEL="Year of procedure 150"                                                 
                                                                                
  PRYEAR151                  LENGTH=3                                           
  LABEL="Year of procedure 151"                                                 
                                                                                
  PRYEAR152                  LENGTH=3                                           
  LABEL="Year of procedure 152"                                                 
                                                                                
  PRYEAR153                  LENGTH=3                                           
  LABEL="Year of procedure 153"                                                 
                                                                                
  PRYEAR154                  LENGTH=3                                           
  LABEL="Year of procedure 154"                                                 
                                                                                
  PRYEAR155                  LENGTH=3                                           
  LABEL="Year of procedure 155"                                                 
                                                                                
  PRYEAR156                  LENGTH=3                                           
  LABEL="Year of procedure 156"                                                 
                                                                                
  PRYEAR157                  LENGTH=3                                           
  LABEL="Year of procedure 157"                                                 
                                                                                
  PRYEAR158                  LENGTH=3                                           
  LABEL="Year of procedure 158"                                                 
                                                                                
  PRYEAR159                  LENGTH=3                                           
  LABEL="Year of procedure 159"                                                 
                                                                                
  PRYEAR160                  LENGTH=3                                           
  LABEL="Year of procedure 160"                                                 
                                                                                
  PRYEAR161                  LENGTH=3                                           
  LABEL="Year of procedure 161"                                                 
                                                                                
  PRYEAR162                  LENGTH=3                                           
  LABEL="Year of procedure 162"                                                 
                                                                                
  PRYEAR163                  LENGTH=3                                           
  LABEL="Year of procedure 163"                                                 
                                                                                
  PRYEAR164                  LENGTH=3                                           
  LABEL="Year of procedure 164"                                                 
                                                                                
  PRYEAR165                  LENGTH=3                                           
  LABEL="Year of procedure 165"                                                 
                                                                                
  PRYEAR166                  LENGTH=3                                           
  LABEL="Year of procedure 166"                                                 
                                                                                
  PRYEAR167                  LENGTH=3                                           
  LABEL="Year of procedure 167"                                                 
                                                                                
  PRYEAR168                  LENGTH=3                                           
  LABEL="Year of procedure 168"                                                 
                                                                                
  PRYEAR169                  LENGTH=3                                           
  LABEL="Year of procedure 169"                                                 
                                                                                
  PRYEAR170                  LENGTH=3                                           
  LABEL="Year of procedure 170"                                                 
                                                                                
  PRYEAR171                  LENGTH=3                                           
  LABEL="Year of procedure 171"                                                 
                                                                                
  PRYEAR172                  LENGTH=3                                           
  LABEL="Year of procedure 172"                                                 
                                                                                
  PRYEAR173                  LENGTH=3                                           
  LABEL="Year of procedure 173"                                                 
                                                                                
  PRYEAR174                  LENGTH=3                                           
  LABEL="Year of procedure 174"                                                 
                                                                                
  PRYEAR175                  LENGTH=3                                           
  LABEL="Year of procedure 175"                                                 
                                                                                
  PRYEAR176                  LENGTH=3                                           
  LABEL="Year of procedure 176"                                                 
                                                                                
  PRYEAR177                  LENGTH=3                                           
  LABEL="Year of procedure 177"                                                 
                                                                                
  PRYEAR178                  LENGTH=3                                           
  LABEL="Year of procedure 178"                                                 
                                                                                
  PRYEAR179                  LENGTH=3                                           
  LABEL="Year of procedure 179"                                                 
                                                                                
  PRYEAR180                  LENGTH=3                                           
  LABEL="Year of procedure 180"                                                 
                                                                                
  PRYEAR181                  LENGTH=3                                           
  LABEL="Year of procedure 181"                                                 
                                                                                
  PRYEAR182                  LENGTH=3                                           
  LABEL="Year of procedure 182"                                                 
                                                                                
  PRYEAR183                  LENGTH=3                                           
  LABEL="Year of procedure 183"                                                 
                                                                                
  PRYEAR184                  LENGTH=3                                           
  LABEL="Year of procedure 184"                                                 
                                                                                
  PRYEAR185                  LENGTH=3                                           
  LABEL="Year of procedure 185"                                                 
                                                                                
  PRYEAR186                  LENGTH=3                                           
  LABEL="Year of procedure 186"                                                 
                                                                                
  PRYEAR187                  LENGTH=3                                           
  LABEL="Year of procedure 187"                                                 
                                                                                
  PRYEAR188                  LENGTH=3                                           
  LABEL="Year of procedure 188"                                                 
                                                                                
  PRYEAR189                  LENGTH=3                                           
  LABEL="Year of procedure 189"                                                 
                                                                                
  PRYEAR190                  LENGTH=3                                           
  LABEL="Year of procedure 190"                                                 
                                                                                
  PRYEAR191                  LENGTH=3                                           
  LABEL="Year of procedure 191"                                                 
                                                                                
  PRYEAR192                  LENGTH=3                                           
  LABEL="Year of procedure 192"                                                 
                                                                                
  PRYEAR193                  LENGTH=3                                           
  LABEL="Year of procedure 193"                                                 
                                                                                
  PRYEAR194                  LENGTH=3                                           
  LABEL="Year of procedure 194"                                                 
                                                                                
  PRYEAR195                  LENGTH=3                                           
  LABEL="Year of procedure 195"                                                 
                                                                                
  PRYEAR196                  LENGTH=3                                           
  LABEL="Year of procedure 196"                                                 
                                                                                
  PRYEAR197                  LENGTH=3                                           
  LABEL="Year of procedure 197"                                                 
                                                                                
  PRYEAR198                  LENGTH=3                                           
  LABEL="Year of procedure 198"                                                 
                                                                                
  PRYEAR199                  LENGTH=3                                           
  LABEL="Year of procedure 199"                                                 
                                                                                
  PRYEAR200                  LENGTH=3                                           
  LABEL="Year of procedure 200"                                                 
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
      @24     BWT                           N4PF.                               
      @28     CPT1                          $CHAR5.                             
      @33     CPT2                          $CHAR5.                             
      @38     CPT3                          $CHAR5.                             
      @43     CPT4                          $CHAR5.                             
      @48     CPT5                          $CHAR5.                             
      @53     CPT6                          $CHAR5.                             
      @58     CPT7                          $CHAR5.                             
      @63     CPT8                          $CHAR5.                             
      @68     CPT9                          $CHAR5.                             
      @73     CPT10                         $CHAR5.                             
      @78     CPT11                         $CHAR5.                             
      @83     CPT12                         $CHAR5.                             
      @88     CPT13                         $CHAR5.                             
      @93     CPT14                         $CHAR5.                             
      @98     CPT15                         $CHAR5.                             
      @103    CPT16                         $CHAR5.                             
      @108    CPT17                         $CHAR5.                             
      @113    CPT18                         $CHAR5.                             
      @118    CPT19                         $CHAR5.                             
      @123    CPT20                         $CHAR5.                             
      @128    CPT21                         $CHAR5.                             
      @133    CPT22                         $CHAR5.                             
      @138    CPT23                         $CHAR5.                             
      @143    CPT24                         $CHAR5.                             
      @148    CPT25                         $CHAR5.                             
      @153    CPT26                         $CHAR5.                             
      @158    CPT27                         $CHAR5.                             
      @163    CPT28                         $CHAR5.                             
      @168    CPT29                         $CHAR5.                             
      @173    CPT30                         $CHAR5.                             
      @178    CPT31                         $CHAR5.                             
      @183    CPT32                         $CHAR5.                             
      @188    CPT33                         $CHAR5.                             
      @193    CPT34                         $CHAR5.                             
      @198    CPT35                         $CHAR5.                             
      @203    CPT36                         $CHAR5.                             
      @208    CPT37                         $CHAR5.                             
      @213    CPT38                         $CHAR5.                             
      @218    CPT39                         $CHAR5.                             
      @223    CPT40                         $CHAR5.                             
      @228    CPT41                         $CHAR5.                             
      @233    CPT42                         $CHAR5.                             
      @238    CPT43                         $CHAR5.                             
      @243    CPT44                         $CHAR5.                             
      @248    CPT45                         $CHAR5.                             
      @253    CPT46                         $CHAR5.                             
      @258    CPT47                         $CHAR5.                             
      @263    CPT48                         $CHAR5.                             
      @268    CPT49                         $CHAR5.                             
      @273    CPT50                         $CHAR5.                             
      @278    CPT51                         $CHAR5.                             
      @283    CPT52                         $CHAR5.                             
      @288    CPT53                         $CHAR5.                             
      @293    CPT54                         $CHAR5.                             
      @298    CPT55                         $CHAR5.                             
      @303    CPT56                         $CHAR5.                             
      @308    CPT57                         $CHAR5.                             
      @313    CPT58                         $CHAR5.                             
      @318    CPT59                         $CHAR5.                             
      @323    CPT60                         $CHAR5.                             
      @328    CPT61                         $CHAR5.                             
      @333    CPT62                         $CHAR5.                             
      @338    CPT63                         $CHAR5.                             
      @343    CPT64                         $CHAR5.                             
      @348    CPT65                         $CHAR5.                             
      @353    CPT66                         $CHAR5.                             
      @358    CPT67                         $CHAR5.                             
      @363    CPT68                         $CHAR5.                             
      @368    CPT69                         $CHAR5.                             
      @373    CPT70                         $CHAR5.                             
      @378    CPT71                         $CHAR5.                             
      @383    CPT72                         $CHAR5.                             
      @388    CPT73                         $CHAR5.                             
      @393    CPT74                         $CHAR5.                             
      @398    CPT75                         $CHAR5.                             
      @403    CPT76                         $CHAR5.                             
      @408    CPT77                         $CHAR5.                             
      @413    CPT78                         $CHAR5.                             
      @418    CPT79                         $CHAR5.                             
      @423    CPT80                         $CHAR5.                             
      @428    CPT81                         $CHAR5.                             
      @433    CPT82                         $CHAR5.                             
      @438    CPT83                         $CHAR5.                             
      @443    CPT84                         $CHAR5.                             
      @448    CPT85                         $CHAR5.                             
      @453    CPT86                         $CHAR5.                             
      @458    CPT87                         $CHAR5.                             
      @463    CPT88                         $CHAR5.                             
      @468    CPT89                         $CHAR5.                             
      @473    CPT90                         $CHAR5.                             
      @478    CPT91                         $CHAR5.                             
      @483    CPT92                         $CHAR5.                             
      @488    CPT93                         $CHAR5.                             
      @493    CPT94                         $CHAR5.                             
      @498    CPT95                         $CHAR5.                             
      @503    CPT96                         $CHAR5.                             
      @508    CPT97                         $CHAR5.                             
      @513    CPT98                         $CHAR5.                             
      @518    CPT99                         $CHAR5.                             
      @523    CPT100                        $CHAR5.                             
      @528    CPT101                        $CHAR5.                             
      @533    CPT102                        $CHAR5.                             
      @538    CPT103                        $CHAR5.                             
      @543    CPT104                        $CHAR5.                             
      @548    CPT105                        $CHAR5.                             
      @553    CPT106                        $CHAR5.                             
      @558    CPT107                        $CHAR5.                             
      @563    CPT108                        $CHAR5.                             
      @568    CPT109                        $CHAR5.                             
      @573    CPT110                        $CHAR5.                             
      @578    CPT111                        $CHAR5.                             
      @583    CPT112                        $CHAR5.                             
      @588    CPT113                        $CHAR5.                             
      @593    CPT114                        $CHAR5.                             
      @598    CPT115                        $CHAR5.                             
      @603    CPT116                        $CHAR5.                             
      @608    CPT117                        $CHAR5.                             
      @613    CPT118                        $CHAR5.                             
      @618    CPT119                        $CHAR5.                             
      @623    CPT120                        $CHAR5.                             
      @628    CPT121                        $CHAR5.                             
      @633    CPT122                        $CHAR5.                             
      @638    CPT123                        $CHAR5.                             
      @643    CPT124                        $CHAR5.                             
      @648    CPT125                        $CHAR5.                             
      @653    CPT126                        $CHAR5.                             
      @658    CPT127                        $CHAR5.                             
      @663    CPT128                        $CHAR5.                             
      @668    CPT129                        $CHAR5.                             
      @673    CPT130                        $CHAR5.                             
      @678    CPT131                        $CHAR5.                             
      @683    CPT132                        $CHAR5.                             
      @688    CPT133                        $CHAR5.                             
      @693    CPT134                        $CHAR5.                             
      @698    CPT135                        $CHAR5.                             
      @703    CPT136                        $CHAR5.                             
      @708    CPT137                        $CHAR5.                             
      @713    CPT138                        $CHAR5.                             
      @718    CPT139                        $CHAR5.                             
      @723    CPT140                        $CHAR5.                             
      @728    CPT141                        $CHAR5.                             
      @733    CPT142                        $CHAR5.                             
      @738    CPT143                        $CHAR5.                             
      @743    CPT144                        $CHAR5.                             
      @748    CPT145                        $CHAR5.                             
      @753    CPT146                        $CHAR5.                             
      @758    CPT147                        $CHAR5.                             
      @763    CPT148                        $CHAR5.                             
      @768    CPT149                        $CHAR5.                             
      @773    CPT150                        $CHAR5.                             
      @778    CPT151                        $CHAR5.                             
      @783    CPT152                        $CHAR5.                             
      @788    CPT153                        $CHAR5.                             
      @793    CPT154                        $CHAR5.                             
      @798    CPT155                        $CHAR5.                             
      @803    CPT156                        $CHAR5.                             
      @808    CPT157                        $CHAR5.                             
      @813    CPT158                        $CHAR5.                             
      @818    CPT159                        $CHAR5.                             
      @823    CPT160                        $CHAR5.                             
      @828    CPT161                        $CHAR5.                             
      @833    CPT162                        $CHAR5.                             
      @838    CPT163                        $CHAR5.                             
      @843    CPT164                        $CHAR5.                             
      @848    CPT165                        $CHAR5.                             
      @853    CPT166                        $CHAR5.                             
      @858    CPT167                        $CHAR5.                             
      @863    CPT168                        $CHAR5.                             
      @868    CPT169                        $CHAR5.                             
      @873    CPT170                        $CHAR5.                             
      @878    CPT171                        $CHAR5.                             
      @883    CPT172                        $CHAR5.                             
      @888    CPT173                        $CHAR5.                             
      @893    CPT174                        $CHAR5.                             
      @898    CPT175                        $CHAR5.                             
      @903    CPT176                        $CHAR5.                             
      @908    CPT177                        $CHAR5.                             
      @913    CPT178                        $CHAR5.                             
      @918    CPT179                        $CHAR5.                             
      @923    CPT180                        $CHAR5.                             
      @928    CPT181                        $CHAR5.                             
      @933    CPT182                        $CHAR5.                             
      @938    CPT183                        $CHAR5.                             
      @943    CPT184                        $CHAR5.                             
      @948    CPT185                        $CHAR5.                             
      @953    CPT186                        $CHAR5.                             
      @958    CPT187                        $CHAR5.                             
      @963    CPT188                        $CHAR5.                             
      @968    CPT189                        $CHAR5.                             
      @973    CPT190                        $CHAR5.                             
      @978    CPT191                        $CHAR5.                             
      @983    CPT192                        $CHAR5.                             
      @988    CPT193                        $CHAR5.                             
      @993    CPT194                        $CHAR5.                             
      @998    CPT195                        $CHAR5.                             
      @1003   CPT196                        $CHAR5.                             
      @1008   CPT197                        $CHAR5.                             
      @1013   CPT198                        $CHAR5.                             
      @1018   CPT199                        $CHAR5.                             
      @1023   CPT200                        $CHAR5.                             
      @1028   CPTCCS1                       N3PF.                               
      @1031   CPTCCS2                       N3PF.                               
      @1034   CPTCCS3                       N3PF.                               
      @1037   CPTCCS4                       N3PF.                               
      @1040   CPTCCS5                       N3PF.                               
      @1043   CPTCCS6                       N3PF.                               
      @1046   CPTCCS7                       N3PF.                               
      @1049   CPTCCS8                       N3PF.                               
      @1052   CPTCCS9                       N3PF.                               
      @1055   CPTCCS10                      N3PF.                               
      @1058   CPTCCS11                      N3PF.                               
      @1061   CPTCCS12                      N3PF.                               
      @1064   CPTCCS13                      N3PF.                               
      @1067   CPTCCS14                      N3PF.                               
      @1070   CPTCCS15                      N3PF.                               
      @1073   CPTCCS16                      N3PF.                               
      @1076   CPTCCS17                      N3PF.                               
      @1079   CPTCCS18                      N3PF.                               
      @1082   CPTCCS19                      N3PF.                               
      @1085   CPTCCS20                      N3PF.                               
      @1088   CPTCCS21                      N3PF.                               
      @1091   CPTCCS22                      N3PF.                               
      @1094   CPTCCS23                      N3PF.                               
      @1097   CPTCCS24                      N3PF.                               
      @1100   CPTCCS25                      N3PF.                               
      @1103   CPTCCS26                      N3PF.                               
      @1106   CPTCCS27                      N3PF.                               
      @1109   CPTCCS28                      N3PF.                               
      @1112   CPTCCS29                      N3PF.                               
      @1115   CPTCCS30                      N3PF.                               
      @1118   CPTCCS31                      N3PF.                               
      @1121   CPTCCS32                      N3PF.                               
      @1124   CPTCCS33                      N3PF.                               
      @1127   CPTCCS34                      N3PF.                               
      @1130   CPTCCS35                      N3PF.                               
      @1133   CPTCCS36                      N3PF.                               
      @1136   CPTCCS37                      N3PF.                               
      @1139   CPTCCS38                      N3PF.                               
      @1142   CPTCCS39                      N3PF.                               
      @1145   CPTCCS40                      N3PF.                               
      @1148   CPTCCS41                      N3PF.                               
      @1151   CPTCCS42                      N3PF.                               
      @1154   CPTCCS43                      N3PF.                               
      @1157   CPTCCS44                      N3PF.                               
      @1160   CPTCCS45                      N3PF.                               
      @1163   CPTCCS46                      N3PF.                               
      @1166   CPTCCS47                      N3PF.                               
      @1169   CPTCCS48                      N3PF.                               
      @1172   CPTCCS49                      N3PF.                               
      @1175   CPTCCS50                      N3PF.                               
      @1178   CPTCCS51                      N3PF.                               
      @1181   CPTCCS52                      N3PF.                               
      @1184   CPTCCS53                      N3PF.                               
      @1187   CPTCCS54                      N3PF.                               
      @1190   CPTCCS55                      N3PF.                               
      @1193   CPTCCS56                      N3PF.                               
      @1196   CPTCCS57                      N3PF.                               
      @1199   CPTCCS58                      N3PF.                               
      @1202   CPTCCS59                      N3PF.                               
      @1205   CPTCCS60                      N3PF.                               
      @1208   CPTCCS61                      N3PF.                               
      @1211   CPTCCS62                      N3PF.                               
      @1214   CPTCCS63                      N3PF.                               
      @1217   CPTCCS64                      N3PF.                               
      @1220   CPTCCS65                      N3PF.                               
      @1223   CPTCCS66                      N3PF.                               
      @1226   CPTCCS67                      N3PF.                               
      @1229   CPTCCS68                      N3PF.                               
      @1232   CPTCCS69                      N3PF.                               
      @1235   CPTCCS70                      N3PF.                               
      @1238   CPTCCS71                      N3PF.                               
      @1241   CPTCCS72                      N3PF.                               
      @1244   CPTCCS73                      N3PF.                               
      @1247   CPTCCS74                      N3PF.                               
      @1250   CPTCCS75                      N3PF.                               
      @1253   CPTCCS76                      N3PF.                               
      @1256   CPTCCS77                      N3PF.                               
      @1259   CPTCCS78                      N3PF.                               
      @1262   CPTCCS79                      N3PF.                               
      @1265   CPTCCS80                      N3PF.                               
      @1268   CPTCCS81                      N3PF.                               
      @1271   CPTCCS82                      N3PF.                               
      @1274   CPTCCS83                      N3PF.                               
      @1277   CPTCCS84                      N3PF.                               
      @1280   CPTCCS85                      N3PF.                               
      @1283   CPTCCS86                      N3PF.                               
      @1286   CPTCCS87                      N3PF.                               
      @1289   CPTCCS88                      N3PF.                               
      @1292   CPTCCS89                      N3PF.                               
      @1295   CPTCCS90                      N3PF.                               
      @1298   CPTCCS91                      N3PF.                               
      @1301   CPTCCS92                      N3PF.                               
      @1304   CPTCCS93                      N3PF.                               
      @1307   CPTCCS94                      N3PF.                               
      @1310   CPTCCS95                      N3PF.                               
      @1313   CPTCCS96                      N3PF.                               
      @1316   CPTCCS97                      N3PF.                               
      @1319   CPTCCS98                      N3PF.                               
      @1322   CPTCCS99                      N3PF.                               
      @1325   CPTCCS100                     N3PF.                               
      @1328   CPTCCS101                     N3PF.                               
      @1331   CPTCCS102                     N3PF.                               
      @1334   CPTCCS103                     N3PF.                               
      @1337   CPTCCS104                     N3PF.                               
      @1340   CPTCCS105                     N3PF.                               
      @1343   CPTCCS106                     N3PF.                               
      @1346   CPTCCS107                     N3PF.                               
      @1349   CPTCCS108                     N3PF.                               
      @1352   CPTCCS109                     N3PF.                               
      @1355   CPTCCS110                     N3PF.                               
      @1358   CPTCCS111                     N3PF.                               
      @1361   CPTCCS112                     N3PF.                               
      @1364   CPTCCS113                     N3PF.                               
      @1367   CPTCCS114                     N3PF.                               
      @1370   CPTCCS115                     N3PF.                               
      @1373   CPTCCS116                     N3PF.                               
      @1376   CPTCCS117                     N3PF.                               
      @1379   CPTCCS118                     N3PF.                               
      @1382   CPTCCS119                     N3PF.                               
      @1385   CPTCCS120                     N3PF.                               
      @1388   CPTCCS121                     N3PF.                               
      @1391   CPTCCS122                     N3PF.                               
      @1394   CPTCCS123                     N3PF.                               
      @1397   CPTCCS124                     N3PF.                               
      @1400   CPTCCS125                     N3PF.                               
      @1403   CPTCCS126                     N3PF.                               
      @1406   CPTCCS127                     N3PF.                               
      @1409   CPTCCS128                     N3PF.                               
      @1412   CPTCCS129                     N3PF.                               
      @1415   CPTCCS130                     N3PF.                               
      @1418   CPTCCS131                     N3PF.                               
      @1421   CPTCCS132                     N3PF.                               
      @1424   CPTCCS133                     N3PF.                               
      @1427   CPTCCS134                     N3PF.                               
      @1430   CPTCCS135                     N3PF.                               
      @1433   CPTCCS136                     N3PF.                               
      @1436   CPTCCS137                     N3PF.                               
      @1439   CPTCCS138                     N3PF.                               
      @1442   CPTCCS139                     N3PF.                               
      @1445   CPTCCS140                     N3PF.                               
      @1448   CPTCCS141                     N3PF.                               
      @1451   CPTCCS142                     N3PF.                               
      @1454   CPTCCS143                     N3PF.                               
      @1457   CPTCCS144                     N3PF.                               
      @1460   CPTCCS145                     N3PF.                               
      @1463   CPTCCS146                     N3PF.                               
      @1466   CPTCCS147                     N3PF.                               
      @1469   CPTCCS148                     N3PF.                               
      @1472   CPTCCS149                     N3PF.                               
      @1475   CPTCCS150                     N3PF.                               
      @1478   CPTCCS151                     N3PF.                               
      @1481   CPTCCS152                     N3PF.                               
      @1484   CPTCCS153                     N3PF.                               
      @1487   CPTCCS154                     N3PF.                               
      @1490   CPTCCS155                     N3PF.                               
      @1493   CPTCCS156                     N3PF.                               
      @1496   CPTCCS157                     N3PF.                               
      @1499   CPTCCS158                     N3PF.                               
      @1502   CPTCCS159                     N3PF.                               
      @1505   CPTCCS160                     N3PF.                               
      @1508   CPTCCS161                     N3PF.                               
      @1511   CPTCCS162                     N3PF.                               
      @1514   CPTCCS163                     N3PF.                               
      @1517   CPTCCS164                     N3PF.                               
      @1520   CPTCCS165                     N3PF.                               
      @1523   CPTCCS166                     N3PF.                               
      @1526   CPTCCS167                     N3PF.                               
      @1529   CPTCCS168                     N3PF.                               
      @1532   CPTCCS169                     N3PF.                               
      @1535   CPTCCS170                     N3PF.                               
      @1538   CPTCCS171                     N3PF.                               
      @1541   CPTCCS172                     N3PF.                               
      @1544   CPTCCS173                     N3PF.                               
      @1547   CPTCCS174                     N3PF.                               
      @1550   CPTCCS175                     N3PF.                               
      @1553   CPTCCS176                     N3PF.                               
      @1556   CPTCCS177                     N3PF.                               
      @1559   CPTCCS178                     N3PF.                               
      @1562   CPTCCS179                     N3PF.                               
      @1565   CPTCCS180                     N3PF.                               
      @1568   CPTCCS181                     N3PF.                               
      @1571   CPTCCS182                     N3PF.                               
      @1574   CPTCCS183                     N3PF.                               
      @1577   CPTCCS184                     N3PF.                               
      @1580   CPTCCS185                     N3PF.                               
      @1583   CPTCCS186                     N3PF.                               
      @1586   CPTCCS187                     N3PF.                               
      @1589   CPTCCS188                     N3PF.                               
      @1592   CPTCCS189                     N3PF.                               
      @1595   CPTCCS190                     N3PF.                               
      @1598   CPTCCS191                     N3PF.                               
      @1601   CPTCCS192                     N3PF.                               
      @1604   CPTCCS193                     N3PF.                               
      @1607   CPTCCS194                     N3PF.                               
      @1610   CPTCCS195                     N3PF.                               
      @1613   CPTCCS196                     N3PF.                               
      @1616   CPTCCS197                     N3PF.                               
      @1619   CPTCCS198                     N3PF.                               
      @1622   CPTCCS199                     N3PF.                               
      @1625   CPTCCS200                     N3PF.                               
      @1628   DaysToEvent                   N6PF.                               
      @1634   DHOUR                         N4PF.                               
      @1638   DIED                          N2PF.                               
      @1640   DISP_X                        $CHAR2.                             
      @1642   DISPUB04                      N2PF.                               
      @1644   DISPUNIFORM                   N2PF.                               
      @1646   DMONTH                        N2PF.                               
      @1648   DQTR                          N2PF.                               
      @1650   DRG                           N3PF.                               
      @1653   DRG_NoPOA                     N3PF.                               
      @1656   DRGVER                        N2PF.                               
      @1658   DXPOA1                        $CHAR1.                             
      @1659   DXPOA2                        $CHAR1.                             
      @1660   DXPOA3                        $CHAR1.                             
      @1661   DXPOA4                        $CHAR1.                             
      @1662   DXPOA5                        $CHAR1.                             
      @1663   DXPOA6                        $CHAR1.                             
      @1664   DXPOA7                        $CHAR1.                             
      @1665   DXPOA8                        $CHAR1.                             
      @1666   DXPOA9                        $CHAR1.                             
      @1667   DXPOA10                       $CHAR1.                             
      @1668   DXPOA11                       $CHAR1.                             
      @1669   DXPOA12                       $CHAR1.                             
      @1670   DXPOA13                       $CHAR1.                             
      @1671   DXPOA14                       $CHAR1.                             
      @1672   DXPOA15                       $CHAR1.                             
      @1673   DXPOA16                       $CHAR1.                             
      @1674   DXPOA17                       $CHAR1.                             
      @1675   DXPOA18                       $CHAR1.                             
      @1676   DXPOA19                       $CHAR1.                             
      @1677   DXPOA20                       $CHAR1.                             
      @1678   DXPOA21                       $CHAR1.                             
      @1679   DXPOA22                       $CHAR1.                             
      @1680   DXPOA23                       $CHAR1.                             
      @1681   DXPOA24                       $CHAR1.                             
      @1682   DXPOA25                       $CHAR1.                             
      @1683   DXPOA26                       $CHAR1.                             
      @1684   DXPOA27                       $CHAR1.                             
      @1685   DXPOA28                       $CHAR1.                             
      @1686   DXPOA29                       $CHAR1.                             
      @1687   DXPOA30                       $CHAR1.                             
      @1688   DXPOA31                       $CHAR1.                             
      @1689   DXPOA32                       $CHAR1.                             
      @1690   DXPOA33                       $CHAR1.                             
      @1691   DXPOA34                       $CHAR1.                             
      @1692   DXPOA35                       $CHAR1.                             
      @1693   DXPOA36                       $CHAR1.                             
      @1694   DXPOA37                       $CHAR1.                             
      @1695   DXPOA38                       $CHAR1.                             
      @1696   DXPOA39                       $CHAR1.                             
      @1697   DXPOA40                       $CHAR1.                             
      @1698   DXPOA41                       $CHAR1.                             
      @1699   DXPOA42                       $CHAR1.                             
      @1700   DXPOA43                       $CHAR1.                             
      @1701   DXPOA44                       $CHAR1.                             
      @1702   DXPOA45                       $CHAR1.                             
      @1703   DXPOA46                       $CHAR1.                             
      @1704   DXPOA47                       $CHAR1.                             
      @1705   DXPOA48                       $CHAR1.                             
      @1706   DXPOA49                       $CHAR1.                             
      @1707   DXPOA50                       $CHAR1.                             
      @1708   DXPOA51                       $CHAR1.                             
      @1709   DXPOA52                       $CHAR1.                             
      @1710   DXPOA53                       $CHAR1.                             
      @1711   DXPOA54                       $CHAR1.                             
      @1712   DXPOA55                       $CHAR1.                             
      @1713   DXPOA56                       $CHAR1.                             
      @1714   DXPOA57                       $CHAR1.                             
      @1715   DXPOA58                       $CHAR1.                             
      @1716   DXPOA59                       $CHAR1.                             
      @1717   DXPOA60                       $CHAR1.                             
      @1718   DXPOA61                       $CHAR1.                             
      @1719   DXPOA62                       $CHAR1.                             
      @1720   DXPOA63                       $CHAR1.                             
      @1721   DXPOA64                       $CHAR1.                             
      @1722   DXPOA65                       $CHAR1.                             
      @1723   DXPOA66                       $CHAR1.                             
      @1724   DXPOA67                       $CHAR1.                             
      @1725   DXPOA68                       $CHAR1.                             
      @1726   DXPOA69                       $CHAR1.                             
      @1727   DXPOA70                       $CHAR1.                             
      @1728   DXPOA71                       $CHAR1.                             
      @1729   DXPOA72                       $CHAR1.                             
      @1730   DXPOA73                       $CHAR1.                             
      @1731   DXPOA74                       $CHAR1.                             
      @1732   DXPOA75                       $CHAR1.                             
      @1733   DXPOA76                       $CHAR1.                             
      @1734   DXPOA77                       $CHAR1.                             
      @1735   DXPOA78                       $CHAR1.                             
      @1736   DXPOA79                       $CHAR1.                             
      @1737   DXPOA80                       $CHAR1.                             
      @1738   DXPOA81                       $CHAR1.                             
      @1739   DXPOA82                       $CHAR1.                             
      @1740   DXPOA83                       $CHAR1.                             
      @1741   DXPOA84                       $CHAR1.                             
      @1742   DXPOA85                       $CHAR1.                             
      @1743   DXPOA86                       $CHAR1.                             
      @1744   DXPOA87                       $CHAR1.                             
      @1745   DXPOA88                       $CHAR1.                             
      @1746   DXPOA89                       $CHAR1.                             
      @1747   DXPOA90                       $CHAR1.                             
      @1748   DXPOA91                       $CHAR1.                             
      @1749   DXPOA92                       $CHAR1.                             
      @1750   DXPOA93                       $CHAR1.                             
      @1751   DXPOA94                       $CHAR1.                             
      @1752   DXPOA95                       $CHAR1.                             
      @1753   DXPOA96                       $CHAR1.                             
      @1754   DXPOA97                       $CHAR1.                             
      @1755   DXPOA98                       $CHAR1.                             
      @1756   DXPOA99                       $CHAR1.                             
      @1757   DXPOA100                      $CHAR1.                             
      @1758   DXPOA101                      $CHAR1.                             
      @1759   DXPOA102                      $CHAR1.                             
      @1760   DXPOA103                      $CHAR1.                             
      @1761   DXPOA104                      $CHAR1.                             
      @1762   DXPOA105                      $CHAR1.                             
      @1763   DXPOA106                      $CHAR1.                             
      @1764   DXPOA107                      $CHAR1.                             
      @1765   DXPOA108                      $CHAR1.                             
      @1766   DXPOA109                      $CHAR1.                             
      @1767   DXPOA110                      $CHAR1.                             
      @1768   DXPOA111                      $CHAR1.                             
      @1769   DXPOA112                      $CHAR1.                             
      @1770   DXPOA113                      $CHAR1.                             
      @1771   DXPOA114                      $CHAR1.                             
      @1772   DXPOA115                      $CHAR1.                             
      @1773   DXPOA116                      $CHAR1.                             
      @1774   DXPOA117                      $CHAR1.                             
      @1775   FEMALE                        N2PF.                               
      @1777   HCUP_ED                       N2PF.                               
      @1779   HCUP_OS                       N2PF.                               
      @1781   HISPANIC                      N2PF.                               
      @1783   HISPANIC_X                    $CHAR1.                             
      @1784   Homeless                      N2PF.                               
      @1786   HOSPST                        $CHAR2.                             
      @1788   I10_BIRTH                     N3PF.                               
      @1791   I10_DELIVERY                  N3PF.                               
      @1794   I10_DX1                       $CHAR7.                             
      @1801   I10_DX2                       $CHAR7.                             
      @1808   I10_DX3                       $CHAR7.                             
      @1815   I10_DX4                       $CHAR7.                             
      @1822   I10_DX5                       $CHAR7.                             
      @1829   I10_DX6                       $CHAR7.                             
      @1836   I10_DX7                       $CHAR7.                             
      @1843   I10_DX8                       $CHAR7.                             
      @1850   I10_DX9                       $CHAR7.                             
      @1857   I10_DX10                      $CHAR7.                             
      @1864   I10_DX11                      $CHAR7.                             
      @1871   I10_DX12                      $CHAR7.                             
      @1878   I10_DX13                      $CHAR7.                             
      @1885   I10_DX14                      $CHAR7.                             
      @1892   I10_DX15                      $CHAR7.                             
      @1899   I10_DX16                      $CHAR7.                             
      @1906   I10_DX17                      $CHAR7.                             
      @1913   I10_DX18                      $CHAR7.                             
      @1920   I10_DX19                      $CHAR7.                             
      @1927   I10_DX20                      $CHAR7.                             
      @1934   I10_DX21                      $CHAR7.                             
      @1941   I10_DX22                      $CHAR7.                             
      @1948   I10_DX23                      $CHAR7.                             
      @1955   I10_DX24                      $CHAR7.                             
      @1962   I10_DX25                      $CHAR7.                             
      @1969   I10_DX26                      $CHAR7.                             
      @1976   I10_DX27                      $CHAR7.                             
      @1983   I10_DX28                      $CHAR7.                             
      @1990   I10_DX29                      $CHAR7.                             
      @1997   I10_DX30                      $CHAR7.                             
      @2004   I10_DX31                      $CHAR7.                             
      @2011   I10_DX32                      $CHAR7.                             
      @2018   I10_DX33                      $CHAR7.                             
      @2025   I10_DX34                      $CHAR7.                             
      @2032   I10_DX35                      $CHAR7.                             
      @2039   I10_DX36                      $CHAR7.                             
      @2046   I10_DX37                      $CHAR7.                             
      @2053   I10_DX38                      $CHAR7.                             
      @2060   I10_DX39                      $CHAR7.                             
      @2067   I10_DX40                      $CHAR7.                             
      @2074   I10_DX41                      $CHAR7.                             
      @2081   I10_DX42                      $CHAR7.                             
      @2088   I10_DX43                      $CHAR7.                             
      @2095   I10_DX44                      $CHAR7.                             
      @2102   I10_DX45                      $CHAR7.                             
      @2109   I10_DX46                      $CHAR7.                             
      @2116   I10_DX47                      $CHAR7.                             
      @2123   I10_DX48                      $CHAR7.                             
      @2130   I10_DX49                      $CHAR7.                             
      @2137   I10_DX50                      $CHAR7.                             
      @2144   I10_DX51                      $CHAR7.                             
      @2151   I10_DX52                      $CHAR7.                             
      @2158   I10_DX53                      $CHAR7.                             
      @2165   I10_DX54                      $CHAR7.                             
      @2172   I10_DX55                      $CHAR7.                             
      @2179   I10_DX56                      $CHAR7.                             
      @2186   I10_DX57                      $CHAR7.                             
      @2193   I10_DX58                      $CHAR7.                             
      @2200   I10_DX59                      $CHAR7.                             
      @2207   I10_DX60                      $CHAR7.                             
      @2214   I10_DX61                      $CHAR7.                             
      @2221   I10_DX62                      $CHAR7.                             
      @2228   I10_DX63                      $CHAR7.                             
      @2235   I10_DX64                      $CHAR7.                             
      @2242   I10_DX65                      $CHAR7.                             
      @2249   I10_DX66                      $CHAR7.                             
      @2256   I10_DX67                      $CHAR7.                             
      @2263   I10_DX68                      $CHAR7.                             
      @2270   I10_DX69                      $CHAR7.                             
      @2277   I10_DX70                      $CHAR7.                             
      @2284   I10_DX71                      $CHAR7.                             
      @2291   I10_DX72                      $CHAR7.                             
      @2298   I10_DX73                      $CHAR7.                             
      @2305   I10_DX74                      $CHAR7.                             
      @2312   I10_DX75                      $CHAR7.                             
      @2319   I10_DX76                      $CHAR7.                             
      @2326   I10_DX77                      $CHAR7.                             
      @2333   I10_DX78                      $CHAR7.                             
      @2340   I10_DX79                      $CHAR7.                             
      @2347   I10_DX80                      $CHAR7.                             
      @2354   I10_DX81                      $CHAR7.                             
      @2361   I10_DX82                      $CHAR7.                             
      @2368   I10_DX83                      $CHAR7.                             
      @2375   I10_DX84                      $CHAR7.                             
      @2382   I10_DX85                      $CHAR7.                             
      @2389   I10_DX86                      $CHAR7.                             
      @2396   I10_DX87                      $CHAR7.                             
      @2403   I10_DX88                      $CHAR7.                             
      @2410   I10_DX89                      $CHAR7.                             
      @2417   I10_DX90                      $CHAR7.                             
      @2424   I10_DX91                      $CHAR7.                             
      @2431   I10_DX92                      $CHAR7.                             
      @2438   I10_DX93                      $CHAR7.                             
      @2445   I10_DX94                      $CHAR7.                             
      @2452   I10_DX95                      $CHAR7.                             
      @2459   I10_DX96                      $CHAR7.                             
      @2466   I10_DX97                      $CHAR7.                             
      @2473   I10_DX98                      $CHAR7.                             
      @2480   I10_DX99                      $CHAR7.                             
      @2487   I10_DX100                     $CHAR7.                             
      @2494   I10_DX101                     $CHAR7.                             
      @2501   I10_DX102                     $CHAR7.                             
      @2508   I10_DX103                     $CHAR7.                             
      @2515   I10_DX104                     $CHAR7.                             
      @2522   I10_DX105                     $CHAR7.                             
      @2529   I10_DX106                     $CHAR7.                             
      @2536   I10_DX107                     $CHAR7.                             
      @2543   I10_DX108                     $CHAR7.                             
      @2550   I10_DX109                     $CHAR7.                             
      @2557   I10_DX110                     $CHAR7.                             
      @2564   I10_DX111                     $CHAR7.                             
      @2571   I10_DX112                     $CHAR7.                             
      @2578   I10_DX113                     $CHAR7.                             
      @2585   I10_DX114                     $CHAR7.                             
      @2592   I10_DX115                     $CHAR7.                             
      @2599   I10_DX116                     $CHAR7.                             
      @2606   I10_DX117                     $CHAR7.                             
      @2613   I10_NDX                       N3PF.                               
      @2616   I10_NPR                       N3PF.                               
      @2619   I10_PR1                       $CHAR7.                             
      @2626   I10_PR2                       $CHAR7.                             
      @2633   I10_PR3                       $CHAR7.                             
      @2640   I10_PR4                       $CHAR7.                             
      @2647   I10_PR5                       $CHAR7.                             
      @2654   I10_PR6                       $CHAR7.                             
      @2661   I10_PR7                       $CHAR7.                             
      @2668   I10_PR8                       $CHAR7.                             
      @2675   I10_PR9                       $CHAR7.                             
      @2682   I10_PR10                      $CHAR7.                             
      @2689   I10_PR11                      $CHAR7.                             
      @2696   I10_PR12                      $CHAR7.                             
      @2703   I10_PR13                      $CHAR7.                             
      @2710   I10_PR14                      $CHAR7.                             
      @2717   I10_PR15                      $CHAR7.                             
      @2724   I10_PR16                      $CHAR7.                             
      @2731   I10_PR17                      $CHAR7.                             
      @2738   I10_PR18                      $CHAR7.                             
      @2745   I10_PR19                      $CHAR7.                             
      @2752   I10_PR20                      $CHAR7.                             
      @2759   I10_PR21                      $CHAR7.                             
      @2766   I10_PR22                      $CHAR7.                             
      @2773   I10_PR23                      $CHAR7.                             
      @2780   I10_PR24                      $CHAR7.                             
      @2787   I10_PR25                      $CHAR7.                             
      @2794   I10_PR26                      $CHAR7.                             
      @2801   I10_PR27                      $CHAR7.                             
      @2808   I10_PR28                      $CHAR7.                             
      @2815   I10_PR29                      $CHAR7.                             
      @2822   I10_PR30                      $CHAR7.                             
      @2829   I10_PR31                      $CHAR7.                             
      @2836   I10_PR32                      $CHAR7.                             
      @2843   I10_PR33                      $CHAR7.                             
      @2850   I10_PR34                      $CHAR7.                             
      @2857   I10_PR35                      $CHAR7.                             
      @2864   I10_PR36                      $CHAR7.                             
      @2871   I10_PR37                      $CHAR7.                             
      @2878   I10_PR38                      $CHAR7.                             
      @2885   I10_PR39                      $CHAR7.                             
      @2892   I10_PR40                      $CHAR7.                             
      @2899   I10_PR41                      $CHAR7.                             
      @2906   I10_PR42                      $CHAR7.                             
      @2913   I10_PR43                      $CHAR7.                             
      @2920   I10_PR44                      $CHAR7.                             
      @2927   I10_PR45                      $CHAR7.                             
      @2934   I10_PR46                      $CHAR7.                             
      @2941   I10_PR47                      $CHAR7.                             
      @2948   I10_PR48                      $CHAR7.                             
      @2955   I10_PR49                      $CHAR7.                             
      @2962   I10_PR50                      $CHAR7.                             
      @2969   I10_PR51                      $CHAR7.                             
      @2976   I10_PR52                      $CHAR7.                             
      @2983   I10_PR53                      $CHAR7.                             
      @2990   I10_PR54                      $CHAR7.                             
      @2997   I10_PR55                      $CHAR7.                             
      @3004   I10_PR56                      $CHAR7.                             
      @3011   I10_PR57                      $CHAR7.                             
      @3018   I10_PR58                      $CHAR7.                             
      @3025   I10_PR59                      $CHAR7.                             
      @3032   I10_PR60                      $CHAR7.                             
      @3039   I10_PR61                      $CHAR7.                             
      @3046   I10_PR62                      $CHAR7.                             
      @3053   I10_PR63                      $CHAR7.                             
      @3060   I10_PR64                      $CHAR7.                             
      @3067   I10_PR65                      $CHAR7.                             
      @3074   I10_PR66                      $CHAR7.                             
      @3081   I10_PR67                      $CHAR7.                             
      @3088   I10_PR68                      $CHAR7.                             
      @3095   I10_PR69                      $CHAR7.                             
      @3102   I10_PR70                      $CHAR7.                             
      @3109   I10_PR71                      $CHAR7.                             
      @3116   I10_PR72                      $CHAR7.                             
      @3123   I10_PR73                      $CHAR7.                             
      @3130   I10_PR74                      $CHAR7.                             
      @3137   I10_PR75                      $CHAR7.                             
      @3144   I10_PR76                      $CHAR7.                             
      @3151   I10_PR77                      $CHAR7.                             
      @3158   I10_PR78                      $CHAR7.                             
      @3165   I10_PR79                      $CHAR7.                             
      @3172   I10_PR80                      $CHAR7.                             
      @3179   I10_PR81                      $CHAR7.                             
      @3186   I10_PR82                      $CHAR7.                             
      @3193   I10_PR83                      $CHAR7.                             
      @3200   I10_PR84                      $CHAR7.                             
      @3207   I10_PR85                      $CHAR7.                             
      @3214   I10_PR86                      $CHAR7.                             
      @3221   I10_PR87                      $CHAR7.                             
      @3228   I10_PR88                      $CHAR7.                             
      @3235   I10_PR89                      $CHAR7.                             
      @3242   I10_PR90                      $CHAR7.                             
      @3249   I10_PR91                      $CHAR7.                             
      @3256   I10_PR92                      $CHAR7.                             
      @3263   I10_PR93                      $CHAR7.                             
      @3270   I10_PR94                      $CHAR7.                             
      @3277   I10_PR95                      $CHAR7.                             
      @3284   I10_PR96                      $CHAR7.                             
      @3291   I10_PR97                      $CHAR7.                             
      @3298   I10_PR98                      $CHAR7.                             
      @3305   I10_PR99                      $CHAR7.                             
      @3312   I10_PR100                     $CHAR7.                             
      @3319   I10_PR101                     $CHAR7.                             
      @3326   I10_PR102                     $CHAR7.                             
      @3333   I10_PR103                     $CHAR7.                             
      @3340   I10_PR104                     $CHAR7.                             
      @3347   I10_PR105                     $CHAR7.                             
      @3354   I10_PR106                     $CHAR7.                             
      @3361   I10_PR107                     $CHAR7.                             
      @3368   I10_PR108                     $CHAR7.                             
      @3375   I10_PR109                     $CHAR7.                             
      @3382   I10_PR110                     $CHAR7.                             
      @3389   I10_PR111                     $CHAR7.                             
      @3396   I10_PR112                     $CHAR7.                             
      @3403   I10_PR113                     $CHAR7.                             
      @3410   I10_PR114                     $CHAR7.                             
      @3417   I10_PR115                     $CHAR7.                             
      @3424   I10_PR116                     $CHAR7.                             
      @3431   I10_PR117                     $CHAR7.                             
      @3438   I10_PR118                     $CHAR7.                             
      @3445   I10_PR119                     $CHAR7.                             
      @3452   I10_PR120                     $CHAR7.                             
      @3459   I10_PR121                     $CHAR7.                             
      @3466   I10_PR122                     $CHAR7.                             
      @3473   I10_PR123                     $CHAR7.                             
      @3480   I10_PR124                     $CHAR7.                             
      @3487   I10_PR125                     $CHAR7.                             
      @3494   I10_PR126                     $CHAR7.                             
      @3501   I10_PR127                     $CHAR7.                             
      @3508   I10_PR128                     $CHAR7.                             
      @3515   I10_PR129                     $CHAR7.                             
      @3522   I10_PR130                     $CHAR7.                             
      @3529   I10_PR131                     $CHAR7.                             
      @3536   I10_PR132                     $CHAR7.                             
      @3543   I10_PR133                     $CHAR7.                             
      @3550   I10_PR134                     $CHAR7.                             
      @3557   I10_PR135                     $CHAR7.                             
      @3564   I10_PR136                     $CHAR7.                             
      @3571   I10_PR137                     $CHAR7.                             
      @3578   I10_PR138                     $CHAR7.                             
      @3585   I10_PR139                     $CHAR7.                             
      @3592   I10_PR140                     $CHAR7.                             
      @3599   I10_PR141                     $CHAR7.                             
      @3606   I10_PR142                     $CHAR7.                             
      @3613   I10_PR143                     $CHAR7.                             
      @3620   I10_PR144                     $CHAR7.                             
      @3627   I10_PR145                     $CHAR7.                             
      @3634   I10_PR146                     $CHAR7.                             
      @3641   I10_PR147                     $CHAR7.                             
      @3648   I10_PR148                     $CHAR7.                             
      @3655   I10_PR149                     $CHAR7.                             
      @3662   I10_PR150                     $CHAR7.                             
      @3669   I10_PR151                     $CHAR7.                             
      @3676   I10_PR152                     $CHAR7.                             
      @3683   I10_PR153                     $CHAR7.                             
      @3690   I10_PR154                     $CHAR7.                             
      @3697   I10_PR155                     $CHAR7.                             
      @3704   I10_PR156                     $CHAR7.                             
      @3711   I10_PR157                     $CHAR7.                             
      @3718   I10_PR158                     $CHAR7.                             
      @3725   I10_PR159                     $CHAR7.                             
      @3732   I10_PR160                     $CHAR7.                             
      @3739   I10_PR161                     $CHAR7.                             
      @3746   I10_PR162                     $CHAR7.                             
      @3753   I10_PR163                     $CHAR7.                             
      @3760   I10_PR164                     $CHAR7.                             
      @3767   I10_PR165                     $CHAR7.                             
      @3774   I10_PR166                     $CHAR7.                             
      @3781   I10_PR167                     $CHAR7.                             
      @3788   I10_PR168                     $CHAR7.                             
      @3795   I10_PR169                     $CHAR7.                             
      @3802   I10_PR170                     $CHAR7.                             
      @3809   I10_PR171                     $CHAR7.                             
      @3816   I10_PR172                     $CHAR7.                             
      @3823   I10_PR173                     $CHAR7.                             
      @3830   I10_PR174                     $CHAR7.                             
      @3837   I10_PR175                     $CHAR7.                             
      @3844   I10_PR176                     $CHAR7.                             
      @3851   I10_PR177                     $CHAR7.                             
      @3858   I10_PR178                     $CHAR7.                             
      @3865   I10_PR179                     $CHAR7.                             
      @3872   I10_PR180                     $CHAR7.                             
      @3879   I10_PR181                     $CHAR7.                             
      @3886   I10_PR182                     $CHAR7.                             
      @3893   I10_PR183                     $CHAR7.                             
      @3900   I10_PR184                     $CHAR7.                             
      @3907   I10_PR185                     $CHAR7.                             
      @3914   I10_PR186                     $CHAR7.                             
      @3921   I10_PR187                     $CHAR7.                             
      @3928   I10_PR188                     $CHAR7.                             
      @3935   I10_PR189                     $CHAR7.                             
      @3942   I10_PR190                     $CHAR7.                             
      @3949   I10_PR191                     $CHAR7.                             
      @3956   I10_PR192                     $CHAR7.                             
      @3963   I10_PR193                     $CHAR7.                             
      @3970   I10_PR194                     $CHAR7.                             
      @3977   I10_PR195                     $CHAR7.                             
      @3984   I10_PR196                     $CHAR7.                             
      @3991   I10_PR197                     $CHAR7.                             
      @3998   I10_PR198                     $CHAR7.                             
      @4005   I10_PR199                     $CHAR7.                             
      @4012   I10_PR200                     $CHAR7.                             
      @4019   I10_PROCTYPE                  N3PF.                               
      @4022   I10_SERVICELINE               N2PF.                               
      @4024   KEY                           15.                                 
      @4039   LOS                           N5PF.                               
      @4044   LOS_X                         N6PF.                               
      @4050   MARITALSTATUS_X               $CHAR1.                             
      @4051   MARITALSTATUSUB04             $CHAR1.                             
      @4052   MDC                           N2PF.                               
      @4054   MDC_NoPOA                     N2PF.                               
      @4056   MDNUM1_R                      N9PF.                               
      @4065   MDNUM2_R                      N9PF.                               
      @4074   MDNUM3_R                      N9PF.                               
      @4083   MDNUM4_R                      N9PF.                               
      @4092   MEDINCSTQ                     N2PF.                               
      @4094   NCPT                          N4PF.                               
      @4098   OS_TIME                       N11P2F.                             
      @4109   PAY1                          N2PF.                               
      @4111   PAY1_X                        $CHAR4.                             
      @4115   PAY2                          N2PF.                               
      @4117   PAY2_X                        $CHAR4.                             
      @4121   PAY3                          N2PF.                               
      @4123   PAY3_X                        $CHAR4.                             
      @4127   PCLASS_ORPROC                 N2PF.                               
      @4129   PL_CBSA                       N3PF.                               
      @4132   PL_NCHS                       N2PF.                               
      @4134   PL_RUCC                       N2PF.                               
      @4136   PL_UIC                        N2PF.                               
      @4138   PL_UR_CAT4                    N2PF.                               
      @4140   POA_Disch_Edit1               N2PF.                               
      @4142   POA_Disch_Edit2               N2PF.                               
      @4144   POA_Hosp_Edit1                N2PF.                               
      @4146   POA_Hosp_Edit2                N2PF.                               
      @4148   POA_Hosp_Edit3                N2PF.                               
      @4150   POA_Hosp_Edit3_Value          N8P2F.                              
      @4158   PointOfOrigin_X               $CHAR1.                             
      @4159   PointOfOriginUB04             $CHAR1.                             
      @4160   PRDAY1                        N5PF.                               
      @4165   PRDAY2                        N5PF.                               
      @4170   PRDAY3                        N5PF.                               
      @4175   PRDAY4                        N5PF.                               
      @4180   PRDAY5                        N5PF.                               
      @4185   PRDAY6                        N5PF.                               
      @4190   PRDAY7                        N5PF.                               
      @4195   PRDAY8                        N5PF.                               
      @4200   PRDAY9                        N5PF.                               
      @4205   PRDAY10                       N5PF.                               
      @4210   PRDAY11                       N5PF.                               
      @4215   PRDAY12                       N5PF.                               
      @4220   PRDAY13                       N5PF.                               
      @4225   PRDAY14                       N5PF.                               
      @4230   PRDAY15                       N5PF.                               
      @4235   PRDAY16                       N5PF.                               
      @4240   PRDAY17                       N5PF.                               
      @4245   PRDAY18                       N5PF.                               
      @4250   PRDAY19                       N5PF.                               
      @4255   PRDAY20                       N5PF.                               
      @4260   PRDAY21                       N5PF.                               
      @4265   PRDAY22                       N5PF.                               
      @4270   PRDAY23                       N5PF.                               
      @4275   PRDAY24                       N5PF.                               
      @4280   PRDAY25                       N5PF.                               
      @4285   PRDAY26                       N5PF.                               
      @4290   PRDAY27                       N5PF.                               
      @4295   PRDAY28                       N5PF.                               
      @4300   PRDAY29                       N5PF.                               
      @4305   PRDAY30                       N5PF.                               
      @4310   PRDAY31                       N5PF.                               
      @4315   PRDAY32                       N5PF.                               
      @4320   PRDAY33                       N5PF.                               
      @4325   PRDAY34                       N5PF.                               
      @4330   PRDAY35                       N5PF.                               
      @4335   PRDAY36                       N5PF.                               
      @4340   PRDAY37                       N5PF.                               
      @4345   PRDAY38                       N5PF.                               
      @4350   PRDAY39                       N5PF.                               
      @4355   PRDAY40                       N5PF.                               
      @4360   PRDAY41                       N5PF.                               
      @4365   PRDAY42                       N5PF.                               
      @4370   PRDAY43                       N5PF.                               
      @4375   PRDAY44                       N5PF.                               
      @4380   PRDAY45                       N5PF.                               
      @4385   PRDAY46                       N5PF.                               
      @4390   PRDAY47                       N5PF.                               
      @4395   PRDAY48                       N5PF.                               
      @4400   PRDAY49                       N5PF.                               
      @4405   PRDAY50                       N5PF.                               
      @4410   PRDAY51                       N5PF.                               
      @4415   PRDAY52                       N5PF.                               
      @4420   PRDAY53                       N5PF.                               
      @4425   PRDAY54                       N5PF.                               
      @4430   PRDAY55                       N5PF.                               
      @4435   PRDAY56                       N5PF.                               
      @4440   PRDAY57                       N5PF.                               
      @4445   PRDAY58                       N5PF.                               
      @4450   PRDAY59                       N5PF.                               
      @4455   PRDAY60                       N5PF.                               
      @4460   PRDAY61                       N5PF.                               
      @4465   PRDAY62                       N5PF.                               
      @4470   PRDAY63                       N5PF.                               
      @4475   PRDAY64                       N5PF.                               
      @4480   PRDAY65                       N5PF.                               
      @4485   PRDAY66                       N5PF.                               
      @4490   PRDAY67                       N5PF.                               
      @4495   PRDAY68                       N5PF.                               
      @4500   PRDAY69                       N5PF.                               
      @4505   PRDAY70                       N5PF.                               
      @4510   PRDAY71                       N5PF.                               
      @4515   PRDAY72                       N5PF.                               
      @4520   PRDAY73                       N5PF.                               
      @4525   PRDAY74                       N5PF.                               
      @4530   PRDAY75                       N5PF.                               
      @4535   PRDAY76                       N5PF.                               
      @4540   PRDAY77                       N5PF.                               
      @4545   PRDAY78                       N5PF.                               
      @4550   PRDAY79                       N5PF.                               
      @4555   PRDAY80                       N5PF.                               
      @4560   PRDAY81                       N5PF.                               
      @4565   PRDAY82                       N5PF.                               
      @4570   PRDAY83                       N5PF.                               
      @4575   PRDAY84                       N5PF.                               
      @4580   PRDAY85                       N5PF.                               
      @4585   PRDAY86                       N5PF.                               
      @4590   PRDAY87                       N5PF.                               
      @4595   PRDAY88                       N5PF.                               
      @4600   PRDAY89                       N5PF.                               
      @4605   PRDAY90                       N5PF.                               
      @4610   PRDAY91                       N5PF.                               
      @4615   PRDAY92                       N5PF.                               
      @4620   PRDAY93                       N5PF.                               
      @4625   PRDAY94                       N5PF.                               
      @4630   PRDAY95                       N5PF.                               
      @4635   PRDAY96                       N5PF.                               
      @4640   PRDAY97                       N5PF.                               
      @4645   PRDAY98                       N5PF.                               
      @4650   PRDAY99                       N5PF.                               
      @4655   PRDAY100                      N5PF.                               
      @4660   PRDAY101                      N5PF.                               
      @4665   PRDAY102                      N5PF.                               
      @4670   PRDAY103                      N5PF.                               
      @4675   PRDAY104                      N5PF.                               
      @4680   PRDAY105                      N5PF.                               
      @4685   PRDAY106                      N5PF.                               
      @4690   PRDAY107                      N5PF.                               
      @4695   PRDAY108                      N5PF.                               
      @4700   PRDAY109                      N5PF.                               
      @4705   PRDAY110                      N5PF.                               
      @4710   PRDAY111                      N5PF.                               
      @4715   PRDAY112                      N5PF.                               
      @4720   PRDAY113                      N5PF.                               
      @4725   PRDAY114                      N5PF.                               
      @4730   PRDAY115                      N5PF.                               
      @4735   PRDAY116                      N5PF.                               
      @4740   PRDAY117                      N5PF.                               
      @4745   PRDAY118                      N5PF.                               
      @4750   PRDAY119                      N5PF.                               
      @4755   PRDAY120                      N5PF.                               
      @4760   PRDAY121                      N5PF.                               
      @4765   PRDAY122                      N5PF.                               
      @4770   PRDAY123                      N5PF.                               
      @4775   PRDAY124                      N5PF.                               
      @4780   PRDAY125                      N5PF.                               
      @4785   PRDAY126                      N5PF.                               
      @4790   PRDAY127                      N5PF.                               
      @4795   PRDAY128                      N5PF.                               
      @4800   PRDAY129                      N5PF.                               
      @4805   PRDAY130                      N5PF.                               
      @4810   PRDAY131                      N5PF.                               
      @4815   PRDAY132                      N5PF.                               
      @4820   PRDAY133                      N5PF.                               
      @4825   PRDAY134                      N5PF.                               
      @4830   PRDAY135                      N5PF.                               
      @4835   PRDAY136                      N5PF.                               
      @4840   PRDAY137                      N5PF.                               
      @4845   PRDAY138                      N5PF.                               
      @4850   PRDAY139                      N5PF.                               
      @4855   PRDAY140                      N5PF.                               
      @4860   PRDAY141                      N5PF.                               
      @4865   PRDAY142                      N5PF.                               
      @4870   PRDAY143                      N5PF.                               
      @4875   PRDAY144                      N5PF.                               
      @4880   PRDAY145                      N5PF.                               
      @4885   PRDAY146                      N5PF.                               
      @4890   PRDAY147                      N5PF.                               
      @4895   PRDAY148                      N5PF.                               
      @4900   PRDAY149                      N5PF.                               
      @4905   PRDAY150                      N5PF.                               
      @4910   PRDAY151                      N5PF.                               
      @4915   PRDAY152                      N5PF.                               
      @4920   PRDAY153                      N5PF.                               
      @4925   PRDAY154                      N5PF.                               
      @4930   PRDAY155                      N5PF.                               
      @4935   PRDAY156                      N5PF.                               
      @4940   PRDAY157                      N5PF.                               
      @4945   PRDAY158                      N5PF.                               
      @4950   PRDAY159                      N5PF.                               
      @4955   PRDAY160                      N5PF.                               
      @4960   PRDAY161                      N5PF.                               
      @4965   PRDAY162                      N5PF.                               
      @4970   PRDAY163                      N5PF.                               
      @4975   PRDAY164                      N5PF.                               
      @4980   PRDAY165                      N5PF.                               
      @4985   PRDAY166                      N5PF.                               
      @4990   PRDAY167                      N5PF.                               
      @4995   PRDAY168                      N5PF.                               
      @5000   PRDAY169                      N5PF.                               
      @5005   PRDAY170                      N5PF.                               
      @5010   PRDAY171                      N5PF.                               
      @5015   PRDAY172                      N5PF.                               
      @5020   PRDAY173                      N5PF.                               
      @5025   PRDAY174                      N5PF.                               
      @5030   PRDAY175                      N5PF.                               
      @5035   PRDAY176                      N5PF.                               
      @5040   PRDAY177                      N5PF.                               
      @5045   PRDAY178                      N5PF.                               
      @5050   PRDAY179                      N5PF.                               
      @5055   PRDAY180                      N5PF.                               
      @5060   PRDAY181                      N5PF.                               
      @5065   PRDAY182                      N5PF.                               
      @5070   PRDAY183                      N5PF.                               
      @5075   PRDAY184                      N5PF.                               
      @5080   PRDAY185                      N5PF.                               
      @5085   PRDAY186                      N5PF.                               
      @5090   PRDAY187                      N5PF.                               
      @5095   PRDAY188                      N5PF.                               
      @5100   PRDAY189                      N5PF.                               
      @5105   PRDAY190                      N5PF.                               
      @5110   PRDAY191                      N5PF.                               
      @5115   PRDAY192                      N5PF.                               
      @5120   PRDAY193                      N5PF.                               
      @5125   PRDAY194                      N5PF.                               
      @5130   PRDAY195                      N5PF.                               
      @5135   PRDAY196                      N5PF.                               
      @5140   PRDAY197                      N5PF.                               
      @5145   PRDAY198                      N5PF.                               
      @5150   PRDAY199                      N5PF.                               
      @5155   PRDAY200                      N5PF.                               
      @5160   PrimLang                      $CHAR3.                             
      @5163   PSTATE                        $CHAR2.                             
      @5165   PSTATE_GEO                    $CHAR2.                             
      @5167   PSTCO                         N5PF.                               
      @5172   PSTCO_GEO                     N5PF.                               
      @5177   RACE                          N2PF.                               
      @5179   RACE_PCT_MISS_HOSP            N7P2F.                              
      @5186   RACE_X                        $CHAR1.                             
      @5187   TOTCHG                        N10PF.                              
      @5197   TOTCHG_X                      N15P2F.                             
      @5212   TRAN_IN                       N2PF.                               
      @5214   TRAN_OUT                      N2PF.                               
      @5216   VisitLink                     N9PF.                               
      @5225   YEAR                          N4PF.                               
      @5229   ZIP                           $CHAR5.                             
      @5234   ZIP3                          $CHAR3.                             
      @5237   ZIPINC_QRTL                   N3PF.                               
      @5240   HOSPID                        N5PF.                               
      @5245   AYEAR                         N4PF.                               
      @5249   BMONTH                        N2PF.                               
      @5251   BYEAR                         N4PF.                               
      @5255   PRMONTH1                      N2PF.                               
      @5257   PRMONTH2                      N2PF.                               
      @5259   PRMONTH3                      N2PF.                               
      @5261   PRMONTH4                      N2PF.                               
      @5263   PRMONTH5                      N2PF.                               
      @5265   PRMONTH6                      N2PF.                               
      @5267   PRMONTH7                      N2PF.                               
      @5269   PRMONTH8                      N2PF.                               
      @5271   PRMONTH9                      N2PF.                               
      @5273   PRMONTH10                     N2PF.                               
      @5275   PRMONTH11                     N2PF.                               
      @5277   PRMONTH12                     N2PF.                               
      @5279   PRMONTH13                     N2PF.                               
      @5281   PRMONTH14                     N2PF.                               
      @5283   PRMONTH15                     N2PF.                               
      @5285   PRMONTH16                     N2PF.                               
      @5287   PRMONTH17                     N2PF.                               
      @5289   PRMONTH18                     N2PF.                               
      @5291   PRMONTH19                     N2PF.                               
      @5293   PRMONTH20                     N2PF.                               
      @5295   PRMONTH21                     N2PF.                               
      @5297   PRMONTH22                     N2PF.                               
      @5299   PRMONTH23                     N2PF.                               
      @5301   PRMONTH24                     N2PF.                               
      @5303   PRMONTH25                     N2PF.                               
      @5305   PRMONTH26                     N2PF.                               
      @5307   PRMONTH27                     N2PF.                               
      @5309   PRMONTH28                     N2PF.                               
      @5311   PRMONTH29                     N2PF.                               
      @5313   PRMONTH30                     N2PF.                               
      @5315   PRMONTH31                     N2PF.                               
      @5317   PRMONTH32                     N2PF.                               
      @5319   PRMONTH33                     N2PF.                               
      @5321   PRMONTH34                     N2PF.                               
      @5323   PRMONTH35                     N2PF.                               
      @5325   PRMONTH36                     N2PF.                               
      @5327   PRMONTH37                     N2PF.                               
      @5329   PRMONTH38                     N2PF.                               
      @5331   PRMONTH39                     N2PF.                               
      @5333   PRMONTH40                     N2PF.                               
      @5335   PRMONTH41                     N2PF.                               
      @5337   PRMONTH42                     N2PF.                               
      @5339   PRMONTH43                     N2PF.                               
      @5341   PRMONTH44                     N2PF.                               
      @5343   PRMONTH45                     N2PF.                               
      @5345   PRMONTH46                     N2PF.                               
      @5347   PRMONTH47                     N2PF.                               
      @5349   PRMONTH48                     N2PF.                               
      @5351   PRMONTH49                     N2PF.                               
      @5353   PRMONTH50                     N2PF.                               
      @5355   PRMONTH51                     N2PF.                               
      @5357   PRMONTH52                     N2PF.                               
      @5359   PRMONTH53                     N2PF.                               
      @5361   PRMONTH54                     N2PF.                               
      @5363   PRMONTH55                     N2PF.                               
      @5365   PRMONTH56                     N2PF.                               
      @5367   PRMONTH57                     N2PF.                               
      @5369   PRMONTH58                     N2PF.                               
      @5371   PRMONTH59                     N2PF.                               
      @5373   PRMONTH60                     N2PF.                               
      @5375   PRMONTH61                     N2PF.                               
      @5377   PRMONTH62                     N2PF.                               
      @5379   PRMONTH63                     N2PF.                               
      @5381   PRMONTH64                     N2PF.                               
      @5383   PRMONTH65                     N2PF.                               
      @5385   PRMONTH66                     N2PF.                               
      @5387   PRMONTH67                     N2PF.                               
      @5389   PRMONTH68                     N2PF.                               
      @5391   PRMONTH69                     N2PF.                               
      @5393   PRMONTH70                     N2PF.                               
      @5395   PRMONTH71                     N2PF.                               
      @5397   PRMONTH72                     N2PF.                               
      @5399   PRMONTH73                     N2PF.                               
      @5401   PRMONTH74                     N2PF.                               
      @5403   PRMONTH75                     N2PF.                               
      @5405   PRMONTH76                     N2PF.                               
      @5407   PRMONTH77                     N2PF.                               
      @5409   PRMONTH78                     N2PF.                               
      @5411   PRMONTH79                     N2PF.                               
      @5413   PRMONTH80                     N2PF.                               
      @5415   PRMONTH81                     N2PF.                               
      @5417   PRMONTH82                     N2PF.                               
      @5419   PRMONTH83                     N2PF.                               
      @5421   PRMONTH84                     N2PF.                               
      @5423   PRMONTH85                     N2PF.                               
      @5425   PRMONTH86                     N2PF.                               
      @5427   PRMONTH87                     N2PF.                               
      @5429   PRMONTH88                     N2PF.                               
      @5431   PRMONTH89                     N2PF.                               
      @5433   PRMONTH90                     N2PF.                               
      @5435   PRMONTH91                     N2PF.                               
      @5437   PRMONTH92                     N2PF.                               
      @5439   PRMONTH93                     N2PF.                               
      @5441   PRMONTH94                     N2PF.                               
      @5443   PRMONTH95                     N2PF.                               
      @5445   PRMONTH96                     N2PF.                               
      @5447   PRMONTH97                     N2PF.                               
      @5449   PRMONTH98                     N2PF.                               
      @5451   PRMONTH99                     N2PF.                               
      @5453   PRMONTH100                    N2PF.                               
      @5455   PRMONTH101                    N2PF.                               
      @5457   PRMONTH102                    N2PF.                               
      @5459   PRMONTH103                    N2PF.                               
      @5461   PRMONTH104                    N2PF.                               
      @5463   PRMONTH105                    N2PF.                               
      @5465   PRMONTH106                    N2PF.                               
      @5467   PRMONTH107                    N2PF.                               
      @5469   PRMONTH108                    N2PF.                               
      @5471   PRMONTH109                    N2PF.                               
      @5473   PRMONTH110                    N2PF.                               
      @5475   PRMONTH111                    N2PF.                               
      @5477   PRMONTH112                    N2PF.                               
      @5479   PRMONTH113                    N2PF.                               
      @5481   PRMONTH114                    N2PF.                               
      @5483   PRMONTH115                    N2PF.                               
      @5485   PRMONTH116                    N2PF.                               
      @5487   PRMONTH117                    N2PF.                               
      @5489   PRMONTH118                    N2PF.                               
      @5491   PRMONTH119                    N2PF.                               
      @5493   PRMONTH120                    N2PF.                               
      @5495   PRMONTH121                    N2PF.                               
      @5497   PRMONTH122                    N2PF.                               
      @5499   PRMONTH123                    N2PF.                               
      @5501   PRMONTH124                    N2PF.                               
      @5503   PRMONTH125                    N2PF.                               
      @5505   PRMONTH126                    N2PF.                               
      @5507   PRMONTH127                    N2PF.                               
      @5509   PRMONTH128                    N2PF.                               
      @5511   PRMONTH129                    N2PF.                               
      @5513   PRMONTH130                    N2PF.                               
      @5515   PRMONTH131                    N2PF.                               
      @5517   PRMONTH132                    N2PF.                               
      @5519   PRMONTH133                    N2PF.                               
      @5521   PRMONTH134                    N2PF.                               
      @5523   PRMONTH135                    N2PF.                               
      @5525   PRMONTH136                    N2PF.                               
      @5527   PRMONTH137                    N2PF.                               
      @5529   PRMONTH138                    N2PF.                               
      @5531   PRMONTH139                    N2PF.                               
      @5533   PRMONTH140                    N2PF.                               
      @5535   PRMONTH141                    N2PF.                               
      @5537   PRMONTH142                    N2PF.                               
      @5539   PRMONTH143                    N2PF.                               
      @5541   PRMONTH144                    N2PF.                               
      @5543   PRMONTH145                    N2PF.                               
      @5545   PRMONTH146                    N2PF.                               
      @5547   PRMONTH147                    N2PF.                               
      @5549   PRMONTH148                    N2PF.                               
      @5551   PRMONTH149                    N2PF.                               
      @5553   PRMONTH150                    N2PF.                               
      @5555   PRMONTH151                    N2PF.                               
      @5557   PRMONTH152                    N2PF.                               
      @5559   PRMONTH153                    N2PF.                               
      @5561   PRMONTH154                    N2PF.                               
      @5563   PRMONTH155                    N2PF.                               
      @5565   PRMONTH156                    N2PF.                               
      @5567   PRMONTH157                    N2PF.                               
      @5569   PRMONTH158                    N2PF.                               
      @5571   PRMONTH159                    N2PF.                               
      @5573   PRMONTH160                    N2PF.                               
      @5575   PRMONTH161                    N2PF.                               
      @5577   PRMONTH162                    N2PF.                               
      @5579   PRMONTH163                    N2PF.                               
      @5581   PRMONTH164                    N2PF.                               
      @5583   PRMONTH165                    N2PF.                               
      @5585   PRMONTH166                    N2PF.                               
      @5587   PRMONTH167                    N2PF.                               
      @5589   PRMONTH168                    N2PF.                               
      @5591   PRMONTH169                    N2PF.                               
      @5593   PRMONTH170                    N2PF.                               
      @5595   PRMONTH171                    N2PF.                               
      @5597   PRMONTH172                    N2PF.                               
      @5599   PRMONTH173                    N2PF.                               
      @5601   PRMONTH174                    N2PF.                               
      @5603   PRMONTH175                    N2PF.                               
      @5605   PRMONTH176                    N2PF.                               
      @5607   PRMONTH177                    N2PF.                               
      @5609   PRMONTH178                    N2PF.                               
      @5611   PRMONTH179                    N2PF.                               
      @5613   PRMONTH180                    N2PF.                               
      @5615   PRMONTH181                    N2PF.                               
      @5617   PRMONTH182                    N2PF.                               
      @5619   PRMONTH183                    N2PF.                               
      @5621   PRMONTH184                    N2PF.                               
      @5623   PRMONTH185                    N2PF.                               
      @5625   PRMONTH186                    N2PF.                               
      @5627   PRMONTH187                    N2PF.                               
      @5629   PRMONTH188                    N2PF.                               
      @5631   PRMONTH189                    N2PF.                               
      @5633   PRMONTH190                    N2PF.                               
      @5635   PRMONTH191                    N2PF.                               
      @5637   PRMONTH192                    N2PF.                               
      @5639   PRMONTH193                    N2PF.                               
      @5641   PRMONTH194                    N2PF.                               
      @5643   PRMONTH195                    N2PF.                               
      @5645   PRMONTH196                    N2PF.                               
      @5647   PRMONTH197                    N2PF.                               
      @5649   PRMONTH198                    N2PF.                               
      @5651   PRMONTH199                    N2PF.                               
      @5653   PRMONTH200                    N2PF.                               
      @5655   PRYEAR1                       N4PF.                               
      @5659   PRYEAR2                       N4PF.                               
      @5663   PRYEAR3                       N4PF.                               
      @5667   PRYEAR4                       N4PF.                               
      @5671   PRYEAR5                       N4PF.                               
      @5675   PRYEAR6                       N4PF.                               
      @5679   PRYEAR7                       N4PF.                               
      @5683   PRYEAR8                       N4PF.                               
      @5687   PRYEAR9                       N4PF.                               
      @5691   PRYEAR10                      N4PF.                               
      @5695   PRYEAR11                      N4PF.                               
      @5699   PRYEAR12                      N4PF.                               
      @5703   PRYEAR13                      N4PF.                               
      @5707   PRYEAR14                      N4PF.                               
      @5711   PRYEAR15                      N4PF.                               
      @5715   PRYEAR16                      N4PF.                               
      @5719   PRYEAR17                      N4PF.                               
      @5723   PRYEAR18                      N4PF.                               
      @5727   PRYEAR19                      N4PF.                               
      @5731   PRYEAR20                      N4PF.                               
      @5735   PRYEAR21                      N4PF.                               
      @5739   PRYEAR22                      N4PF.                               
      @5743   PRYEAR23                      N4PF.                               
      @5747   PRYEAR24                      N4PF.                               
      @5751   PRYEAR25                      N4PF.                               
      @5755   PRYEAR26                      N4PF.                               
      @5759   PRYEAR27                      N4PF.                               
      @5763   PRYEAR28                      N4PF.                               
      @5767   PRYEAR29                      N4PF.                               
      @5771   PRYEAR30                      N4PF.                               
      @5775   PRYEAR31                      N4PF.                               
      @5779   PRYEAR32                      N4PF.                               
      @5783   PRYEAR33                      N4PF.                               
      @5787   PRYEAR34                      N4PF.                               
      @5791   PRYEAR35                      N4PF.                               
      @5795   PRYEAR36                      N4PF.                               
      @5799   PRYEAR37                      N4PF.                               
      @5803   PRYEAR38                      N4PF.                               
      @5807   PRYEAR39                      N4PF.                               
      @5811   PRYEAR40                      N4PF.                               
      @5815   PRYEAR41                      N4PF.                               
      @5819   PRYEAR42                      N4PF.                               
      @5823   PRYEAR43                      N4PF.                               
      @5827   PRYEAR44                      N4PF.                               
      @5831   PRYEAR45                      N4PF.                               
      @5835   PRYEAR46                      N4PF.                               
      @5839   PRYEAR47                      N4PF.                               
      @5843   PRYEAR48                      N4PF.                               
      @5847   PRYEAR49                      N4PF.                               
      @5851   PRYEAR50                      N4PF.                               
      @5855   PRYEAR51                      N4PF.                               
      @5859   PRYEAR52                      N4PF.                               
      @5863   PRYEAR53                      N4PF.                               
      @5867   PRYEAR54                      N4PF.                               
      @5871   PRYEAR55                      N4PF.                               
      @5875   PRYEAR56                      N4PF.                               
      @5879   PRYEAR57                      N4PF.                               
      @5883   PRYEAR58                      N4PF.                               
      @5887   PRYEAR59                      N4PF.                               
      @5891   PRYEAR60                      N4PF.                               
      @5895   PRYEAR61                      N4PF.                               
      @5899   PRYEAR62                      N4PF.                               
      @5903   PRYEAR63                      N4PF.                               
      @5907   PRYEAR64                      N4PF.                               
      @5911   PRYEAR65                      N4PF.                               
      @5915   PRYEAR66                      N4PF.                               
      @5919   PRYEAR67                      N4PF.                               
      @5923   PRYEAR68                      N4PF.                               
      @5927   PRYEAR69                      N4PF.                               
      @5931   PRYEAR70                      N4PF.                               
      @5935   PRYEAR71                      N4PF.                               
      @5939   PRYEAR72                      N4PF.                               
      @5943   PRYEAR73                      N4PF.                               
      @5947   PRYEAR74                      N4PF.                               
      @5951   PRYEAR75                      N4PF.                               
      @5955   PRYEAR76                      N4PF.                               
      @5959   PRYEAR77                      N4PF.                               
      @5963   PRYEAR78                      N4PF.                               
      @5967   PRYEAR79                      N4PF.                               
      @5971   PRYEAR80                      N4PF.                               
      @5975   PRYEAR81                      N4PF.                               
      @5979   PRYEAR82                      N4PF.                               
      @5983   PRYEAR83                      N4PF.                               
      @5987   PRYEAR84                      N4PF.                               
      @5991   PRYEAR85                      N4PF.                               
      @5995   PRYEAR86                      N4PF.                               
      @5999   PRYEAR87                      N4PF.                               
      @6003   PRYEAR88                      N4PF.                               
      @6007   PRYEAR89                      N4PF.                               
      @6011   PRYEAR90                      N4PF.                               
      @6015   PRYEAR91                      N4PF.                               
      @6019   PRYEAR92                      N4PF.                               
      @6023   PRYEAR93                      N4PF.                               
      @6027   PRYEAR94                      N4PF.                               
      @6031   PRYEAR95                      N4PF.                               
      @6035   PRYEAR96                      N4PF.                               
      @6039   PRYEAR97                      N4PF.                               
      @6043   PRYEAR98                      N4PF.                               
      @6047   PRYEAR99                      N4PF.                               
      @6051   PRYEAR100                     N4PF.                               
      @6055   PRYEAR101                     N4PF.                               
      @6059   PRYEAR102                     N4PF.                               
      @6063   PRYEAR103                     N4PF.                               
      @6067   PRYEAR104                     N4PF.                               
      @6071   PRYEAR105                     N4PF.                               
      @6075   PRYEAR106                     N4PF.                               
      @6079   PRYEAR107                     N4PF.                               
      @6083   PRYEAR108                     N4PF.                               
      @6087   PRYEAR109                     N4PF.                               
      @6091   PRYEAR110                     N4PF.                               
      @6095   PRYEAR111                     N4PF.                               
      @6099   PRYEAR112                     N4PF.                               
      @6103   PRYEAR113                     N4PF.                               
      @6107   PRYEAR114                     N4PF.                               
      @6111   PRYEAR115                     N4PF.                               
      @6115   PRYEAR116                     N4PF.                               
      @6119   PRYEAR117                     N4PF.                               
      @6123   PRYEAR118                     N4PF.                               
      @6127   PRYEAR119                     N4PF.                               
      @6131   PRYEAR120                     N4PF.                               
      @6135   PRYEAR121                     N4PF.                               
      @6139   PRYEAR122                     N4PF.                               
      @6143   PRYEAR123                     N4PF.                               
      @6147   PRYEAR124                     N4PF.                               
      @6151   PRYEAR125                     N4PF.                               
      @6155   PRYEAR126                     N4PF.                               
      @6159   PRYEAR127                     N4PF.                               
      @6163   PRYEAR128                     N4PF.                               
      @6167   PRYEAR129                     N4PF.                               
      @6171   PRYEAR130                     N4PF.                               
      @6175   PRYEAR131                     N4PF.                               
      @6179   PRYEAR132                     N4PF.                               
      @6183   PRYEAR133                     N4PF.                               
      @6187   PRYEAR134                     N4PF.                               
      @6191   PRYEAR135                     N4PF.                               
      @6195   PRYEAR136                     N4PF.                               
      @6199   PRYEAR137                     N4PF.                               
      @6203   PRYEAR138                     N4PF.                               
      @6207   PRYEAR139                     N4PF.                               
      @6211   PRYEAR140                     N4PF.                               
      @6215   PRYEAR141                     N4PF.                               
      @6219   PRYEAR142                     N4PF.                               
      @6223   PRYEAR143                     N4PF.                               
      @6227   PRYEAR144                     N4PF.                               
      @6231   PRYEAR145                     N4PF.                               
      @6235   PRYEAR146                     N4PF.                               
      @6239   PRYEAR147                     N4PF.                               
      @6243   PRYEAR148                     N4PF.                               
      @6247   PRYEAR149                     N4PF.                               
      @6251   PRYEAR150                     N4PF.                               
      @6255   PRYEAR151                     N4PF.                               
      @6259   PRYEAR152                     N4PF.                               
      @6263   PRYEAR153                     N4PF.                               
      @6267   PRYEAR154                     N4PF.                               
      @6271   PRYEAR155                     N4PF.                               
      @6275   PRYEAR156                     N4PF.                               
      @6279   PRYEAR157                     N4PF.                               
      @6283   PRYEAR158                     N4PF.                               
      @6287   PRYEAR159                     N4PF.                               
      @6291   PRYEAR160                     N4PF.                               
      @6295   PRYEAR161                     N4PF.                               
      @6299   PRYEAR162                     N4PF.                               
      @6303   PRYEAR163                     N4PF.                               
      @6307   PRYEAR164                     N4PF.                               
      @6311   PRYEAR165                     N4PF.                               
      @6315   PRYEAR166                     N4PF.                               
      @6319   PRYEAR167                     N4PF.                               
      @6323   PRYEAR168                     N4PF.                               
      @6327   PRYEAR169                     N4PF.                               
      @6331   PRYEAR170                     N4PF.                               
      @6335   PRYEAR171                     N4PF.                               
      @6339   PRYEAR172                     N4PF.                               
      @6343   PRYEAR173                     N4PF.                               
      @6347   PRYEAR174                     N4PF.                               
      @6351   PRYEAR175                     N4PF.                               
      @6355   PRYEAR176                     N4PF.                               
      @6359   PRYEAR177                     N4PF.                               
      @6363   PRYEAR178                     N4PF.                               
      @6367   PRYEAR179                     N4PF.                               
      @6371   PRYEAR180                     N4PF.                               
      @6375   PRYEAR181                     N4PF.                               
      @6379   PRYEAR182                     N4PF.                               
      @6383   PRYEAR183                     N4PF.                               
      @6387   PRYEAR184                     N4PF.                               
      @6391   PRYEAR185                     N4PF.                               
      @6395   PRYEAR186                     N4PF.                               
      @6399   PRYEAR187                     N4PF.                               
      @6403   PRYEAR188                     N4PF.                               
      @6407   PRYEAR189                     N4PF.                               
      @6411   PRYEAR190                     N4PF.                               
      @6415   PRYEAR191                     N4PF.                               
      @6419   PRYEAR192                     N4PF.                               
      @6423   PRYEAR193                     N4PF.                               
      @6427   PRYEAR194                     N4PF.                               
      @6431   PRYEAR195                     N4PF.                               
      @6435   PRYEAR196                     N4PF.                               
      @6439   PRYEAR197                     N4PF.                               
      @6443   PRYEAR198                     N4PF.                               
      @6447   PRYEAR199                     N4PF.                               
      @6451   PRYEAR200                     N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
