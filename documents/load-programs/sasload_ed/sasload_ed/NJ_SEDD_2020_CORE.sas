/*******************************************************************            
* Creation Date: 04/27/2022                                                     
*   NJ_SEDD_2020_CORE.SAS:                                                      
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
DATA NJ_SEDDC_2020_CORE;                                                        
INFILE 'NJ_SEDD_2020_CORE.ASC' FIRSTOBS=3 LRECL = 3312;                         
                                                                                
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
                                                                                
  CPTM1_121                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 121"                                        
                                                                                
  CPTM1_122                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 122"                                        
                                                                                
  CPTM1_123                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 123"                                        
                                                                                
  CPTM1_124                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 124"                                        
                                                                                
  CPTM1_125                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 125"                                        
                                                                                
  CPTM1_126                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 126"                                        
                                                                                
  CPTM1_127                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 127"                                        
                                                                                
  CPTM1_128                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 128"                                        
                                                                                
  CPTM1_129                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 129"                                        
                                                                                
  CPTM1_130                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 130"                                        
                                                                                
  CPTM1_131                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 131"                                        
                                                                                
  CPTM1_132                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 132"                                        
                                                                                
  CPTM1_133                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 133"                                        
                                                                                
  CPTM1_134                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 134"                                        
                                                                                
  CPTM1_135                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 135"                                        
                                                                                
  CPTM1_136                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 136"                                        
                                                                                
  CPTM1_137                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 137"                                        
                                                                                
  CPTM1_138                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 138"                                        
                                                                                
  CPTM1_139                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 139"                                        
                                                                                
  CPTM1_140                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 140"                                        
                                                                                
  CPTM1_141                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 141"                                        
                                                                                
  CPTM1_142                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 142"                                        
                                                                                
  CPTM1_143                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 143"                                        
                                                                                
  CPTM1_144                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 144"                                        
                                                                                
  CPTM1_145                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 145"                                        
                                                                                
  CPTM1_146                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 146"                                        
                                                                                
  CPTM1_147                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 147"                                        
                                                                                
  CPTM1_148                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 148"                                        
                                                                                
  CPTM1_149                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 149"                                        
                                                                                
  CPTM1_150                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 150"                                        
                                                                                
  CPTM1_151                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 151"                                        
                                                                                
  CPTM1_152                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 152"                                        
                                                                                
  CPTM1_153                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 153"                                        
                                                                                
  CPTM1_154                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 154"                                        
                                                                                
  CPTM1_155                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 155"                                        
                                                                                
  CPTM1_156                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 156"                                        
                                                                                
  CPTM1_157                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 157"                                        
                                                                                
  CPTM1_158                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 158"                                        
                                                                                
  CPTM1_159                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 159"                                        
                                                                                
  CPTM1_160                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 160"                                        
                                                                                
  CPTM1_161                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 161"                                        
                                                                                
  CPTM1_162                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 162"                                        
                                                                                
  CPTM1_163                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 163"                                        
                                                                                
  CPTM1_164                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 164"                                        
                                                                                
  CPTM1_165                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 165"                                        
                                                                                
  CPTM1_166                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 166"                                        
                                                                                
  CPTM1_167                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 167"                                        
                                                                                
  CPTM1_168                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 168"                                        
                                                                                
  CPTM1_169                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 169"                                        
                                                                                
  CPTM1_170                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 170"                                        
                                                                                
  CPTM1_171                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 171"                                        
                                                                                
  CPTM1_172                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 172"                                        
                                                                                
  CPTM1_173                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 173"                                        
                                                                                
  CPTM1_174                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 174"                                        
                                                                                
  CPTM1_175                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 175"                                        
                                                                                
  CPTM1_176                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 176"                                        
                                                                                
  CPTM1_177                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 177"                                        
                                                                                
  CPTM1_178                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 178"                                        
                                                                                
  CPTM1_179                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 179"                                        
                                                                                
  CPTM1_180                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 180"                                        
                                                                                
  CPTM1_181                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 181"                                        
                                                                                
  CPTM1_182                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 182"                                        
                                                                                
  CPTM1_183                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 183"                                        
                                                                                
  CPTM1_184                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 184"                                        
                                                                                
  CPTM1_185                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 185"                                        
                                                                                
  CPTM1_186                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 186"                                        
                                                                                
  CPTM1_187                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 187"                                        
                                                                                
  CPTM1_188                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 188"                                        
                                                                                
  CPTM1_189                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 189"                                        
                                                                                
  CPTM1_190                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 190"                                        
                                                                                
  CPTM1_191                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 191"                                        
                                                                                
  CPTM1_192                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 192"                                        
                                                                                
  CPTM1_193                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 193"                                        
                                                                                
  CPTM1_194                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 194"                                        
                                                                                
  CPTM1_195                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 195"                                        
                                                                                
  CPTM1_196                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 196"                                        
                                                                                
  CPTM1_197                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 197"                                        
                                                                                
  CPTM1_198                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 198"                                        
                                                                                
  CPTM1_199                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 199"                                        
                                                                                
  CPTM1_200                  LENGTH=$2                                          
  LABEL="First CPT-4/HCPCS modifier 200"                                        
                                                                                
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
                                                                                
  CPTM2_121                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 121"                                       
                                                                                
  CPTM2_122                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 122"                                       
                                                                                
  CPTM2_123                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 123"                                       
                                                                                
  CPTM2_124                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 124"                                       
                                                                                
  CPTM2_125                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 125"                                       
                                                                                
  CPTM2_126                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 126"                                       
                                                                                
  CPTM2_127                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 127"                                       
                                                                                
  CPTM2_128                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 128"                                       
                                                                                
  CPTM2_129                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 129"                                       
                                                                                
  CPTM2_130                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 130"                                       
                                                                                
  CPTM2_131                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 131"                                       
                                                                                
  CPTM2_132                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 132"                                       
                                                                                
  CPTM2_133                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 133"                                       
                                                                                
  CPTM2_134                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 134"                                       
                                                                                
  CPTM2_135                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 135"                                       
                                                                                
  CPTM2_136                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 136"                                       
                                                                                
  CPTM2_137                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 137"                                       
                                                                                
  CPTM2_138                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 138"                                       
                                                                                
  CPTM2_139                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 139"                                       
                                                                                
  CPTM2_140                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 140"                                       
                                                                                
  CPTM2_141                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 141"                                       
                                                                                
  CPTM2_142                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 142"                                       
                                                                                
  CPTM2_143                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 143"                                       
                                                                                
  CPTM2_144                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 144"                                       
                                                                                
  CPTM2_145                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 145"                                       
                                                                                
  CPTM2_146                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 146"                                       
                                                                                
  CPTM2_147                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 147"                                       
                                                                                
  CPTM2_148                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 148"                                       
                                                                                
  CPTM2_149                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 149"                                       
                                                                                
  CPTM2_150                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 150"                                       
                                                                                
  CPTM2_151                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 151"                                       
                                                                                
  CPTM2_152                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 152"                                       
                                                                                
  CPTM2_153                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 153"                                       
                                                                                
  CPTM2_154                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 154"                                       
                                                                                
  CPTM2_155                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 155"                                       
                                                                                
  CPTM2_156                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 156"                                       
                                                                                
  CPTM2_157                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 157"                                       
                                                                                
  CPTM2_158                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 158"                                       
                                                                                
  CPTM2_159                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 159"                                       
                                                                                
  CPTM2_160                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 160"                                       
                                                                                
  CPTM2_161                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 161"                                       
                                                                                
  CPTM2_162                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 162"                                       
                                                                                
  CPTM2_163                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 163"                                       
                                                                                
  CPTM2_164                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 164"                                       
                                                                                
  CPTM2_165                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 165"                                       
                                                                                
  CPTM2_166                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 166"                                       
                                                                                
  CPTM2_167                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 167"                                       
                                                                                
  CPTM2_168                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 168"                                       
                                                                                
  CPTM2_169                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 169"                                       
                                                                                
  CPTM2_170                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 170"                                       
                                                                                
  CPTM2_171                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 171"                                       
                                                                                
  CPTM2_172                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 172"                                       
                                                                                
  CPTM2_173                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 173"                                       
                                                                                
  CPTM2_174                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 174"                                       
                                                                                
  CPTM2_175                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 175"                                       
                                                                                
  CPTM2_176                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 176"                                       
                                                                                
  CPTM2_177                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 177"                                       
                                                                                
  CPTM2_178                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 178"                                       
                                                                                
  CPTM2_179                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 179"                                       
                                                                                
  CPTM2_180                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 180"                                       
                                                                                
  CPTM2_181                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 181"                                       
                                                                                
  CPTM2_182                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 182"                                       
                                                                                
  CPTM2_183                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 183"                                       
                                                                                
  CPTM2_184                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 184"                                       
                                                                                
  CPTM2_185                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 185"                                       
                                                                                
  CPTM2_186                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 186"                                       
                                                                                
  CPTM2_187                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 187"                                       
                                                                                
  CPTM2_188                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 188"                                       
                                                                                
  CPTM2_189                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 189"                                       
                                                                                
  CPTM2_190                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 190"                                       
                                                                                
  CPTM2_191                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 191"                                       
                                                                                
  CPTM2_192                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 192"                                       
                                                                                
  CPTM2_193                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 193"                                       
                                                                                
  CPTM2_194                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 194"                                       
                                                                                
  CPTM2_195                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 195"                                       
                                                                                
  CPTM2_196                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 196"                                       
                                                                                
  CPTM2_197                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 197"                                       
                                                                                
  CPTM2_198                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 198"                                       
                                                                                
  CPTM2_199                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 199"                                       
                                                                                
  CPTM2_200                  LENGTH=$2                                          
  LABEL="Second CPT-4/HCPCS modifier 200"                                       
                                                                                
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
                                                                                
  DSHOSPID                   LENGTH=$17                                         
  LABEL="Data source hospital identifier"                                       
                                                                                
  DURATION                   LENGTH=4                                           
  LABEL="Elapsed time for hospital care in hours and minutes"                   
                                                                                
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
                                                                                
  HISPANIC_X                 LENGTH=$5                                          
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
                                                                                
  I10_DX29                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 29"                                                
                                                                                
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
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MOMNUM_R                   LENGTH=5                                           
  LABEL="Mother's number (re-identified)"                                       
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures for this visit"                         
                                                                                
  OPservice                  LENGTH=$1                                          
  LABEL="Indicator of outpatient service (as received from source)"             
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$10                                         
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$10                                         
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$10                                         
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
                                                                                
  RACE_X                     LENGTH=$5                                          
  LABEL="Race (as received from source)"                                        
                                                                                
  READMIT                    LENGTH=3                                           
  LABEL="Readmission"                                                           
                                                                                
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
                                                                                
  TOWN                       LENGTH=$4                                          
  LABEL="Patient town of residence (as received from source)"                   
                                                                                
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
      @524    CPT101                        $CHAR5.                             
      @529    CPT102                        $CHAR5.                             
      @534    CPT103                        $CHAR5.                             
      @539    CPT104                        $CHAR5.                             
      @544    CPT105                        $CHAR5.                             
      @549    CPT106                        $CHAR5.                             
      @554    CPT107                        $CHAR5.                             
      @559    CPT108                        $CHAR5.                             
      @564    CPT109                        $CHAR5.                             
      @569    CPT110                        $CHAR5.                             
      @574    CPT111                        $CHAR5.                             
      @579    CPT112                        $CHAR5.                             
      @584    CPT113                        $CHAR5.                             
      @589    CPT114                        $CHAR5.                             
      @594    CPT115                        $CHAR5.                             
      @599    CPT116                        $CHAR5.                             
      @604    CPT117                        $CHAR5.                             
      @609    CPT118                        $CHAR5.                             
      @614    CPT119                        $CHAR5.                             
      @619    CPT120                        $CHAR5.                             
      @624    CPT121                        $CHAR5.                             
      @629    CPT122                        $CHAR5.                             
      @634    CPT123                        $CHAR5.                             
      @639    CPT124                        $CHAR5.                             
      @644    CPT125                        $CHAR5.                             
      @649    CPT126                        $CHAR5.                             
      @654    CPT127                        $CHAR5.                             
      @659    CPT128                        $CHAR5.                             
      @664    CPT129                        $CHAR5.                             
      @669    CPT130                        $CHAR5.                             
      @674    CPT131                        $CHAR5.                             
      @679    CPT132                        $CHAR5.                             
      @684    CPT133                        $CHAR5.                             
      @689    CPT134                        $CHAR5.                             
      @694    CPT135                        $CHAR5.                             
      @699    CPT136                        $CHAR5.                             
      @704    CPT137                        $CHAR5.                             
      @709    CPT138                        $CHAR5.                             
      @714    CPT139                        $CHAR5.                             
      @719    CPT140                        $CHAR5.                             
      @724    CPT141                        $CHAR5.                             
      @729    CPT142                        $CHAR5.                             
      @734    CPT143                        $CHAR5.                             
      @739    CPT144                        $CHAR5.                             
      @744    CPT145                        $CHAR5.                             
      @749    CPT146                        $CHAR5.                             
      @754    CPT147                        $CHAR5.                             
      @759    CPT148                        $CHAR5.                             
      @764    CPT149                        $CHAR5.                             
      @769    CPT150                        $CHAR5.                             
      @774    CPT151                        $CHAR5.                             
      @779    CPT152                        $CHAR5.                             
      @784    CPT153                        $CHAR5.                             
      @789    CPT154                        $CHAR5.                             
      @794    CPT155                        $CHAR5.                             
      @799    CPT156                        $CHAR5.                             
      @804    CPT157                        $CHAR5.                             
      @809    CPT158                        $CHAR5.                             
      @814    CPT159                        $CHAR5.                             
      @819    CPT160                        $CHAR5.                             
      @824    CPT161                        $CHAR5.                             
      @829    CPT162                        $CHAR5.                             
      @834    CPT163                        $CHAR5.                             
      @839    CPT164                        $CHAR5.                             
      @844    CPT165                        $CHAR5.                             
      @849    CPT166                        $CHAR5.                             
      @854    CPT167                        $CHAR5.                             
      @859    CPT168                        $CHAR5.                             
      @864    CPT169                        $CHAR5.                             
      @869    CPT170                        $CHAR5.                             
      @874    CPT171                        $CHAR5.                             
      @879    CPT172                        $CHAR5.                             
      @884    CPT173                        $CHAR5.                             
      @889    CPT174                        $CHAR5.                             
      @894    CPT175                        $CHAR5.                             
      @899    CPT176                        $CHAR5.                             
      @904    CPT177                        $CHAR5.                             
      @909    CPT178                        $CHAR5.                             
      @914    CPT179                        $CHAR5.                             
      @919    CPT180                        $CHAR5.                             
      @924    CPT181                        $CHAR5.                             
      @929    CPT182                        $CHAR5.                             
      @934    CPT183                        $CHAR5.                             
      @939    CPT184                        $CHAR5.                             
      @944    CPT185                        $CHAR5.                             
      @949    CPT186                        $CHAR5.                             
      @954    CPT187                        $CHAR5.                             
      @959    CPT188                        $CHAR5.                             
      @964    CPT189                        $CHAR5.                             
      @969    CPT190                        $CHAR5.                             
      @974    CPT191                        $CHAR5.                             
      @979    CPT192                        $CHAR5.                             
      @984    CPT193                        $CHAR5.                             
      @989    CPT194                        $CHAR5.                             
      @994    CPT195                        $CHAR5.                             
      @999    CPT196                        $CHAR5.                             
      @1004   CPT197                        $CHAR5.                             
      @1009   CPT198                        $CHAR5.                             
      @1014   CPT199                        $CHAR5.                             
      @1019   CPT200                        $CHAR5.                             
      @1024   CPTCCS1                       N3PF.                               
      @1027   CPTCCS2                       N3PF.                               
      @1030   CPTCCS3                       N3PF.                               
      @1033   CPTCCS4                       N3PF.                               
      @1036   CPTCCS5                       N3PF.                               
      @1039   CPTCCS6                       N3PF.                               
      @1042   CPTCCS7                       N3PF.                               
      @1045   CPTCCS8                       N3PF.                               
      @1048   CPTCCS9                       N3PF.                               
      @1051   CPTCCS10                      N3PF.                               
      @1054   CPTCCS11                      N3PF.                               
      @1057   CPTCCS12                      N3PF.                               
      @1060   CPTCCS13                      N3PF.                               
      @1063   CPTCCS14                      N3PF.                               
      @1066   CPTCCS15                      N3PF.                               
      @1069   CPTCCS16                      N3PF.                               
      @1072   CPTCCS17                      N3PF.                               
      @1075   CPTCCS18                      N3PF.                               
      @1078   CPTCCS19                      N3PF.                               
      @1081   CPTCCS20                      N3PF.                               
      @1084   CPTCCS21                      N3PF.                               
      @1087   CPTCCS22                      N3PF.                               
      @1090   CPTCCS23                      N3PF.                               
      @1093   CPTCCS24                      N3PF.                               
      @1096   CPTCCS25                      N3PF.                               
      @1099   CPTCCS26                      N3PF.                               
      @1102   CPTCCS27                      N3PF.                               
      @1105   CPTCCS28                      N3PF.                               
      @1108   CPTCCS29                      N3PF.                               
      @1111   CPTCCS30                      N3PF.                               
      @1114   CPTCCS31                      N3PF.                               
      @1117   CPTCCS32                      N3PF.                               
      @1120   CPTCCS33                      N3PF.                               
      @1123   CPTCCS34                      N3PF.                               
      @1126   CPTCCS35                      N3PF.                               
      @1129   CPTCCS36                      N3PF.                               
      @1132   CPTCCS37                      N3PF.                               
      @1135   CPTCCS38                      N3PF.                               
      @1138   CPTCCS39                      N3PF.                               
      @1141   CPTCCS40                      N3PF.                               
      @1144   CPTCCS41                      N3PF.                               
      @1147   CPTCCS42                      N3PF.                               
      @1150   CPTCCS43                      N3PF.                               
      @1153   CPTCCS44                      N3PF.                               
      @1156   CPTCCS45                      N3PF.                               
      @1159   CPTCCS46                      N3PF.                               
      @1162   CPTCCS47                      N3PF.                               
      @1165   CPTCCS48                      N3PF.                               
      @1168   CPTCCS49                      N3PF.                               
      @1171   CPTCCS50                      N3PF.                               
      @1174   CPTCCS51                      N3PF.                               
      @1177   CPTCCS52                      N3PF.                               
      @1180   CPTCCS53                      N3PF.                               
      @1183   CPTCCS54                      N3PF.                               
      @1186   CPTCCS55                      N3PF.                               
      @1189   CPTCCS56                      N3PF.                               
      @1192   CPTCCS57                      N3PF.                               
      @1195   CPTCCS58                      N3PF.                               
      @1198   CPTCCS59                      N3PF.                               
      @1201   CPTCCS60                      N3PF.                               
      @1204   CPTCCS61                      N3PF.                               
      @1207   CPTCCS62                      N3PF.                               
      @1210   CPTCCS63                      N3PF.                               
      @1213   CPTCCS64                      N3PF.                               
      @1216   CPTCCS65                      N3PF.                               
      @1219   CPTCCS66                      N3PF.                               
      @1222   CPTCCS67                      N3PF.                               
      @1225   CPTCCS68                      N3PF.                               
      @1228   CPTCCS69                      N3PF.                               
      @1231   CPTCCS70                      N3PF.                               
      @1234   CPTCCS71                      N3PF.                               
      @1237   CPTCCS72                      N3PF.                               
      @1240   CPTCCS73                      N3PF.                               
      @1243   CPTCCS74                      N3PF.                               
      @1246   CPTCCS75                      N3PF.                               
      @1249   CPTCCS76                      N3PF.                               
      @1252   CPTCCS77                      N3PF.                               
      @1255   CPTCCS78                      N3PF.                               
      @1258   CPTCCS79                      N3PF.                               
      @1261   CPTCCS80                      N3PF.                               
      @1264   CPTCCS81                      N3PF.                               
      @1267   CPTCCS82                      N3PF.                               
      @1270   CPTCCS83                      N3PF.                               
      @1273   CPTCCS84                      N3PF.                               
      @1276   CPTCCS85                      N3PF.                               
      @1279   CPTCCS86                      N3PF.                               
      @1282   CPTCCS87                      N3PF.                               
      @1285   CPTCCS88                      N3PF.                               
      @1288   CPTCCS89                      N3PF.                               
      @1291   CPTCCS90                      N3PF.                               
      @1294   CPTCCS91                      N3PF.                               
      @1297   CPTCCS92                      N3PF.                               
      @1300   CPTCCS93                      N3PF.                               
      @1303   CPTCCS94                      N3PF.                               
      @1306   CPTCCS95                      N3PF.                               
      @1309   CPTCCS96                      N3PF.                               
      @1312   CPTCCS97                      N3PF.                               
      @1315   CPTCCS98                      N3PF.                               
      @1318   CPTCCS99                      N3PF.                               
      @1321   CPTCCS100                     N3PF.                               
      @1324   CPTCCS101                     N3PF.                               
      @1327   CPTCCS102                     N3PF.                               
      @1330   CPTCCS103                     N3PF.                               
      @1333   CPTCCS104                     N3PF.                               
      @1336   CPTCCS105                     N3PF.                               
      @1339   CPTCCS106                     N3PF.                               
      @1342   CPTCCS107                     N3PF.                               
      @1345   CPTCCS108                     N3PF.                               
      @1348   CPTCCS109                     N3PF.                               
      @1351   CPTCCS110                     N3PF.                               
      @1354   CPTCCS111                     N3PF.                               
      @1357   CPTCCS112                     N3PF.                               
      @1360   CPTCCS113                     N3PF.                               
      @1363   CPTCCS114                     N3PF.                               
      @1366   CPTCCS115                     N3PF.                               
      @1369   CPTCCS116                     N3PF.                               
      @1372   CPTCCS117                     N3PF.                               
      @1375   CPTCCS118                     N3PF.                               
      @1378   CPTCCS119                     N3PF.                               
      @1381   CPTCCS120                     N3PF.                               
      @1384   CPTCCS121                     N3PF.                               
      @1387   CPTCCS122                     N3PF.                               
      @1390   CPTCCS123                     N3PF.                               
      @1393   CPTCCS124                     N3PF.                               
      @1396   CPTCCS125                     N3PF.                               
      @1399   CPTCCS126                     N3PF.                               
      @1402   CPTCCS127                     N3PF.                               
      @1405   CPTCCS128                     N3PF.                               
      @1408   CPTCCS129                     N3PF.                               
      @1411   CPTCCS130                     N3PF.                               
      @1414   CPTCCS131                     N3PF.                               
      @1417   CPTCCS132                     N3PF.                               
      @1420   CPTCCS133                     N3PF.                               
      @1423   CPTCCS134                     N3PF.                               
      @1426   CPTCCS135                     N3PF.                               
      @1429   CPTCCS136                     N3PF.                               
      @1432   CPTCCS137                     N3PF.                               
      @1435   CPTCCS138                     N3PF.                               
      @1438   CPTCCS139                     N3PF.                               
      @1441   CPTCCS140                     N3PF.                               
      @1444   CPTCCS141                     N3PF.                               
      @1447   CPTCCS142                     N3PF.                               
      @1450   CPTCCS143                     N3PF.                               
      @1453   CPTCCS144                     N3PF.                               
      @1456   CPTCCS145                     N3PF.                               
      @1459   CPTCCS146                     N3PF.                               
      @1462   CPTCCS147                     N3PF.                               
      @1465   CPTCCS148                     N3PF.                               
      @1468   CPTCCS149                     N3PF.                               
      @1471   CPTCCS150                     N3PF.                               
      @1474   CPTCCS151                     N3PF.                               
      @1477   CPTCCS152                     N3PF.                               
      @1480   CPTCCS153                     N3PF.                               
      @1483   CPTCCS154                     N3PF.                               
      @1486   CPTCCS155                     N3PF.                               
      @1489   CPTCCS156                     N3PF.                               
      @1492   CPTCCS157                     N3PF.                               
      @1495   CPTCCS158                     N3PF.                               
      @1498   CPTCCS159                     N3PF.                               
      @1501   CPTCCS160                     N3PF.                               
      @1504   CPTCCS161                     N3PF.                               
      @1507   CPTCCS162                     N3PF.                               
      @1510   CPTCCS163                     N3PF.                               
      @1513   CPTCCS164                     N3PF.                               
      @1516   CPTCCS165                     N3PF.                               
      @1519   CPTCCS166                     N3PF.                               
      @1522   CPTCCS167                     N3PF.                               
      @1525   CPTCCS168                     N3PF.                               
      @1528   CPTCCS169                     N3PF.                               
      @1531   CPTCCS170                     N3PF.                               
      @1534   CPTCCS171                     N3PF.                               
      @1537   CPTCCS172                     N3PF.                               
      @1540   CPTCCS173                     N3PF.                               
      @1543   CPTCCS174                     N3PF.                               
      @1546   CPTCCS175                     N3PF.                               
      @1549   CPTCCS176                     N3PF.                               
      @1552   CPTCCS177                     N3PF.                               
      @1555   CPTCCS178                     N3PF.                               
      @1558   CPTCCS179                     N3PF.                               
      @1561   CPTCCS180                     N3PF.                               
      @1564   CPTCCS181                     N3PF.                               
      @1567   CPTCCS182                     N3PF.                               
      @1570   CPTCCS183                     N3PF.                               
      @1573   CPTCCS184                     N3PF.                               
      @1576   CPTCCS185                     N3PF.                               
      @1579   CPTCCS186                     N3PF.                               
      @1582   CPTCCS187                     N3PF.                               
      @1585   CPTCCS188                     N3PF.                               
      @1588   CPTCCS189                     N3PF.                               
      @1591   CPTCCS190                     N3PF.                               
      @1594   CPTCCS191                     N3PF.                               
      @1597   CPTCCS192                     N3PF.                               
      @1600   CPTCCS193                     N3PF.                               
      @1603   CPTCCS194                     N3PF.                               
      @1606   CPTCCS195                     N3PF.                               
      @1609   CPTCCS196                     N3PF.                               
      @1612   CPTCCS197                     N3PF.                               
      @1615   CPTCCS198                     N3PF.                               
      @1618   CPTCCS199                     N3PF.                               
      @1621   CPTCCS200                     N3PF.                               
      @1624   CPTM1_1                       $CHAR2.                             
      @1626   CPTM1_2                       $CHAR2.                             
      @1628   CPTM1_3                       $CHAR2.                             
      @1630   CPTM1_4                       $CHAR2.                             
      @1632   CPTM1_5                       $CHAR2.                             
      @1634   CPTM1_6                       $CHAR2.                             
      @1636   CPTM1_7                       $CHAR2.                             
      @1638   CPTM1_8                       $CHAR2.                             
      @1640   CPTM1_9                       $CHAR2.                             
      @1642   CPTM1_10                      $CHAR2.                             
      @1644   CPTM1_11                      $CHAR2.                             
      @1646   CPTM1_12                      $CHAR2.                             
      @1648   CPTM1_13                      $CHAR2.                             
      @1650   CPTM1_14                      $CHAR2.                             
      @1652   CPTM1_15                      $CHAR2.                             
      @1654   CPTM1_16                      $CHAR2.                             
      @1656   CPTM1_17                      $CHAR2.                             
      @1658   CPTM1_18                      $CHAR2.                             
      @1660   CPTM1_19                      $CHAR2.                             
      @1662   CPTM1_20                      $CHAR2.                             
      @1664   CPTM1_21                      $CHAR2.                             
      @1666   CPTM1_22                      $CHAR2.                             
      @1668   CPTM1_23                      $CHAR2.                             
      @1670   CPTM1_24                      $CHAR2.                             
      @1672   CPTM1_25                      $CHAR2.                             
      @1674   CPTM1_26                      $CHAR2.                             
      @1676   CPTM1_27                      $CHAR2.                             
      @1678   CPTM1_28                      $CHAR2.                             
      @1680   CPTM1_29                      $CHAR2.                             
      @1682   CPTM1_30                      $CHAR2.                             
      @1684   CPTM1_31                      $CHAR2.                             
      @1686   CPTM1_32                      $CHAR2.                             
      @1688   CPTM1_33                      $CHAR2.                             
      @1690   CPTM1_34                      $CHAR2.                             
      @1692   CPTM1_35                      $CHAR2.                             
      @1694   CPTM1_36                      $CHAR2.                             
      @1696   CPTM1_37                      $CHAR2.                             
      @1698   CPTM1_38                      $CHAR2.                             
      @1700   CPTM1_39                      $CHAR2.                             
      @1702   CPTM1_40                      $CHAR2.                             
      @1704   CPTM1_41                      $CHAR2.                             
      @1706   CPTM1_42                      $CHAR2.                             
      @1708   CPTM1_43                      $CHAR2.                             
      @1710   CPTM1_44                      $CHAR2.                             
      @1712   CPTM1_45                      $CHAR2.                             
      @1714   CPTM1_46                      $CHAR2.                             
      @1716   CPTM1_47                      $CHAR2.                             
      @1718   CPTM1_48                      $CHAR2.                             
      @1720   CPTM1_49                      $CHAR2.                             
      @1722   CPTM1_50                      $CHAR2.                             
      @1724   CPTM1_51                      $CHAR2.                             
      @1726   CPTM1_52                      $CHAR2.                             
      @1728   CPTM1_53                      $CHAR2.                             
      @1730   CPTM1_54                      $CHAR2.                             
      @1732   CPTM1_55                      $CHAR2.                             
      @1734   CPTM1_56                      $CHAR2.                             
      @1736   CPTM1_57                      $CHAR2.                             
      @1738   CPTM1_58                      $CHAR2.                             
      @1740   CPTM1_59                      $CHAR2.                             
      @1742   CPTM1_60                      $CHAR2.                             
      @1744   CPTM1_61                      $CHAR2.                             
      @1746   CPTM1_62                      $CHAR2.                             
      @1748   CPTM1_63                      $CHAR2.                             
      @1750   CPTM1_64                      $CHAR2.                             
      @1752   CPTM1_65                      $CHAR2.                             
      @1754   CPTM1_66                      $CHAR2.                             
      @1756   CPTM1_67                      $CHAR2.                             
      @1758   CPTM1_68                      $CHAR2.                             
      @1760   CPTM1_69                      $CHAR2.                             
      @1762   CPTM1_70                      $CHAR2.                             
      @1764   CPTM1_71                      $CHAR2.                             
      @1766   CPTM1_72                      $CHAR2.                             
      @1768   CPTM1_73                      $CHAR2.                             
      @1770   CPTM1_74                      $CHAR2.                             
      @1772   CPTM1_75                      $CHAR2.                             
      @1774   CPTM1_76                      $CHAR2.                             
      @1776   CPTM1_77                      $CHAR2.                             
      @1778   CPTM1_78                      $CHAR2.                             
      @1780   CPTM1_79                      $CHAR2.                             
      @1782   CPTM1_80                      $CHAR2.                             
      @1784   CPTM1_81                      $CHAR2.                             
      @1786   CPTM1_82                      $CHAR2.                             
      @1788   CPTM1_83                      $CHAR2.                             
      @1790   CPTM1_84                      $CHAR2.                             
      @1792   CPTM1_85                      $CHAR2.                             
      @1794   CPTM1_86                      $CHAR2.                             
      @1796   CPTM1_87                      $CHAR2.                             
      @1798   CPTM1_88                      $CHAR2.                             
      @1800   CPTM1_89                      $CHAR2.                             
      @1802   CPTM1_90                      $CHAR2.                             
      @1804   CPTM1_91                      $CHAR2.                             
      @1806   CPTM1_92                      $CHAR2.                             
      @1808   CPTM1_93                      $CHAR2.                             
      @1810   CPTM1_94                      $CHAR2.                             
      @1812   CPTM1_95                      $CHAR2.                             
      @1814   CPTM1_96                      $CHAR2.                             
      @1816   CPTM1_97                      $CHAR2.                             
      @1818   CPTM1_98                      $CHAR2.                             
      @1820   CPTM1_99                      $CHAR2.                             
      @1822   CPTM1_100                     $CHAR2.                             
      @1824   CPTM1_101                     $CHAR2.                             
      @1826   CPTM1_102                     $CHAR2.                             
      @1828   CPTM1_103                     $CHAR2.                             
      @1830   CPTM1_104                     $CHAR2.                             
      @1832   CPTM1_105                     $CHAR2.                             
      @1834   CPTM1_106                     $CHAR2.                             
      @1836   CPTM1_107                     $CHAR2.                             
      @1838   CPTM1_108                     $CHAR2.                             
      @1840   CPTM1_109                     $CHAR2.                             
      @1842   CPTM1_110                     $CHAR2.                             
      @1844   CPTM1_111                     $CHAR2.                             
      @1846   CPTM1_112                     $CHAR2.                             
      @1848   CPTM1_113                     $CHAR2.                             
      @1850   CPTM1_114                     $CHAR2.                             
      @1852   CPTM1_115                     $CHAR2.                             
      @1854   CPTM1_116                     $CHAR2.                             
      @1856   CPTM1_117                     $CHAR2.                             
      @1858   CPTM1_118                     $CHAR2.                             
      @1860   CPTM1_119                     $CHAR2.                             
      @1862   CPTM1_120                     $CHAR2.                             
      @1864   CPTM1_121                     $CHAR2.                             
      @1866   CPTM1_122                     $CHAR2.                             
      @1868   CPTM1_123                     $CHAR2.                             
      @1870   CPTM1_124                     $CHAR2.                             
      @1872   CPTM1_125                     $CHAR2.                             
      @1874   CPTM1_126                     $CHAR2.                             
      @1876   CPTM1_127                     $CHAR2.                             
      @1878   CPTM1_128                     $CHAR2.                             
      @1880   CPTM1_129                     $CHAR2.                             
      @1882   CPTM1_130                     $CHAR2.                             
      @1884   CPTM1_131                     $CHAR2.                             
      @1886   CPTM1_132                     $CHAR2.                             
      @1888   CPTM1_133                     $CHAR2.                             
      @1890   CPTM1_134                     $CHAR2.                             
      @1892   CPTM1_135                     $CHAR2.                             
      @1894   CPTM1_136                     $CHAR2.                             
      @1896   CPTM1_137                     $CHAR2.                             
      @1898   CPTM1_138                     $CHAR2.                             
      @1900   CPTM1_139                     $CHAR2.                             
      @1902   CPTM1_140                     $CHAR2.                             
      @1904   CPTM1_141                     $CHAR2.                             
      @1906   CPTM1_142                     $CHAR2.                             
      @1908   CPTM1_143                     $CHAR2.                             
      @1910   CPTM1_144                     $CHAR2.                             
      @1912   CPTM1_145                     $CHAR2.                             
      @1914   CPTM1_146                     $CHAR2.                             
      @1916   CPTM1_147                     $CHAR2.                             
      @1918   CPTM1_148                     $CHAR2.                             
      @1920   CPTM1_149                     $CHAR2.                             
      @1922   CPTM1_150                     $CHAR2.                             
      @1924   CPTM1_151                     $CHAR2.                             
      @1926   CPTM1_152                     $CHAR2.                             
      @1928   CPTM1_153                     $CHAR2.                             
      @1930   CPTM1_154                     $CHAR2.                             
      @1932   CPTM1_155                     $CHAR2.                             
      @1934   CPTM1_156                     $CHAR2.                             
      @1936   CPTM1_157                     $CHAR2.                             
      @1938   CPTM1_158                     $CHAR2.                             
      @1940   CPTM1_159                     $CHAR2.                             
      @1942   CPTM1_160                     $CHAR2.                             
      @1944   CPTM1_161                     $CHAR2.                             
      @1946   CPTM1_162                     $CHAR2.                             
      @1948   CPTM1_163                     $CHAR2.                             
      @1950   CPTM1_164                     $CHAR2.                             
      @1952   CPTM1_165                     $CHAR2.                             
      @1954   CPTM1_166                     $CHAR2.                             
      @1956   CPTM1_167                     $CHAR2.                             
      @1958   CPTM1_168                     $CHAR2.                             
      @1960   CPTM1_169                     $CHAR2.                             
      @1962   CPTM1_170                     $CHAR2.                             
      @1964   CPTM1_171                     $CHAR2.                             
      @1966   CPTM1_172                     $CHAR2.                             
      @1968   CPTM1_173                     $CHAR2.                             
      @1970   CPTM1_174                     $CHAR2.                             
      @1972   CPTM1_175                     $CHAR2.                             
      @1974   CPTM1_176                     $CHAR2.                             
      @1976   CPTM1_177                     $CHAR2.                             
      @1978   CPTM1_178                     $CHAR2.                             
      @1980   CPTM1_179                     $CHAR2.                             
      @1982   CPTM1_180                     $CHAR2.                             
      @1984   CPTM1_181                     $CHAR2.                             
      @1986   CPTM1_182                     $CHAR2.                             
      @1988   CPTM1_183                     $CHAR2.                             
      @1990   CPTM1_184                     $CHAR2.                             
      @1992   CPTM1_185                     $CHAR2.                             
      @1994   CPTM1_186                     $CHAR2.                             
      @1996   CPTM1_187                     $CHAR2.                             
      @1998   CPTM1_188                     $CHAR2.                             
      @2000   CPTM1_189                     $CHAR2.                             
      @2002   CPTM1_190                     $CHAR2.                             
      @2004   CPTM1_191                     $CHAR2.                             
      @2006   CPTM1_192                     $CHAR2.                             
      @2008   CPTM1_193                     $CHAR2.                             
      @2010   CPTM1_194                     $CHAR2.                             
      @2012   CPTM1_195                     $CHAR2.                             
      @2014   CPTM1_196                     $CHAR2.                             
      @2016   CPTM1_197                     $CHAR2.                             
      @2018   CPTM1_198                     $CHAR2.                             
      @2020   CPTM1_199                     $CHAR2.                             
      @2022   CPTM1_200                     $CHAR2.                             
      @2024   CPTM2_1                       $CHAR2.                             
      @2026   CPTM2_2                       $CHAR2.                             
      @2028   CPTM2_3                       $CHAR2.                             
      @2030   CPTM2_4                       $CHAR2.                             
      @2032   CPTM2_5                       $CHAR2.                             
      @2034   CPTM2_6                       $CHAR2.                             
      @2036   CPTM2_7                       $CHAR2.                             
      @2038   CPTM2_8                       $CHAR2.                             
      @2040   CPTM2_9                       $CHAR2.                             
      @2042   CPTM2_10                      $CHAR2.                             
      @2044   CPTM2_11                      $CHAR2.                             
      @2046   CPTM2_12                      $CHAR2.                             
      @2048   CPTM2_13                      $CHAR2.                             
      @2050   CPTM2_14                      $CHAR2.                             
      @2052   CPTM2_15                      $CHAR2.                             
      @2054   CPTM2_16                      $CHAR2.                             
      @2056   CPTM2_17                      $CHAR2.                             
      @2058   CPTM2_18                      $CHAR2.                             
      @2060   CPTM2_19                      $CHAR2.                             
      @2062   CPTM2_20                      $CHAR2.                             
      @2064   CPTM2_21                      $CHAR2.                             
      @2066   CPTM2_22                      $CHAR2.                             
      @2068   CPTM2_23                      $CHAR2.                             
      @2070   CPTM2_24                      $CHAR2.                             
      @2072   CPTM2_25                      $CHAR2.                             
      @2074   CPTM2_26                      $CHAR2.                             
      @2076   CPTM2_27                      $CHAR2.                             
      @2078   CPTM2_28                      $CHAR2.                             
      @2080   CPTM2_29                      $CHAR2.                             
      @2082   CPTM2_30                      $CHAR2.                             
      @2084   CPTM2_31                      $CHAR2.                             
      @2086   CPTM2_32                      $CHAR2.                             
      @2088   CPTM2_33                      $CHAR2.                             
      @2090   CPTM2_34                      $CHAR2.                             
      @2092   CPTM2_35                      $CHAR2.                             
      @2094   CPTM2_36                      $CHAR2.                             
      @2096   CPTM2_37                      $CHAR2.                             
      @2098   CPTM2_38                      $CHAR2.                             
      @2100   CPTM2_39                      $CHAR2.                             
      @2102   CPTM2_40                      $CHAR2.                             
      @2104   CPTM2_41                      $CHAR2.                             
      @2106   CPTM2_42                      $CHAR2.                             
      @2108   CPTM2_43                      $CHAR2.                             
      @2110   CPTM2_44                      $CHAR2.                             
      @2112   CPTM2_45                      $CHAR2.                             
      @2114   CPTM2_46                      $CHAR2.                             
      @2116   CPTM2_47                      $CHAR2.                             
      @2118   CPTM2_48                      $CHAR2.                             
      @2120   CPTM2_49                      $CHAR2.                             
      @2122   CPTM2_50                      $CHAR2.                             
      @2124   CPTM2_51                      $CHAR2.                             
      @2126   CPTM2_52                      $CHAR2.                             
      @2128   CPTM2_53                      $CHAR2.                             
      @2130   CPTM2_54                      $CHAR2.                             
      @2132   CPTM2_55                      $CHAR2.                             
      @2134   CPTM2_56                      $CHAR2.                             
      @2136   CPTM2_57                      $CHAR2.                             
      @2138   CPTM2_58                      $CHAR2.                             
      @2140   CPTM2_59                      $CHAR2.                             
      @2142   CPTM2_60                      $CHAR2.                             
      @2144   CPTM2_61                      $CHAR2.                             
      @2146   CPTM2_62                      $CHAR2.                             
      @2148   CPTM2_63                      $CHAR2.                             
      @2150   CPTM2_64                      $CHAR2.                             
      @2152   CPTM2_65                      $CHAR2.                             
      @2154   CPTM2_66                      $CHAR2.                             
      @2156   CPTM2_67                      $CHAR2.                             
      @2158   CPTM2_68                      $CHAR2.                             
      @2160   CPTM2_69                      $CHAR2.                             
      @2162   CPTM2_70                      $CHAR2.                             
      @2164   CPTM2_71                      $CHAR2.                             
      @2166   CPTM2_72                      $CHAR2.                             
      @2168   CPTM2_73                      $CHAR2.                             
      @2170   CPTM2_74                      $CHAR2.                             
      @2172   CPTM2_75                      $CHAR2.                             
      @2174   CPTM2_76                      $CHAR2.                             
      @2176   CPTM2_77                      $CHAR2.                             
      @2178   CPTM2_78                      $CHAR2.                             
      @2180   CPTM2_79                      $CHAR2.                             
      @2182   CPTM2_80                      $CHAR2.                             
      @2184   CPTM2_81                      $CHAR2.                             
      @2186   CPTM2_82                      $CHAR2.                             
      @2188   CPTM2_83                      $CHAR2.                             
      @2190   CPTM2_84                      $CHAR2.                             
      @2192   CPTM2_85                      $CHAR2.                             
      @2194   CPTM2_86                      $CHAR2.                             
      @2196   CPTM2_87                      $CHAR2.                             
      @2198   CPTM2_88                      $CHAR2.                             
      @2200   CPTM2_89                      $CHAR2.                             
      @2202   CPTM2_90                      $CHAR2.                             
      @2204   CPTM2_91                      $CHAR2.                             
      @2206   CPTM2_92                      $CHAR2.                             
      @2208   CPTM2_93                      $CHAR2.                             
      @2210   CPTM2_94                      $CHAR2.                             
      @2212   CPTM2_95                      $CHAR2.                             
      @2214   CPTM2_96                      $CHAR2.                             
      @2216   CPTM2_97                      $CHAR2.                             
      @2218   CPTM2_98                      $CHAR2.                             
      @2220   CPTM2_99                      $CHAR2.                             
      @2222   CPTM2_100                     $CHAR2.                             
      @2224   CPTM2_101                     $CHAR2.                             
      @2226   CPTM2_102                     $CHAR2.                             
      @2228   CPTM2_103                     $CHAR2.                             
      @2230   CPTM2_104                     $CHAR2.                             
      @2232   CPTM2_105                     $CHAR2.                             
      @2234   CPTM2_106                     $CHAR2.                             
      @2236   CPTM2_107                     $CHAR2.                             
      @2238   CPTM2_108                     $CHAR2.                             
      @2240   CPTM2_109                     $CHAR2.                             
      @2242   CPTM2_110                     $CHAR2.                             
      @2244   CPTM2_111                     $CHAR2.                             
      @2246   CPTM2_112                     $CHAR2.                             
      @2248   CPTM2_113                     $CHAR2.                             
      @2250   CPTM2_114                     $CHAR2.                             
      @2252   CPTM2_115                     $CHAR2.                             
      @2254   CPTM2_116                     $CHAR2.                             
      @2256   CPTM2_117                     $CHAR2.                             
      @2258   CPTM2_118                     $CHAR2.                             
      @2260   CPTM2_119                     $CHAR2.                             
      @2262   CPTM2_120                     $CHAR2.                             
      @2264   CPTM2_121                     $CHAR2.                             
      @2266   CPTM2_122                     $CHAR2.                             
      @2268   CPTM2_123                     $CHAR2.                             
      @2270   CPTM2_124                     $CHAR2.                             
      @2272   CPTM2_125                     $CHAR2.                             
      @2274   CPTM2_126                     $CHAR2.                             
      @2276   CPTM2_127                     $CHAR2.                             
      @2278   CPTM2_128                     $CHAR2.                             
      @2280   CPTM2_129                     $CHAR2.                             
      @2282   CPTM2_130                     $CHAR2.                             
      @2284   CPTM2_131                     $CHAR2.                             
      @2286   CPTM2_132                     $CHAR2.                             
      @2288   CPTM2_133                     $CHAR2.                             
      @2290   CPTM2_134                     $CHAR2.                             
      @2292   CPTM2_135                     $CHAR2.                             
      @2294   CPTM2_136                     $CHAR2.                             
      @2296   CPTM2_137                     $CHAR2.                             
      @2298   CPTM2_138                     $CHAR2.                             
      @2300   CPTM2_139                     $CHAR2.                             
      @2302   CPTM2_140                     $CHAR2.                             
      @2304   CPTM2_141                     $CHAR2.                             
      @2306   CPTM2_142                     $CHAR2.                             
      @2308   CPTM2_143                     $CHAR2.                             
      @2310   CPTM2_144                     $CHAR2.                             
      @2312   CPTM2_145                     $CHAR2.                             
      @2314   CPTM2_146                     $CHAR2.                             
      @2316   CPTM2_147                     $CHAR2.                             
      @2318   CPTM2_148                     $CHAR2.                             
      @2320   CPTM2_149                     $CHAR2.                             
      @2322   CPTM2_150                     $CHAR2.                             
      @2324   CPTM2_151                     $CHAR2.                             
      @2326   CPTM2_152                     $CHAR2.                             
      @2328   CPTM2_153                     $CHAR2.                             
      @2330   CPTM2_154                     $CHAR2.                             
      @2332   CPTM2_155                     $CHAR2.                             
      @2334   CPTM2_156                     $CHAR2.                             
      @2336   CPTM2_157                     $CHAR2.                             
      @2338   CPTM2_158                     $CHAR2.                             
      @2340   CPTM2_159                     $CHAR2.                             
      @2342   CPTM2_160                     $CHAR2.                             
      @2344   CPTM2_161                     $CHAR2.                             
      @2346   CPTM2_162                     $CHAR2.                             
      @2348   CPTM2_163                     $CHAR2.                             
      @2350   CPTM2_164                     $CHAR2.                             
      @2352   CPTM2_165                     $CHAR2.                             
      @2354   CPTM2_166                     $CHAR2.                             
      @2356   CPTM2_167                     $CHAR2.                             
      @2358   CPTM2_168                     $CHAR2.                             
      @2360   CPTM2_169                     $CHAR2.                             
      @2362   CPTM2_170                     $CHAR2.                             
      @2364   CPTM2_171                     $CHAR2.                             
      @2366   CPTM2_172                     $CHAR2.                             
      @2368   CPTM2_173                     $CHAR2.                             
      @2370   CPTM2_174                     $CHAR2.                             
      @2372   CPTM2_175                     $CHAR2.                             
      @2374   CPTM2_176                     $CHAR2.                             
      @2376   CPTM2_177                     $CHAR2.                             
      @2378   CPTM2_178                     $CHAR2.                             
      @2380   CPTM2_179                     $CHAR2.                             
      @2382   CPTM2_180                     $CHAR2.                             
      @2384   CPTM2_181                     $CHAR2.                             
      @2386   CPTM2_182                     $CHAR2.                             
      @2388   CPTM2_183                     $CHAR2.                             
      @2390   CPTM2_184                     $CHAR2.                             
      @2392   CPTM2_185                     $CHAR2.                             
      @2394   CPTM2_186                     $CHAR2.                             
      @2396   CPTM2_187                     $CHAR2.                             
      @2398   CPTM2_188                     $CHAR2.                             
      @2400   CPTM2_189                     $CHAR2.                             
      @2402   CPTM2_190                     $CHAR2.                             
      @2404   CPTM2_191                     $CHAR2.                             
      @2406   CPTM2_192                     $CHAR2.                             
      @2408   CPTM2_193                     $CHAR2.                             
      @2410   CPTM2_194                     $CHAR2.                             
      @2412   CPTM2_195                     $CHAR2.                             
      @2414   CPTM2_196                     $CHAR2.                             
      @2416   CPTM2_197                     $CHAR2.                             
      @2418   CPTM2_198                     $CHAR2.                             
      @2420   CPTM2_199                     $CHAR2.                             
      @2422   CPTM2_200                     $CHAR2.                             
      @2424   DHOUR                         N4PF.                               
      @2428   DIED                          N2PF.                               
      @2430   DISP_X                        $CHAR2.                             
      @2432   DISPUB04                      N2PF.                               
      @2434   DISPUNIFORM                   N2PF.                               
      @2436   DMONTH                        N2PF.                               
      @2438   DNR                           N2PF.                               
      @2440   DQTR                          N2PF.                               
      @2442   DSHOSPID                      $CHAR17.                            
      @2459   DURATION                      N6PF.                               
      @2465   DXPOA1                        $CHAR1.                             
      @2466   DXPOA2                        $CHAR1.                             
      @2467   DXPOA3                        $CHAR1.                             
      @2468   DXPOA4                        $CHAR1.                             
      @2469   DXPOA5                        $CHAR1.                             
      @2470   DXPOA6                        $CHAR1.                             
      @2471   DXPOA7                        $CHAR1.                             
      @2472   DXPOA8                        $CHAR1.                             
      @2473   DXPOA9                        $CHAR1.                             
      @2474   DXPOA10                       $CHAR1.                             
      @2475   DXPOA11                       $CHAR1.                             
      @2476   DXPOA12                       $CHAR1.                             
      @2477   DXPOA13                       $CHAR1.                             
      @2478   DXPOA14                       $CHAR1.                             
      @2479   DXPOA15                       $CHAR1.                             
      @2480   DXPOA16                       $CHAR1.                             
      @2481   DXPOA17                       $CHAR1.                             
      @2482   DXPOA18                       $CHAR1.                             
      @2483   DXPOA19                       $CHAR1.                             
      @2484   DXPOA20                       $CHAR1.                             
      @2485   DXPOA21                       $CHAR1.                             
      @2486   DXPOA22                       $CHAR1.                             
      @2487   DXPOA23                       $CHAR1.                             
      @2488   DXPOA24                       $CHAR1.                             
      @2489   DXPOA25                       $CHAR1.                             
      @2490   DXPOA26                       $CHAR1.                             
      @2491   DXPOA27                       $CHAR1.                             
      @2492   DXPOA28                       $CHAR1.                             
      @2493   DXPOA29                       $CHAR1.                             
      @2494   FEMALE                        N2PF.                               
      @2496   HCUP_ED                       N2PF.                               
      @2498   HCUP_OS                       N2PF.                               
      @2500   HCUP_SURGERY_BROAD_CPT        N5PF.                               
      @2505   HCUP_SURGERY_NARROW_CPT       N5PF.                               
      @2510   HISPANIC                      N2PF.                               
      @2512   HISPANIC_X                    $CHAR5.                             
      @2517   Homeless                      N2PF.                               
      @2519   HOSPST                        $CHAR2.                             
      @2521   I10_DX_Visit_Reason1          $CHAR7.                             
      @2528   I10_DX_Visit_Reason2          $CHAR7.                             
      @2535   I10_DX_Visit_Reason3          $CHAR7.                             
      @2542   I10_DX1                       $CHAR7.                             
      @2549   I10_DX2                       $CHAR7.                             
      @2556   I10_DX3                       $CHAR7.                             
      @2563   I10_DX4                       $CHAR7.                             
      @2570   I10_DX5                       $CHAR7.                             
      @2577   I10_DX6                       $CHAR7.                             
      @2584   I10_DX7                       $CHAR7.                             
      @2591   I10_DX8                       $CHAR7.                             
      @2598   I10_DX9                       $CHAR7.                             
      @2605   I10_DX10                      $CHAR7.                             
      @2612   I10_DX11                      $CHAR7.                             
      @2619   I10_DX12                      $CHAR7.                             
      @2626   I10_DX13                      $CHAR7.                             
      @2633   I10_DX14                      $CHAR7.                             
      @2640   I10_DX15                      $CHAR7.                             
      @2647   I10_DX16                      $CHAR7.                             
      @2654   I10_DX17                      $CHAR7.                             
      @2661   I10_DX18                      $CHAR7.                             
      @2668   I10_DX19                      $CHAR7.                             
      @2675   I10_DX20                      $CHAR7.                             
      @2682   I10_DX21                      $CHAR7.                             
      @2689   I10_DX22                      $CHAR7.                             
      @2696   I10_DX23                      $CHAR7.                             
      @2703   I10_DX24                      $CHAR7.                             
      @2710   I10_DX25                      $CHAR7.                             
      @2717   I10_DX26                      $CHAR7.                             
      @2724   I10_DX27                      $CHAR7.                             
      @2731   I10_DX28                      $CHAR7.                             
      @2738   I10_DX29                      $CHAR7.                             
      @2745   I10_NDX                       N3PF.                               
      @2748   I10_NPR                       N3PF.                               
      @2751   I10_PR1                       $CHAR7.                             
      @2758   I10_PR2                       $CHAR7.                             
      @2765   I10_PR3                       $CHAR7.                             
      @2772   I10_PR4                       $CHAR7.                             
      @2779   I10_PR5                       $CHAR7.                             
      @2786   I10_PR6                       $CHAR7.                             
      @2793   I10_PR7                       $CHAR7.                             
      @2800   I10_PR8                       $CHAR7.                             
      @2807   I10_PR9                       $CHAR7.                             
      @2814   I10_PR10                      $CHAR7.                             
      @2821   I10_PR11                      $CHAR7.                             
      @2828   I10_PR12                      $CHAR7.                             
      @2835   I10_PR13                      $CHAR7.                             
      @2842   I10_PR14                      $CHAR7.                             
      @2849   I10_PR15                      $CHAR7.                             
      @2856   I10_PR16                      $CHAR7.                             
      @2863   I10_PR17                      $CHAR7.                             
      @2870   I10_PR18                      $CHAR7.                             
      @2877   I10_PROCTYPE                  N3PF.                               
      @2880   KEY                           15.                                 
      @2895   LOS                           N5PF.                               
      @2900   LOS_X                         N6PF.                               
      @2906   MARITALSTATUS_X               $CHAR1.                             
      @2907   MARITALSTATUSUB04             $CHAR1.                             
      @2908   MDNUM1_R                      N9PF.                               
      @2917   MDNUM2_R                      N9PF.                               
      @2926   MEDINCSTQ                     N2PF.                               
      @2928   MOMNUM_R                      N9PF.                               
      @2937   MRN_R                         N9PF.                               
      @2946   NCPT                          N4PF.                               
      @2950   OPservice                     $CHAR1.                             
      @2951   OS_TIME                       N11P2F.                             
      @2962   PAY1                          N2PF.                               
      @2964   PAY1_X                        $CHAR10.                            
      @2974   PAY2                          N2PF.                               
      @2976   PAY2_X                        $CHAR10.                            
      @2986   PAY3                          N2PF.                               
      @2988   PAY3_X                        $CHAR10.                            
      @2998   PL_CBSA                       N3PF.                               
      @3001   PL_NCHS                       N2PF.                               
      @3003   PL_RUCC                       N2PF.                               
      @3005   PL_UIC                        N2PF.                               
      @3007   PL_UR_CAT4                    N2PF.                               
      @3009   POA_Disch_Edit1               N2PF.                               
      @3011   POA_Disch_Edit2               N2PF.                               
      @3013   POA_Hosp_Edit1                N2PF.                               
      @3015   POA_Hosp_Edit2                N2PF.                               
      @3017   POA_Hosp_Edit3                N2PF.                               
      @3019   POA_Hosp_Edit3_Value          N8P2F.                              
      @3027   PointOfOrigin_X               $CHAR1.                             
      @3028   PointOfOriginUB04             $CHAR1.                             
      @3029   PRDAY1                        N5PF.                               
      @3034   PRDAY2                        N5PF.                               
      @3039   PRDAY3                        N5PF.                               
      @3044   PRDAY4                        N5PF.                               
      @3049   PRDAY5                        N5PF.                               
      @3054   PRDAY6                        N5PF.                               
      @3059   PRDAY7                        N5PF.                               
      @3064   PRDAY8                        N5PF.                               
      @3069   PRDAY9                        N5PF.                               
      @3074   PRDAY10                       N5PF.                               
      @3079   PRDAY11                       N5PF.                               
      @3084   PRDAY12                       N5PF.                               
      @3089   PRDAY13                       N5PF.                               
      @3094   PRDAY14                       N5PF.                               
      @3099   PRDAY15                       N5PF.                               
      @3104   PRDAY16                       N5PF.                               
      @3109   PRDAY17                       N5PF.                               
      @3114   PRDAY18                       N5PF.                               
      @3119   PrimLang                      $CHAR3.                             
      @3122   PSTATE                        $CHAR2.                             
      @3124   PSTATE_GEO                    $CHAR2.                             
      @3126   PSTCO                         N5PF.                               
      @3131   PSTCO_GEO                     N5PF.                               
      @3136   RACE                          N2PF.                               
      @3138   RACE_X                        $CHAR5.                             
      @3143   READMIT                       N2PF.                               
      @3145   STATE_AS                      N2PF.                               
      @3147   STATE_ED                      N2PF.                               
      @3149   STATE_OS                      N2PF.                               
      @3151   TOTCHG                        N10PF.                              
      @3161   TOTCHG_X                      N15P2F.                             
      @3176   YEAR                          N4PF.                               
      @3180   ZIP                           $CHAR5.                             
      @3185   ZIP3                          $CHAR3.                             
      @3188   ZIPINC_QRTL                   N3PF.                               
      @3191   TOWN                          $CHAR4.                             
      @3195   AYEAR                         N4PF.                               
      @3199   BMONTH                        N2PF.                               
      @3201   BYEAR                         N4PF.                               
      @3205   PRMONTH1                      N2PF.                               
      @3207   PRMONTH2                      N2PF.                               
      @3209   PRMONTH3                      N2PF.                               
      @3211   PRMONTH4                      N2PF.                               
      @3213   PRMONTH5                      N2PF.                               
      @3215   PRMONTH6                      N2PF.                               
      @3217   PRMONTH7                      N2PF.                               
      @3219   PRMONTH8                      N2PF.                               
      @3221   PRMONTH9                      N2PF.                               
      @3223   PRMONTH10                     N2PF.                               
      @3225   PRMONTH11                     N2PF.                               
      @3227   PRMONTH12                     N2PF.                               
      @3229   PRMONTH13                     N2PF.                               
      @3231   PRMONTH14                     N2PF.                               
      @3233   PRMONTH15                     N2PF.                               
      @3235   PRMONTH16                     N2PF.                               
      @3237   PRMONTH17                     N2PF.                               
      @3239   PRMONTH18                     N2PF.                               
      @3241   PRYEAR1                       N4PF.                               
      @3245   PRYEAR2                       N4PF.                               
      @3249   PRYEAR3                       N4PF.                               
      @3253   PRYEAR4                       N4PF.                               
      @3257   PRYEAR5                       N4PF.                               
      @3261   PRYEAR6                       N4PF.                               
      @3265   PRYEAR7                       N4PF.                               
      @3269   PRYEAR8                       N4PF.                               
      @3273   PRYEAR9                       N4PF.                               
      @3277   PRYEAR10                      N4PF.                               
      @3281   PRYEAR11                      N4PF.                               
      @3285   PRYEAR12                      N4PF.                               
      @3289   PRYEAR13                      N4PF.                               
      @3293   PRYEAR14                      N4PF.                               
      @3297   PRYEAR15                      N4PF.                               
      @3301   PRYEAR16                      N4PF.                               
      @3305   PRYEAR17                      N4PF.                               
      @3309   PRYEAR18                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
