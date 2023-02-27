/*******************************************************************            
* Creation Date: 09/08/2020                                                     
*   IA_SEDD_2019_CORE.SAS:                                                      
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
DATA IA_SEDDC_2019_CORE;                                                        
INFILE 'IA_SEDD_2019_CORE.ASC' FIRSTOBS=3 LRECL = 2679;                         
                                                                                
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
                                                                                
  DIED                       LENGTH=3                                           
  LABEL="Died during hospitalization"                                           
                                                                                
  DISPUB04                   LENGTH=3                                           
  LABEL="Disposition of patient (UB-04 standard coding)"                        
                                                                                
  DISPUNIFORM                LENGTH=3                                           
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
  DISP_X                     LENGTH=$2                                          
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DMONTH                     LENGTH=3                                           
  LABEL="Discharge month"                                                       
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DaysToEvent                LENGTH=8                                           
  LABEL="Days from 'start date' to admission"                                   
                                                                                
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
                                                                                
  I10_DX_Visit_Reason1       LENGTH=$7                                          
  LABEL="ICD-10-CM Reason for visit diagnosis 1"                                
                                                                                
  I10_DX_Visit_Reason2       LENGTH=$7                                          
  LABEL="ICD-10-CM Reason for visit diagnosis 2"                                
                                                                                
  I10_DX_Visit_Reason3       LENGTH=$7                                          
  LABEL="ICD-10-CM Reason for visit diagnosis 3"                                
                                                                                
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
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTATE_GEO                 LENGTH=$2                                          
  LABEL="Patient State postal code assigned from ZIP Code"                      
                                                                                
  PSTCO                      LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO_GEO                  LENGTH=4                      FORMAT=Z5.           
  LABEL="Counties assigned based on ZIP Code geographic centroids"              
                                                                                
  PointOfOriginUB04          LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, UB-04 standard coding"         
                                                                                
  PointOfOrigin_X            LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, as received from source"       
                                                                                
  PrimLang                   LENGTH=$3                                          
  LABEL="Primary language of patient"                                           
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X                     LENGTH=$4                                          
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
      @516    CPT101                        $CHAR5.                             
      @521    CPT102                        $CHAR5.                             
      @526    CPT103                        $CHAR5.                             
      @531    CPT104                        $CHAR5.                             
      @536    CPT105                        $CHAR5.                             
      @541    CPT106                        $CHAR5.                             
      @546    CPT107                        $CHAR5.                             
      @551    CPT108                        $CHAR5.                             
      @556    CPT109                        $CHAR5.                             
      @561    CPT110                        $CHAR5.                             
      @566    CPT111                        $CHAR5.                             
      @571    CPT112                        $CHAR5.                             
      @576    CPT113                        $CHAR5.                             
      @581    CPT114                        $CHAR5.                             
      @586    CPT115                        $CHAR5.                             
      @591    CPT116                        $CHAR5.                             
      @596    CPT117                        $CHAR5.                             
      @601    CPT118                        $CHAR5.                             
      @606    CPT119                        $CHAR5.                             
      @611    CPT120                        $CHAR5.                             
      @616    CPT121                        $CHAR5.                             
      @621    CPT122                        $CHAR5.                             
      @626    CPT123                        $CHAR5.                             
      @631    CPT124                        $CHAR5.                             
      @636    CPT125                        $CHAR5.                             
      @641    CPT126                        $CHAR5.                             
      @646    CPT127                        $CHAR5.                             
      @651    CPT128                        $CHAR5.                             
      @656    CPT129                        $CHAR5.                             
      @661    CPT130                        $CHAR5.                             
      @666    CPT131                        $CHAR5.                             
      @671    CPT132                        $CHAR5.                             
      @676    CPT133                        $CHAR5.                             
      @681    CPT134                        $CHAR5.                             
      @686    CPT135                        $CHAR5.                             
      @691    CPT136                        $CHAR5.                             
      @696    CPT137                        $CHAR5.                             
      @701    CPTCCS1                       N3PF.                               
      @704    CPTCCS2                       N3PF.                               
      @707    CPTCCS3                       N3PF.                               
      @710    CPTCCS4                       N3PF.                               
      @713    CPTCCS5                       N3PF.                               
      @716    CPTCCS6                       N3PF.                               
      @719    CPTCCS7                       N3PF.                               
      @722    CPTCCS8                       N3PF.                               
      @725    CPTCCS9                       N3PF.                               
      @728    CPTCCS10                      N3PF.                               
      @731    CPTCCS11                      N3PF.                               
      @734    CPTCCS12                      N3PF.                               
      @737    CPTCCS13                      N3PF.                               
      @740    CPTCCS14                      N3PF.                               
      @743    CPTCCS15                      N3PF.                               
      @746    CPTCCS16                      N3PF.                               
      @749    CPTCCS17                      N3PF.                               
      @752    CPTCCS18                      N3PF.                               
      @755    CPTCCS19                      N3PF.                               
      @758    CPTCCS20                      N3PF.                               
      @761    CPTCCS21                      N3PF.                               
      @764    CPTCCS22                      N3PF.                               
      @767    CPTCCS23                      N3PF.                               
      @770    CPTCCS24                      N3PF.                               
      @773    CPTCCS25                      N3PF.                               
      @776    CPTCCS26                      N3PF.                               
      @779    CPTCCS27                      N3PF.                               
      @782    CPTCCS28                      N3PF.                               
      @785    CPTCCS29                      N3PF.                               
      @788    CPTCCS30                      N3PF.                               
      @791    CPTCCS31                      N3PF.                               
      @794    CPTCCS32                      N3PF.                               
      @797    CPTCCS33                      N3PF.                               
      @800    CPTCCS34                      N3PF.                               
      @803    CPTCCS35                      N3PF.                               
      @806    CPTCCS36                      N3PF.                               
      @809    CPTCCS37                      N3PF.                               
      @812    CPTCCS38                      N3PF.                               
      @815    CPTCCS39                      N3PF.                               
      @818    CPTCCS40                      N3PF.                               
      @821    CPTCCS41                      N3PF.                               
      @824    CPTCCS42                      N3PF.                               
      @827    CPTCCS43                      N3PF.                               
      @830    CPTCCS44                      N3PF.                               
      @833    CPTCCS45                      N3PF.                               
      @836    CPTCCS46                      N3PF.                               
      @839    CPTCCS47                      N3PF.                               
      @842    CPTCCS48                      N3PF.                               
      @845    CPTCCS49                      N3PF.                               
      @848    CPTCCS50                      N3PF.                               
      @851    CPTCCS51                      N3PF.                               
      @854    CPTCCS52                      N3PF.                               
      @857    CPTCCS53                      N3PF.                               
      @860    CPTCCS54                      N3PF.                               
      @863    CPTCCS55                      N3PF.                               
      @866    CPTCCS56                      N3PF.                               
      @869    CPTCCS57                      N3PF.                               
      @872    CPTCCS58                      N3PF.                               
      @875    CPTCCS59                      N3PF.                               
      @878    CPTCCS60                      N3PF.                               
      @881    CPTCCS61                      N3PF.                               
      @884    CPTCCS62                      N3PF.                               
      @887    CPTCCS63                      N3PF.                               
      @890    CPTCCS64                      N3PF.                               
      @893    CPTCCS65                      N3PF.                               
      @896    CPTCCS66                      N3PF.                               
      @899    CPTCCS67                      N3PF.                               
      @902    CPTCCS68                      N3PF.                               
      @905    CPTCCS69                      N3PF.                               
      @908    CPTCCS70                      N3PF.                               
      @911    CPTCCS71                      N3PF.                               
      @914    CPTCCS72                      N3PF.                               
      @917    CPTCCS73                      N3PF.                               
      @920    CPTCCS74                      N3PF.                               
      @923    CPTCCS75                      N3PF.                               
      @926    CPTCCS76                      N3PF.                               
      @929    CPTCCS77                      N3PF.                               
      @932    CPTCCS78                      N3PF.                               
      @935    CPTCCS79                      N3PF.                               
      @938    CPTCCS80                      N3PF.                               
      @941    CPTCCS81                      N3PF.                               
      @944    CPTCCS82                      N3PF.                               
      @947    CPTCCS83                      N3PF.                               
      @950    CPTCCS84                      N3PF.                               
      @953    CPTCCS85                      N3PF.                               
      @956    CPTCCS86                      N3PF.                               
      @959    CPTCCS87                      N3PF.                               
      @962    CPTCCS88                      N3PF.                               
      @965    CPTCCS89                      N3PF.                               
      @968    CPTCCS90                      N3PF.                               
      @971    CPTCCS91                      N3PF.                               
      @974    CPTCCS92                      N3PF.                               
      @977    CPTCCS93                      N3PF.                               
      @980    CPTCCS94                      N3PF.                               
      @983    CPTCCS95                      N3PF.                               
      @986    CPTCCS96                      N3PF.                               
      @989    CPTCCS97                      N3PF.                               
      @992    CPTCCS98                      N3PF.                               
      @995    CPTCCS99                      N3PF.                               
      @998    CPTCCS100                     N3PF.                               
      @1001   CPTCCS101                     N3PF.                               
      @1004   CPTCCS102                     N3PF.                               
      @1007   CPTCCS103                     N3PF.                               
      @1010   CPTCCS104                     N3PF.                               
      @1013   CPTCCS105                     N3PF.                               
      @1016   CPTCCS106                     N3PF.                               
      @1019   CPTCCS107                     N3PF.                               
      @1022   CPTCCS108                     N3PF.                               
      @1025   CPTCCS109                     N3PF.                               
      @1028   CPTCCS110                     N3PF.                               
      @1031   CPTCCS111                     N3PF.                               
      @1034   CPTCCS112                     N3PF.                               
      @1037   CPTCCS113                     N3PF.                               
      @1040   CPTCCS114                     N3PF.                               
      @1043   CPTCCS115                     N3PF.                               
      @1046   CPTCCS116                     N3PF.                               
      @1049   CPTCCS117                     N3PF.                               
      @1052   CPTCCS118                     N3PF.                               
      @1055   CPTCCS119                     N3PF.                               
      @1058   CPTCCS120                     N3PF.                               
      @1061   CPTCCS121                     N3PF.                               
      @1064   CPTCCS122                     N3PF.                               
      @1067   CPTCCS123                     N3PF.                               
      @1070   CPTCCS124                     N3PF.                               
      @1073   CPTCCS125                     N3PF.                               
      @1076   CPTCCS126                     N3PF.                               
      @1079   CPTCCS127                     N3PF.                               
      @1082   CPTCCS128                     N3PF.                               
      @1085   CPTCCS129                     N3PF.                               
      @1088   CPTCCS130                     N3PF.                               
      @1091   CPTCCS131                     N3PF.                               
      @1094   CPTCCS132                     N3PF.                               
      @1097   CPTCCS133                     N3PF.                               
      @1100   CPTCCS134                     N3PF.                               
      @1103   CPTCCS135                     N3PF.                               
      @1106   CPTCCS136                     N3PF.                               
      @1109   CPTCCS137                     N3PF.                               
      @1112   CPTDAY1                       N3PF.                               
      @1115   CPTDAY2                       N3PF.                               
      @1118   CPTDAY3                       N3PF.                               
      @1121   CPTDAY4                       N3PF.                               
      @1124   CPTDAY5                       N3PF.                               
      @1127   CPTDAY6                       N3PF.                               
      @1130   CPTDAY7                       N3PF.                               
      @1133   CPTDAY8                       N3PF.                               
      @1136   CPTDAY9                       N3PF.                               
      @1139   CPTDAY10                      N3PF.                               
      @1142   CPTDAY11                      N3PF.                               
      @1145   CPTDAY12                      N3PF.                               
      @1148   CPTDAY13                      N3PF.                               
      @1151   CPTDAY14                      N3PF.                               
      @1154   CPTDAY15                      N3PF.                               
      @1157   CPTDAY16                      N3PF.                               
      @1160   CPTDAY17                      N3PF.                               
      @1163   CPTDAY18                      N3PF.                               
      @1166   CPTDAY19                      N3PF.                               
      @1169   CPTDAY20                      N3PF.                               
      @1172   CPTDAY21                      N3PF.                               
      @1175   CPTDAY22                      N3PF.                               
      @1178   CPTDAY23                      N3PF.                               
      @1181   CPTDAY24                      N3PF.                               
      @1184   CPTDAY25                      N3PF.                               
      @1187   CPTDAY26                      N3PF.                               
      @1190   CPTDAY27                      N3PF.                               
      @1193   CPTDAY28                      N3PF.                               
      @1196   CPTDAY29                      N3PF.                               
      @1199   CPTDAY30                      N3PF.                               
      @1202   CPTDAY31                      N3PF.                               
      @1205   CPTDAY32                      N3PF.                               
      @1208   CPTDAY33                      N3PF.                               
      @1211   CPTDAY34                      N3PF.                               
      @1214   CPTDAY35                      N3PF.                               
      @1217   CPTDAY36                      N3PF.                               
      @1220   CPTDAY37                      N3PF.                               
      @1223   CPTDAY38                      N3PF.                               
      @1226   CPTDAY39                      N3PF.                               
      @1229   CPTDAY40                      N3PF.                               
      @1232   CPTDAY41                      N3PF.                               
      @1235   CPTDAY42                      N3PF.                               
      @1238   CPTDAY43                      N3PF.                               
      @1241   CPTDAY44                      N3PF.                               
      @1244   CPTDAY45                      N3PF.                               
      @1247   CPTDAY46                      N3PF.                               
      @1250   CPTDAY47                      N3PF.                               
      @1253   CPTDAY48                      N3PF.                               
      @1256   CPTDAY49                      N3PF.                               
      @1259   CPTDAY50                      N3PF.                               
      @1262   CPTDAY51                      N3PF.                               
      @1265   CPTDAY52                      N3PF.                               
      @1268   CPTDAY53                      N3PF.                               
      @1271   CPTDAY54                      N3PF.                               
      @1274   CPTDAY55                      N3PF.                               
      @1277   CPTDAY56                      N3PF.                               
      @1280   CPTDAY57                      N3PF.                               
      @1283   CPTDAY58                      N3PF.                               
      @1286   CPTDAY59                      N3PF.                               
      @1289   CPTDAY60                      N3PF.                               
      @1292   CPTDAY61                      N3PF.                               
      @1295   CPTDAY62                      N3PF.                               
      @1298   CPTDAY63                      N3PF.                               
      @1301   CPTDAY64                      N3PF.                               
      @1304   CPTDAY65                      N3PF.                               
      @1307   CPTDAY66                      N3PF.                               
      @1310   CPTDAY67                      N3PF.                               
      @1313   CPTDAY68                      N3PF.                               
      @1316   CPTDAY69                      N3PF.                               
      @1319   CPTDAY70                      N3PF.                               
      @1322   CPTDAY71                      N3PF.                               
      @1325   CPTDAY72                      N3PF.                               
      @1328   CPTDAY73                      N3PF.                               
      @1331   CPTDAY74                      N3PF.                               
      @1334   CPTDAY75                      N3PF.                               
      @1337   CPTDAY76                      N3PF.                               
      @1340   CPTDAY77                      N3PF.                               
      @1343   CPTDAY78                      N3PF.                               
      @1346   CPTDAY79                      N3PF.                               
      @1349   CPTDAY80                      N3PF.                               
      @1352   CPTDAY81                      N3PF.                               
      @1355   CPTDAY82                      N3PF.                               
      @1358   CPTDAY83                      N3PF.                               
      @1361   CPTDAY84                      N3PF.                               
      @1364   CPTDAY85                      N3PF.                               
      @1367   CPTDAY86                      N3PF.                               
      @1370   CPTDAY87                      N3PF.                               
      @1373   CPTDAY88                      N3PF.                               
      @1376   CPTDAY89                      N3PF.                               
      @1379   CPTDAY90                      N3PF.                               
      @1382   CPTDAY91                      N3PF.                               
      @1385   CPTDAY92                      N3PF.                               
      @1388   CPTDAY93                      N3PF.                               
      @1391   CPTDAY94                      N3PF.                               
      @1394   CPTDAY95                      N3PF.                               
      @1397   CPTDAY96                      N3PF.                               
      @1400   CPTDAY97                      N3PF.                               
      @1403   CPTDAY98                      N3PF.                               
      @1406   CPTDAY99                      N3PF.                               
      @1409   CPTDAY100                     N3PF.                               
      @1412   CPTDAY101                     N3PF.                               
      @1415   CPTDAY102                     N3PF.                               
      @1418   CPTDAY103                     N3PF.                               
      @1421   CPTDAY104                     N3PF.                               
      @1424   CPTDAY105                     N3PF.                               
      @1427   CPTDAY106                     N3PF.                               
      @1430   CPTDAY107                     N3PF.                               
      @1433   CPTDAY108                     N3PF.                               
      @1436   CPTDAY109                     N3PF.                               
      @1439   CPTDAY110                     N3PF.                               
      @1442   CPTDAY111                     N3PF.                               
      @1445   CPTDAY112                     N3PF.                               
      @1448   CPTDAY113                     N3PF.                               
      @1451   CPTDAY114                     N3PF.                               
      @1454   CPTDAY115                     N3PF.                               
      @1457   CPTDAY116                     N3PF.                               
      @1460   CPTDAY117                     N3PF.                               
      @1463   CPTDAY118                     N3PF.                               
      @1466   CPTDAY119                     N3PF.                               
      @1469   CPTDAY120                     N3PF.                               
      @1472   CPTDAY121                     N3PF.                               
      @1475   CPTDAY122                     N3PF.                               
      @1478   CPTDAY123                     N3PF.                               
      @1481   CPTDAY124                     N3PF.                               
      @1484   CPTDAY125                     N3PF.                               
      @1487   CPTDAY126                     N3PF.                               
      @1490   CPTDAY127                     N3PF.                               
      @1493   CPTDAY128                     N3PF.                               
      @1496   CPTDAY129                     N3PF.                               
      @1499   CPTDAY130                     N3PF.                               
      @1502   CPTDAY131                     N3PF.                               
      @1505   CPTDAY132                     N3PF.                               
      @1508   CPTDAY133                     N3PF.                               
      @1511   CPTDAY134                     N3PF.                               
      @1514   CPTDAY135                     N3PF.                               
      @1517   CPTDAY136                     N3PF.                               
      @1520   CPTDAY137                     N3PF.                               
      @1523   CPTM1_1                       $CHAR2.                             
      @1525   CPTM1_2                       $CHAR2.                             
      @1527   CPTM1_3                       $CHAR2.                             
      @1529   CPTM1_4                       $CHAR2.                             
      @1531   CPTM1_5                       $CHAR2.                             
      @1533   CPTM1_6                       $CHAR2.                             
      @1535   CPTM1_7                       $CHAR2.                             
      @1537   CPTM1_8                       $CHAR2.                             
      @1539   CPTM1_9                       $CHAR2.                             
      @1541   CPTM1_10                      $CHAR2.                             
      @1543   CPTM1_11                      $CHAR2.                             
      @1545   CPTM1_12                      $CHAR2.                             
      @1547   CPTM1_13                      $CHAR2.                             
      @1549   CPTM1_14                      $CHAR2.                             
      @1551   CPTM1_15                      $CHAR2.                             
      @1553   CPTM1_16                      $CHAR2.                             
      @1555   CPTM1_17                      $CHAR2.                             
      @1557   CPTM1_18                      $CHAR2.                             
      @1559   CPTM1_19                      $CHAR2.                             
      @1561   CPTM1_20                      $CHAR2.                             
      @1563   CPTM1_21                      $CHAR2.                             
      @1565   CPTM1_22                      $CHAR2.                             
      @1567   CPTM1_23                      $CHAR2.                             
      @1569   CPTM1_24                      $CHAR2.                             
      @1571   CPTM1_25                      $CHAR2.                             
      @1573   CPTM1_26                      $CHAR2.                             
      @1575   CPTM1_27                      $CHAR2.                             
      @1577   CPTM1_28                      $CHAR2.                             
      @1579   CPTM1_29                      $CHAR2.                             
      @1581   CPTM1_30                      $CHAR2.                             
      @1583   CPTM1_31                      $CHAR2.                             
      @1585   CPTM1_32                      $CHAR2.                             
      @1587   CPTM1_33                      $CHAR2.                             
      @1589   CPTM1_34                      $CHAR2.                             
      @1591   CPTM1_35                      $CHAR2.                             
      @1593   CPTM1_36                      $CHAR2.                             
      @1595   CPTM1_37                      $CHAR2.                             
      @1597   CPTM1_38                      $CHAR2.                             
      @1599   CPTM1_39                      $CHAR2.                             
      @1601   CPTM1_40                      $CHAR2.                             
      @1603   CPTM1_41                      $CHAR2.                             
      @1605   CPTM1_42                      $CHAR2.                             
      @1607   CPTM1_43                      $CHAR2.                             
      @1609   CPTM1_44                      $CHAR2.                             
      @1611   CPTM1_45                      $CHAR2.                             
      @1613   CPTM1_46                      $CHAR2.                             
      @1615   CPTM1_47                      $CHAR2.                             
      @1617   CPTM1_48                      $CHAR2.                             
      @1619   CPTM1_49                      $CHAR2.                             
      @1621   CPTM1_50                      $CHAR2.                             
      @1623   CPTM1_51                      $CHAR2.                             
      @1625   CPTM1_52                      $CHAR2.                             
      @1627   CPTM1_53                      $CHAR2.                             
      @1629   CPTM1_54                      $CHAR2.                             
      @1631   CPTM1_55                      $CHAR2.                             
      @1633   CPTM1_56                      $CHAR2.                             
      @1635   CPTM1_57                      $CHAR2.                             
      @1637   CPTM1_58                      $CHAR2.                             
      @1639   CPTM1_59                      $CHAR2.                             
      @1641   CPTM1_60                      $CHAR2.                             
      @1643   CPTM1_61                      $CHAR2.                             
      @1645   CPTM1_62                      $CHAR2.                             
      @1647   CPTM1_63                      $CHAR2.                             
      @1649   CPTM1_64                      $CHAR2.                             
      @1651   CPTM1_65                      $CHAR2.                             
      @1653   CPTM1_66                      $CHAR2.                             
      @1655   CPTM1_67                      $CHAR2.                             
      @1657   CPTM1_68                      $CHAR2.                             
      @1659   CPTM1_69                      $CHAR2.                             
      @1661   CPTM1_70                      $CHAR2.                             
      @1663   CPTM1_71                      $CHAR2.                             
      @1665   CPTM1_72                      $CHAR2.                             
      @1667   CPTM1_73                      $CHAR2.                             
      @1669   CPTM1_74                      $CHAR2.                             
      @1671   CPTM1_75                      $CHAR2.                             
      @1673   CPTM1_76                      $CHAR2.                             
      @1675   CPTM1_77                      $CHAR2.                             
      @1677   CPTM1_78                      $CHAR2.                             
      @1679   CPTM1_79                      $CHAR2.                             
      @1681   CPTM1_80                      $CHAR2.                             
      @1683   CPTM1_81                      $CHAR2.                             
      @1685   CPTM1_82                      $CHAR2.                             
      @1687   CPTM1_83                      $CHAR2.                             
      @1689   CPTM1_84                      $CHAR2.                             
      @1691   CPTM1_85                      $CHAR2.                             
      @1693   CPTM1_86                      $CHAR2.                             
      @1695   CPTM1_87                      $CHAR2.                             
      @1697   CPTM1_88                      $CHAR2.                             
      @1699   CPTM1_89                      $CHAR2.                             
      @1701   CPTM1_90                      $CHAR2.                             
      @1703   CPTM1_91                      $CHAR2.                             
      @1705   CPTM1_92                      $CHAR2.                             
      @1707   CPTM1_93                      $CHAR2.                             
      @1709   CPTM1_94                      $CHAR2.                             
      @1711   CPTM1_95                      $CHAR2.                             
      @1713   CPTM1_96                      $CHAR2.                             
      @1715   CPTM1_97                      $CHAR2.                             
      @1717   CPTM1_98                      $CHAR2.                             
      @1719   CPTM1_99                      $CHAR2.                             
      @1721   CPTM1_100                     $CHAR2.                             
      @1723   CPTM1_101                     $CHAR2.                             
      @1725   CPTM1_102                     $CHAR2.                             
      @1727   CPTM1_103                     $CHAR2.                             
      @1729   CPTM1_104                     $CHAR2.                             
      @1731   CPTM1_105                     $CHAR2.                             
      @1733   CPTM1_106                     $CHAR2.                             
      @1735   CPTM1_107                     $CHAR2.                             
      @1737   CPTM1_108                     $CHAR2.                             
      @1739   CPTM1_109                     $CHAR2.                             
      @1741   CPTM1_110                     $CHAR2.                             
      @1743   CPTM1_111                     $CHAR2.                             
      @1745   CPTM1_112                     $CHAR2.                             
      @1747   CPTM1_113                     $CHAR2.                             
      @1749   CPTM1_114                     $CHAR2.                             
      @1751   CPTM1_115                     $CHAR2.                             
      @1753   CPTM1_116                     $CHAR2.                             
      @1755   CPTM1_117                     $CHAR2.                             
      @1757   CPTM1_118                     $CHAR2.                             
      @1759   CPTM1_119                     $CHAR2.                             
      @1761   CPTM1_120                     $CHAR2.                             
      @1763   CPTM1_121                     $CHAR2.                             
      @1765   CPTM1_122                     $CHAR2.                             
      @1767   CPTM1_123                     $CHAR2.                             
      @1769   CPTM1_124                     $CHAR2.                             
      @1771   CPTM1_125                     $CHAR2.                             
      @1773   CPTM1_126                     $CHAR2.                             
      @1775   CPTM1_127                     $CHAR2.                             
      @1777   CPTM1_128                     $CHAR2.                             
      @1779   CPTM1_129                     $CHAR2.                             
      @1781   CPTM1_130                     $CHAR2.                             
      @1783   CPTM1_131                     $CHAR2.                             
      @1785   CPTM1_132                     $CHAR2.                             
      @1787   CPTM1_133                     $CHAR2.                             
      @1789   CPTM1_134                     $CHAR2.                             
      @1791   CPTM1_135                     $CHAR2.                             
      @1793   CPTM1_136                     $CHAR2.                             
      @1795   CPTM1_137                     $CHAR2.                             
      @1797   CPTM2_1                       $CHAR2.                             
      @1799   CPTM2_2                       $CHAR2.                             
      @1801   CPTM2_3                       $CHAR2.                             
      @1803   CPTM2_4                       $CHAR2.                             
      @1805   CPTM2_5                       $CHAR2.                             
      @1807   CPTM2_6                       $CHAR2.                             
      @1809   CPTM2_7                       $CHAR2.                             
      @1811   CPTM2_8                       $CHAR2.                             
      @1813   CPTM2_9                       $CHAR2.                             
      @1815   CPTM2_10                      $CHAR2.                             
      @1817   CPTM2_11                      $CHAR2.                             
      @1819   CPTM2_12                      $CHAR2.                             
      @1821   CPTM2_13                      $CHAR2.                             
      @1823   CPTM2_14                      $CHAR2.                             
      @1825   CPTM2_15                      $CHAR2.                             
      @1827   CPTM2_16                      $CHAR2.                             
      @1829   CPTM2_17                      $CHAR2.                             
      @1831   CPTM2_18                      $CHAR2.                             
      @1833   CPTM2_19                      $CHAR2.                             
      @1835   CPTM2_20                      $CHAR2.                             
      @1837   CPTM2_21                      $CHAR2.                             
      @1839   CPTM2_22                      $CHAR2.                             
      @1841   CPTM2_23                      $CHAR2.                             
      @1843   CPTM2_24                      $CHAR2.                             
      @1845   CPTM2_25                      $CHAR2.                             
      @1847   CPTM2_26                      $CHAR2.                             
      @1849   CPTM2_27                      $CHAR2.                             
      @1851   CPTM2_28                      $CHAR2.                             
      @1853   CPTM2_29                      $CHAR2.                             
      @1855   CPTM2_30                      $CHAR2.                             
      @1857   CPTM2_31                      $CHAR2.                             
      @1859   CPTM2_32                      $CHAR2.                             
      @1861   CPTM2_33                      $CHAR2.                             
      @1863   CPTM2_34                      $CHAR2.                             
      @1865   CPTM2_35                      $CHAR2.                             
      @1867   CPTM2_36                      $CHAR2.                             
      @1869   CPTM2_37                      $CHAR2.                             
      @1871   CPTM2_38                      $CHAR2.                             
      @1873   CPTM2_39                      $CHAR2.                             
      @1875   CPTM2_40                      $CHAR2.                             
      @1877   CPTM2_41                      $CHAR2.                             
      @1879   CPTM2_42                      $CHAR2.                             
      @1881   CPTM2_43                      $CHAR2.                             
      @1883   CPTM2_44                      $CHAR2.                             
      @1885   CPTM2_45                      $CHAR2.                             
      @1887   CPTM2_46                      $CHAR2.                             
      @1889   CPTM2_47                      $CHAR2.                             
      @1891   CPTM2_48                      $CHAR2.                             
      @1893   CPTM2_49                      $CHAR2.                             
      @1895   CPTM2_50                      $CHAR2.                             
      @1897   CPTM2_51                      $CHAR2.                             
      @1899   CPTM2_52                      $CHAR2.                             
      @1901   CPTM2_53                      $CHAR2.                             
      @1903   CPTM2_54                      $CHAR2.                             
      @1905   CPTM2_55                      $CHAR2.                             
      @1907   CPTM2_56                      $CHAR2.                             
      @1909   CPTM2_57                      $CHAR2.                             
      @1911   CPTM2_58                      $CHAR2.                             
      @1913   CPTM2_59                      $CHAR2.                             
      @1915   CPTM2_60                      $CHAR2.                             
      @1917   CPTM2_61                      $CHAR2.                             
      @1919   CPTM2_62                      $CHAR2.                             
      @1921   CPTM2_63                      $CHAR2.                             
      @1923   CPTM2_64                      $CHAR2.                             
      @1925   CPTM2_65                      $CHAR2.                             
      @1927   CPTM2_66                      $CHAR2.                             
      @1929   CPTM2_67                      $CHAR2.                             
      @1931   CPTM2_68                      $CHAR2.                             
      @1933   CPTM2_69                      $CHAR2.                             
      @1935   CPTM2_70                      $CHAR2.                             
      @1937   CPTM2_71                      $CHAR2.                             
      @1939   CPTM2_72                      $CHAR2.                             
      @1941   CPTM2_73                      $CHAR2.                             
      @1943   CPTM2_74                      $CHAR2.                             
      @1945   CPTM2_75                      $CHAR2.                             
      @1947   CPTM2_76                      $CHAR2.                             
      @1949   CPTM2_77                      $CHAR2.                             
      @1951   CPTM2_78                      $CHAR2.                             
      @1953   CPTM2_79                      $CHAR2.                             
      @1955   CPTM2_80                      $CHAR2.                             
      @1957   CPTM2_81                      $CHAR2.                             
      @1959   CPTM2_82                      $CHAR2.                             
      @1961   CPTM2_83                      $CHAR2.                             
      @1963   CPTM2_84                      $CHAR2.                             
      @1965   CPTM2_85                      $CHAR2.                             
      @1967   CPTM2_86                      $CHAR2.                             
      @1969   CPTM2_87                      $CHAR2.                             
      @1971   CPTM2_88                      $CHAR2.                             
      @1973   CPTM2_89                      $CHAR2.                             
      @1975   CPTM2_90                      $CHAR2.                             
      @1977   CPTM2_91                      $CHAR2.                             
      @1979   CPTM2_92                      $CHAR2.                             
      @1981   CPTM2_93                      $CHAR2.                             
      @1983   CPTM2_94                      $CHAR2.                             
      @1985   CPTM2_95                      $CHAR2.                             
      @1987   CPTM2_96                      $CHAR2.                             
      @1989   CPTM2_97                      $CHAR2.                             
      @1991   CPTM2_98                      $CHAR2.                             
      @1993   CPTM2_99                      $CHAR2.                             
      @1995   CPTM2_100                     $CHAR2.                             
      @1997   CPTM2_101                     $CHAR2.                             
      @1999   CPTM2_102                     $CHAR2.                             
      @2001   CPTM2_103                     $CHAR2.                             
      @2003   CPTM2_104                     $CHAR2.                             
      @2005   CPTM2_105                     $CHAR2.                             
      @2007   CPTM2_106                     $CHAR2.                             
      @2009   CPTM2_107                     $CHAR2.                             
      @2011   CPTM2_108                     $CHAR2.                             
      @2013   CPTM2_109                     $CHAR2.                             
      @2015   CPTM2_110                     $CHAR2.                             
      @2017   CPTM2_111                     $CHAR2.                             
      @2019   CPTM2_112                     $CHAR2.                             
      @2021   CPTM2_113                     $CHAR2.                             
      @2023   CPTM2_114                     $CHAR2.                             
      @2025   CPTM2_115                     $CHAR2.                             
      @2027   CPTM2_116                     $CHAR2.                             
      @2029   CPTM2_117                     $CHAR2.                             
      @2031   CPTM2_118                     $CHAR2.                             
      @2033   CPTM2_119                     $CHAR2.                             
      @2035   CPTM2_120                     $CHAR2.                             
      @2037   CPTM2_121                     $CHAR2.                             
      @2039   CPTM2_122                     $CHAR2.                             
      @2041   CPTM2_123                     $CHAR2.                             
      @2043   CPTM2_124                     $CHAR2.                             
      @2045   CPTM2_125                     $CHAR2.                             
      @2047   CPTM2_126                     $CHAR2.                             
      @2049   CPTM2_127                     $CHAR2.                             
      @2051   CPTM2_128                     $CHAR2.                             
      @2053   CPTM2_129                     $CHAR2.                             
      @2055   CPTM2_130                     $CHAR2.                             
      @2057   CPTM2_131                     $CHAR2.                             
      @2059   CPTM2_132                     $CHAR2.                             
      @2061   CPTM2_133                     $CHAR2.                             
      @2063   CPTM2_134                     $CHAR2.                             
      @2065   CPTM2_135                     $CHAR2.                             
      @2067   CPTM2_136                     $CHAR2.                             
      @2069   CPTM2_137                     $CHAR2.                             
      @2071   DIED                          N2PF.                               
      @2073   DISPUB04                      N2PF.                               
      @2075   DISPUNIFORM                   N2PF.                               
      @2077   DISP_X                        $CHAR2.                             
      @2079   DMONTH                        N2PF.                               
      @2081   DQTR                          N2PF.                               
      @2083   DaysToEvent                   N6PF.                               
      @2089   FEMALE                        N2PF.                               
      @2091   HCUP_ED                       N2PF.                               
      @2093   HCUP_OS                       N2PF.                               
      @2095   HISPANIC                      N2PF.                               
      @2097   HISPANIC_X                    $CHAR1.                             
      @2098   HOSPST                        $CHAR2.                             
      @2100   I10_DX1                       $CHAR7.                             
      @2107   I10_DX2                       $CHAR7.                             
      @2114   I10_DX3                       $CHAR7.                             
      @2121   I10_DX4                       $CHAR7.                             
      @2128   I10_DX5                       $CHAR7.                             
      @2135   I10_DX6                       $CHAR7.                             
      @2142   I10_DX7                       $CHAR7.                             
      @2149   I10_DX8                       $CHAR7.                             
      @2156   I10_DX9                       $CHAR7.                             
      @2163   I10_DX10                      $CHAR7.                             
      @2170   I10_DX11                      $CHAR7.                             
      @2177   I10_DX12                      $CHAR7.                             
      @2184   I10_DX13                      $CHAR7.                             
      @2191   I10_DX14                      $CHAR7.                             
      @2198   I10_DX15                      $CHAR7.                             
      @2205   I10_DX16                      $CHAR7.                             
      @2212   I10_DX17                      $CHAR7.                             
      @2219   I10_DX18                      $CHAR7.                             
      @2226   I10_DX19                      $CHAR7.                             
      @2233   I10_DX20                      $CHAR7.                             
      @2240   I10_DX21                      $CHAR7.                             
      @2247   I10_DX22                      $CHAR7.                             
      @2254   I10_DX23                      $CHAR7.                             
      @2261   I10_DX24                      $CHAR7.                             
      @2268   I10_DX25                      $CHAR7.                             
      @2275   I10_DX26                      $CHAR7.                             
      @2282   I10_DX27                      $CHAR7.                             
      @2289   I10_DX28                      $CHAR7.                             
      @2296   I10_DX29                      $CHAR7.                             
      @2303   I10_DX30                      $CHAR7.                             
      @2310   I10_DX31                      $CHAR7.                             
      @2317   I10_DX32                      $CHAR7.                             
      @2324   I10_DX33                      $CHAR7.                             
      @2331   I10_DX34                      $CHAR7.                             
      @2338   I10_DX35                      $CHAR7.                             
      @2345   I10_DX36                      $CHAR7.                             
      @2352   I10_DX37                      $CHAR7.                             
      @2359   I10_DX38                      $CHAR7.                             
      @2366   I10_DX39                      $CHAR7.                             
      @2373   I10_DX40                      $CHAR7.                             
      @2380   I10_DX41                      $CHAR7.                             
      @2387   I10_DX42                      $CHAR7.                             
      @2394   I10_DX43                      $CHAR7.                             
      @2401   I10_DX44                      $CHAR7.                             
      @2408   I10_DX45                      $CHAR7.                             
      @2415   I10_DX46                      $CHAR7.                             
      @2422   I10_DX47                      $CHAR7.                             
      @2429   I10_DX48                      $CHAR7.                             
      @2436   I10_DX49                      $CHAR7.                             
      @2443   I10_DX50                      $CHAR7.                             
      @2450   I10_DX_Visit_Reason1          $CHAR7.                             
      @2457   I10_DX_Visit_Reason2          $CHAR7.                             
      @2464   I10_DX_Visit_Reason3          $CHAR7.                             
      @2471   I10_NDX                       N3PF.                               
      @2474   I10_PROCTYPE                  N3PF.                               
      @2477   KEY                           15.                                 
      @2492   LOS                           N5PF.                               
      @2497   LOS_X                         N6PF.                               
      @2503   MDNUM1_R                      N9PF.                               
      @2512   MDNUM2_R                      N9PF.                               
      @2521   MDNUM3_R                      N9PF.                               
      @2530   MEDINCSTQ                     N2PF.                               
      @2532   MRN_R                         N9PF.                               
      @2541   NCPT                          N4PF.                               
      @2545   OPservice                     $CHAR5.                             
      @2550   OS_TIME                       N11P2F.                             
      @2561   PAY1                          N2PF.                               
      @2563   PAY1_X                        $CHAR4.                             
      @2567   PAY2                          N2PF.                               
      @2569   PAY2_X                        $CHAR4.                             
      @2573   PAY3                          N2PF.                               
      @2575   PAY3_X                        $CHAR4.                             
      @2579   PL_CBSA                       N3PF.                               
      @2582   PL_NCHS                       N2PF.                               
      @2584   PL_RUCC                       N2PF.                               
      @2586   PL_UIC                        N2PF.                               
      @2588   PL_UR_CAT4                    N2PF.                               
      @2590   PSTATE                        $CHAR2.                             
      @2592   PSTATE_GEO                    $CHAR2.                             
      @2594   PSTCO                         N5PF.                               
      @2599   PSTCO_GEO                     N5PF.                               
      @2604   PointOfOriginUB04             $CHAR1.                             
      @2605   PointOfOrigin_X               $CHAR1.                             
      @2606   PrimLang                      $CHAR3.                             
      @2609   RACE                          N2PF.                               
      @2611   RACE_X                        $CHAR4.                             
      @2615   STATE_AS                      N2PF.                               
      @2617   STATE_ED                      N2PF.                               
      @2619   STATE_OS                      N2PF.                               
      @2621   TOTCHG                        N10PF.                              
      @2631   TOTCHG_X                      N15P2F.                             
      @2646   VisitLink                     N9PF.                               
      @2655   YEAR                          N4PF.                               
      @2659   ZIP                           $CHAR5.                             
      @2664   ZIP3                          $CHAR3.                             
      @2667   ZIPINC_QRTL                   N3PF.                               
      @2670   AYEAR                         N4PF.                               
      @2674   BMONTH                        N2PF.                               
      @2676   BYEAR                         N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
