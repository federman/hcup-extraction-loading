/*******************************************************************            
* Creation Date: 02/16/2022                                                     
*   AK_SID_2020_CORE.SAS:                                                       
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
DATA AK_SIDC_2020_CORE;                                                         
INFILE 'AK_SID_2020_CORE.ASC' FIRSTOBS=3 LRECL = 2793;                          
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
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
                                                                                
  HospitalUnit               LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Patient was discharged from a special unit within an acute care hospital (repor
ted by source)"                                                                 
                                                                                
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
                                                                                
  MDC                        LENGTH=3                                           
  LABEL="MDC in effect on discharge date"                                       
                                                                                
  MDC_NoPOA                  LENGTH=3                                           
  LABEL="MDC in use on discharge date, calculated without POA"                  
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures for this visit"                         
                                                                                
  OBSERVATION                LENGTH=4                                           
  LABEL="Time for observation services (as received from source)"               
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  P7EDSRC_X                  LENGTH=$2                                          
  LABEL="Condition Code P7, Direct Inpatient Admission from Emergency Room"     
                                                                                
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
                                                                                
  PCLASS_ORPROC              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indicates operating room (major diagnostic or therapeutic) procedure on the rec
ord"                                                                            
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_NCHS                    LENGTH=3                                           
  LABEL="Patient Location: NCHS Urban-Rural Code"                               
                                                                                
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
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTATE_GEO                 LENGTH=$2                                          
  LABEL="Patient State postal code assigned from ZIP Code"                      
                                                                                
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                           N3PF.                               
      @4      AGEMONTH                      N3PF.                               
      @7      AHOUR                         N4PF.                               
      @11     AMONTH                        N2PF.                               
      @13     ATYPE                         N2PF.                               
      @15     AWEEKEND                      N2PF.                               
      @17     BILLTYPE                      $CHAR4.                             
      @21     CPT1                          $CHAR5.                             
      @26     CPT2                          $CHAR5.                             
      @31     CPT3                          $CHAR5.                             
      @36     CPT4                          $CHAR5.                             
      @41     CPT5                          $CHAR5.                             
      @46     CPT6                          $CHAR5.                             
      @51     CPT7                          $CHAR5.                             
      @56     CPT8                          $CHAR5.                             
      @61     CPT9                          $CHAR5.                             
      @66     CPT10                         $CHAR5.                             
      @71     CPT11                         $CHAR5.                             
      @76     CPT12                         $CHAR5.                             
      @81     CPT13                         $CHAR5.                             
      @86     CPT14                         $CHAR5.                             
      @91     CPT15                         $CHAR5.                             
      @96     CPT16                         $CHAR5.                             
      @101    CPT17                         $CHAR5.                             
      @106    CPT18                         $CHAR5.                             
      @111    CPT19                         $CHAR5.                             
      @116    CPT20                         $CHAR5.                             
      @121    CPT21                         $CHAR5.                             
      @126    CPT22                         $CHAR5.                             
      @131    CPT23                         $CHAR5.                             
      @136    CPT24                         $CHAR5.                             
      @141    CPT25                         $CHAR5.                             
      @146    CPT26                         $CHAR5.                             
      @151    CPT27                         $CHAR5.                             
      @156    CPT28                         $CHAR5.                             
      @161    CPT29                         $CHAR5.                             
      @166    CPT30                         $CHAR5.                             
      @171    CPT31                         $CHAR5.                             
      @176    CPT32                         $CHAR5.                             
      @181    CPT33                         $CHAR5.                             
      @186    CPT34                         $CHAR5.                             
      @191    CPT35                         $CHAR5.                             
      @196    CPT36                         $CHAR5.                             
      @201    CPT37                         $CHAR5.                             
      @206    CPT38                         $CHAR5.                             
      @211    CPT39                         $CHAR5.                             
      @216    CPT40                         $CHAR5.                             
      @221    CPT41                         $CHAR5.                             
      @226    CPT42                         $CHAR5.                             
      @231    CPT43                         $CHAR5.                             
      @236    CPT44                         $CHAR5.                             
      @241    CPT45                         $CHAR5.                             
      @246    CPT46                         $CHAR5.                             
      @251    CPT47                         $CHAR5.                             
      @256    CPT48                         $CHAR5.                             
      @261    CPT49                         $CHAR5.                             
      @266    CPT50                         $CHAR5.                             
      @271    CPT51                         $CHAR5.                             
      @276    CPT52                         $CHAR5.                             
      @281    CPT53                         $CHAR5.                             
      @286    CPT54                         $CHAR5.                             
      @291    CPT55                         $CHAR5.                             
      @296    CPT56                         $CHAR5.                             
      @301    CPT57                         $CHAR5.                             
      @306    CPT58                         $CHAR5.                             
      @311    CPT59                         $CHAR5.                             
      @316    CPT60                         $CHAR5.                             
      @321    CPT61                         $CHAR5.                             
      @326    CPT62                         $CHAR5.                             
      @331    CPT63                         $CHAR5.                             
      @336    CPT64                         $CHAR5.                             
      @341    CPT65                         $CHAR5.                             
      @346    CPT66                         $CHAR5.                             
      @351    CPT67                         $CHAR5.                             
      @356    CPT68                         $CHAR5.                             
      @361    CPT69                         $CHAR5.                             
      @366    CPT70                         $CHAR5.                             
      @371    CPT71                         $CHAR5.                             
      @376    CPT72                         $CHAR5.                             
      @381    CPT73                         $CHAR5.                             
      @386    CPT74                         $CHAR5.                             
      @391    CPT75                         $CHAR5.                             
      @396    CPT76                         $CHAR5.                             
      @401    CPT77                         $CHAR5.                             
      @406    CPT78                         $CHAR5.                             
      @411    CPT79                         $CHAR5.                             
      @416    CPT80                         $CHAR5.                             
      @421    CPT81                         $CHAR5.                             
      @426    CPT82                         $CHAR5.                             
      @431    CPT83                         $CHAR5.                             
      @436    CPT84                         $CHAR5.                             
      @441    CPT85                         $CHAR5.                             
      @446    CPT86                         $CHAR5.                             
      @451    CPT87                         $CHAR5.                             
      @456    CPT88                         $CHAR5.                             
      @461    CPT89                         $CHAR5.                             
      @466    CPT90                         $CHAR5.                             
      @471    CPT91                         $CHAR5.                             
      @476    CPT92                         $CHAR5.                             
      @481    CPT93                         $CHAR5.                             
      @486    CPT94                         $CHAR5.                             
      @491    CPT95                         $CHAR5.                             
      @496    CPT96                         $CHAR5.                             
      @501    CPT97                         $CHAR5.                             
      @506    CPT98                         $CHAR5.                             
      @511    CPT99                         $CHAR5.                             
      @516    CPT100                        $CHAR5.                             
      @521    CPT101                        $CHAR5.                             
      @526    CPT102                        $CHAR5.                             
      @531    CPT103                        $CHAR5.                             
      @536    CPT104                        $CHAR5.                             
      @541    CPT105                        $CHAR5.                             
      @546    CPT106                        $CHAR5.                             
      @551    CPT107                        $CHAR5.                             
      @556    CPT108                        $CHAR5.                             
      @561    CPT109                        $CHAR5.                             
      @566    CPT110                        $CHAR5.                             
      @571    CPT111                        $CHAR5.                             
      @576    CPT112                        $CHAR5.                             
      @581    CPT113                        $CHAR5.                             
      @586    CPT114                        $CHAR5.                             
      @591    CPT115                        $CHAR5.                             
      @596    CPT116                        $CHAR5.                             
      @601    CPT117                        $CHAR5.                             
      @606    CPT118                        $CHAR5.                             
      @611    CPT119                        $CHAR5.                             
      @616    CPT120                        $CHAR5.                             
      @621    CPT121                        $CHAR5.                             
      @626    CPT122                        $CHAR5.                             
      @631    CPT123                        $CHAR5.                             
      @636    CPT124                        $CHAR5.                             
      @641    CPT125                        $CHAR5.                             
      @646    CPT126                        $CHAR5.                             
      @651    CPT127                        $CHAR5.                             
      @656    CPT128                        $CHAR5.                             
      @661    CPT129                        $CHAR5.                             
      @666    CPT130                        $CHAR5.                             
      @671    CPT131                        $CHAR5.                             
      @676    CPT132                        $CHAR5.                             
      @681    CPT133                        $CHAR5.                             
      @686    CPT134                        $CHAR5.                             
      @691    CPT135                        $CHAR5.                             
      @696    CPT136                        $CHAR5.                             
      @701    CPT137                        $CHAR5.                             
      @706    CPT138                        $CHAR5.                             
      @711    CPT139                        $CHAR5.                             
      @716    CPT140                        $CHAR5.                             
      @721    CPT141                        $CHAR5.                             
      @726    CPT142                        $CHAR5.                             
      @731    CPT143                        $CHAR5.                             
      @736    CPT144                        $CHAR5.                             
      @741    CPT145                        $CHAR5.                             
      @746    CPT146                        $CHAR5.                             
      @751    CPT147                        $CHAR5.                             
      @756    CPT148                        $CHAR5.                             
      @761    CPT149                        $CHAR5.                             
      @766    CPT150                        $CHAR5.                             
      @771    CPT151                        $CHAR5.                             
      @776    CPT152                        $CHAR5.                             
      @781    CPT153                        $CHAR5.                             
      @786    CPT154                        $CHAR5.                             
      @791    CPT155                        $CHAR5.                             
      @796    CPT156                        $CHAR5.                             
      @801    CPT157                        $CHAR5.                             
      @806    CPT158                        $CHAR5.                             
      @811    CPT159                        $CHAR5.                             
      @816    CPT160                        $CHAR5.                             
      @821    CPTCCS1                       N3PF.                               
      @824    CPTCCS2                       N3PF.                               
      @827    CPTCCS3                       N3PF.                               
      @830    CPTCCS4                       N3PF.                               
      @833    CPTCCS5                       N3PF.                               
      @836    CPTCCS6                       N3PF.                               
      @839    CPTCCS7                       N3PF.                               
      @842    CPTCCS8                       N3PF.                               
      @845    CPTCCS9                       N3PF.                               
      @848    CPTCCS10                      N3PF.                               
      @851    CPTCCS11                      N3PF.                               
      @854    CPTCCS12                      N3PF.                               
      @857    CPTCCS13                      N3PF.                               
      @860    CPTCCS14                      N3PF.                               
      @863    CPTCCS15                      N3PF.                               
      @866    CPTCCS16                      N3PF.                               
      @869    CPTCCS17                      N3PF.                               
      @872    CPTCCS18                      N3PF.                               
      @875    CPTCCS19                      N3PF.                               
      @878    CPTCCS20                      N3PF.                               
      @881    CPTCCS21                      N3PF.                               
      @884    CPTCCS22                      N3PF.                               
      @887    CPTCCS23                      N3PF.                               
      @890    CPTCCS24                      N3PF.                               
      @893    CPTCCS25                      N3PF.                               
      @896    CPTCCS26                      N3PF.                               
      @899    CPTCCS27                      N3PF.                               
      @902    CPTCCS28                      N3PF.                               
      @905    CPTCCS29                      N3PF.                               
      @908    CPTCCS30                      N3PF.                               
      @911    CPTCCS31                      N3PF.                               
      @914    CPTCCS32                      N3PF.                               
      @917    CPTCCS33                      N3PF.                               
      @920    CPTCCS34                      N3PF.                               
      @923    CPTCCS35                      N3PF.                               
      @926    CPTCCS36                      N3PF.                               
      @929    CPTCCS37                      N3PF.                               
      @932    CPTCCS38                      N3PF.                               
      @935    CPTCCS39                      N3PF.                               
      @938    CPTCCS40                      N3PF.                               
      @941    CPTCCS41                      N3PF.                               
      @944    CPTCCS42                      N3PF.                               
      @947    CPTCCS43                      N3PF.                               
      @950    CPTCCS44                      N3PF.                               
      @953    CPTCCS45                      N3PF.                               
      @956    CPTCCS46                      N3PF.                               
      @959    CPTCCS47                      N3PF.                               
      @962    CPTCCS48                      N3PF.                               
      @965    CPTCCS49                      N3PF.                               
      @968    CPTCCS50                      N3PF.                               
      @971    CPTCCS51                      N3PF.                               
      @974    CPTCCS52                      N3PF.                               
      @977    CPTCCS53                      N3PF.                               
      @980    CPTCCS54                      N3PF.                               
      @983    CPTCCS55                      N3PF.                               
      @986    CPTCCS56                      N3PF.                               
      @989    CPTCCS57                      N3PF.                               
      @992    CPTCCS58                      N3PF.                               
      @995    CPTCCS59                      N3PF.                               
      @998    CPTCCS60                      N3PF.                               
      @1001   CPTCCS61                      N3PF.                               
      @1004   CPTCCS62                      N3PF.                               
      @1007   CPTCCS63                      N3PF.                               
      @1010   CPTCCS64                      N3PF.                               
      @1013   CPTCCS65                      N3PF.                               
      @1016   CPTCCS66                      N3PF.                               
      @1019   CPTCCS67                      N3PF.                               
      @1022   CPTCCS68                      N3PF.                               
      @1025   CPTCCS69                      N3PF.                               
      @1028   CPTCCS70                      N3PF.                               
      @1031   CPTCCS71                      N3PF.                               
      @1034   CPTCCS72                      N3PF.                               
      @1037   CPTCCS73                      N3PF.                               
      @1040   CPTCCS74                      N3PF.                               
      @1043   CPTCCS75                      N3PF.                               
      @1046   CPTCCS76                      N3PF.                               
      @1049   CPTCCS77                      N3PF.                               
      @1052   CPTCCS78                      N3PF.                               
      @1055   CPTCCS79                      N3PF.                               
      @1058   CPTCCS80                      N3PF.                               
      @1061   CPTCCS81                      N3PF.                               
      @1064   CPTCCS82                      N3PF.                               
      @1067   CPTCCS83                      N3PF.                               
      @1070   CPTCCS84                      N3PF.                               
      @1073   CPTCCS85                      N3PF.                               
      @1076   CPTCCS86                      N3PF.                               
      @1079   CPTCCS87                      N3PF.                               
      @1082   CPTCCS88                      N3PF.                               
      @1085   CPTCCS89                      N3PF.                               
      @1088   CPTCCS90                      N3PF.                               
      @1091   CPTCCS91                      N3PF.                               
      @1094   CPTCCS92                      N3PF.                               
      @1097   CPTCCS93                      N3PF.                               
      @1100   CPTCCS94                      N3PF.                               
      @1103   CPTCCS95                      N3PF.                               
      @1106   CPTCCS96                      N3PF.                               
      @1109   CPTCCS97                      N3PF.                               
      @1112   CPTCCS98                      N3PF.                               
      @1115   CPTCCS99                      N3PF.                               
      @1118   CPTCCS100                     N3PF.                               
      @1121   CPTCCS101                     N3PF.                               
      @1124   CPTCCS102                     N3PF.                               
      @1127   CPTCCS103                     N3PF.                               
      @1130   CPTCCS104                     N3PF.                               
      @1133   CPTCCS105                     N3PF.                               
      @1136   CPTCCS106                     N3PF.                               
      @1139   CPTCCS107                     N3PF.                               
      @1142   CPTCCS108                     N3PF.                               
      @1145   CPTCCS109                     N3PF.                               
      @1148   CPTCCS110                     N3PF.                               
      @1151   CPTCCS111                     N3PF.                               
      @1154   CPTCCS112                     N3PF.                               
      @1157   CPTCCS113                     N3PF.                               
      @1160   CPTCCS114                     N3PF.                               
      @1163   CPTCCS115                     N3PF.                               
      @1166   CPTCCS116                     N3PF.                               
      @1169   CPTCCS117                     N3PF.                               
      @1172   CPTCCS118                     N3PF.                               
      @1175   CPTCCS119                     N3PF.                               
      @1178   CPTCCS120                     N3PF.                               
      @1181   CPTCCS121                     N3PF.                               
      @1184   CPTCCS122                     N3PF.                               
      @1187   CPTCCS123                     N3PF.                               
      @1190   CPTCCS124                     N3PF.                               
      @1193   CPTCCS125                     N3PF.                               
      @1196   CPTCCS126                     N3PF.                               
      @1199   CPTCCS127                     N3PF.                               
      @1202   CPTCCS128                     N3PF.                               
      @1205   CPTCCS129                     N3PF.                               
      @1208   CPTCCS130                     N3PF.                               
      @1211   CPTCCS131                     N3PF.                               
      @1214   CPTCCS132                     N3PF.                               
      @1217   CPTCCS133                     N3PF.                               
      @1220   CPTCCS134                     N3PF.                               
      @1223   CPTCCS135                     N3PF.                               
      @1226   CPTCCS136                     N3PF.                               
      @1229   CPTCCS137                     N3PF.                               
      @1232   CPTCCS138                     N3PF.                               
      @1235   CPTCCS139                     N3PF.                               
      @1238   CPTCCS140                     N3PF.                               
      @1241   CPTCCS141                     N3PF.                               
      @1244   CPTCCS142                     N3PF.                               
      @1247   CPTCCS143                     N3PF.                               
      @1250   CPTCCS144                     N3PF.                               
      @1253   CPTCCS145                     N3PF.                               
      @1256   CPTCCS146                     N3PF.                               
      @1259   CPTCCS147                     N3PF.                               
      @1262   CPTCCS148                     N3PF.                               
      @1265   CPTCCS149                     N3PF.                               
      @1268   CPTCCS150                     N3PF.                               
      @1271   CPTCCS151                     N3PF.                               
      @1274   CPTCCS152                     N3PF.                               
      @1277   CPTCCS153                     N3PF.                               
      @1280   CPTCCS154                     N3PF.                               
      @1283   CPTCCS155                     N3PF.                               
      @1286   CPTCCS156                     N3PF.                               
      @1289   CPTCCS157                     N3PF.                               
      @1292   CPTCCS158                     N3PF.                               
      @1295   CPTCCS159                     N3PF.                               
      @1298   CPTCCS160                     N3PF.                               
      @1301   CPTDAY1                       N3PF.                               
      @1304   CPTDAY2                       N3PF.                               
      @1307   CPTDAY3                       N3PF.                               
      @1310   CPTDAY4                       N3PF.                               
      @1313   CPTDAY5                       N3PF.                               
      @1316   CPTDAY6                       N3PF.                               
      @1319   CPTDAY7                       N3PF.                               
      @1322   CPTDAY8                       N3PF.                               
      @1325   CPTDAY9                       N3PF.                               
      @1328   CPTDAY10                      N3PF.                               
      @1331   CPTDAY11                      N3PF.                               
      @1334   CPTDAY12                      N3PF.                               
      @1337   CPTDAY13                      N3PF.                               
      @1340   CPTDAY14                      N3PF.                               
      @1343   CPTDAY15                      N3PF.                               
      @1346   CPTDAY16                      N3PF.                               
      @1349   CPTDAY17                      N3PF.                               
      @1352   CPTDAY18                      N3PF.                               
      @1355   CPTDAY19                      N3PF.                               
      @1358   CPTDAY20                      N3PF.                               
      @1361   CPTDAY21                      N3PF.                               
      @1364   CPTDAY22                      N3PF.                               
      @1367   CPTDAY23                      N3PF.                               
      @1370   CPTDAY24                      N3PF.                               
      @1373   CPTDAY25                      N3PF.                               
      @1376   CPTDAY26                      N3PF.                               
      @1379   CPTDAY27                      N3PF.                               
      @1382   CPTDAY28                      N3PF.                               
      @1385   CPTDAY29                      N3PF.                               
      @1388   CPTDAY30                      N3PF.                               
      @1391   CPTDAY31                      N3PF.                               
      @1394   CPTDAY32                      N3PF.                               
      @1397   CPTDAY33                      N3PF.                               
      @1400   CPTDAY34                      N3PF.                               
      @1403   CPTDAY35                      N3PF.                               
      @1406   CPTDAY36                      N3PF.                               
      @1409   CPTDAY37                      N3PF.                               
      @1412   CPTDAY38                      N3PF.                               
      @1415   CPTDAY39                      N3PF.                               
      @1418   CPTDAY40                      N3PF.                               
      @1421   CPTDAY41                      N3PF.                               
      @1424   CPTDAY42                      N3PF.                               
      @1427   CPTDAY43                      N3PF.                               
      @1430   CPTDAY44                      N3PF.                               
      @1433   CPTDAY45                      N3PF.                               
      @1436   CPTDAY46                      N3PF.                               
      @1439   CPTDAY47                      N3PF.                               
      @1442   CPTDAY48                      N3PF.                               
      @1445   CPTDAY49                      N3PF.                               
      @1448   CPTDAY50                      N3PF.                               
      @1451   CPTDAY51                      N3PF.                               
      @1454   CPTDAY52                      N3PF.                               
      @1457   CPTDAY53                      N3PF.                               
      @1460   CPTDAY54                      N3PF.                               
      @1463   CPTDAY55                      N3PF.                               
      @1466   CPTDAY56                      N3PF.                               
      @1469   CPTDAY57                      N3PF.                               
      @1472   CPTDAY58                      N3PF.                               
      @1475   CPTDAY59                      N3PF.                               
      @1478   CPTDAY60                      N3PF.                               
      @1481   CPTDAY61                      N3PF.                               
      @1484   CPTDAY62                      N3PF.                               
      @1487   CPTDAY63                      N3PF.                               
      @1490   CPTDAY64                      N3PF.                               
      @1493   CPTDAY65                      N3PF.                               
      @1496   CPTDAY66                      N3PF.                               
      @1499   CPTDAY67                      N3PF.                               
      @1502   CPTDAY68                      N3PF.                               
      @1505   CPTDAY69                      N3PF.                               
      @1508   CPTDAY70                      N3PF.                               
      @1511   CPTDAY71                      N3PF.                               
      @1514   CPTDAY72                      N3PF.                               
      @1517   CPTDAY73                      N3PF.                               
      @1520   CPTDAY74                      N3PF.                               
      @1523   CPTDAY75                      N3PF.                               
      @1526   CPTDAY76                      N3PF.                               
      @1529   CPTDAY77                      N3PF.                               
      @1532   CPTDAY78                      N3PF.                               
      @1535   CPTDAY79                      N3PF.                               
      @1538   CPTDAY80                      N3PF.                               
      @1541   CPTDAY81                      N3PF.                               
      @1544   CPTDAY82                      N3PF.                               
      @1547   CPTDAY83                      N3PF.                               
      @1550   CPTDAY84                      N3PF.                               
      @1553   CPTDAY85                      N3PF.                               
      @1556   CPTDAY86                      N3PF.                               
      @1559   CPTDAY87                      N3PF.                               
      @1562   CPTDAY88                      N3PF.                               
      @1565   CPTDAY89                      N3PF.                               
      @1568   CPTDAY90                      N3PF.                               
      @1571   CPTDAY91                      N3PF.                               
      @1574   CPTDAY92                      N3PF.                               
      @1577   CPTDAY93                      N3PF.                               
      @1580   CPTDAY94                      N3PF.                               
      @1583   CPTDAY95                      N3PF.                               
      @1586   CPTDAY96                      N3PF.                               
      @1589   CPTDAY97                      N3PF.                               
      @1592   CPTDAY98                      N3PF.                               
      @1595   CPTDAY99                      N3PF.                               
      @1598   CPTDAY100                     N3PF.                               
      @1601   CPTDAY101                     N3PF.                               
      @1604   CPTDAY102                     N3PF.                               
      @1607   CPTDAY103                     N3PF.                               
      @1610   CPTDAY104                     N3PF.                               
      @1613   CPTDAY105                     N3PF.                               
      @1616   CPTDAY106                     N3PF.                               
      @1619   CPTDAY107                     N3PF.                               
      @1622   CPTDAY108                     N3PF.                               
      @1625   CPTDAY109                     N3PF.                               
      @1628   CPTDAY110                     N3PF.                               
      @1631   CPTDAY111                     N3PF.                               
      @1634   CPTDAY112                     N3PF.                               
      @1637   CPTDAY113                     N3PF.                               
      @1640   CPTDAY114                     N3PF.                               
      @1643   CPTDAY115                     N3PF.                               
      @1646   CPTDAY116                     N3PF.                               
      @1649   CPTDAY117                     N3PF.                               
      @1652   CPTDAY118                     N3PF.                               
      @1655   CPTDAY119                     N3PF.                               
      @1658   CPTDAY120                     N3PF.                               
      @1661   CPTDAY121                     N3PF.                               
      @1664   CPTDAY122                     N3PF.                               
      @1667   CPTDAY123                     N3PF.                               
      @1670   CPTDAY124                     N3PF.                               
      @1673   CPTDAY125                     N3PF.                               
      @1676   CPTDAY126                     N3PF.                               
      @1679   CPTDAY127                     N3PF.                               
      @1682   CPTDAY128                     N3PF.                               
      @1685   CPTDAY129                     N3PF.                               
      @1688   CPTDAY130                     N3PF.                               
      @1691   CPTDAY131                     N3PF.                               
      @1694   CPTDAY132                     N3PF.                               
      @1697   CPTDAY133                     N3PF.                               
      @1700   CPTDAY134                     N3PF.                               
      @1703   CPTDAY135                     N3PF.                               
      @1706   CPTDAY136                     N3PF.                               
      @1709   CPTDAY137                     N3PF.                               
      @1712   CPTDAY138                     N3PF.                               
      @1715   CPTDAY139                     N3PF.                               
      @1718   CPTDAY140                     N3PF.                               
      @1721   CPTDAY141                     N3PF.                               
      @1724   CPTDAY142                     N3PF.                               
      @1727   CPTDAY143                     N3PF.                               
      @1730   CPTDAY144                     N3PF.                               
      @1733   CPTDAY145                     N3PF.                               
      @1736   CPTDAY146                     N3PF.                               
      @1739   CPTDAY147                     N3PF.                               
      @1742   CPTDAY148                     N3PF.                               
      @1745   CPTDAY149                     N3PF.                               
      @1748   CPTDAY150                     N3PF.                               
      @1751   CPTDAY151                     N3PF.                               
      @1754   CPTDAY152                     N3PF.                               
      @1757   CPTDAY153                     N3PF.                               
      @1760   CPTDAY154                     N3PF.                               
      @1763   CPTDAY155                     N3PF.                               
      @1766   CPTDAY156                     N3PF.                               
      @1769   CPTDAY157                     N3PF.                               
      @1772   CPTDAY158                     N3PF.                               
      @1775   CPTDAY159                     N3PF.                               
      @1778   CPTDAY160                     N3PF.                               
      @1781   DaysToEvent                   N6PF.                               
      @1787   DHOUR                         N4PF.                               
      @1791   DIED                          N2PF.                               
      @1793   DISP_X                        $CHAR2.                             
      @1795   DISPUB04                      N2PF.                               
      @1797   DISPUNIFORM                   N2PF.                               
      @1799   DMONTH                        N2PF.                               
      @1801   DQTR                          N2PF.                               
      @1803   DRG                           N3PF.                               
      @1806   DRG_NoPOA                     N3PF.                               
      @1809   DRGVER                        N2PF.                               
      @1811   DXPOA1                        $CHAR1.                             
      @1812   DXPOA2                        $CHAR1.                             
      @1813   DXPOA3                        $CHAR1.                             
      @1814   DXPOA4                        $CHAR1.                             
      @1815   DXPOA5                        $CHAR1.                             
      @1816   DXPOA6                        $CHAR1.                             
      @1817   DXPOA7                        $CHAR1.                             
      @1818   DXPOA8                        $CHAR1.                             
      @1819   DXPOA9                        $CHAR1.                             
      @1820   DXPOA10                       $CHAR1.                             
      @1821   DXPOA11                       $CHAR1.                             
      @1822   DXPOA12                       $CHAR1.                             
      @1823   DXPOA13                       $CHAR1.                             
      @1824   DXPOA14                       $CHAR1.                             
      @1825   DXPOA15                       $CHAR1.                             
      @1826   DXPOA16                       $CHAR1.                             
      @1827   DXPOA17                       $CHAR1.                             
      @1828   DXPOA18                       $CHAR1.                             
      @1829   DXPOA19                       $CHAR1.                             
      @1830   DXPOA20                       $CHAR1.                             
      @1831   DXPOA21                       $CHAR1.                             
      @1832   DXPOA22                       $CHAR1.                             
      @1833   DXPOA23                       $CHAR1.                             
      @1834   DXPOA24                       $CHAR1.                             
      @1835   DXPOA25                       $CHAR1.                             
      @1836   DXPOA26                       $CHAR1.                             
      @1837   DXPOA27                       $CHAR1.                             
      @1838   DXPOA28                       $CHAR1.                             
      @1839   DXPOA29                       $CHAR1.                             
      @1840   DXPOA30                       $CHAR1.                             
      @1841   FEMALE                        N2PF.                               
      @1843   HCUP_ED                       N2PF.                               
      @1845   HCUP_OS                       N2PF.                               
      @1847   HISPANIC                      N2PF.                               
      @1849   HISPANIC_X                    $CHAR1.                             
      @1850   HospitalUnit                  N2PF.                               
      @1852   HOSPST                        $CHAR2.                             
      @1854   I10_BIRTH                     N3PF.                               
      @1857   I10_DELIVERY                  N3PF.                               
      @1860   I10_DX_Admitting              $CHAR7.                             
      @1867   I10_DX1                       $CHAR7.                             
      @1874   I10_DX2                       $CHAR7.                             
      @1881   I10_DX3                       $CHAR7.                             
      @1888   I10_DX4                       $CHAR7.                             
      @1895   I10_DX5                       $CHAR7.                             
      @1902   I10_DX6                       $CHAR7.                             
      @1909   I10_DX7                       $CHAR7.                             
      @1916   I10_DX8                       $CHAR7.                             
      @1923   I10_DX9                       $CHAR7.                             
      @1930   I10_DX10                      $CHAR7.                             
      @1937   I10_DX11                      $CHAR7.                             
      @1944   I10_DX12                      $CHAR7.                             
      @1951   I10_DX13                      $CHAR7.                             
      @1958   I10_DX14                      $CHAR7.                             
      @1965   I10_DX15                      $CHAR7.                             
      @1972   I10_DX16                      $CHAR7.                             
      @1979   I10_DX17                      $CHAR7.                             
      @1986   I10_DX18                      $CHAR7.                             
      @1993   I10_DX19                      $CHAR7.                             
      @2000   I10_DX20                      $CHAR7.                             
      @2007   I10_DX21                      $CHAR7.                             
      @2014   I10_DX22                      $CHAR7.                             
      @2021   I10_DX23                      $CHAR7.                             
      @2028   I10_DX24                      $CHAR7.                             
      @2035   I10_DX25                      $CHAR7.                             
      @2042   I10_DX26                      $CHAR7.                             
      @2049   I10_DX27                      $CHAR7.                             
      @2056   I10_DX28                      $CHAR7.                             
      @2063   I10_DX29                      $CHAR7.                             
      @2070   I10_DX30                      $CHAR7.                             
      @2077   I10_NDX                       N3PF.                               
      @2080   I10_NPR                       N3PF.                               
      @2083   I10_PR1                       $CHAR7.                             
      @2090   I10_PR2                       $CHAR7.                             
      @2097   I10_PR3                       $CHAR7.                             
      @2104   I10_PR4                       $CHAR7.                             
      @2111   I10_PR5                       $CHAR7.                             
      @2118   I10_PR6                       $CHAR7.                             
      @2125   I10_PR7                       $CHAR7.                             
      @2132   I10_PR8                       $CHAR7.                             
      @2139   I10_PR9                       $CHAR7.                             
      @2146   I10_PR10                      $CHAR7.                             
      @2153   I10_PR11                      $CHAR7.                             
      @2160   I10_PR12                      $CHAR7.                             
      @2167   I10_PR13                      $CHAR7.                             
      @2174   I10_PR14                      $CHAR7.                             
      @2181   I10_PR15                      $CHAR7.                             
      @2188   I10_PR16                      $CHAR7.                             
      @2195   I10_PR17                      $CHAR7.                             
      @2202   I10_PR18                      $CHAR7.                             
      @2209   I10_PR19                      $CHAR7.                             
      @2216   I10_PR20                      $CHAR7.                             
      @2223   I10_PR21                      $CHAR7.                             
      @2230   I10_PR22                      $CHAR7.                             
      @2237   I10_PR23                      $CHAR7.                             
      @2244   I10_PR24                      $CHAR7.                             
      @2251   I10_PR25                      $CHAR7.                             
      @2258   I10_PR26                      $CHAR7.                             
      @2265   I10_PR27                      $CHAR7.                             
      @2272   I10_PR28                      $CHAR7.                             
      @2279   I10_PR29                      $CHAR7.                             
      @2286   I10_PR30                      $CHAR7.                             
      @2293   I10_PROCTYPE                  N3PF.                               
      @2296   I10_SERVICELINE               N2PF.                               
      @2298   KEY                           15.                                 
      @2313   LOS                           N5PF.                               
      @2318   LOS_X                         N6PF.                               
      @2324   MDC                           N2PF.                               
      @2326   MDC_NoPOA                     N2PF.                               
      @2328   MEDINCSTQ                     N2PF.                               
      @2330   NCPT                          N4PF.                               
      @2334   OBSERVATION                   N4PF.                               
      @2338   OS_TIME                       N11P2F.                             
      @2349   P7EDSRC_X                     $CHAR2.                             
      @2351   PAY1                          N2PF.                               
      @2353   PAY1_X                        $CHAR2.                             
      @2355   PAY2                          N2PF.                               
      @2357   PAY2_X                        $CHAR2.                             
      @2359   PAY3                          N2PF.                               
      @2361   PAY3_X                        $CHAR2.                             
      @2363   PCLASS_ORPROC                 N2PF.                               
      @2365   PL_CBSA                       N3PF.                               
      @2368   PL_NCHS                       N2PF.                               
      @2370   POA_Disch_Edit1               N2PF.                               
      @2372   POA_Disch_Edit2               N2PF.                               
      @2374   POA_Hosp_Edit1                N2PF.                               
      @2376   POA_Hosp_Edit2                N2PF.                               
      @2378   POA_Hosp_Edit3                N2PF.                               
      @2380   POA_Hosp_Edit3_Value          N8P2F.                              
      @2388   PointOfOrigin_X               $CHAR1.                             
      @2389   PointOfOriginUB04             $CHAR1.                             
      @2390   PRDAY1                        N5PF.                               
      @2395   PRDAY2                        N5PF.                               
      @2400   PRDAY3                        N5PF.                               
      @2405   PRDAY4                        N5PF.                               
      @2410   PRDAY5                        N5PF.                               
      @2415   PRDAY6                        N5PF.                               
      @2420   PRDAY7                        N5PF.                               
      @2425   PRDAY8                        N5PF.                               
      @2430   PRDAY9                        N5PF.                               
      @2435   PRDAY10                       N5PF.                               
      @2440   PRDAY11                       N5PF.                               
      @2445   PRDAY12                       N5PF.                               
      @2450   PRDAY13                       N5PF.                               
      @2455   PRDAY14                       N5PF.                               
      @2460   PRDAY15                       N5PF.                               
      @2465   PRDAY16                       N5PF.                               
      @2470   PRDAY17                       N5PF.                               
      @2475   PRDAY18                       N5PF.                               
      @2480   PRDAY19                       N5PF.                               
      @2485   PRDAY20                       N5PF.                               
      @2490   PRDAY21                       N5PF.                               
      @2495   PRDAY22                       N5PF.                               
      @2500   PRDAY23                       N5PF.                               
      @2505   PRDAY24                       N5PF.                               
      @2510   PRDAY25                       N5PF.                               
      @2515   PRDAY26                       N5PF.                               
      @2520   PRDAY27                       N5PF.                               
      @2525   PRDAY28                       N5PF.                               
      @2530   PRDAY29                       N5PF.                               
      @2535   PRDAY30                       N5PF.                               
      @2540   PSTATE                        $CHAR2.                             
      @2542   PSTATE_GEO                    $CHAR2.                             
      @2544   RACE                          N2PF.                               
      @2546   RACE_PCT_MISS_HOSP            N7P2F.                              
      @2553   RACE_X                        $CHAR1.                             
      @2554   TOTCHG                        N10PF.                              
      @2564   TOTCHG_X                      N15P2F.                             
      @2579   TRAN_IN                       N2PF.                               
      @2581   TRAN_OUT                      N2PF.                               
      @2583   VisitLink                     N9PF.                               
      @2592   YEAR                          N4PF.                               
      @2596   ZIPINC_QRTL                   N3PF.                               
      @2599   HOSPID                        N5PF.                               
      @2604   AYEAR                         N4PF.                               
      @2608   BMONTH                        N2PF.                               
      @2610   BYEAR                         N4PF.                               
      @2614   PRMONTH1                      N2PF.                               
      @2616   PRMONTH2                      N2PF.                               
      @2618   PRMONTH3                      N2PF.                               
      @2620   PRMONTH4                      N2PF.                               
      @2622   PRMONTH5                      N2PF.                               
      @2624   PRMONTH6                      N2PF.                               
      @2626   PRMONTH7                      N2PF.                               
      @2628   PRMONTH8                      N2PF.                               
      @2630   PRMONTH9                      N2PF.                               
      @2632   PRMONTH10                     N2PF.                               
      @2634   PRMONTH11                     N2PF.                               
      @2636   PRMONTH12                     N2PF.                               
      @2638   PRMONTH13                     N2PF.                               
      @2640   PRMONTH14                     N2PF.                               
      @2642   PRMONTH15                     N2PF.                               
      @2644   PRMONTH16                     N2PF.                               
      @2646   PRMONTH17                     N2PF.                               
      @2648   PRMONTH18                     N2PF.                               
      @2650   PRMONTH19                     N2PF.                               
      @2652   PRMONTH20                     N2PF.                               
      @2654   PRMONTH21                     N2PF.                               
      @2656   PRMONTH22                     N2PF.                               
      @2658   PRMONTH23                     N2PF.                               
      @2660   PRMONTH24                     N2PF.                               
      @2662   PRMONTH25                     N2PF.                               
      @2664   PRMONTH26                     N2PF.                               
      @2666   PRMONTH27                     N2PF.                               
      @2668   PRMONTH28                     N2PF.                               
      @2670   PRMONTH29                     N2PF.                               
      @2672   PRMONTH30                     N2PF.                               
      @2674   PRYEAR1                       N4PF.                               
      @2678   PRYEAR2                       N4PF.                               
      @2682   PRYEAR3                       N4PF.                               
      @2686   PRYEAR4                       N4PF.                               
      @2690   PRYEAR5                       N4PF.                               
      @2694   PRYEAR6                       N4PF.                               
      @2698   PRYEAR7                       N4PF.                               
      @2702   PRYEAR8                       N4PF.                               
      @2706   PRYEAR9                       N4PF.                               
      @2710   PRYEAR10                      N4PF.                               
      @2714   PRYEAR11                      N4PF.                               
      @2718   PRYEAR12                      N4PF.                               
      @2722   PRYEAR13                      N4PF.                               
      @2726   PRYEAR14                      N4PF.                               
      @2730   PRYEAR15                      N4PF.                               
      @2734   PRYEAR16                      N4PF.                               
      @2738   PRYEAR17                      N4PF.                               
      @2742   PRYEAR18                      N4PF.                               
      @2746   PRYEAR19                      N4PF.                               
      @2750   PRYEAR20                      N4PF.                               
      @2754   PRYEAR21                      N4PF.                               
      @2758   PRYEAR22                      N4PF.                               
      @2762   PRYEAR23                      N4PF.                               
      @2766   PRYEAR24                      N4PF.                               
      @2770   PRYEAR25                      N4PF.                               
      @2774   PRYEAR26                      N4PF.                               
      @2778   PRYEAR27                      N4PF.                               
      @2782   PRYEAR28                      N4PF.                               
      @2786   PRYEAR29                      N4PF.                               
      @2790   PRYEAR30                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
