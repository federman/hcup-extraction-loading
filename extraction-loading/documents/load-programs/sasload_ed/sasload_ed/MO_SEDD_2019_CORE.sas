/*******************************************************************            
* Creation Date: 09/20/2021                                                     
*   MO_SEDD_2019_CORE.SAS:                                                      
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
DATA MO_SEDDC_2019_CORE;                                                        
INFILE 'MO_SEDD_2019_CORE.ASC' FIRSTOBS=3 LRECL = 3086;                         
                                                                                
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
                                                                                
  DURATION                   LENGTH=4                                           
  LABEL="Elapsed time for hospital care in hours and minutes"                   
                                                                                
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
                                                                                
  I10_NDX                    LENGTH=3                                           
  LABEL="ICD-10-CM Number of diagnoses on this record"                          
                                                                                
  I10_NPR                    LENGTH=3                                           
  LABEL="ICD-10-PCS Number of procedures on this record"                        
                                                                                
  I10_ORPROC                 LENGTH=3                                           
  LABEL="ICD-10-PCS Major operating room procedure indicator"                   
                                                                                
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
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures for this visit"                         
                                                                                
  OBSERVATION                LENGTH=4                                           
  LABEL="Time for observation services (as received from source)"               
                                                                                
  OPservice                  LENGTH=$1                                          
  LABEL="Indicator of outpatient service (as received from source)"             
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$2                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$2                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$2                                          
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
      @1      AGE                           N3PF.                               
      @4      AGEDAY                        N3PF.                               
      @7      AGEMONTH                      N3PF.                               
      @10     AHOUR                         N4PF.                               
      @14     AMONTH                        N2PF.                               
      @16     AWEEKEND                      N2PF.                               
      @18     BILLTYPE                      $CHAR4.                             
      @22     CPT1                          $CHAR5.                             
      @27     CPT2                          $CHAR5.                             
      @32     CPT3                          $CHAR5.                             
      @37     CPT4                          $CHAR5.                             
      @42     CPT5                          $CHAR5.                             
      @47     CPT6                          $CHAR5.                             
      @52     CPT7                          $CHAR5.                             
      @57     CPT8                          $CHAR5.                             
      @62     CPT9                          $CHAR5.                             
      @67     CPT10                         $CHAR5.                             
      @72     CPT11                         $CHAR5.                             
      @77     CPT12                         $CHAR5.                             
      @82     CPT13                         $CHAR5.                             
      @87     CPT14                         $CHAR5.                             
      @92     CPT15                         $CHAR5.                             
      @97     CPT16                         $CHAR5.                             
      @102    CPT17                         $CHAR5.                             
      @107    CPT18                         $CHAR5.                             
      @112    CPT19                         $CHAR5.                             
      @117    CPT20                         $CHAR5.                             
      @122    CPT21                         $CHAR5.                             
      @127    CPT22                         $CHAR5.                             
      @132    CPT23                         $CHAR5.                             
      @137    CPT24                         $CHAR5.                             
      @142    CPT25                         $CHAR5.                             
      @147    CPT26                         $CHAR5.                             
      @152    CPT27                         $CHAR5.                             
      @157    CPT28                         $CHAR5.                             
      @162    CPT29                         $CHAR5.                             
      @167    CPT30                         $CHAR5.                             
      @172    CPT31                         $CHAR5.                             
      @177    CPT32                         $CHAR5.                             
      @182    CPT33                         $CHAR5.                             
      @187    CPT34                         $CHAR5.                             
      @192    CPT35                         $CHAR5.                             
      @197    CPT36                         $CHAR5.                             
      @202    CPT37                         $CHAR5.                             
      @207    CPT38                         $CHAR5.                             
      @212    CPT39                         $CHAR5.                             
      @217    CPT40                         $CHAR5.                             
      @222    CPT41                         $CHAR5.                             
      @227    CPT42                         $CHAR5.                             
      @232    CPT43                         $CHAR5.                             
      @237    CPT44                         $CHAR5.                             
      @242    CPT45                         $CHAR5.                             
      @247    CPT46                         $CHAR5.                             
      @252    CPT47                         $CHAR5.                             
      @257    CPT48                         $CHAR5.                             
      @262    CPT49                         $CHAR5.                             
      @267    CPT50                         $CHAR5.                             
      @272    CPT51                         $CHAR5.                             
      @277    CPT52                         $CHAR5.                             
      @282    CPT53                         $CHAR5.                             
      @287    CPT54                         $CHAR5.                             
      @292    CPT55                         $CHAR5.                             
      @297    CPT56                         $CHAR5.                             
      @302    CPT57                         $CHAR5.                             
      @307    CPT58                         $CHAR5.                             
      @312    CPT59                         $CHAR5.                             
      @317    CPT60                         $CHAR5.                             
      @322    CPT61                         $CHAR5.                             
      @327    CPT62                         $CHAR5.                             
      @332    CPT63                         $CHAR5.                             
      @337    CPT64                         $CHAR5.                             
      @342    CPT65                         $CHAR5.                             
      @347    CPT66                         $CHAR5.                             
      @352    CPT67                         $CHAR5.                             
      @357    CPT68                         $CHAR5.                             
      @362    CPT69                         $CHAR5.                             
      @367    CPT70                         $CHAR5.                             
      @372    CPT71                         $CHAR5.                             
      @377    CPT72                         $CHAR5.                             
      @382    CPT73                         $CHAR5.                             
      @387    CPT74                         $CHAR5.                             
      @392    CPT75                         $CHAR5.                             
      @397    CPT76                         $CHAR5.                             
      @402    CPT77                         $CHAR5.                             
      @407    CPT78                         $CHAR5.                             
      @412    CPT79                         $CHAR5.                             
      @417    CPT80                         $CHAR5.                             
      @422    CPT81                         $CHAR5.                             
      @427    CPT82                         $CHAR5.                             
      @432    CPT83                         $CHAR5.                             
      @437    CPT84                         $CHAR5.                             
      @442    CPT85                         $CHAR5.                             
      @447    CPT86                         $CHAR5.                             
      @452    CPT87                         $CHAR5.                             
      @457    CPT88                         $CHAR5.                             
      @462    CPT89                         $CHAR5.                             
      @467    CPT90                         $CHAR5.                             
      @472    CPT91                         $CHAR5.                             
      @477    CPT92                         $CHAR5.                             
      @482    CPT93                         $CHAR5.                             
      @487    CPT94                         $CHAR5.                             
      @492    CPT95                         $CHAR5.                             
      @497    CPT96                         $CHAR5.                             
      @502    CPT97                         $CHAR5.                             
      @507    CPT98                         $CHAR5.                             
      @512    CPT99                         $CHAR5.                             
      @517    CPT100                        $CHAR5.                             
      @522    CPT101                        $CHAR5.                             
      @527    CPT102                        $CHAR5.                             
      @532    CPT103                        $CHAR5.                             
      @537    CPT104                        $CHAR5.                             
      @542    CPT105                        $CHAR5.                             
      @547    CPT106                        $CHAR5.                             
      @552    CPT107                        $CHAR5.                             
      @557    CPT108                        $CHAR5.                             
      @562    CPT109                        $CHAR5.                             
      @567    CPT110                        $CHAR5.                             
      @572    CPT111                        $CHAR5.                             
      @577    CPT112                        $CHAR5.                             
      @582    CPT113                        $CHAR5.                             
      @587    CPT114                        $CHAR5.                             
      @592    CPT115                        $CHAR5.                             
      @597    CPT116                        $CHAR5.                             
      @602    CPT117                        $CHAR5.                             
      @607    CPT118                        $CHAR5.                             
      @612    CPT119                        $CHAR5.                             
      @617    CPT120                        $CHAR5.                             
      @622    CPT121                        $CHAR5.                             
      @627    CPT122                        $CHAR5.                             
      @632    CPT123                        $CHAR5.                             
      @637    CPT124                        $CHAR5.                             
      @642    CPT125                        $CHAR5.                             
      @647    CPT126                        $CHAR5.                             
      @652    CPT127                        $CHAR5.                             
      @657    CPT128                        $CHAR5.                             
      @662    CPT129                        $CHAR5.                             
      @667    CPT130                        $CHAR5.                             
      @672    CPT131                        $CHAR5.                             
      @677    CPT132                        $CHAR5.                             
      @682    CPT133                        $CHAR5.                             
      @687    CPT134                        $CHAR5.                             
      @692    CPT135                        $CHAR5.                             
      @697    CPT136                        $CHAR5.                             
      @702    CPT137                        $CHAR5.                             
      @707    CPT138                        $CHAR5.                             
      @712    CPT139                        $CHAR5.                             
      @717    CPT140                        $CHAR5.                             
      @722    CPT141                        $CHAR5.                             
      @727    CPT142                        $CHAR5.                             
      @732    CPT143                        $CHAR5.                             
      @737    CPT144                        $CHAR5.                             
      @742    CPT145                        $CHAR5.                             
      @747    CPT146                        $CHAR5.                             
      @752    CPT147                        $CHAR5.                             
      @757    CPT148                        $CHAR5.                             
      @762    CPT149                        $CHAR5.                             
      @767    CPT150                        $CHAR5.                             
      @772    CPT151                        $CHAR5.                             
      @777    CPT152                        $CHAR5.                             
      @782    CPT153                        $CHAR5.                             
      @787    CPT154                        $CHAR5.                             
      @792    CPT155                        $CHAR5.                             
      @797    CPT156                        $CHAR5.                             
      @802    CPT157                        $CHAR5.                             
      @807    CPT158                        $CHAR5.                             
      @812    CPT159                        $CHAR5.                             
      @817    CPT160                        $CHAR5.                             
      @822    CPT161                        $CHAR5.                             
      @827    CPT162                        $CHAR5.                             
      @832    CPT163                        $CHAR5.                             
      @837    CPT164                        $CHAR5.                             
      @842    CPT165                        $CHAR5.                             
      @847    CPT166                        $CHAR5.                             
      @852    CPT167                        $CHAR5.                             
      @857    CPT168                        $CHAR5.                             
      @862    CPT169                        $CHAR5.                             
      @867    CPT170                        $CHAR5.                             
      @872    CPT171                        $CHAR5.                             
      @877    CPT172                        $CHAR5.                             
      @882    CPT173                        $CHAR5.                             
      @887    CPT174                        $CHAR5.                             
      @892    CPT175                        $CHAR5.                             
      @897    CPT176                        $CHAR5.                             
      @902    CPT177                        $CHAR5.                             
      @907    CPT178                        $CHAR5.                             
      @912    CPT179                        $CHAR5.                             
      @917    CPT180                        $CHAR5.                             
      @922    CPT181                        $CHAR5.                             
      @927    CPT182                        $CHAR5.                             
      @932    CPT183                        $CHAR5.                             
      @937    CPT184                        $CHAR5.                             
      @942    CPT185                        $CHAR5.                             
      @947    CPT186                        $CHAR5.                             
      @952    CPT187                        $CHAR5.                             
      @957    CPT188                        $CHAR5.                             
      @962    CPT189                        $CHAR5.                             
      @967    CPT190                        $CHAR5.                             
      @972    CPT191                        $CHAR5.                             
      @977    CPT192                        $CHAR5.                             
      @982    CPT193                        $CHAR5.                             
      @987    CPT194                        $CHAR5.                             
      @992    CPT195                        $CHAR5.                             
      @997    CPT196                        $CHAR5.                             
      @1002   CPT197                        $CHAR5.                             
      @1007   CPT198                        $CHAR5.                             
      @1012   CPT199                        $CHAR5.                             
      @1017   CPT200                        $CHAR5.                             
      @1022   CPTCCS1                       N3PF.                               
      @1025   CPTCCS2                       N3PF.                               
      @1028   CPTCCS3                       N3PF.                               
      @1031   CPTCCS4                       N3PF.                               
      @1034   CPTCCS5                       N3PF.                               
      @1037   CPTCCS6                       N3PF.                               
      @1040   CPTCCS7                       N3PF.                               
      @1043   CPTCCS8                       N3PF.                               
      @1046   CPTCCS9                       N3PF.                               
      @1049   CPTCCS10                      N3PF.                               
      @1052   CPTCCS11                      N3PF.                               
      @1055   CPTCCS12                      N3PF.                               
      @1058   CPTCCS13                      N3PF.                               
      @1061   CPTCCS14                      N3PF.                               
      @1064   CPTCCS15                      N3PF.                               
      @1067   CPTCCS16                      N3PF.                               
      @1070   CPTCCS17                      N3PF.                               
      @1073   CPTCCS18                      N3PF.                               
      @1076   CPTCCS19                      N3PF.                               
      @1079   CPTCCS20                      N3PF.                               
      @1082   CPTCCS21                      N3PF.                               
      @1085   CPTCCS22                      N3PF.                               
      @1088   CPTCCS23                      N3PF.                               
      @1091   CPTCCS24                      N3PF.                               
      @1094   CPTCCS25                      N3PF.                               
      @1097   CPTCCS26                      N3PF.                               
      @1100   CPTCCS27                      N3PF.                               
      @1103   CPTCCS28                      N3PF.                               
      @1106   CPTCCS29                      N3PF.                               
      @1109   CPTCCS30                      N3PF.                               
      @1112   CPTCCS31                      N3PF.                               
      @1115   CPTCCS32                      N3PF.                               
      @1118   CPTCCS33                      N3PF.                               
      @1121   CPTCCS34                      N3PF.                               
      @1124   CPTCCS35                      N3PF.                               
      @1127   CPTCCS36                      N3PF.                               
      @1130   CPTCCS37                      N3PF.                               
      @1133   CPTCCS38                      N3PF.                               
      @1136   CPTCCS39                      N3PF.                               
      @1139   CPTCCS40                      N3PF.                               
      @1142   CPTCCS41                      N3PF.                               
      @1145   CPTCCS42                      N3PF.                               
      @1148   CPTCCS43                      N3PF.                               
      @1151   CPTCCS44                      N3PF.                               
      @1154   CPTCCS45                      N3PF.                               
      @1157   CPTCCS46                      N3PF.                               
      @1160   CPTCCS47                      N3PF.                               
      @1163   CPTCCS48                      N3PF.                               
      @1166   CPTCCS49                      N3PF.                               
      @1169   CPTCCS50                      N3PF.                               
      @1172   CPTCCS51                      N3PF.                               
      @1175   CPTCCS52                      N3PF.                               
      @1178   CPTCCS53                      N3PF.                               
      @1181   CPTCCS54                      N3PF.                               
      @1184   CPTCCS55                      N3PF.                               
      @1187   CPTCCS56                      N3PF.                               
      @1190   CPTCCS57                      N3PF.                               
      @1193   CPTCCS58                      N3PF.                               
      @1196   CPTCCS59                      N3PF.                               
      @1199   CPTCCS60                      N3PF.                               
      @1202   CPTCCS61                      N3PF.                               
      @1205   CPTCCS62                      N3PF.                               
      @1208   CPTCCS63                      N3PF.                               
      @1211   CPTCCS64                      N3PF.                               
      @1214   CPTCCS65                      N3PF.                               
      @1217   CPTCCS66                      N3PF.                               
      @1220   CPTCCS67                      N3PF.                               
      @1223   CPTCCS68                      N3PF.                               
      @1226   CPTCCS69                      N3PF.                               
      @1229   CPTCCS70                      N3PF.                               
      @1232   CPTCCS71                      N3PF.                               
      @1235   CPTCCS72                      N3PF.                               
      @1238   CPTCCS73                      N3PF.                               
      @1241   CPTCCS74                      N3PF.                               
      @1244   CPTCCS75                      N3PF.                               
      @1247   CPTCCS76                      N3PF.                               
      @1250   CPTCCS77                      N3PF.                               
      @1253   CPTCCS78                      N3PF.                               
      @1256   CPTCCS79                      N3PF.                               
      @1259   CPTCCS80                      N3PF.                               
      @1262   CPTCCS81                      N3PF.                               
      @1265   CPTCCS82                      N3PF.                               
      @1268   CPTCCS83                      N3PF.                               
      @1271   CPTCCS84                      N3PF.                               
      @1274   CPTCCS85                      N3PF.                               
      @1277   CPTCCS86                      N3PF.                               
      @1280   CPTCCS87                      N3PF.                               
      @1283   CPTCCS88                      N3PF.                               
      @1286   CPTCCS89                      N3PF.                               
      @1289   CPTCCS90                      N3PF.                               
      @1292   CPTCCS91                      N3PF.                               
      @1295   CPTCCS92                      N3PF.                               
      @1298   CPTCCS93                      N3PF.                               
      @1301   CPTCCS94                      N3PF.                               
      @1304   CPTCCS95                      N3PF.                               
      @1307   CPTCCS96                      N3PF.                               
      @1310   CPTCCS97                      N3PF.                               
      @1313   CPTCCS98                      N3PF.                               
      @1316   CPTCCS99                      N3PF.                               
      @1319   CPTCCS100                     N3PF.                               
      @1322   CPTCCS101                     N3PF.                               
      @1325   CPTCCS102                     N3PF.                               
      @1328   CPTCCS103                     N3PF.                               
      @1331   CPTCCS104                     N3PF.                               
      @1334   CPTCCS105                     N3PF.                               
      @1337   CPTCCS106                     N3PF.                               
      @1340   CPTCCS107                     N3PF.                               
      @1343   CPTCCS108                     N3PF.                               
      @1346   CPTCCS109                     N3PF.                               
      @1349   CPTCCS110                     N3PF.                               
      @1352   CPTCCS111                     N3PF.                               
      @1355   CPTCCS112                     N3PF.                               
      @1358   CPTCCS113                     N3PF.                               
      @1361   CPTCCS114                     N3PF.                               
      @1364   CPTCCS115                     N3PF.                               
      @1367   CPTCCS116                     N3PF.                               
      @1370   CPTCCS117                     N3PF.                               
      @1373   CPTCCS118                     N3PF.                               
      @1376   CPTCCS119                     N3PF.                               
      @1379   CPTCCS120                     N3PF.                               
      @1382   CPTCCS121                     N3PF.                               
      @1385   CPTCCS122                     N3PF.                               
      @1388   CPTCCS123                     N3PF.                               
      @1391   CPTCCS124                     N3PF.                               
      @1394   CPTCCS125                     N3PF.                               
      @1397   CPTCCS126                     N3PF.                               
      @1400   CPTCCS127                     N3PF.                               
      @1403   CPTCCS128                     N3PF.                               
      @1406   CPTCCS129                     N3PF.                               
      @1409   CPTCCS130                     N3PF.                               
      @1412   CPTCCS131                     N3PF.                               
      @1415   CPTCCS132                     N3PF.                               
      @1418   CPTCCS133                     N3PF.                               
      @1421   CPTCCS134                     N3PF.                               
      @1424   CPTCCS135                     N3PF.                               
      @1427   CPTCCS136                     N3PF.                               
      @1430   CPTCCS137                     N3PF.                               
      @1433   CPTCCS138                     N3PF.                               
      @1436   CPTCCS139                     N3PF.                               
      @1439   CPTCCS140                     N3PF.                               
      @1442   CPTCCS141                     N3PF.                               
      @1445   CPTCCS142                     N3PF.                               
      @1448   CPTCCS143                     N3PF.                               
      @1451   CPTCCS144                     N3PF.                               
      @1454   CPTCCS145                     N3PF.                               
      @1457   CPTCCS146                     N3PF.                               
      @1460   CPTCCS147                     N3PF.                               
      @1463   CPTCCS148                     N3PF.                               
      @1466   CPTCCS149                     N3PF.                               
      @1469   CPTCCS150                     N3PF.                               
      @1472   CPTCCS151                     N3PF.                               
      @1475   CPTCCS152                     N3PF.                               
      @1478   CPTCCS153                     N3PF.                               
      @1481   CPTCCS154                     N3PF.                               
      @1484   CPTCCS155                     N3PF.                               
      @1487   CPTCCS156                     N3PF.                               
      @1490   CPTCCS157                     N3PF.                               
      @1493   CPTCCS158                     N3PF.                               
      @1496   CPTCCS159                     N3PF.                               
      @1499   CPTCCS160                     N3PF.                               
      @1502   CPTCCS161                     N3PF.                               
      @1505   CPTCCS162                     N3PF.                               
      @1508   CPTCCS163                     N3PF.                               
      @1511   CPTCCS164                     N3PF.                               
      @1514   CPTCCS165                     N3PF.                               
      @1517   CPTCCS166                     N3PF.                               
      @1520   CPTCCS167                     N3PF.                               
      @1523   CPTCCS168                     N3PF.                               
      @1526   CPTCCS169                     N3PF.                               
      @1529   CPTCCS170                     N3PF.                               
      @1532   CPTCCS171                     N3PF.                               
      @1535   CPTCCS172                     N3PF.                               
      @1538   CPTCCS173                     N3PF.                               
      @1541   CPTCCS174                     N3PF.                               
      @1544   CPTCCS175                     N3PF.                               
      @1547   CPTCCS176                     N3PF.                               
      @1550   CPTCCS177                     N3PF.                               
      @1553   CPTCCS178                     N3PF.                               
      @1556   CPTCCS179                     N3PF.                               
      @1559   CPTCCS180                     N3PF.                               
      @1562   CPTCCS181                     N3PF.                               
      @1565   CPTCCS182                     N3PF.                               
      @1568   CPTCCS183                     N3PF.                               
      @1571   CPTCCS184                     N3PF.                               
      @1574   CPTCCS185                     N3PF.                               
      @1577   CPTCCS186                     N3PF.                               
      @1580   CPTCCS187                     N3PF.                               
      @1583   CPTCCS188                     N3PF.                               
      @1586   CPTCCS189                     N3PF.                               
      @1589   CPTCCS190                     N3PF.                               
      @1592   CPTCCS191                     N3PF.                               
      @1595   CPTCCS192                     N3PF.                               
      @1598   CPTCCS193                     N3PF.                               
      @1601   CPTCCS194                     N3PF.                               
      @1604   CPTCCS195                     N3PF.                               
      @1607   CPTCCS196                     N3PF.                               
      @1610   CPTCCS197                     N3PF.                               
      @1613   CPTCCS198                     N3PF.                               
      @1616   CPTCCS199                     N3PF.                               
      @1619   CPTCCS200                     N3PF.                               
      @1622   CPTDAY1                       N3PF.                               
      @1625   CPTDAY2                       N3PF.                               
      @1628   CPTDAY3                       N3PF.                               
      @1631   CPTDAY4                       N3PF.                               
      @1634   CPTDAY5                       N3PF.                               
      @1637   CPTDAY6                       N3PF.                               
      @1640   CPTDAY7                       N3PF.                               
      @1643   CPTDAY8                       N3PF.                               
      @1646   CPTDAY9                       N3PF.                               
      @1649   CPTDAY10                      N3PF.                               
      @1652   CPTDAY11                      N3PF.                               
      @1655   CPTDAY12                      N3PF.                               
      @1658   CPTDAY13                      N3PF.                               
      @1661   CPTDAY14                      N3PF.                               
      @1664   CPTDAY15                      N3PF.                               
      @1667   CPTDAY16                      N3PF.                               
      @1670   CPTDAY17                      N3PF.                               
      @1673   CPTDAY18                      N3PF.                               
      @1676   CPTDAY19                      N3PF.                               
      @1679   CPTDAY20                      N3PF.                               
      @1682   CPTDAY21                      N3PF.                               
      @1685   CPTDAY22                      N3PF.                               
      @1688   CPTDAY23                      N3PF.                               
      @1691   CPTDAY24                      N3PF.                               
      @1694   CPTDAY25                      N3PF.                               
      @1697   CPTDAY26                      N3PF.                               
      @1700   CPTDAY27                      N3PF.                               
      @1703   CPTDAY28                      N3PF.                               
      @1706   CPTDAY29                      N3PF.                               
      @1709   CPTDAY30                      N3PF.                               
      @1712   CPTDAY31                      N3PF.                               
      @1715   CPTDAY32                      N3PF.                               
      @1718   CPTDAY33                      N3PF.                               
      @1721   CPTDAY34                      N3PF.                               
      @1724   CPTDAY35                      N3PF.                               
      @1727   CPTDAY36                      N3PF.                               
      @1730   CPTDAY37                      N3PF.                               
      @1733   CPTDAY38                      N3PF.                               
      @1736   CPTDAY39                      N3PF.                               
      @1739   CPTDAY40                      N3PF.                               
      @1742   CPTDAY41                      N3PF.                               
      @1745   CPTDAY42                      N3PF.                               
      @1748   CPTDAY43                      N3PF.                               
      @1751   CPTDAY44                      N3PF.                               
      @1754   CPTDAY45                      N3PF.                               
      @1757   CPTDAY46                      N3PF.                               
      @1760   CPTDAY47                      N3PF.                               
      @1763   CPTDAY48                      N3PF.                               
      @1766   CPTDAY49                      N3PF.                               
      @1769   CPTDAY50                      N3PF.                               
      @1772   CPTDAY51                      N3PF.                               
      @1775   CPTDAY52                      N3PF.                               
      @1778   CPTDAY53                      N3PF.                               
      @1781   CPTDAY54                      N3PF.                               
      @1784   CPTDAY55                      N3PF.                               
      @1787   CPTDAY56                      N3PF.                               
      @1790   CPTDAY57                      N3PF.                               
      @1793   CPTDAY58                      N3PF.                               
      @1796   CPTDAY59                      N3PF.                               
      @1799   CPTDAY60                      N3PF.                               
      @1802   CPTDAY61                      N3PF.                               
      @1805   CPTDAY62                      N3PF.                               
      @1808   CPTDAY63                      N3PF.                               
      @1811   CPTDAY64                      N3PF.                               
      @1814   CPTDAY65                      N3PF.                               
      @1817   CPTDAY66                      N3PF.                               
      @1820   CPTDAY67                      N3PF.                               
      @1823   CPTDAY68                      N3PF.                               
      @1826   CPTDAY69                      N3PF.                               
      @1829   CPTDAY70                      N3PF.                               
      @1832   CPTDAY71                      N3PF.                               
      @1835   CPTDAY72                      N3PF.                               
      @1838   CPTDAY73                      N3PF.                               
      @1841   CPTDAY74                      N3PF.                               
      @1844   CPTDAY75                      N3PF.                               
      @1847   CPTDAY76                      N3PF.                               
      @1850   CPTDAY77                      N3PF.                               
      @1853   CPTDAY78                      N3PF.                               
      @1856   CPTDAY79                      N3PF.                               
      @1859   CPTDAY80                      N3PF.                               
      @1862   CPTDAY81                      N3PF.                               
      @1865   CPTDAY82                      N3PF.                               
      @1868   CPTDAY83                      N3PF.                               
      @1871   CPTDAY84                      N3PF.                               
      @1874   CPTDAY85                      N3PF.                               
      @1877   CPTDAY86                      N3PF.                               
      @1880   CPTDAY87                      N3PF.                               
      @1883   CPTDAY88                      N3PF.                               
      @1886   CPTDAY89                      N3PF.                               
      @1889   CPTDAY90                      N3PF.                               
      @1892   CPTDAY91                      N3PF.                               
      @1895   CPTDAY92                      N3PF.                               
      @1898   CPTDAY93                      N3PF.                               
      @1901   CPTDAY94                      N3PF.                               
      @1904   CPTDAY95                      N3PF.                               
      @1907   CPTDAY96                      N3PF.                               
      @1910   CPTDAY97                      N3PF.                               
      @1913   CPTDAY98                      N3PF.                               
      @1916   CPTDAY99                      N3PF.                               
      @1919   CPTDAY100                     N3PF.                               
      @1922   CPTDAY101                     N3PF.                               
      @1925   CPTDAY102                     N3PF.                               
      @1928   CPTDAY103                     N3PF.                               
      @1931   CPTDAY104                     N3PF.                               
      @1934   CPTDAY105                     N3PF.                               
      @1937   CPTDAY106                     N3PF.                               
      @1940   CPTDAY107                     N3PF.                               
      @1943   CPTDAY108                     N3PF.                               
      @1946   CPTDAY109                     N3PF.                               
      @1949   CPTDAY110                     N3PF.                               
      @1952   CPTDAY111                     N3PF.                               
      @1955   CPTDAY112                     N3PF.                               
      @1958   CPTDAY113                     N3PF.                               
      @1961   CPTDAY114                     N3PF.                               
      @1964   CPTDAY115                     N3PF.                               
      @1967   CPTDAY116                     N3PF.                               
      @1970   CPTDAY117                     N3PF.                               
      @1973   CPTDAY118                     N3PF.                               
      @1976   CPTDAY119                     N3PF.                               
      @1979   CPTDAY120                     N3PF.                               
      @1982   CPTDAY121                     N3PF.                               
      @1985   CPTDAY122                     N3PF.                               
      @1988   CPTDAY123                     N3PF.                               
      @1991   CPTDAY124                     N3PF.                               
      @1994   CPTDAY125                     N3PF.                               
      @1997   CPTDAY126                     N3PF.                               
      @2000   CPTDAY127                     N3PF.                               
      @2003   CPTDAY128                     N3PF.                               
      @2006   CPTDAY129                     N3PF.                               
      @2009   CPTDAY130                     N3PF.                               
      @2012   CPTDAY131                     N3PF.                               
      @2015   CPTDAY132                     N3PF.                               
      @2018   CPTDAY133                     N3PF.                               
      @2021   CPTDAY134                     N3PF.                               
      @2024   CPTDAY135                     N3PF.                               
      @2027   CPTDAY136                     N3PF.                               
      @2030   CPTDAY137                     N3PF.                               
      @2033   CPTDAY138                     N3PF.                               
      @2036   CPTDAY139                     N3PF.                               
      @2039   CPTDAY140                     N3PF.                               
      @2042   CPTDAY141                     N3PF.                               
      @2045   CPTDAY142                     N3PF.                               
      @2048   CPTDAY143                     N3PF.                               
      @2051   CPTDAY144                     N3PF.                               
      @2054   CPTDAY145                     N3PF.                               
      @2057   CPTDAY146                     N3PF.                               
      @2060   CPTDAY147                     N3PF.                               
      @2063   CPTDAY148                     N3PF.                               
      @2066   CPTDAY149                     N3PF.                               
      @2069   CPTDAY150                     N3PF.                               
      @2072   CPTDAY151                     N3PF.                               
      @2075   CPTDAY152                     N3PF.                               
      @2078   CPTDAY153                     N3PF.                               
      @2081   CPTDAY154                     N3PF.                               
      @2084   CPTDAY155                     N3PF.                               
      @2087   CPTDAY156                     N3PF.                               
      @2090   CPTDAY157                     N3PF.                               
      @2093   CPTDAY158                     N3PF.                               
      @2096   CPTDAY159                     N3PF.                               
      @2099   CPTDAY160                     N3PF.                               
      @2102   CPTDAY161                     N3PF.                               
      @2105   CPTDAY162                     N3PF.                               
      @2108   CPTDAY163                     N3PF.                               
      @2111   CPTDAY164                     N3PF.                               
      @2114   CPTDAY165                     N3PF.                               
      @2117   CPTDAY166                     N3PF.                               
      @2120   CPTDAY167                     N3PF.                               
      @2123   CPTDAY168                     N3PF.                               
      @2126   CPTDAY169                     N3PF.                               
      @2129   CPTDAY170                     N3PF.                               
      @2132   CPTDAY171                     N3PF.                               
      @2135   CPTDAY172                     N3PF.                               
      @2138   CPTDAY173                     N3PF.                               
      @2141   CPTDAY174                     N3PF.                               
      @2144   CPTDAY175                     N3PF.                               
      @2147   CPTDAY176                     N3PF.                               
      @2150   CPTDAY177                     N3PF.                               
      @2153   CPTDAY178                     N3PF.                               
      @2156   CPTDAY179                     N3PF.                               
      @2159   CPTDAY180                     N3PF.                               
      @2162   CPTDAY181                     N3PF.                               
      @2165   CPTDAY182                     N3PF.                               
      @2168   CPTDAY183                     N3PF.                               
      @2171   CPTDAY184                     N3PF.                               
      @2174   CPTDAY185                     N3PF.                               
      @2177   CPTDAY186                     N3PF.                               
      @2180   CPTDAY187                     N3PF.                               
      @2183   CPTDAY188                     N3PF.                               
      @2186   CPTDAY189                     N3PF.                               
      @2189   CPTDAY190                     N3PF.                               
      @2192   CPTDAY191                     N3PF.                               
      @2195   CPTDAY192                     N3PF.                               
      @2198   CPTDAY193                     N3PF.                               
      @2201   CPTDAY194                     N3PF.                               
      @2204   CPTDAY195                     N3PF.                               
      @2207   CPTDAY196                     N3PF.                               
      @2210   CPTDAY197                     N3PF.                               
      @2213   CPTDAY198                     N3PF.                               
      @2216   CPTDAY199                     N3PF.                               
      @2219   CPTDAY200                     N3PF.                               
      @2222   DaysToEvent                   N6PF.                               
      @2228   DHOUR                         N4PF.                               
      @2232   DIED                          N2PF.                               
      @2234   DISP_X                        $CHAR2.                             
      @2236   DISPUB04                      N2PF.                               
      @2238   DISPUNIFORM                   N2PF.                               
      @2240   DMONTH                        N2PF.                               
      @2242   DQTR                          N2PF.                               
      @2244   DURATION                      N6PF.                               
      @2250   FEMALE                        N2PF.                               
      @2252   HCUP_ED                       N2PF.                               
      @2254   HCUP_OS                       N2PF.                               
      @2256   HISPANIC                      N2PF.                               
      @2258   HISPANIC_X                    $CHAR1.                             
      @2259   Homeless                      N2PF.                               
      @2261   HOSPST                        $CHAR2.                             
      @2263   I10_DX1                       $CHAR7.                             
      @2270   I10_DX2                       $CHAR7.                             
      @2277   I10_DX3                       $CHAR7.                             
      @2284   I10_DX4                       $CHAR7.                             
      @2291   I10_DX5                       $CHAR7.                             
      @2298   I10_DX6                       $CHAR7.                             
      @2305   I10_DX7                       $CHAR7.                             
      @2312   I10_DX8                       $CHAR7.                             
      @2319   I10_DX9                       $CHAR7.                             
      @2326   I10_DX10                      $CHAR7.                             
      @2333   I10_DX11                      $CHAR7.                             
      @2340   I10_DX12                      $CHAR7.                             
      @2347   I10_DX13                      $CHAR7.                             
      @2354   I10_DX14                      $CHAR7.                             
      @2361   I10_DX15                      $CHAR7.                             
      @2368   I10_DX16                      $CHAR7.                             
      @2375   I10_DX17                      $CHAR7.                             
      @2382   I10_DX18                      $CHAR7.                             
      @2389   I10_DX19                      $CHAR7.                             
      @2396   I10_DX20                      $CHAR7.                             
      @2403   I10_DX21                      $CHAR7.                             
      @2410   I10_DX22                      $CHAR7.                             
      @2417   I10_DX23                      $CHAR7.                             
      @2424   I10_DX24                      $CHAR7.                             
      @2431   I10_DX25                      $CHAR7.                             
      @2438   I10_DX26                      $CHAR7.                             
      @2445   I10_DX27                      $CHAR7.                             
      @2452   I10_DX28                      $CHAR7.                             
      @2459   I10_DX29                      $CHAR7.                             
      @2466   I10_DX30                      $CHAR7.                             
      @2473   I10_NDX                       N3PF.                               
      @2476   I10_NPR                       N3PF.                               
      @2479   I10_ORPROC                    N2PF.                               
      @2481   I10_PR1                       $CHAR7.                             
      @2488   I10_PR2                       $CHAR7.                             
      @2495   I10_PR3                       $CHAR7.                             
      @2502   I10_PR4                       $CHAR7.                             
      @2509   I10_PR5                       $CHAR7.                             
      @2516   I10_PR6                       $CHAR7.                             
      @2523   I10_PR7                       $CHAR7.                             
      @2530   I10_PR8                       $CHAR7.                             
      @2537   I10_PR9                       $CHAR7.                             
      @2544   I10_PR10                      $CHAR7.                             
      @2551   I10_PR11                      $CHAR7.                             
      @2558   I10_PR12                      $CHAR7.                             
      @2565   I10_PR13                      $CHAR7.                             
      @2572   I10_PR14                      $CHAR7.                             
      @2579   I10_PR15                      $CHAR7.                             
      @2586   I10_PR16                      $CHAR7.                             
      @2593   I10_PR17                      $CHAR7.                             
      @2600   I10_PR18                      $CHAR7.                             
      @2607   I10_PR19                      $CHAR7.                             
      @2614   I10_PR20                      $CHAR7.                             
      @2621   I10_PR21                      $CHAR7.                             
      @2628   I10_PR22                      $CHAR7.                             
      @2635   I10_PR23                      $CHAR7.                             
      @2642   I10_PR24                      $CHAR7.                             
      @2649   I10_PR25                      $CHAR7.                             
      @2656   I10_PROCTYPE                  N3PF.                               
      @2659   KEY                           15.                                 
      @2674   LOS                           N5PF.                               
      @2679   LOS_X                         N6PF.                               
      @2685   MDNUM1_R                      N9PF.                               
      @2694   MDNUM2_R                      N9PF.                               
      @2703   MEDINCSTQ                     N2PF.                               
      @2705   NCPT                          N4PF.                               
      @2709   OBSERVATION                   N4PF.                               
      @2713   OPservice                     $CHAR1.                             
      @2714   OS_TIME                       N11P2F.                             
      @2725   PAY1                          N2PF.                               
      @2727   PAY1_X                        $CHAR2.                             
      @2729   PAY2                          N2PF.                               
      @2731   PAY2_X                        $CHAR2.                             
      @2733   PAY3                          N2PF.                               
      @2735   PAY3_X                        $CHAR2.                             
      @2737   PL_CBSA                       N3PF.                               
      @2740   PL_NCHS                       N2PF.                               
      @2742   PL_RUCC                       N2PF.                               
      @2744   PL_UIC                        N2PF.                               
      @2746   PL_UR_CAT4                    N2PF.                               
      @2748   PointOfOrigin_X               $CHAR1.                             
      @2749   PointOfOriginUB04             $CHAR1.                             
      @2750   PRDAY1                        N5PF.                               
      @2755   PRDAY2                        N5PF.                               
      @2760   PRDAY3                        N5PF.                               
      @2765   PRDAY4                        N5PF.                               
      @2770   PRDAY5                        N5PF.                               
      @2775   PRDAY6                        N5PF.                               
      @2780   PRDAY7                        N5PF.                               
      @2785   PRDAY8                        N5PF.                               
      @2790   PRDAY9                        N5PF.                               
      @2795   PRDAY10                       N5PF.                               
      @2800   PRDAY11                       N5PF.                               
      @2805   PRDAY12                       N5PF.                               
      @2810   PRDAY13                       N5PF.                               
      @2815   PRDAY14                       N5PF.                               
      @2820   PRDAY15                       N5PF.                               
      @2825   PRDAY16                       N5PF.                               
      @2830   PRDAY17                       N5PF.                               
      @2835   PRDAY18                       N5PF.                               
      @2840   PRDAY19                       N5PF.                               
      @2845   PRDAY20                       N5PF.                               
      @2850   PRDAY21                       N5PF.                               
      @2855   PRDAY22                       N5PF.                               
      @2860   PRDAY23                       N5PF.                               
      @2865   PRDAY24                       N5PF.                               
      @2870   PRDAY25                       N5PF.                               
      @2875   PSTATE                        $CHAR2.                             
      @2877   PSTATE_GEO                    $CHAR2.                             
      @2879   PSTCO                         N5PF.                               
      @2884   PSTCO_GEO                     N5PF.                               
      @2889   RACE                          N2PF.                               
      @2891   RACE_X                        $CHAR1.                             
      @2892   STATE_AS                      N2PF.                               
      @2894   STATE_ED                      N2PF.                               
      @2896   STATE_OS                      N2PF.                               
      @2898   VisitLink                     N9PF.                               
      @2907   YEAR                          N4PF.                               
      @2911   ZIP                           $CHAR5.                             
      @2916   ZIP3                          $CHAR3.                             
      @2919   ZIPINC_QRTL                   N3PF.                               
      @2922   HOSPID                        N5PF.                               
      @2927   AYEAR                         N4PF.                               
      @2931   BMONTH                        N2PF.                               
      @2933   BYEAR                         N4PF.                               
      @2937   PRMONTH1                      N2PF.                               
      @2939   PRMONTH2                      N2PF.                               
      @2941   PRMONTH3                      N2PF.                               
      @2943   PRMONTH4                      N2PF.                               
      @2945   PRMONTH5                      N2PF.                               
      @2947   PRMONTH6                      N2PF.                               
      @2949   PRMONTH7                      N2PF.                               
      @2951   PRMONTH8                      N2PF.                               
      @2953   PRMONTH9                      N2PF.                               
      @2955   PRMONTH10                     N2PF.                               
      @2957   PRMONTH11                     N2PF.                               
      @2959   PRMONTH12                     N2PF.                               
      @2961   PRMONTH13                     N2PF.                               
      @2963   PRMONTH14                     N2PF.                               
      @2965   PRMONTH15                     N2PF.                               
      @2967   PRMONTH16                     N2PF.                               
      @2969   PRMONTH17                     N2PF.                               
      @2971   PRMONTH18                     N2PF.                               
      @2973   PRMONTH19                     N2PF.                               
      @2975   PRMONTH20                     N2PF.                               
      @2977   PRMONTH21                     N2PF.                               
      @2979   PRMONTH22                     N2PF.                               
      @2981   PRMONTH23                     N2PF.                               
      @2983   PRMONTH24                     N2PF.                               
      @2985   PRMONTH25                     N2PF.                               
      @2987   PRYEAR1                       N4PF.                               
      @2991   PRYEAR2                       N4PF.                               
      @2995   PRYEAR3                       N4PF.                               
      @2999   PRYEAR4                       N4PF.                               
      @3003   PRYEAR5                       N4PF.                               
      @3007   PRYEAR6                       N4PF.                               
      @3011   PRYEAR7                       N4PF.                               
      @3015   PRYEAR8                       N4PF.                               
      @3019   PRYEAR9                       N4PF.                               
      @3023   PRYEAR10                      N4PF.                               
      @3027   PRYEAR11                      N4PF.                               
      @3031   PRYEAR12                      N4PF.                               
      @3035   PRYEAR13                      N4PF.                               
      @3039   PRYEAR14                      N4PF.                               
      @3043   PRYEAR15                      N4PF.                               
      @3047   PRYEAR16                      N4PF.                               
      @3051   PRYEAR17                      N4PF.                               
      @3055   PRYEAR18                      N4PF.                               
      @3059   PRYEAR19                      N4PF.                               
      @3063   PRYEAR20                      N4PF.                               
      @3067   PRYEAR21                      N4PF.                               
      @3071   PRYEAR22                      N4PF.                               
      @3075   PRYEAR23                      N4PF.                               
      @3079   PRYEAR24                      N4PF.                               
      @3083   PRYEAR25                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
