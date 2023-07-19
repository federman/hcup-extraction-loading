/*******************************************************************            
* Creation Date: 08/18/2022                                                     
*   GA_SEDD_2020_CORE.SAS:                                                      
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
DATA GA_SEDDC_2020_CORE;                                                        
INFILE 'GA_SEDD_2020_CORE.ASC' FIRSTOBS=3 LRECL = 3360;                         
                                                                                
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
                                                                                
  CPTDAY121                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT121"                               
                                                                                
  CPTDAY122                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT122"                               
                                                                                
  CPTDAY123                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT123"                               
                                                                                
  CPTDAY124                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT124"                               
                                                                                
  CPTDAY125                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT125"                               
                                                                                
  CPTDAY126                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT126"                               
                                                                                
  CPTDAY127                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT127"                               
                                                                                
  CPTDAY128                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT128"                               
                                                                                
  CPTDAY129                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT129"                               
                                                                                
  CPTDAY130                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT130"                               
                                                                                
  CPTDAY131                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT131"                               
                                                                                
  CPTDAY132                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT132"                               
                                                                                
  CPTDAY133                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT133"                               
                                                                                
  CPTDAY134                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT134"                               
                                                                                
  CPTDAY135                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT135"                               
                                                                                
  CPTDAY136                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT136"                               
                                                                                
  CPTDAY137                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT137"                               
                                                                                
  CPTDAY138                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT138"                               
                                                                                
  CPTDAY139                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT139"                               
                                                                                
  CPTDAY140                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT140"                               
                                                                                
  CPTDAY141                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT141"                               
                                                                                
  CPTDAY142                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT142"                               
                                                                                
  CPTDAY143                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT143"                               
                                                                                
  CPTDAY144                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT144"                               
                                                                                
  CPTDAY145                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT145"                               
                                                                                
  CPTDAY146                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT146"                               
                                                                                
  CPTDAY147                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT147"                               
                                                                                
  CPTDAY148                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT148"                               
                                                                                
  CPTDAY149                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT149"                               
                                                                                
  CPTDAY150                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT150"                               
                                                                                
  CPTDAY151                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT151"                               
                                                                                
  CPTDAY152                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT152"                               
                                                                                
  CPTDAY153                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT153"                               
                                                                                
  CPTDAY154                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT154"                               
                                                                                
  CPTDAY155                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT155"                               
                                                                                
  CPTDAY156                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT156"                               
                                                                                
  CPTDAY157                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT157"                               
                                                                                
  CPTDAY158                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT158"                               
                                                                                
  CPTDAY159                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT159"                               
                                                                                
  CPTDAY160                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT160"                               
                                                                                
  CPTDAY161                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT161"                               
                                                                                
  CPTDAY162                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT162"                               
                                                                                
  CPTDAY163                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT163"                               
                                                                                
  CPTDAY164                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT164"                               
                                                                                
  CPTDAY165                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT165"                               
                                                                                
  CPTDAY166                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT166"                               
                                                                                
  CPTDAY167                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT167"                               
                                                                                
  CPTDAY168                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT168"                               
                                                                                
  CPTDAY169                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT169"                               
                                                                                
  CPTDAY170                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT170"                               
                                                                                
  CPTDAY171                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT171"                               
                                                                                
  CPTDAY172                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT172"                               
                                                                                
  CPTDAY173                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT173"                               
                                                                                
  CPTDAY174                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT174"                               
                                                                                
  CPTDAY175                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT175"                               
                                                                                
  CPTDAY176                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT176"                               
                                                                                
  CPTDAY177                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT177"                               
                                                                                
  CPTDAY178                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT178"                               
                                                                                
  CPTDAY179                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT179"                               
                                                                                
  CPTDAY180                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT180"                               
                                                                                
  CPTDAY181                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT181"                               
                                                                                
  CPTDAY182                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT182"                               
                                                                                
  CPTDAY183                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT183"                               
                                                                                
  CPTDAY184                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT184"                               
                                                                                
  CPTDAY185                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT185"                               
                                                                                
  CPTDAY186                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT186"                               
                                                                                
  CPTDAY187                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT187"                               
                                                                                
  CPTDAY188                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT188"                               
                                                                                
  CPTDAY189                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT189"                               
                                                                                
  CPTDAY190                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT190"                               
                                                                                
  CPTDAY191                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT191"                               
                                                                                
  CPTDAY192                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT192"                               
                                                                                
  CPTDAY193                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT193"                               
                                                                                
  CPTDAY194                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT194"                               
                                                                                
  CPTDAY195                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT195"                               
                                                                                
  CPTDAY196                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT196"                               
                                                                                
  CPTDAY197                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT197"                               
                                                                                
  CPTDAY198                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT198"                               
                                                                                
  CPTDAY199                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT199"                               
                                                                                
  CPTDAY200                  LENGTH=4                                           
  LABEL="Number of days from admission to CPT200"                               
                                                                                
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
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures for this visit"                         
                                                                                
  OPservice                  LENGTH=$2                                          
  LABEL="Indicator of outpatient service (as received from source)"             
                                                                                
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
      @620    CPT121                        $CHAR5.                             
      @625    CPT122                        $CHAR5.                             
      @630    CPT123                        $CHAR5.                             
      @635    CPT124                        $CHAR5.                             
      @640    CPT125                        $CHAR5.                             
      @645    CPT126                        $CHAR5.                             
      @650    CPT127                        $CHAR5.                             
      @655    CPT128                        $CHAR5.                             
      @660    CPT129                        $CHAR5.                             
      @665    CPT130                        $CHAR5.                             
      @670    CPT131                        $CHAR5.                             
      @675    CPT132                        $CHAR5.                             
      @680    CPT133                        $CHAR5.                             
      @685    CPT134                        $CHAR5.                             
      @690    CPT135                        $CHAR5.                             
      @695    CPT136                        $CHAR5.                             
      @700    CPT137                        $CHAR5.                             
      @705    CPT138                        $CHAR5.                             
      @710    CPT139                        $CHAR5.                             
      @715    CPT140                        $CHAR5.                             
      @720    CPT141                        $CHAR5.                             
      @725    CPT142                        $CHAR5.                             
      @730    CPT143                        $CHAR5.                             
      @735    CPT144                        $CHAR5.                             
      @740    CPT145                        $CHAR5.                             
      @745    CPT146                        $CHAR5.                             
      @750    CPT147                        $CHAR5.                             
      @755    CPT148                        $CHAR5.                             
      @760    CPT149                        $CHAR5.                             
      @765    CPT150                        $CHAR5.                             
      @770    CPT151                        $CHAR5.                             
      @775    CPT152                        $CHAR5.                             
      @780    CPT153                        $CHAR5.                             
      @785    CPT154                        $CHAR5.                             
      @790    CPT155                        $CHAR5.                             
      @795    CPT156                        $CHAR5.                             
      @800    CPT157                        $CHAR5.                             
      @805    CPT158                        $CHAR5.                             
      @810    CPT159                        $CHAR5.                             
      @815    CPT160                        $CHAR5.                             
      @820    CPT161                        $CHAR5.                             
      @825    CPT162                        $CHAR5.                             
      @830    CPT163                        $CHAR5.                             
      @835    CPT164                        $CHAR5.                             
      @840    CPT165                        $CHAR5.                             
      @845    CPT166                        $CHAR5.                             
      @850    CPT167                        $CHAR5.                             
      @855    CPT168                        $CHAR5.                             
      @860    CPT169                        $CHAR5.                             
      @865    CPT170                        $CHAR5.                             
      @870    CPT171                        $CHAR5.                             
      @875    CPT172                        $CHAR5.                             
      @880    CPT173                        $CHAR5.                             
      @885    CPT174                        $CHAR5.                             
      @890    CPT175                        $CHAR5.                             
      @895    CPT176                        $CHAR5.                             
      @900    CPT177                        $CHAR5.                             
      @905    CPT178                        $CHAR5.                             
      @910    CPT179                        $CHAR5.                             
      @915    CPT180                        $CHAR5.                             
      @920    CPT181                        $CHAR5.                             
      @925    CPT182                        $CHAR5.                             
      @930    CPT183                        $CHAR5.                             
      @935    CPT184                        $CHAR5.                             
      @940    CPT185                        $CHAR5.                             
      @945    CPT186                        $CHAR5.                             
      @950    CPT187                        $CHAR5.                             
      @955    CPT188                        $CHAR5.                             
      @960    CPT189                        $CHAR5.                             
      @965    CPT190                        $CHAR5.                             
      @970    CPT191                        $CHAR5.                             
      @975    CPT192                        $CHAR5.                             
      @980    CPT193                        $CHAR5.                             
      @985    CPT194                        $CHAR5.                             
      @990    CPT195                        $CHAR5.                             
      @995    CPT196                        $CHAR5.                             
      @1000   CPT197                        $CHAR5.                             
      @1005   CPT198                        $CHAR5.                             
      @1010   CPT199                        $CHAR5.                             
      @1015   CPT200                        $CHAR5.                             
      @1020   CPTCCS1                       N3PF.                               
      @1023   CPTCCS2                       N3PF.                               
      @1026   CPTCCS3                       N3PF.                               
      @1029   CPTCCS4                       N3PF.                               
      @1032   CPTCCS5                       N3PF.                               
      @1035   CPTCCS6                       N3PF.                               
      @1038   CPTCCS7                       N3PF.                               
      @1041   CPTCCS8                       N3PF.                               
      @1044   CPTCCS9                       N3PF.                               
      @1047   CPTCCS10                      N3PF.                               
      @1050   CPTCCS11                      N3PF.                               
      @1053   CPTCCS12                      N3PF.                               
      @1056   CPTCCS13                      N3PF.                               
      @1059   CPTCCS14                      N3PF.                               
      @1062   CPTCCS15                      N3PF.                               
      @1065   CPTCCS16                      N3PF.                               
      @1068   CPTCCS17                      N3PF.                               
      @1071   CPTCCS18                      N3PF.                               
      @1074   CPTCCS19                      N3PF.                               
      @1077   CPTCCS20                      N3PF.                               
      @1080   CPTCCS21                      N3PF.                               
      @1083   CPTCCS22                      N3PF.                               
      @1086   CPTCCS23                      N3PF.                               
      @1089   CPTCCS24                      N3PF.                               
      @1092   CPTCCS25                      N3PF.                               
      @1095   CPTCCS26                      N3PF.                               
      @1098   CPTCCS27                      N3PF.                               
      @1101   CPTCCS28                      N3PF.                               
      @1104   CPTCCS29                      N3PF.                               
      @1107   CPTCCS30                      N3PF.                               
      @1110   CPTCCS31                      N3PF.                               
      @1113   CPTCCS32                      N3PF.                               
      @1116   CPTCCS33                      N3PF.                               
      @1119   CPTCCS34                      N3PF.                               
      @1122   CPTCCS35                      N3PF.                               
      @1125   CPTCCS36                      N3PF.                               
      @1128   CPTCCS37                      N3PF.                               
      @1131   CPTCCS38                      N3PF.                               
      @1134   CPTCCS39                      N3PF.                               
      @1137   CPTCCS40                      N3PF.                               
      @1140   CPTCCS41                      N3PF.                               
      @1143   CPTCCS42                      N3PF.                               
      @1146   CPTCCS43                      N3PF.                               
      @1149   CPTCCS44                      N3PF.                               
      @1152   CPTCCS45                      N3PF.                               
      @1155   CPTCCS46                      N3PF.                               
      @1158   CPTCCS47                      N3PF.                               
      @1161   CPTCCS48                      N3PF.                               
      @1164   CPTCCS49                      N3PF.                               
      @1167   CPTCCS50                      N3PF.                               
      @1170   CPTCCS51                      N3PF.                               
      @1173   CPTCCS52                      N3PF.                               
      @1176   CPTCCS53                      N3PF.                               
      @1179   CPTCCS54                      N3PF.                               
      @1182   CPTCCS55                      N3PF.                               
      @1185   CPTCCS56                      N3PF.                               
      @1188   CPTCCS57                      N3PF.                               
      @1191   CPTCCS58                      N3PF.                               
      @1194   CPTCCS59                      N3PF.                               
      @1197   CPTCCS60                      N3PF.                               
      @1200   CPTCCS61                      N3PF.                               
      @1203   CPTCCS62                      N3PF.                               
      @1206   CPTCCS63                      N3PF.                               
      @1209   CPTCCS64                      N3PF.                               
      @1212   CPTCCS65                      N3PF.                               
      @1215   CPTCCS66                      N3PF.                               
      @1218   CPTCCS67                      N3PF.                               
      @1221   CPTCCS68                      N3PF.                               
      @1224   CPTCCS69                      N3PF.                               
      @1227   CPTCCS70                      N3PF.                               
      @1230   CPTCCS71                      N3PF.                               
      @1233   CPTCCS72                      N3PF.                               
      @1236   CPTCCS73                      N3PF.                               
      @1239   CPTCCS74                      N3PF.                               
      @1242   CPTCCS75                      N3PF.                               
      @1245   CPTCCS76                      N3PF.                               
      @1248   CPTCCS77                      N3PF.                               
      @1251   CPTCCS78                      N3PF.                               
      @1254   CPTCCS79                      N3PF.                               
      @1257   CPTCCS80                      N3PF.                               
      @1260   CPTCCS81                      N3PF.                               
      @1263   CPTCCS82                      N3PF.                               
      @1266   CPTCCS83                      N3PF.                               
      @1269   CPTCCS84                      N3PF.                               
      @1272   CPTCCS85                      N3PF.                               
      @1275   CPTCCS86                      N3PF.                               
      @1278   CPTCCS87                      N3PF.                               
      @1281   CPTCCS88                      N3PF.                               
      @1284   CPTCCS89                      N3PF.                               
      @1287   CPTCCS90                      N3PF.                               
      @1290   CPTCCS91                      N3PF.                               
      @1293   CPTCCS92                      N3PF.                               
      @1296   CPTCCS93                      N3PF.                               
      @1299   CPTCCS94                      N3PF.                               
      @1302   CPTCCS95                      N3PF.                               
      @1305   CPTCCS96                      N3PF.                               
      @1308   CPTCCS97                      N3PF.                               
      @1311   CPTCCS98                      N3PF.                               
      @1314   CPTCCS99                      N3PF.                               
      @1317   CPTCCS100                     N3PF.                               
      @1320   CPTCCS101                     N3PF.                               
      @1323   CPTCCS102                     N3PF.                               
      @1326   CPTCCS103                     N3PF.                               
      @1329   CPTCCS104                     N3PF.                               
      @1332   CPTCCS105                     N3PF.                               
      @1335   CPTCCS106                     N3PF.                               
      @1338   CPTCCS107                     N3PF.                               
      @1341   CPTCCS108                     N3PF.                               
      @1344   CPTCCS109                     N3PF.                               
      @1347   CPTCCS110                     N3PF.                               
      @1350   CPTCCS111                     N3PF.                               
      @1353   CPTCCS112                     N3PF.                               
      @1356   CPTCCS113                     N3PF.                               
      @1359   CPTCCS114                     N3PF.                               
      @1362   CPTCCS115                     N3PF.                               
      @1365   CPTCCS116                     N3PF.                               
      @1368   CPTCCS117                     N3PF.                               
      @1371   CPTCCS118                     N3PF.                               
      @1374   CPTCCS119                     N3PF.                               
      @1377   CPTCCS120                     N3PF.                               
      @1380   CPTCCS121                     N3PF.                               
      @1383   CPTCCS122                     N3PF.                               
      @1386   CPTCCS123                     N3PF.                               
      @1389   CPTCCS124                     N3PF.                               
      @1392   CPTCCS125                     N3PF.                               
      @1395   CPTCCS126                     N3PF.                               
      @1398   CPTCCS127                     N3PF.                               
      @1401   CPTCCS128                     N3PF.                               
      @1404   CPTCCS129                     N3PF.                               
      @1407   CPTCCS130                     N3PF.                               
      @1410   CPTCCS131                     N3PF.                               
      @1413   CPTCCS132                     N3PF.                               
      @1416   CPTCCS133                     N3PF.                               
      @1419   CPTCCS134                     N3PF.                               
      @1422   CPTCCS135                     N3PF.                               
      @1425   CPTCCS136                     N3PF.                               
      @1428   CPTCCS137                     N3PF.                               
      @1431   CPTCCS138                     N3PF.                               
      @1434   CPTCCS139                     N3PF.                               
      @1437   CPTCCS140                     N3PF.                               
      @1440   CPTCCS141                     N3PF.                               
      @1443   CPTCCS142                     N3PF.                               
      @1446   CPTCCS143                     N3PF.                               
      @1449   CPTCCS144                     N3PF.                               
      @1452   CPTCCS145                     N3PF.                               
      @1455   CPTCCS146                     N3PF.                               
      @1458   CPTCCS147                     N3PF.                               
      @1461   CPTCCS148                     N3PF.                               
      @1464   CPTCCS149                     N3PF.                               
      @1467   CPTCCS150                     N3PF.                               
      @1470   CPTCCS151                     N3PF.                               
      @1473   CPTCCS152                     N3PF.                               
      @1476   CPTCCS153                     N3PF.                               
      @1479   CPTCCS154                     N3PF.                               
      @1482   CPTCCS155                     N3PF.                               
      @1485   CPTCCS156                     N3PF.                               
      @1488   CPTCCS157                     N3PF.                               
      @1491   CPTCCS158                     N3PF.                               
      @1494   CPTCCS159                     N3PF.                               
      @1497   CPTCCS160                     N3PF.                               
      @1500   CPTCCS161                     N3PF.                               
      @1503   CPTCCS162                     N3PF.                               
      @1506   CPTCCS163                     N3PF.                               
      @1509   CPTCCS164                     N3PF.                               
      @1512   CPTCCS165                     N3PF.                               
      @1515   CPTCCS166                     N3PF.                               
      @1518   CPTCCS167                     N3PF.                               
      @1521   CPTCCS168                     N3PF.                               
      @1524   CPTCCS169                     N3PF.                               
      @1527   CPTCCS170                     N3PF.                               
      @1530   CPTCCS171                     N3PF.                               
      @1533   CPTCCS172                     N3PF.                               
      @1536   CPTCCS173                     N3PF.                               
      @1539   CPTCCS174                     N3PF.                               
      @1542   CPTCCS175                     N3PF.                               
      @1545   CPTCCS176                     N3PF.                               
      @1548   CPTCCS177                     N3PF.                               
      @1551   CPTCCS178                     N3PF.                               
      @1554   CPTCCS179                     N3PF.                               
      @1557   CPTCCS180                     N3PF.                               
      @1560   CPTCCS181                     N3PF.                               
      @1563   CPTCCS182                     N3PF.                               
      @1566   CPTCCS183                     N3PF.                               
      @1569   CPTCCS184                     N3PF.                               
      @1572   CPTCCS185                     N3PF.                               
      @1575   CPTCCS186                     N3PF.                               
      @1578   CPTCCS187                     N3PF.                               
      @1581   CPTCCS188                     N3PF.                               
      @1584   CPTCCS189                     N3PF.                               
      @1587   CPTCCS190                     N3PF.                               
      @1590   CPTCCS191                     N3PF.                               
      @1593   CPTCCS192                     N3PF.                               
      @1596   CPTCCS193                     N3PF.                               
      @1599   CPTCCS194                     N3PF.                               
      @1602   CPTCCS195                     N3PF.                               
      @1605   CPTCCS196                     N3PF.                               
      @1608   CPTCCS197                     N3PF.                               
      @1611   CPTCCS198                     N3PF.                               
      @1614   CPTCCS199                     N3PF.                               
      @1617   CPTCCS200                     N3PF.                               
      @1620   CPTDAY1                       N3PF.                               
      @1623   CPTDAY2                       N3PF.                               
      @1626   CPTDAY3                       N3PF.                               
      @1629   CPTDAY4                       N3PF.                               
      @1632   CPTDAY5                       N3PF.                               
      @1635   CPTDAY6                       N3PF.                               
      @1638   CPTDAY7                       N3PF.                               
      @1641   CPTDAY8                       N3PF.                               
      @1644   CPTDAY9                       N3PF.                               
      @1647   CPTDAY10                      N3PF.                               
      @1650   CPTDAY11                      N3PF.                               
      @1653   CPTDAY12                      N3PF.                               
      @1656   CPTDAY13                      N3PF.                               
      @1659   CPTDAY14                      N3PF.                               
      @1662   CPTDAY15                      N3PF.                               
      @1665   CPTDAY16                      N3PF.                               
      @1668   CPTDAY17                      N3PF.                               
      @1671   CPTDAY18                      N3PF.                               
      @1674   CPTDAY19                      N3PF.                               
      @1677   CPTDAY20                      N3PF.                               
      @1680   CPTDAY21                      N3PF.                               
      @1683   CPTDAY22                      N3PF.                               
      @1686   CPTDAY23                      N3PF.                               
      @1689   CPTDAY24                      N3PF.                               
      @1692   CPTDAY25                      N3PF.                               
      @1695   CPTDAY26                      N3PF.                               
      @1698   CPTDAY27                      N3PF.                               
      @1701   CPTDAY28                      N3PF.                               
      @1704   CPTDAY29                      N3PF.                               
      @1707   CPTDAY30                      N3PF.                               
      @1710   CPTDAY31                      N3PF.                               
      @1713   CPTDAY32                      N3PF.                               
      @1716   CPTDAY33                      N3PF.                               
      @1719   CPTDAY34                      N3PF.                               
      @1722   CPTDAY35                      N3PF.                               
      @1725   CPTDAY36                      N3PF.                               
      @1728   CPTDAY37                      N3PF.                               
      @1731   CPTDAY38                      N3PF.                               
      @1734   CPTDAY39                      N3PF.                               
      @1737   CPTDAY40                      N3PF.                               
      @1740   CPTDAY41                      N3PF.                               
      @1743   CPTDAY42                      N3PF.                               
      @1746   CPTDAY43                      N3PF.                               
      @1749   CPTDAY44                      N3PF.                               
      @1752   CPTDAY45                      N3PF.                               
      @1755   CPTDAY46                      N3PF.                               
      @1758   CPTDAY47                      N3PF.                               
      @1761   CPTDAY48                      N3PF.                               
      @1764   CPTDAY49                      N3PF.                               
      @1767   CPTDAY50                      N3PF.                               
      @1770   CPTDAY51                      N3PF.                               
      @1773   CPTDAY52                      N3PF.                               
      @1776   CPTDAY53                      N3PF.                               
      @1779   CPTDAY54                      N3PF.                               
      @1782   CPTDAY55                      N3PF.                               
      @1785   CPTDAY56                      N3PF.                               
      @1788   CPTDAY57                      N3PF.                               
      @1791   CPTDAY58                      N3PF.                               
      @1794   CPTDAY59                      N3PF.                               
      @1797   CPTDAY60                      N3PF.                               
      @1800   CPTDAY61                      N3PF.                               
      @1803   CPTDAY62                      N3PF.                               
      @1806   CPTDAY63                      N3PF.                               
      @1809   CPTDAY64                      N3PF.                               
      @1812   CPTDAY65                      N3PF.                               
      @1815   CPTDAY66                      N3PF.                               
      @1818   CPTDAY67                      N3PF.                               
      @1821   CPTDAY68                      N3PF.                               
      @1824   CPTDAY69                      N3PF.                               
      @1827   CPTDAY70                      N3PF.                               
      @1830   CPTDAY71                      N3PF.                               
      @1833   CPTDAY72                      N3PF.                               
      @1836   CPTDAY73                      N3PF.                               
      @1839   CPTDAY74                      N3PF.                               
      @1842   CPTDAY75                      N3PF.                               
      @1845   CPTDAY76                      N3PF.                               
      @1848   CPTDAY77                      N3PF.                               
      @1851   CPTDAY78                      N3PF.                               
      @1854   CPTDAY79                      N3PF.                               
      @1857   CPTDAY80                      N3PF.                               
      @1860   CPTDAY81                      N3PF.                               
      @1863   CPTDAY82                      N3PF.                               
      @1866   CPTDAY83                      N3PF.                               
      @1869   CPTDAY84                      N3PF.                               
      @1872   CPTDAY85                      N3PF.                               
      @1875   CPTDAY86                      N3PF.                               
      @1878   CPTDAY87                      N3PF.                               
      @1881   CPTDAY88                      N3PF.                               
      @1884   CPTDAY89                      N3PF.                               
      @1887   CPTDAY90                      N3PF.                               
      @1890   CPTDAY91                      N3PF.                               
      @1893   CPTDAY92                      N3PF.                               
      @1896   CPTDAY93                      N3PF.                               
      @1899   CPTDAY94                      N3PF.                               
      @1902   CPTDAY95                      N3PF.                               
      @1905   CPTDAY96                      N3PF.                               
      @1908   CPTDAY97                      N3PF.                               
      @1911   CPTDAY98                      N3PF.                               
      @1914   CPTDAY99                      N3PF.                               
      @1917   CPTDAY100                     N3PF.                               
      @1920   CPTDAY101                     N3PF.                               
      @1923   CPTDAY102                     N3PF.                               
      @1926   CPTDAY103                     N3PF.                               
      @1929   CPTDAY104                     N3PF.                               
      @1932   CPTDAY105                     N3PF.                               
      @1935   CPTDAY106                     N3PF.                               
      @1938   CPTDAY107                     N3PF.                               
      @1941   CPTDAY108                     N3PF.                               
      @1944   CPTDAY109                     N3PF.                               
      @1947   CPTDAY110                     N3PF.                               
      @1950   CPTDAY111                     N3PF.                               
      @1953   CPTDAY112                     N3PF.                               
      @1956   CPTDAY113                     N3PF.                               
      @1959   CPTDAY114                     N3PF.                               
      @1962   CPTDAY115                     N3PF.                               
      @1965   CPTDAY116                     N3PF.                               
      @1968   CPTDAY117                     N3PF.                               
      @1971   CPTDAY118                     N3PF.                               
      @1974   CPTDAY119                     N3PF.                               
      @1977   CPTDAY120                     N3PF.                               
      @1980   CPTDAY121                     N3PF.                               
      @1983   CPTDAY122                     N3PF.                               
      @1986   CPTDAY123                     N3PF.                               
      @1989   CPTDAY124                     N3PF.                               
      @1992   CPTDAY125                     N3PF.                               
      @1995   CPTDAY126                     N3PF.                               
      @1998   CPTDAY127                     N3PF.                               
      @2001   CPTDAY128                     N3PF.                               
      @2004   CPTDAY129                     N3PF.                               
      @2007   CPTDAY130                     N3PF.                               
      @2010   CPTDAY131                     N3PF.                               
      @2013   CPTDAY132                     N3PF.                               
      @2016   CPTDAY133                     N3PF.                               
      @2019   CPTDAY134                     N3PF.                               
      @2022   CPTDAY135                     N3PF.                               
      @2025   CPTDAY136                     N3PF.                               
      @2028   CPTDAY137                     N3PF.                               
      @2031   CPTDAY138                     N3PF.                               
      @2034   CPTDAY139                     N3PF.                               
      @2037   CPTDAY140                     N3PF.                               
      @2040   CPTDAY141                     N3PF.                               
      @2043   CPTDAY142                     N3PF.                               
      @2046   CPTDAY143                     N3PF.                               
      @2049   CPTDAY144                     N3PF.                               
      @2052   CPTDAY145                     N3PF.                               
      @2055   CPTDAY146                     N3PF.                               
      @2058   CPTDAY147                     N3PF.                               
      @2061   CPTDAY148                     N3PF.                               
      @2064   CPTDAY149                     N3PF.                               
      @2067   CPTDAY150                     N3PF.                               
      @2070   CPTDAY151                     N3PF.                               
      @2073   CPTDAY152                     N3PF.                               
      @2076   CPTDAY153                     N3PF.                               
      @2079   CPTDAY154                     N3PF.                               
      @2082   CPTDAY155                     N3PF.                               
      @2085   CPTDAY156                     N3PF.                               
      @2088   CPTDAY157                     N3PF.                               
      @2091   CPTDAY158                     N3PF.                               
      @2094   CPTDAY159                     N3PF.                               
      @2097   CPTDAY160                     N3PF.                               
      @2100   CPTDAY161                     N3PF.                               
      @2103   CPTDAY162                     N3PF.                               
      @2106   CPTDAY163                     N3PF.                               
      @2109   CPTDAY164                     N3PF.                               
      @2112   CPTDAY165                     N3PF.                               
      @2115   CPTDAY166                     N3PF.                               
      @2118   CPTDAY167                     N3PF.                               
      @2121   CPTDAY168                     N3PF.                               
      @2124   CPTDAY169                     N3PF.                               
      @2127   CPTDAY170                     N3PF.                               
      @2130   CPTDAY171                     N3PF.                               
      @2133   CPTDAY172                     N3PF.                               
      @2136   CPTDAY173                     N3PF.                               
      @2139   CPTDAY174                     N3PF.                               
      @2142   CPTDAY175                     N3PF.                               
      @2145   CPTDAY176                     N3PF.                               
      @2148   CPTDAY177                     N3PF.                               
      @2151   CPTDAY178                     N3PF.                               
      @2154   CPTDAY179                     N3PF.                               
      @2157   CPTDAY180                     N3PF.                               
      @2160   CPTDAY181                     N3PF.                               
      @2163   CPTDAY182                     N3PF.                               
      @2166   CPTDAY183                     N3PF.                               
      @2169   CPTDAY184                     N3PF.                               
      @2172   CPTDAY185                     N3PF.                               
      @2175   CPTDAY186                     N3PF.                               
      @2178   CPTDAY187                     N3PF.                               
      @2181   CPTDAY188                     N3PF.                               
      @2184   CPTDAY189                     N3PF.                               
      @2187   CPTDAY190                     N3PF.                               
      @2190   CPTDAY191                     N3PF.                               
      @2193   CPTDAY192                     N3PF.                               
      @2196   CPTDAY193                     N3PF.                               
      @2199   CPTDAY194                     N3PF.                               
      @2202   CPTDAY195                     N3PF.                               
      @2205   CPTDAY196                     N3PF.                               
      @2208   CPTDAY197                     N3PF.                               
      @2211   CPTDAY198                     N3PF.                               
      @2214   CPTDAY199                     N3PF.                               
      @2217   CPTDAY200                     N3PF.                               
      @2220   DaysToEvent                   N6PF.                               
      @2226   DIED                          N2PF.                               
      @2228   DISP_X                        $CHAR2.                             
      @2230   DISPUB04                      N2PF.                               
      @2232   DISPUNIFORM                   N2PF.                               
      @2234   DMONTH                        N2PF.                               
      @2236   DQTR                          N2PF.                               
      @2238   DXPOA1                        $CHAR1.                             
      @2239   DXPOA2                        $CHAR1.                             
      @2240   DXPOA3                        $CHAR1.                             
      @2241   DXPOA4                        $CHAR1.                             
      @2242   DXPOA5                        $CHAR1.                             
      @2243   DXPOA6                        $CHAR1.                             
      @2244   DXPOA7                        $CHAR1.                             
      @2245   DXPOA8                        $CHAR1.                             
      @2246   DXPOA9                        $CHAR1.                             
      @2247   DXPOA10                       $CHAR1.                             
      @2248   DXPOA11                       $CHAR1.                             
      @2249   DXPOA12                       $CHAR1.                             
      @2250   DXPOA13                       $CHAR1.                             
      @2251   DXPOA14                       $CHAR1.                             
      @2252   DXPOA15                       $CHAR1.                             
      @2253   DXPOA16                       $CHAR1.                             
      @2254   DXPOA17                       $CHAR1.                             
      @2255   DXPOA18                       $CHAR1.                             
      @2256   DXPOA19                       $CHAR1.                             
      @2257   DXPOA20                       $CHAR1.                             
      @2258   DXPOA21                       $CHAR1.                             
      @2259   DXPOA22                       $CHAR1.                             
      @2260   DXPOA23                       $CHAR1.                             
      @2261   DXPOA24                       $CHAR1.                             
      @2262   DXPOA25                       $CHAR1.                             
      @2263   DXPOA26                       $CHAR1.                             
      @2264   DXPOA27                       $CHAR1.                             
      @2265   DXPOA28                       $CHAR1.                             
      @2266   DXPOA29                       $CHAR1.                             
      @2267   DXPOA30                       $CHAR1.                             
      @2268   DXPOA31                       $CHAR1.                             
      @2269   DXPOA32                       $CHAR1.                             
      @2270   DXPOA33                       $CHAR1.                             
      @2271   DXPOA34                       $CHAR1.                             
      @2272   DXPOA35                       $CHAR1.                             
      @2273   DXPOA36                       $CHAR1.                             
      @2274   DXPOA37                       $CHAR1.                             
      @2275   DXPOA38                       $CHAR1.                             
      @2276   DXPOA39                       $CHAR1.                             
      @2277   DXPOA40                       $CHAR1.                             
      @2278   DXPOA41                       $CHAR1.                             
      @2279   DXPOA42                       $CHAR1.                             
      @2280   DXPOA43                       $CHAR1.                             
      @2281   DXPOA44                       $CHAR1.                             
      @2282   DXPOA45                       $CHAR1.                             
      @2283   DXPOA46                       $CHAR1.                             
      @2284   DXPOA47                       $CHAR1.                             
      @2285   DXPOA48                       $CHAR1.                             
      @2286   DXPOA49                       $CHAR1.                             
      @2287   DXPOA50                       $CHAR1.                             
      @2288   DXPOA51                       $CHAR1.                             
      @2289   DXPOA52                       $CHAR1.                             
      @2290   DXPOA53                       $CHAR1.                             
      @2291   DXPOA54                       $CHAR1.                             
      @2292   DXPOA55                       $CHAR1.                             
      @2293   FEMALE                        N2PF.                               
      @2295   HCUP_ED                       N2PF.                               
      @2297   HCUP_OS                       N2PF.                               
      @2299   HCUP_SURGERY_BROAD_CPT        N5PF.                               
      @2304   HCUP_SURGERY_NARROW_CPT       N5PF.                               
      @2309   HISPANIC                      N2PF.                               
      @2311   HISPANIC_X                    $CHAR1.                             
      @2312   Homeless                      N2PF.                               
      @2314   HOSPST                        $CHAR2.                             
      @2316   I10_DX1                       $CHAR7.                             
      @2323   I10_DX2                       $CHAR7.                             
      @2330   I10_DX3                       $CHAR7.                             
      @2337   I10_DX4                       $CHAR7.                             
      @2344   I10_DX5                       $CHAR7.                             
      @2351   I10_DX6                       $CHAR7.                             
      @2358   I10_DX7                       $CHAR7.                             
      @2365   I10_DX8                       $CHAR7.                             
      @2372   I10_DX9                       $CHAR7.                             
      @2379   I10_DX10                      $CHAR7.                             
      @2386   I10_DX11                      $CHAR7.                             
      @2393   I10_DX12                      $CHAR7.                             
      @2400   I10_DX13                      $CHAR7.                             
      @2407   I10_DX14                      $CHAR7.                             
      @2414   I10_DX15                      $CHAR7.                             
      @2421   I10_DX16                      $CHAR7.                             
      @2428   I10_DX17                      $CHAR7.                             
      @2435   I10_DX18                      $CHAR7.                             
      @2442   I10_DX19                      $CHAR7.                             
      @2449   I10_DX20                      $CHAR7.                             
      @2456   I10_DX21                      $CHAR7.                             
      @2463   I10_DX22                      $CHAR7.                             
      @2470   I10_DX23                      $CHAR7.                             
      @2477   I10_DX24                      $CHAR7.                             
      @2484   I10_DX25                      $CHAR7.                             
      @2491   I10_DX26                      $CHAR7.                             
      @2498   I10_DX27                      $CHAR7.                             
      @2505   I10_DX28                      $CHAR7.                             
      @2512   I10_DX29                      $CHAR7.                             
      @2519   I10_DX30                      $CHAR7.                             
      @2526   I10_DX31                      $CHAR7.                             
      @2533   I10_DX32                      $CHAR7.                             
      @2540   I10_DX33                      $CHAR7.                             
      @2547   I10_DX34                      $CHAR7.                             
      @2554   I10_DX35                      $CHAR7.                             
      @2561   I10_DX36                      $CHAR7.                             
      @2568   I10_DX37                      $CHAR7.                             
      @2575   I10_DX38                      $CHAR7.                             
      @2582   I10_DX39                      $CHAR7.                             
      @2589   I10_DX40                      $CHAR7.                             
      @2596   I10_DX41                      $CHAR7.                             
      @2603   I10_DX42                      $CHAR7.                             
      @2610   I10_DX43                      $CHAR7.                             
      @2617   I10_DX44                      $CHAR7.                             
      @2624   I10_DX45                      $CHAR7.                             
      @2631   I10_DX46                      $CHAR7.                             
      @2638   I10_DX47                      $CHAR7.                             
      @2645   I10_DX48                      $CHAR7.                             
      @2652   I10_DX49                      $CHAR7.                             
      @2659   I10_DX50                      $CHAR7.                             
      @2666   I10_DX51                      $CHAR7.                             
      @2673   I10_DX52                      $CHAR7.                             
      @2680   I10_DX53                      $CHAR7.                             
      @2687   I10_DX54                      $CHAR7.                             
      @2694   I10_DX55                      $CHAR7.                             
      @2701   I10_NDX                       N3PF.                               
      @2704   I10_NPR                       N3PF.                               
      @2707   I10_PR1                       $CHAR7.                             
      @2714   I10_PR2                       $CHAR7.                             
      @2721   I10_PR3                       $CHAR7.                             
      @2728   I10_PR4                       $CHAR7.                             
      @2735   I10_PR5                       $CHAR7.                             
      @2742   I10_PR6                       $CHAR7.                             
      @2749   I10_PR7                       $CHAR7.                             
      @2756   I10_PR8                       $CHAR7.                             
      @2763   I10_PR9                       $CHAR7.                             
      @2770   I10_PR10                      $CHAR7.                             
      @2777   I10_PR11                      $CHAR7.                             
      @2784   I10_PR12                      $CHAR7.                             
      @2791   I10_PR13                      $CHAR7.                             
      @2798   I10_PR14                      $CHAR7.                             
      @2805   I10_PR15                      $CHAR7.                             
      @2812   I10_PR16                      $CHAR7.                             
      @2819   I10_PR17                      $CHAR7.                             
      @2826   I10_PR18                      $CHAR7.                             
      @2833   I10_PR19                      $CHAR7.                             
      @2840   I10_PR20                      $CHAR7.                             
      @2847   I10_PR21                      $CHAR7.                             
      @2854   I10_PR22                      $CHAR7.                             
      @2861   I10_PR23                      $CHAR7.                             
      @2868   I10_PR24                      $CHAR7.                             
      @2875   I10_PROCTYPE                  N3PF.                               
      @2878   KEY                           15.                                 
      @2893   LOS                           N5PF.                               
      @2898   LOS_X                         N6PF.                               
      @2904   MARITALSTATUS_X               $CHAR1.                             
      @2905   MARITALSTATUSUB04             $CHAR1.                             
      @2906   MDNUM1_R                      N9PF.                               
      @2915   MDNUM2_R                      N9PF.                               
      @2924   MDNUM3_R                      N9PF.                               
      @2933   MDNUM4_R                      N9PF.                               
      @2942   MEDINCSTQ                     N2PF.                               
      @2944   NCPT                          N4PF.                               
      @2948   OPservice                     $CHAR2.                             
      @2950   OS_TIME                       N11P2F.                             
      @2961   PAY1                          N2PF.                               
      @2963   PAY1_X                        $CHAR4.                             
      @2967   PAY2                          N2PF.                               
      @2969   PAY2_X                        $CHAR4.                             
      @2973   PAY3                          N2PF.                               
      @2975   PAY3_X                        $CHAR4.                             
      @2979   PL_CBSA                       N3PF.                               
      @2982   PL_NCHS                       N2PF.                               
      @2984   PL_RUCC                       N2PF.                               
      @2986   PL_UIC                        N2PF.                               
      @2988   PL_UR_CAT4                    N2PF.                               
      @2990   POA_Disch_Edit1               N2PF.                               
      @2992   POA_Disch_Edit2               N2PF.                               
      @2994   POA_Hosp_Edit1                N2PF.                               
      @2996   POA_Hosp_Edit2                N2PF.                               
      @2998   POA_Hosp_Edit3                N2PF.                               
      @3000   POA_Hosp_Edit3_Value          N8P2F.                              
      @3008   PointOfOrigin_X               $CHAR1.                             
      @3009   PointOfOriginUB04             $CHAR1.                             
      @3010   PRDAY1                        N5PF.                               
      @3015   PRDAY2                        N5PF.                               
      @3020   PRDAY3                        N5PF.                               
      @3025   PRDAY4                        N5PF.                               
      @3030   PRDAY5                        N5PF.                               
      @3035   PRDAY6                        N5PF.                               
      @3040   PRDAY7                        N5PF.                               
      @3045   PRDAY8                        N5PF.                               
      @3050   PRDAY9                        N5PF.                               
      @3055   PRDAY10                       N5PF.                               
      @3060   PRDAY11                       N5PF.                               
      @3065   PRDAY12                       N5PF.                               
      @3070   PRDAY13                       N5PF.                               
      @3075   PRDAY14                       N5PF.                               
      @3080   PRDAY15                       N5PF.                               
      @3085   PRDAY16                       N5PF.                               
      @3090   PRDAY17                       N5PF.                               
      @3095   PRDAY18                       N5PF.                               
      @3100   PRDAY19                       N5PF.                               
      @3105   PRDAY20                       N5PF.                               
      @3110   PRDAY21                       N5PF.                               
      @3115   PRDAY22                       N5PF.                               
      @3120   PRDAY23                       N5PF.                               
      @3125   PRDAY24                       N5PF.                               
      @3130   PSTATE                        $CHAR2.                             
      @3132   PSTATE_GEO                    $CHAR2.                             
      @3134   PSTCO                         N5PF.                               
      @3139   PSTCO_GEO                     N5PF.                               
      @3144   RACE                          N2PF.                               
      @3146   RACE_X                        $CHAR1.                             
      @3147   STATE_AS                      N2PF.                               
      @3149   STATE_ED                      N2PF.                               
      @3151   STATE_OS                      N2PF.                               
      @3153   TOTCHG                        N10PF.                              
      @3163   TOTCHG_X                      N15P2F.                             
      @3178   VisitLink                     N9PF.                               
      @3187   YEAR                          N4PF.                               
      @3191   ZIP                           $CHAR5.                             
      @3196   ZIP3                          $CHAR3.                             
      @3199   ZIPINC_QRTL                   N3PF.                               
      @3202   HOSPID                        N5PF.                               
      @3207   AYEAR                         N4PF.                               
      @3211   BMONTH                        N2PF.                               
      @3213   BYEAR                         N4PF.                               
      @3217   PRMONTH1                      N2PF.                               
      @3219   PRMONTH2                      N2PF.                               
      @3221   PRMONTH3                      N2PF.                               
      @3223   PRMONTH4                      N2PF.                               
      @3225   PRMONTH5                      N2PF.                               
      @3227   PRMONTH6                      N2PF.                               
      @3229   PRMONTH7                      N2PF.                               
      @3231   PRMONTH8                      N2PF.                               
      @3233   PRMONTH9                      N2PF.                               
      @3235   PRMONTH10                     N2PF.                               
      @3237   PRMONTH11                     N2PF.                               
      @3239   PRMONTH12                     N2PF.                               
      @3241   PRMONTH13                     N2PF.                               
      @3243   PRMONTH14                     N2PF.                               
      @3245   PRMONTH15                     N2PF.                               
      @3247   PRMONTH16                     N2PF.                               
      @3249   PRMONTH17                     N2PF.                               
      @3251   PRMONTH18                     N2PF.                               
      @3253   PRMONTH19                     N2PF.                               
      @3255   PRMONTH20                     N2PF.                               
      @3257   PRMONTH21                     N2PF.                               
      @3259   PRMONTH22                     N2PF.                               
      @3261   PRMONTH23                     N2PF.                               
      @3263   PRMONTH24                     N2PF.                               
      @3265   PRYEAR1                       N4PF.                               
      @3269   PRYEAR2                       N4PF.                               
      @3273   PRYEAR3                       N4PF.                               
      @3277   PRYEAR4                       N4PF.                               
      @3281   PRYEAR5                       N4PF.                               
      @3285   PRYEAR6                       N4PF.                               
      @3289   PRYEAR7                       N4PF.                               
      @3293   PRYEAR8                       N4PF.                               
      @3297   PRYEAR9                       N4PF.                               
      @3301   PRYEAR10                      N4PF.                               
      @3305   PRYEAR11                      N4PF.                               
      @3309   PRYEAR12                      N4PF.                               
      @3313   PRYEAR13                      N4PF.                               
      @3317   PRYEAR14                      N4PF.                               
      @3321   PRYEAR15                      N4PF.                               
      @3325   PRYEAR16                      N4PF.                               
      @3329   PRYEAR17                      N4PF.                               
      @3333   PRYEAR18                      N4PF.                               
      @3337   PRYEAR19                      N4PF.                               
      @3341   PRYEAR20                      N4PF.                               
      @3345   PRYEAR21                      N4PF.                               
      @3349   PRYEAR22                      N4PF.                               
      @3353   PRYEAR23                      N4PF.                               
      @3357   PRYEAR24                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
