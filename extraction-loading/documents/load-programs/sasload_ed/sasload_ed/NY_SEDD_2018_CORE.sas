/*******************************************************************            
* Creation Date: 01/12/2022                                                     
*   NY_SEDD_2018_CORE.SAS:                                                      
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
DATA NY_SEDDC_2018_CORE;                                                        
INFILE 'NY_SEDD_2018_CORE.ASC' FIRSTOBS=3 LRECL = 3662;                         
                                                                                
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
                                                                                
  BLOOD                      LENGTH=4                                           
  LABEL="Pints of blood furnished to the patient"                               
                                                                                
  BP_DIASTOLIC_X             LENGTH=3                                           
  LABEL="Diastolic blood pressure of the patient, as received from data source" 
                                                                                
  BP_SYSTOLIC_X              LENGTH=3                                           
  LABEL="Systolic blood pressure of the patient, as received from data source"  
                                                                                
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
                                                                                
  HEART_RATE_X               LENGTH=3                                           
  LABEL="Heart rate of the patient, as received from data source"               
                                                                                
  HISPANIC                   LENGTH=3                                           
  LABEL="Hispanic ethnicity (uniform)"                                          
                                                                                
  HISPANIC_X                 LENGTH=$49                                         
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  Homeless                   LENGTH=3                                           
  LABEL="Indicator that patient is homeless"                                    
                                                                                
  HOSP_NPI                   LENGTH=$10                                         
  LABEL="Hospital NPI"                                                          
                                                                                
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
                                                                                
  I10_DX30                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 30"                                                
                                                                                
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
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures for this visit"                         
                                                                                
  OPservice                  LENGTH=$1                                          
  LABEL="Indicator of outpatient service (as received from source)"             
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$5                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$5                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$5                                          
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
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO                      LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X                     LENGTH=$95                                         
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
      @10     AHOUR                         N4PF.                               
      @14     AMONTH                        N2PF.                               
      @16     ATYPE                         N2PF.                               
      @18     AWEEKEND                      N2PF.                               
      @20     BLOOD                         N6PF.                               
      @26     BP_DIASTOLIC_X                N4PF.                               
      @30     BP_SYSTOLIC_X                 N4PF.                               
      @34     CPT1                          $CHAR5.                             
      @39     CPT2                          $CHAR5.                             
      @44     CPT3                          $CHAR5.                             
      @49     CPT4                          $CHAR5.                             
      @54     CPT5                          $CHAR5.                             
      @59     CPT6                          $CHAR5.                             
      @64     CPT7                          $CHAR5.                             
      @69     CPT8                          $CHAR5.                             
      @74     CPT9                          $CHAR5.                             
      @79     CPT10                         $CHAR5.                             
      @84     CPT11                         $CHAR5.                             
      @89     CPT12                         $CHAR5.                             
      @94     CPT13                         $CHAR5.                             
      @99     CPT14                         $CHAR5.                             
      @104    CPT15                         $CHAR5.                             
      @109    CPT16                         $CHAR5.                             
      @114    CPT17                         $CHAR5.                             
      @119    CPT18                         $CHAR5.                             
      @124    CPT19                         $CHAR5.                             
      @129    CPT20                         $CHAR5.                             
      @134    CPT21                         $CHAR5.                             
      @139    CPT22                         $CHAR5.                             
      @144    CPT23                         $CHAR5.                             
      @149    CPT24                         $CHAR5.                             
      @154    CPT25                         $CHAR5.                             
      @159    CPT26                         $CHAR5.                             
      @164    CPT27                         $CHAR5.                             
      @169    CPT28                         $CHAR5.                             
      @174    CPT29                         $CHAR5.                             
      @179    CPT30                         $CHAR5.                             
      @184    CPT31                         $CHAR5.                             
      @189    CPT32                         $CHAR5.                             
      @194    CPT33                         $CHAR5.                             
      @199    CPT34                         $CHAR5.                             
      @204    CPT35                         $CHAR5.                             
      @209    CPT36                         $CHAR5.                             
      @214    CPT37                         $CHAR5.                             
      @219    CPT38                         $CHAR5.                             
      @224    CPT39                         $CHAR5.                             
      @229    CPT40                         $CHAR5.                             
      @234    CPT41                         $CHAR5.                             
      @239    CPT42                         $CHAR5.                             
      @244    CPT43                         $CHAR5.                             
      @249    CPT44                         $CHAR5.                             
      @254    CPT45                         $CHAR5.                             
      @259    CPT46                         $CHAR5.                             
      @264    CPT47                         $CHAR5.                             
      @269    CPT48                         $CHAR5.                             
      @274    CPT49                         $CHAR5.                             
      @279    CPT50                         $CHAR5.                             
      @284    CPT51                         $CHAR5.                             
      @289    CPT52                         $CHAR5.                             
      @294    CPT53                         $CHAR5.                             
      @299    CPT54                         $CHAR5.                             
      @304    CPT55                         $CHAR5.                             
      @309    CPT56                         $CHAR5.                             
      @314    CPT57                         $CHAR5.                             
      @319    CPT58                         $CHAR5.                             
      @324    CPT59                         $CHAR5.                             
      @329    CPT60                         $CHAR5.                             
      @334    CPT61                         $CHAR5.                             
      @339    CPT62                         $CHAR5.                             
      @344    CPT63                         $CHAR5.                             
      @349    CPT64                         $CHAR5.                             
      @354    CPT65                         $CHAR5.                             
      @359    CPT66                         $CHAR5.                             
      @364    CPT67                         $CHAR5.                             
      @369    CPT68                         $CHAR5.                             
      @374    CPT69                         $CHAR5.                             
      @379    CPT70                         $CHAR5.                             
      @384    CPT71                         $CHAR5.                             
      @389    CPT72                         $CHAR5.                             
      @394    CPT73                         $CHAR5.                             
      @399    CPT74                         $CHAR5.                             
      @404    CPT75                         $CHAR5.                             
      @409    CPT76                         $CHAR5.                             
      @414    CPT77                         $CHAR5.                             
      @419    CPT78                         $CHAR5.                             
      @424    CPT79                         $CHAR5.                             
      @429    CPT80                         $CHAR5.                             
      @434    CPT81                         $CHAR5.                             
      @439    CPT82                         $CHAR5.                             
      @444    CPT83                         $CHAR5.                             
      @449    CPT84                         $CHAR5.                             
      @454    CPT85                         $CHAR5.                             
      @459    CPT86                         $CHAR5.                             
      @464    CPT87                         $CHAR5.                             
      @469    CPT88                         $CHAR5.                             
      @474    CPT89                         $CHAR5.                             
      @479    CPT90                         $CHAR5.                             
      @484    CPT91                         $CHAR5.                             
      @489    CPT92                         $CHAR5.                             
      @494    CPT93                         $CHAR5.                             
      @499    CPT94                         $CHAR5.                             
      @504    CPT95                         $CHAR5.                             
      @509    CPT96                         $CHAR5.                             
      @514    CPT97                         $CHAR5.                             
      @519    CPT98                         $CHAR5.                             
      @524    CPT99                         $CHAR5.                             
      @529    CPT100                        $CHAR5.                             
      @534    CPT101                        $CHAR5.                             
      @539    CPT102                        $CHAR5.                             
      @544    CPT103                        $CHAR5.                             
      @549    CPT104                        $CHAR5.                             
      @554    CPT105                        $CHAR5.                             
      @559    CPT106                        $CHAR5.                             
      @564    CPT107                        $CHAR5.                             
      @569    CPT108                        $CHAR5.                             
      @574    CPT109                        $CHAR5.                             
      @579    CPT110                        $CHAR5.                             
      @584    CPT111                        $CHAR5.                             
      @589    CPT112                        $CHAR5.                             
      @594    CPT113                        $CHAR5.                             
      @599    CPT114                        $CHAR5.                             
      @604    CPT115                        $CHAR5.                             
      @609    CPT116                        $CHAR5.                             
      @614    CPT117                        $CHAR5.                             
      @619    CPT118                        $CHAR5.                             
      @624    CPT119                        $CHAR5.                             
      @629    CPT120                        $CHAR5.                             
      @634    CPT121                        $CHAR5.                             
      @639    CPT122                        $CHAR5.                             
      @644    CPT123                        $CHAR5.                             
      @649    CPT124                        $CHAR5.                             
      @654    CPT125                        $CHAR5.                             
      @659    CPT126                        $CHAR5.                             
      @664    CPT127                        $CHAR5.                             
      @669    CPT128                        $CHAR5.                             
      @674    CPT129                        $CHAR5.                             
      @679    CPT130                        $CHAR5.                             
      @684    CPT131                        $CHAR5.                             
      @689    CPT132                        $CHAR5.                             
      @694    CPT133                        $CHAR5.                             
      @699    CPT134                        $CHAR5.                             
      @704    CPT135                        $CHAR5.                             
      @709    CPT136                        $CHAR5.                             
      @714    CPT137                        $CHAR5.                             
      @719    CPT138                        $CHAR5.                             
      @724    CPT139                        $CHAR5.                             
      @729    CPT140                        $CHAR5.                             
      @734    CPT141                        $CHAR5.                             
      @739    CPT142                        $CHAR5.                             
      @744    CPT143                        $CHAR5.                             
      @749    CPT144                        $CHAR5.                             
      @754    CPT145                        $CHAR5.                             
      @759    CPT146                        $CHAR5.                             
      @764    CPT147                        $CHAR5.                             
      @769    CPT148                        $CHAR5.                             
      @774    CPT149                        $CHAR5.                             
      @779    CPT150                        $CHAR5.                             
      @784    CPT151                        $CHAR5.                             
      @789    CPT152                        $CHAR5.                             
      @794    CPT153                        $CHAR5.                             
      @799    CPT154                        $CHAR5.                             
      @804    CPT155                        $CHAR5.                             
      @809    CPT156                        $CHAR5.                             
      @814    CPT157                        $CHAR5.                             
      @819    CPT158                        $CHAR5.                             
      @824    CPT159                        $CHAR5.                             
      @829    CPT160                        $CHAR5.                             
      @834    CPT161                        $CHAR5.                             
      @839    CPT162                        $CHAR5.                             
      @844    CPT163                        $CHAR5.                             
      @849    CPT164                        $CHAR5.                             
      @854    CPT165                        $CHAR5.                             
      @859    CPT166                        $CHAR5.                             
      @864    CPT167                        $CHAR5.                             
      @869    CPT168                        $CHAR5.                             
      @874    CPT169                        $CHAR5.                             
      @879    CPT170                        $CHAR5.                             
      @884    CPT171                        $CHAR5.                             
      @889    CPT172                        $CHAR5.                             
      @894    CPT173                        $CHAR5.                             
      @899    CPT174                        $CHAR5.                             
      @904    CPT175                        $CHAR5.                             
      @909    CPT176                        $CHAR5.                             
      @914    CPT177                        $CHAR5.                             
      @919    CPT178                        $CHAR5.                             
      @924    CPT179                        $CHAR5.                             
      @929    CPT180                        $CHAR5.                             
      @934    CPT181                        $CHAR5.                             
      @939    CPT182                        $CHAR5.                             
      @944    CPT183                        $CHAR5.                             
      @949    CPT184                        $CHAR5.                             
      @954    CPT185                        $CHAR5.                             
      @959    CPT186                        $CHAR5.                             
      @964    CPT187                        $CHAR5.                             
      @969    CPT188                        $CHAR5.                             
      @974    CPT189                        $CHAR5.                             
      @979    CPT190                        $CHAR5.                             
      @984    CPT191                        $CHAR5.                             
      @989    CPT192                        $CHAR5.                             
      @994    CPT193                        $CHAR5.                             
      @999    CPT194                        $CHAR5.                             
      @1004   CPT195                        $CHAR5.                             
      @1009   CPT196                        $CHAR5.                             
      @1014   CPT197                        $CHAR5.                             
      @1019   CPT198                        $CHAR5.                             
      @1024   CPT199                        $CHAR5.                             
      @1029   CPT200                        $CHAR5.                             
      @1034   CPTCCS1                       N3PF.                               
      @1037   CPTCCS2                       N3PF.                               
      @1040   CPTCCS3                       N3PF.                               
      @1043   CPTCCS4                       N3PF.                               
      @1046   CPTCCS5                       N3PF.                               
      @1049   CPTCCS6                       N3PF.                               
      @1052   CPTCCS7                       N3PF.                               
      @1055   CPTCCS8                       N3PF.                               
      @1058   CPTCCS9                       N3PF.                               
      @1061   CPTCCS10                      N3PF.                               
      @1064   CPTCCS11                      N3PF.                               
      @1067   CPTCCS12                      N3PF.                               
      @1070   CPTCCS13                      N3PF.                               
      @1073   CPTCCS14                      N3PF.                               
      @1076   CPTCCS15                      N3PF.                               
      @1079   CPTCCS16                      N3PF.                               
      @1082   CPTCCS17                      N3PF.                               
      @1085   CPTCCS18                      N3PF.                               
      @1088   CPTCCS19                      N3PF.                               
      @1091   CPTCCS20                      N3PF.                               
      @1094   CPTCCS21                      N3PF.                               
      @1097   CPTCCS22                      N3PF.                               
      @1100   CPTCCS23                      N3PF.                               
      @1103   CPTCCS24                      N3PF.                               
      @1106   CPTCCS25                      N3PF.                               
      @1109   CPTCCS26                      N3PF.                               
      @1112   CPTCCS27                      N3PF.                               
      @1115   CPTCCS28                      N3PF.                               
      @1118   CPTCCS29                      N3PF.                               
      @1121   CPTCCS30                      N3PF.                               
      @1124   CPTCCS31                      N3PF.                               
      @1127   CPTCCS32                      N3PF.                               
      @1130   CPTCCS33                      N3PF.                               
      @1133   CPTCCS34                      N3PF.                               
      @1136   CPTCCS35                      N3PF.                               
      @1139   CPTCCS36                      N3PF.                               
      @1142   CPTCCS37                      N3PF.                               
      @1145   CPTCCS38                      N3PF.                               
      @1148   CPTCCS39                      N3PF.                               
      @1151   CPTCCS40                      N3PF.                               
      @1154   CPTCCS41                      N3PF.                               
      @1157   CPTCCS42                      N3PF.                               
      @1160   CPTCCS43                      N3PF.                               
      @1163   CPTCCS44                      N3PF.                               
      @1166   CPTCCS45                      N3PF.                               
      @1169   CPTCCS46                      N3PF.                               
      @1172   CPTCCS47                      N3PF.                               
      @1175   CPTCCS48                      N3PF.                               
      @1178   CPTCCS49                      N3PF.                               
      @1181   CPTCCS50                      N3PF.                               
      @1184   CPTCCS51                      N3PF.                               
      @1187   CPTCCS52                      N3PF.                               
      @1190   CPTCCS53                      N3PF.                               
      @1193   CPTCCS54                      N3PF.                               
      @1196   CPTCCS55                      N3PF.                               
      @1199   CPTCCS56                      N3PF.                               
      @1202   CPTCCS57                      N3PF.                               
      @1205   CPTCCS58                      N3PF.                               
      @1208   CPTCCS59                      N3PF.                               
      @1211   CPTCCS60                      N3PF.                               
      @1214   CPTCCS61                      N3PF.                               
      @1217   CPTCCS62                      N3PF.                               
      @1220   CPTCCS63                      N3PF.                               
      @1223   CPTCCS64                      N3PF.                               
      @1226   CPTCCS65                      N3PF.                               
      @1229   CPTCCS66                      N3PF.                               
      @1232   CPTCCS67                      N3PF.                               
      @1235   CPTCCS68                      N3PF.                               
      @1238   CPTCCS69                      N3PF.                               
      @1241   CPTCCS70                      N3PF.                               
      @1244   CPTCCS71                      N3PF.                               
      @1247   CPTCCS72                      N3PF.                               
      @1250   CPTCCS73                      N3PF.                               
      @1253   CPTCCS74                      N3PF.                               
      @1256   CPTCCS75                      N3PF.                               
      @1259   CPTCCS76                      N3PF.                               
      @1262   CPTCCS77                      N3PF.                               
      @1265   CPTCCS78                      N3PF.                               
      @1268   CPTCCS79                      N3PF.                               
      @1271   CPTCCS80                      N3PF.                               
      @1274   CPTCCS81                      N3PF.                               
      @1277   CPTCCS82                      N3PF.                               
      @1280   CPTCCS83                      N3PF.                               
      @1283   CPTCCS84                      N3PF.                               
      @1286   CPTCCS85                      N3PF.                               
      @1289   CPTCCS86                      N3PF.                               
      @1292   CPTCCS87                      N3PF.                               
      @1295   CPTCCS88                      N3PF.                               
      @1298   CPTCCS89                      N3PF.                               
      @1301   CPTCCS90                      N3PF.                               
      @1304   CPTCCS91                      N3PF.                               
      @1307   CPTCCS92                      N3PF.                               
      @1310   CPTCCS93                      N3PF.                               
      @1313   CPTCCS94                      N3PF.                               
      @1316   CPTCCS95                      N3PF.                               
      @1319   CPTCCS96                      N3PF.                               
      @1322   CPTCCS97                      N3PF.                               
      @1325   CPTCCS98                      N3PF.                               
      @1328   CPTCCS99                      N3PF.                               
      @1331   CPTCCS100                     N3PF.                               
      @1334   CPTCCS101                     N3PF.                               
      @1337   CPTCCS102                     N3PF.                               
      @1340   CPTCCS103                     N3PF.                               
      @1343   CPTCCS104                     N3PF.                               
      @1346   CPTCCS105                     N3PF.                               
      @1349   CPTCCS106                     N3PF.                               
      @1352   CPTCCS107                     N3PF.                               
      @1355   CPTCCS108                     N3PF.                               
      @1358   CPTCCS109                     N3PF.                               
      @1361   CPTCCS110                     N3PF.                               
      @1364   CPTCCS111                     N3PF.                               
      @1367   CPTCCS112                     N3PF.                               
      @1370   CPTCCS113                     N3PF.                               
      @1373   CPTCCS114                     N3PF.                               
      @1376   CPTCCS115                     N3PF.                               
      @1379   CPTCCS116                     N3PF.                               
      @1382   CPTCCS117                     N3PF.                               
      @1385   CPTCCS118                     N3PF.                               
      @1388   CPTCCS119                     N3PF.                               
      @1391   CPTCCS120                     N3PF.                               
      @1394   CPTCCS121                     N3PF.                               
      @1397   CPTCCS122                     N3PF.                               
      @1400   CPTCCS123                     N3PF.                               
      @1403   CPTCCS124                     N3PF.                               
      @1406   CPTCCS125                     N3PF.                               
      @1409   CPTCCS126                     N3PF.                               
      @1412   CPTCCS127                     N3PF.                               
      @1415   CPTCCS128                     N3PF.                               
      @1418   CPTCCS129                     N3PF.                               
      @1421   CPTCCS130                     N3PF.                               
      @1424   CPTCCS131                     N3PF.                               
      @1427   CPTCCS132                     N3PF.                               
      @1430   CPTCCS133                     N3PF.                               
      @1433   CPTCCS134                     N3PF.                               
      @1436   CPTCCS135                     N3PF.                               
      @1439   CPTCCS136                     N3PF.                               
      @1442   CPTCCS137                     N3PF.                               
      @1445   CPTCCS138                     N3PF.                               
      @1448   CPTCCS139                     N3PF.                               
      @1451   CPTCCS140                     N3PF.                               
      @1454   CPTCCS141                     N3PF.                               
      @1457   CPTCCS142                     N3PF.                               
      @1460   CPTCCS143                     N3PF.                               
      @1463   CPTCCS144                     N3PF.                               
      @1466   CPTCCS145                     N3PF.                               
      @1469   CPTCCS146                     N3PF.                               
      @1472   CPTCCS147                     N3PF.                               
      @1475   CPTCCS148                     N3PF.                               
      @1478   CPTCCS149                     N3PF.                               
      @1481   CPTCCS150                     N3PF.                               
      @1484   CPTCCS151                     N3PF.                               
      @1487   CPTCCS152                     N3PF.                               
      @1490   CPTCCS153                     N3PF.                               
      @1493   CPTCCS154                     N3PF.                               
      @1496   CPTCCS155                     N3PF.                               
      @1499   CPTCCS156                     N3PF.                               
      @1502   CPTCCS157                     N3PF.                               
      @1505   CPTCCS158                     N3PF.                               
      @1508   CPTCCS159                     N3PF.                               
      @1511   CPTCCS160                     N3PF.                               
      @1514   CPTCCS161                     N3PF.                               
      @1517   CPTCCS162                     N3PF.                               
      @1520   CPTCCS163                     N3PF.                               
      @1523   CPTCCS164                     N3PF.                               
      @1526   CPTCCS165                     N3PF.                               
      @1529   CPTCCS166                     N3PF.                               
      @1532   CPTCCS167                     N3PF.                               
      @1535   CPTCCS168                     N3PF.                               
      @1538   CPTCCS169                     N3PF.                               
      @1541   CPTCCS170                     N3PF.                               
      @1544   CPTCCS171                     N3PF.                               
      @1547   CPTCCS172                     N3PF.                               
      @1550   CPTCCS173                     N3PF.                               
      @1553   CPTCCS174                     N3PF.                               
      @1556   CPTCCS175                     N3PF.                               
      @1559   CPTCCS176                     N3PF.                               
      @1562   CPTCCS177                     N3PF.                               
      @1565   CPTCCS178                     N3PF.                               
      @1568   CPTCCS179                     N3PF.                               
      @1571   CPTCCS180                     N3PF.                               
      @1574   CPTCCS181                     N3PF.                               
      @1577   CPTCCS182                     N3PF.                               
      @1580   CPTCCS183                     N3PF.                               
      @1583   CPTCCS184                     N3PF.                               
      @1586   CPTCCS185                     N3PF.                               
      @1589   CPTCCS186                     N3PF.                               
      @1592   CPTCCS187                     N3PF.                               
      @1595   CPTCCS188                     N3PF.                               
      @1598   CPTCCS189                     N3PF.                               
      @1601   CPTCCS190                     N3PF.                               
      @1604   CPTCCS191                     N3PF.                               
      @1607   CPTCCS192                     N3PF.                               
      @1610   CPTCCS193                     N3PF.                               
      @1613   CPTCCS194                     N3PF.                               
      @1616   CPTCCS195                     N3PF.                               
      @1619   CPTCCS196                     N3PF.                               
      @1622   CPTCCS197                     N3PF.                               
      @1625   CPTCCS198                     N3PF.                               
      @1628   CPTCCS199                     N3PF.                               
      @1631   CPTCCS200                     N3PF.                               
      @1634   CPTDAY1                       N3PF.                               
      @1637   CPTDAY2                       N3PF.                               
      @1640   CPTDAY3                       N3PF.                               
      @1643   CPTDAY4                       N3PF.                               
      @1646   CPTDAY5                       N3PF.                               
      @1649   CPTDAY6                       N3PF.                               
      @1652   CPTDAY7                       N3PF.                               
      @1655   CPTDAY8                       N3PF.                               
      @1658   CPTDAY9                       N3PF.                               
      @1661   CPTDAY10                      N3PF.                               
      @1664   CPTDAY11                      N3PF.                               
      @1667   CPTDAY12                      N3PF.                               
      @1670   CPTDAY13                      N3PF.                               
      @1673   CPTDAY14                      N3PF.                               
      @1676   CPTDAY15                      N3PF.                               
      @1679   CPTDAY16                      N3PF.                               
      @1682   CPTDAY17                      N3PF.                               
      @1685   CPTDAY18                      N3PF.                               
      @1688   CPTDAY19                      N3PF.                               
      @1691   CPTDAY20                      N3PF.                               
      @1694   CPTDAY21                      N3PF.                               
      @1697   CPTDAY22                      N3PF.                               
      @1700   CPTDAY23                      N3PF.                               
      @1703   CPTDAY24                      N3PF.                               
      @1706   CPTDAY25                      N3PF.                               
      @1709   CPTDAY26                      N3PF.                               
      @1712   CPTDAY27                      N3PF.                               
      @1715   CPTDAY28                      N3PF.                               
      @1718   CPTDAY29                      N3PF.                               
      @1721   CPTDAY30                      N3PF.                               
      @1724   CPTDAY31                      N3PF.                               
      @1727   CPTDAY32                      N3PF.                               
      @1730   CPTDAY33                      N3PF.                               
      @1733   CPTDAY34                      N3PF.                               
      @1736   CPTDAY35                      N3PF.                               
      @1739   CPTDAY36                      N3PF.                               
      @1742   CPTDAY37                      N3PF.                               
      @1745   CPTDAY38                      N3PF.                               
      @1748   CPTDAY39                      N3PF.                               
      @1751   CPTDAY40                      N3PF.                               
      @1754   CPTDAY41                      N3PF.                               
      @1757   CPTDAY42                      N3PF.                               
      @1760   CPTDAY43                      N3PF.                               
      @1763   CPTDAY44                      N3PF.                               
      @1766   CPTDAY45                      N3PF.                               
      @1769   CPTDAY46                      N3PF.                               
      @1772   CPTDAY47                      N3PF.                               
      @1775   CPTDAY48                      N3PF.                               
      @1778   CPTDAY49                      N3PF.                               
      @1781   CPTDAY50                      N3PF.                               
      @1784   CPTDAY51                      N3PF.                               
      @1787   CPTDAY52                      N3PF.                               
      @1790   CPTDAY53                      N3PF.                               
      @1793   CPTDAY54                      N3PF.                               
      @1796   CPTDAY55                      N3PF.                               
      @1799   CPTDAY56                      N3PF.                               
      @1802   CPTDAY57                      N3PF.                               
      @1805   CPTDAY58                      N3PF.                               
      @1808   CPTDAY59                      N3PF.                               
      @1811   CPTDAY60                      N3PF.                               
      @1814   CPTDAY61                      N3PF.                               
      @1817   CPTDAY62                      N3PF.                               
      @1820   CPTDAY63                      N3PF.                               
      @1823   CPTDAY64                      N3PF.                               
      @1826   CPTDAY65                      N3PF.                               
      @1829   CPTDAY66                      N3PF.                               
      @1832   CPTDAY67                      N3PF.                               
      @1835   CPTDAY68                      N3PF.                               
      @1838   CPTDAY69                      N3PF.                               
      @1841   CPTDAY70                      N3PF.                               
      @1844   CPTDAY71                      N3PF.                               
      @1847   CPTDAY72                      N3PF.                               
      @1850   CPTDAY73                      N3PF.                               
      @1853   CPTDAY74                      N3PF.                               
      @1856   CPTDAY75                      N3PF.                               
      @1859   CPTDAY76                      N3PF.                               
      @1862   CPTDAY77                      N3PF.                               
      @1865   CPTDAY78                      N3PF.                               
      @1868   CPTDAY79                      N3PF.                               
      @1871   CPTDAY80                      N3PF.                               
      @1874   CPTDAY81                      N3PF.                               
      @1877   CPTDAY82                      N3PF.                               
      @1880   CPTDAY83                      N3PF.                               
      @1883   CPTDAY84                      N3PF.                               
      @1886   CPTDAY85                      N3PF.                               
      @1889   CPTDAY86                      N3PF.                               
      @1892   CPTDAY87                      N3PF.                               
      @1895   CPTDAY88                      N3PF.                               
      @1898   CPTDAY89                      N3PF.                               
      @1901   CPTDAY90                      N3PF.                               
      @1904   CPTDAY91                      N3PF.                               
      @1907   CPTDAY92                      N3PF.                               
      @1910   CPTDAY93                      N3PF.                               
      @1913   CPTDAY94                      N3PF.                               
      @1916   CPTDAY95                      N3PF.                               
      @1919   CPTDAY96                      N3PF.                               
      @1922   CPTDAY97                      N3PF.                               
      @1925   CPTDAY98                      N3PF.                               
      @1928   CPTDAY99                      N3PF.                               
      @1931   CPTDAY100                     N3PF.                               
      @1934   CPTDAY101                     N3PF.                               
      @1937   CPTDAY102                     N3PF.                               
      @1940   CPTDAY103                     N3PF.                               
      @1943   CPTDAY104                     N3PF.                               
      @1946   CPTDAY105                     N3PF.                               
      @1949   CPTDAY106                     N3PF.                               
      @1952   CPTDAY107                     N3PF.                               
      @1955   CPTDAY108                     N3PF.                               
      @1958   CPTDAY109                     N3PF.                               
      @1961   CPTDAY110                     N3PF.                               
      @1964   CPTDAY111                     N3PF.                               
      @1967   CPTDAY112                     N3PF.                               
      @1970   CPTDAY113                     N3PF.                               
      @1973   CPTDAY114                     N3PF.                               
      @1976   CPTDAY115                     N3PF.                               
      @1979   CPTDAY116                     N3PF.                               
      @1982   CPTDAY117                     N3PF.                               
      @1985   CPTDAY118                     N3PF.                               
      @1988   CPTDAY119                     N3PF.                               
      @1991   CPTDAY120                     N3PF.                               
      @1994   CPTDAY121                     N3PF.                               
      @1997   CPTDAY122                     N3PF.                               
      @2000   CPTDAY123                     N3PF.                               
      @2003   CPTDAY124                     N3PF.                               
      @2006   CPTDAY125                     N3PF.                               
      @2009   CPTDAY126                     N3PF.                               
      @2012   CPTDAY127                     N3PF.                               
      @2015   CPTDAY128                     N3PF.                               
      @2018   CPTDAY129                     N3PF.                               
      @2021   CPTDAY130                     N3PF.                               
      @2024   CPTDAY131                     N3PF.                               
      @2027   CPTDAY132                     N3PF.                               
      @2030   CPTDAY133                     N3PF.                               
      @2033   CPTDAY134                     N3PF.                               
      @2036   CPTDAY135                     N3PF.                               
      @2039   CPTDAY136                     N3PF.                               
      @2042   CPTDAY137                     N3PF.                               
      @2045   CPTDAY138                     N3PF.                               
      @2048   CPTDAY139                     N3PF.                               
      @2051   CPTDAY140                     N3PF.                               
      @2054   CPTDAY141                     N3PF.                               
      @2057   CPTDAY142                     N3PF.                               
      @2060   CPTDAY143                     N3PF.                               
      @2063   CPTDAY144                     N3PF.                               
      @2066   CPTDAY145                     N3PF.                               
      @2069   CPTDAY146                     N3PF.                               
      @2072   CPTDAY147                     N3PF.                               
      @2075   CPTDAY148                     N3PF.                               
      @2078   CPTDAY149                     N3PF.                               
      @2081   CPTDAY150                     N3PF.                               
      @2084   CPTDAY151                     N3PF.                               
      @2087   CPTDAY152                     N3PF.                               
      @2090   CPTDAY153                     N3PF.                               
      @2093   CPTDAY154                     N3PF.                               
      @2096   CPTDAY155                     N3PF.                               
      @2099   CPTDAY156                     N3PF.                               
      @2102   CPTDAY157                     N3PF.                               
      @2105   CPTDAY158                     N3PF.                               
      @2108   CPTDAY159                     N3PF.                               
      @2111   CPTDAY160                     N3PF.                               
      @2114   CPTDAY161                     N3PF.                               
      @2117   CPTDAY162                     N3PF.                               
      @2120   CPTDAY163                     N3PF.                               
      @2123   CPTDAY164                     N3PF.                               
      @2126   CPTDAY165                     N3PF.                               
      @2129   CPTDAY166                     N3PF.                               
      @2132   CPTDAY167                     N3PF.                               
      @2135   CPTDAY168                     N3PF.                               
      @2138   CPTDAY169                     N3PF.                               
      @2141   CPTDAY170                     N3PF.                               
      @2144   CPTDAY171                     N3PF.                               
      @2147   CPTDAY172                     N3PF.                               
      @2150   CPTDAY173                     N3PF.                               
      @2153   CPTDAY174                     N3PF.                               
      @2156   CPTDAY175                     N3PF.                               
      @2159   CPTDAY176                     N3PF.                               
      @2162   CPTDAY177                     N3PF.                               
      @2165   CPTDAY178                     N3PF.                               
      @2168   CPTDAY179                     N3PF.                               
      @2171   CPTDAY180                     N3PF.                               
      @2174   CPTDAY181                     N3PF.                               
      @2177   CPTDAY182                     N3PF.                               
      @2180   CPTDAY183                     N3PF.                               
      @2183   CPTDAY184                     N3PF.                               
      @2186   CPTDAY185                     N3PF.                               
      @2189   CPTDAY186                     N3PF.                               
      @2192   CPTDAY187                     N3PF.                               
      @2195   CPTDAY188                     N3PF.                               
      @2198   CPTDAY189                     N3PF.                               
      @2201   CPTDAY190                     N3PF.                               
      @2204   CPTDAY191                     N3PF.                               
      @2207   CPTDAY192                     N3PF.                               
      @2210   CPTDAY193                     N3PF.                               
      @2213   CPTDAY194                     N3PF.                               
      @2216   CPTDAY195                     N3PF.                               
      @2219   CPTDAY196                     N3PF.                               
      @2222   CPTDAY197                     N3PF.                               
      @2225   CPTDAY198                     N3PF.                               
      @2228   CPTDAY199                     N3PF.                               
      @2231   CPTDAY200                     N3PF.                               
      @2234   CPTM1_1                       $CHAR2.                             
      @2236   CPTM1_2                       $CHAR2.                             
      @2238   CPTM1_3                       $CHAR2.                             
      @2240   CPTM1_4                       $CHAR2.                             
      @2242   CPTM1_5                       $CHAR2.                             
      @2244   CPTM1_6                       $CHAR2.                             
      @2246   CPTM1_7                       $CHAR2.                             
      @2248   CPTM1_8                       $CHAR2.                             
      @2250   CPTM1_9                       $CHAR2.                             
      @2252   CPTM1_10                      $CHAR2.                             
      @2254   CPTM1_11                      $CHAR2.                             
      @2256   CPTM1_12                      $CHAR2.                             
      @2258   CPTM1_13                      $CHAR2.                             
      @2260   CPTM1_14                      $CHAR2.                             
      @2262   CPTM1_15                      $CHAR2.                             
      @2264   CPTM1_16                      $CHAR2.                             
      @2266   CPTM1_17                      $CHAR2.                             
      @2268   CPTM1_18                      $CHAR2.                             
      @2270   CPTM1_19                      $CHAR2.                             
      @2272   CPTM1_20                      $CHAR2.                             
      @2274   CPTM1_21                      $CHAR2.                             
      @2276   CPTM1_22                      $CHAR2.                             
      @2278   CPTM1_23                      $CHAR2.                             
      @2280   CPTM1_24                      $CHAR2.                             
      @2282   CPTM1_25                      $CHAR2.                             
      @2284   CPTM1_26                      $CHAR2.                             
      @2286   CPTM1_27                      $CHAR2.                             
      @2288   CPTM1_28                      $CHAR2.                             
      @2290   CPTM1_29                      $CHAR2.                             
      @2292   CPTM1_30                      $CHAR2.                             
      @2294   CPTM1_31                      $CHAR2.                             
      @2296   CPTM1_32                      $CHAR2.                             
      @2298   CPTM1_33                      $CHAR2.                             
      @2300   CPTM1_34                      $CHAR2.                             
      @2302   CPTM1_35                      $CHAR2.                             
      @2304   CPTM1_36                      $CHAR2.                             
      @2306   CPTM1_37                      $CHAR2.                             
      @2308   CPTM1_38                      $CHAR2.                             
      @2310   CPTM1_39                      $CHAR2.                             
      @2312   CPTM1_40                      $CHAR2.                             
      @2314   CPTM1_41                      $CHAR2.                             
      @2316   CPTM1_42                      $CHAR2.                             
      @2318   CPTM1_43                      $CHAR2.                             
      @2320   CPTM1_44                      $CHAR2.                             
      @2322   CPTM1_45                      $CHAR2.                             
      @2324   CPTM1_46                      $CHAR2.                             
      @2326   CPTM1_47                      $CHAR2.                             
      @2328   CPTM1_48                      $CHAR2.                             
      @2330   CPTM1_49                      $CHAR2.                             
      @2332   CPTM1_50                      $CHAR2.                             
      @2334   CPTM1_51                      $CHAR2.                             
      @2336   CPTM1_52                      $CHAR2.                             
      @2338   CPTM1_53                      $CHAR2.                             
      @2340   CPTM1_54                      $CHAR2.                             
      @2342   CPTM1_55                      $CHAR2.                             
      @2344   CPTM1_56                      $CHAR2.                             
      @2346   CPTM1_57                      $CHAR2.                             
      @2348   CPTM1_58                      $CHAR2.                             
      @2350   CPTM1_59                      $CHAR2.                             
      @2352   CPTM1_60                      $CHAR2.                             
      @2354   CPTM1_61                      $CHAR2.                             
      @2356   CPTM1_62                      $CHAR2.                             
      @2358   CPTM1_63                      $CHAR2.                             
      @2360   CPTM1_64                      $CHAR2.                             
      @2362   CPTM1_65                      $CHAR2.                             
      @2364   CPTM1_66                      $CHAR2.                             
      @2366   CPTM1_67                      $CHAR2.                             
      @2368   CPTM1_68                      $CHAR2.                             
      @2370   CPTM1_69                      $CHAR2.                             
      @2372   CPTM1_70                      $CHAR2.                             
      @2374   CPTM1_71                      $CHAR2.                             
      @2376   CPTM1_72                      $CHAR2.                             
      @2378   CPTM1_73                      $CHAR2.                             
      @2380   CPTM1_74                      $CHAR2.                             
      @2382   CPTM1_75                      $CHAR2.                             
      @2384   CPTM1_76                      $CHAR2.                             
      @2386   CPTM1_77                      $CHAR2.                             
      @2388   CPTM1_78                      $CHAR2.                             
      @2390   CPTM1_79                      $CHAR2.                             
      @2392   CPTM1_80                      $CHAR2.                             
      @2394   CPTM1_81                      $CHAR2.                             
      @2396   CPTM1_82                      $CHAR2.                             
      @2398   CPTM1_83                      $CHAR2.                             
      @2400   CPTM1_84                      $CHAR2.                             
      @2402   CPTM1_85                      $CHAR2.                             
      @2404   CPTM1_86                      $CHAR2.                             
      @2406   CPTM1_87                      $CHAR2.                             
      @2408   CPTM1_88                      $CHAR2.                             
      @2410   CPTM1_89                      $CHAR2.                             
      @2412   CPTM1_90                      $CHAR2.                             
      @2414   CPTM1_91                      $CHAR2.                             
      @2416   CPTM1_92                      $CHAR2.                             
      @2418   CPTM1_93                      $CHAR2.                             
      @2420   CPTM1_94                      $CHAR2.                             
      @2422   CPTM1_95                      $CHAR2.                             
      @2424   CPTM1_96                      $CHAR2.                             
      @2426   CPTM1_97                      $CHAR2.                             
      @2428   CPTM1_98                      $CHAR2.                             
      @2430   CPTM1_99                      $CHAR2.                             
      @2432   CPTM1_100                     $CHAR2.                             
      @2434   CPTM1_101                     $CHAR2.                             
      @2436   CPTM1_102                     $CHAR2.                             
      @2438   CPTM1_103                     $CHAR2.                             
      @2440   CPTM1_104                     $CHAR2.                             
      @2442   CPTM1_105                     $CHAR2.                             
      @2444   CPTM1_106                     $CHAR2.                             
      @2446   CPTM1_107                     $CHAR2.                             
      @2448   CPTM1_108                     $CHAR2.                             
      @2450   CPTM1_109                     $CHAR2.                             
      @2452   CPTM1_110                     $CHAR2.                             
      @2454   CPTM1_111                     $CHAR2.                             
      @2456   CPTM1_112                     $CHAR2.                             
      @2458   CPTM1_113                     $CHAR2.                             
      @2460   CPTM1_114                     $CHAR2.                             
      @2462   CPTM1_115                     $CHAR2.                             
      @2464   CPTM1_116                     $CHAR2.                             
      @2466   CPTM1_117                     $CHAR2.                             
      @2468   CPTM1_118                     $CHAR2.                             
      @2470   CPTM1_119                     $CHAR2.                             
      @2472   CPTM1_120                     $CHAR2.                             
      @2474   CPTM1_121                     $CHAR2.                             
      @2476   CPTM1_122                     $CHAR2.                             
      @2478   CPTM1_123                     $CHAR2.                             
      @2480   CPTM1_124                     $CHAR2.                             
      @2482   CPTM1_125                     $CHAR2.                             
      @2484   CPTM1_126                     $CHAR2.                             
      @2486   CPTM1_127                     $CHAR2.                             
      @2488   CPTM1_128                     $CHAR2.                             
      @2490   CPTM1_129                     $CHAR2.                             
      @2492   CPTM1_130                     $CHAR2.                             
      @2494   CPTM1_131                     $CHAR2.                             
      @2496   CPTM1_132                     $CHAR2.                             
      @2498   CPTM1_133                     $CHAR2.                             
      @2500   CPTM1_134                     $CHAR2.                             
      @2502   CPTM1_135                     $CHAR2.                             
      @2504   CPTM1_136                     $CHAR2.                             
      @2506   CPTM1_137                     $CHAR2.                             
      @2508   CPTM1_138                     $CHAR2.                             
      @2510   CPTM1_139                     $CHAR2.                             
      @2512   CPTM1_140                     $CHAR2.                             
      @2514   CPTM1_141                     $CHAR2.                             
      @2516   CPTM1_142                     $CHAR2.                             
      @2518   CPTM1_143                     $CHAR2.                             
      @2520   CPTM1_144                     $CHAR2.                             
      @2522   CPTM1_145                     $CHAR2.                             
      @2524   CPTM1_146                     $CHAR2.                             
      @2526   CPTM1_147                     $CHAR2.                             
      @2528   CPTM1_148                     $CHAR2.                             
      @2530   CPTM1_149                     $CHAR2.                             
      @2532   CPTM1_150                     $CHAR2.                             
      @2534   CPTM1_151                     $CHAR2.                             
      @2536   CPTM1_152                     $CHAR2.                             
      @2538   CPTM1_153                     $CHAR2.                             
      @2540   CPTM1_154                     $CHAR2.                             
      @2542   CPTM1_155                     $CHAR2.                             
      @2544   CPTM1_156                     $CHAR2.                             
      @2546   CPTM1_157                     $CHAR2.                             
      @2548   CPTM1_158                     $CHAR2.                             
      @2550   CPTM1_159                     $CHAR2.                             
      @2552   CPTM1_160                     $CHAR2.                             
      @2554   CPTM1_161                     $CHAR2.                             
      @2556   CPTM1_162                     $CHAR2.                             
      @2558   CPTM1_163                     $CHAR2.                             
      @2560   CPTM1_164                     $CHAR2.                             
      @2562   CPTM1_165                     $CHAR2.                             
      @2564   CPTM1_166                     $CHAR2.                             
      @2566   CPTM1_167                     $CHAR2.                             
      @2568   CPTM1_168                     $CHAR2.                             
      @2570   CPTM1_169                     $CHAR2.                             
      @2572   CPTM1_170                     $CHAR2.                             
      @2574   CPTM1_171                     $CHAR2.                             
      @2576   CPTM1_172                     $CHAR2.                             
      @2578   CPTM1_173                     $CHAR2.                             
      @2580   CPTM1_174                     $CHAR2.                             
      @2582   CPTM1_175                     $CHAR2.                             
      @2584   CPTM1_176                     $CHAR2.                             
      @2586   CPTM1_177                     $CHAR2.                             
      @2588   CPTM1_178                     $CHAR2.                             
      @2590   CPTM1_179                     $CHAR2.                             
      @2592   CPTM1_180                     $CHAR2.                             
      @2594   CPTM1_181                     $CHAR2.                             
      @2596   CPTM1_182                     $CHAR2.                             
      @2598   CPTM1_183                     $CHAR2.                             
      @2600   CPTM1_184                     $CHAR2.                             
      @2602   CPTM1_185                     $CHAR2.                             
      @2604   CPTM1_186                     $CHAR2.                             
      @2606   CPTM1_187                     $CHAR2.                             
      @2608   CPTM1_188                     $CHAR2.                             
      @2610   CPTM1_189                     $CHAR2.                             
      @2612   CPTM1_190                     $CHAR2.                             
      @2614   CPTM1_191                     $CHAR2.                             
      @2616   CPTM1_192                     $CHAR2.                             
      @2618   CPTM1_193                     $CHAR2.                             
      @2620   CPTM1_194                     $CHAR2.                             
      @2622   CPTM1_195                     $CHAR2.                             
      @2624   CPTM1_196                     $CHAR2.                             
      @2626   CPTM1_197                     $CHAR2.                             
      @2628   CPTM1_198                     $CHAR2.                             
      @2630   CPTM1_199                     $CHAR2.                             
      @2632   CPTM1_200                     $CHAR2.                             
      @2634   CPTM2_1                       $CHAR2.                             
      @2636   CPTM2_2                       $CHAR2.                             
      @2638   CPTM2_3                       $CHAR2.                             
      @2640   CPTM2_4                       $CHAR2.                             
      @2642   CPTM2_5                       $CHAR2.                             
      @2644   CPTM2_6                       $CHAR2.                             
      @2646   CPTM2_7                       $CHAR2.                             
      @2648   CPTM2_8                       $CHAR2.                             
      @2650   CPTM2_9                       $CHAR2.                             
      @2652   CPTM2_10                      $CHAR2.                             
      @2654   CPTM2_11                      $CHAR2.                             
      @2656   CPTM2_12                      $CHAR2.                             
      @2658   CPTM2_13                      $CHAR2.                             
      @2660   CPTM2_14                      $CHAR2.                             
      @2662   CPTM2_15                      $CHAR2.                             
      @2664   CPTM2_16                      $CHAR2.                             
      @2666   CPTM2_17                      $CHAR2.                             
      @2668   CPTM2_18                      $CHAR2.                             
      @2670   CPTM2_19                      $CHAR2.                             
      @2672   CPTM2_20                      $CHAR2.                             
      @2674   CPTM2_21                      $CHAR2.                             
      @2676   CPTM2_22                      $CHAR2.                             
      @2678   CPTM2_23                      $CHAR2.                             
      @2680   CPTM2_24                      $CHAR2.                             
      @2682   CPTM2_25                      $CHAR2.                             
      @2684   CPTM2_26                      $CHAR2.                             
      @2686   CPTM2_27                      $CHAR2.                             
      @2688   CPTM2_28                      $CHAR2.                             
      @2690   CPTM2_29                      $CHAR2.                             
      @2692   CPTM2_30                      $CHAR2.                             
      @2694   CPTM2_31                      $CHAR2.                             
      @2696   CPTM2_32                      $CHAR2.                             
      @2698   CPTM2_33                      $CHAR2.                             
      @2700   CPTM2_34                      $CHAR2.                             
      @2702   CPTM2_35                      $CHAR2.                             
      @2704   CPTM2_36                      $CHAR2.                             
      @2706   CPTM2_37                      $CHAR2.                             
      @2708   CPTM2_38                      $CHAR2.                             
      @2710   CPTM2_39                      $CHAR2.                             
      @2712   CPTM2_40                      $CHAR2.                             
      @2714   CPTM2_41                      $CHAR2.                             
      @2716   CPTM2_42                      $CHAR2.                             
      @2718   CPTM2_43                      $CHAR2.                             
      @2720   CPTM2_44                      $CHAR2.                             
      @2722   CPTM2_45                      $CHAR2.                             
      @2724   CPTM2_46                      $CHAR2.                             
      @2726   CPTM2_47                      $CHAR2.                             
      @2728   CPTM2_48                      $CHAR2.                             
      @2730   CPTM2_49                      $CHAR2.                             
      @2732   CPTM2_50                      $CHAR2.                             
      @2734   CPTM2_51                      $CHAR2.                             
      @2736   CPTM2_52                      $CHAR2.                             
      @2738   CPTM2_53                      $CHAR2.                             
      @2740   CPTM2_54                      $CHAR2.                             
      @2742   CPTM2_55                      $CHAR2.                             
      @2744   CPTM2_56                      $CHAR2.                             
      @2746   CPTM2_57                      $CHAR2.                             
      @2748   CPTM2_58                      $CHAR2.                             
      @2750   CPTM2_59                      $CHAR2.                             
      @2752   CPTM2_60                      $CHAR2.                             
      @2754   CPTM2_61                      $CHAR2.                             
      @2756   CPTM2_62                      $CHAR2.                             
      @2758   CPTM2_63                      $CHAR2.                             
      @2760   CPTM2_64                      $CHAR2.                             
      @2762   CPTM2_65                      $CHAR2.                             
      @2764   CPTM2_66                      $CHAR2.                             
      @2766   CPTM2_67                      $CHAR2.                             
      @2768   CPTM2_68                      $CHAR2.                             
      @2770   CPTM2_69                      $CHAR2.                             
      @2772   CPTM2_70                      $CHAR2.                             
      @2774   CPTM2_71                      $CHAR2.                             
      @2776   CPTM2_72                      $CHAR2.                             
      @2778   CPTM2_73                      $CHAR2.                             
      @2780   CPTM2_74                      $CHAR2.                             
      @2782   CPTM2_75                      $CHAR2.                             
      @2784   CPTM2_76                      $CHAR2.                             
      @2786   CPTM2_77                      $CHAR2.                             
      @2788   CPTM2_78                      $CHAR2.                             
      @2790   CPTM2_79                      $CHAR2.                             
      @2792   CPTM2_80                      $CHAR2.                             
      @2794   CPTM2_81                      $CHAR2.                             
      @2796   CPTM2_82                      $CHAR2.                             
      @2798   CPTM2_83                      $CHAR2.                             
      @2800   CPTM2_84                      $CHAR2.                             
      @2802   CPTM2_85                      $CHAR2.                             
      @2804   CPTM2_86                      $CHAR2.                             
      @2806   CPTM2_87                      $CHAR2.                             
      @2808   CPTM2_88                      $CHAR2.                             
      @2810   CPTM2_89                      $CHAR2.                             
      @2812   CPTM2_90                      $CHAR2.                             
      @2814   CPTM2_91                      $CHAR2.                             
      @2816   CPTM2_92                      $CHAR2.                             
      @2818   CPTM2_93                      $CHAR2.                             
      @2820   CPTM2_94                      $CHAR2.                             
      @2822   CPTM2_95                      $CHAR2.                             
      @2824   CPTM2_96                      $CHAR2.                             
      @2826   CPTM2_97                      $CHAR2.                             
      @2828   CPTM2_98                      $CHAR2.                             
      @2830   CPTM2_99                      $CHAR2.                             
      @2832   CPTM2_100                     $CHAR2.                             
      @2834   CPTM2_101                     $CHAR2.                             
      @2836   CPTM2_102                     $CHAR2.                             
      @2838   CPTM2_103                     $CHAR2.                             
      @2840   CPTM2_104                     $CHAR2.                             
      @2842   CPTM2_105                     $CHAR2.                             
      @2844   CPTM2_106                     $CHAR2.                             
      @2846   CPTM2_107                     $CHAR2.                             
      @2848   CPTM2_108                     $CHAR2.                             
      @2850   CPTM2_109                     $CHAR2.                             
      @2852   CPTM2_110                     $CHAR2.                             
      @2854   CPTM2_111                     $CHAR2.                             
      @2856   CPTM2_112                     $CHAR2.                             
      @2858   CPTM2_113                     $CHAR2.                             
      @2860   CPTM2_114                     $CHAR2.                             
      @2862   CPTM2_115                     $CHAR2.                             
      @2864   CPTM2_116                     $CHAR2.                             
      @2866   CPTM2_117                     $CHAR2.                             
      @2868   CPTM2_118                     $CHAR2.                             
      @2870   CPTM2_119                     $CHAR2.                             
      @2872   CPTM2_120                     $CHAR2.                             
      @2874   CPTM2_121                     $CHAR2.                             
      @2876   CPTM2_122                     $CHAR2.                             
      @2878   CPTM2_123                     $CHAR2.                             
      @2880   CPTM2_124                     $CHAR2.                             
      @2882   CPTM2_125                     $CHAR2.                             
      @2884   CPTM2_126                     $CHAR2.                             
      @2886   CPTM2_127                     $CHAR2.                             
      @2888   CPTM2_128                     $CHAR2.                             
      @2890   CPTM2_129                     $CHAR2.                             
      @2892   CPTM2_130                     $CHAR2.                             
      @2894   CPTM2_131                     $CHAR2.                             
      @2896   CPTM2_132                     $CHAR2.                             
      @2898   CPTM2_133                     $CHAR2.                             
      @2900   CPTM2_134                     $CHAR2.                             
      @2902   CPTM2_135                     $CHAR2.                             
      @2904   CPTM2_136                     $CHAR2.                             
      @2906   CPTM2_137                     $CHAR2.                             
      @2908   CPTM2_138                     $CHAR2.                             
      @2910   CPTM2_139                     $CHAR2.                             
      @2912   CPTM2_140                     $CHAR2.                             
      @2914   CPTM2_141                     $CHAR2.                             
      @2916   CPTM2_142                     $CHAR2.                             
      @2918   CPTM2_143                     $CHAR2.                             
      @2920   CPTM2_144                     $CHAR2.                             
      @2922   CPTM2_145                     $CHAR2.                             
      @2924   CPTM2_146                     $CHAR2.                             
      @2926   CPTM2_147                     $CHAR2.                             
      @2928   CPTM2_148                     $CHAR2.                             
      @2930   CPTM2_149                     $CHAR2.                             
      @2932   CPTM2_150                     $CHAR2.                             
      @2934   CPTM2_151                     $CHAR2.                             
      @2936   CPTM2_152                     $CHAR2.                             
      @2938   CPTM2_153                     $CHAR2.                             
      @2940   CPTM2_154                     $CHAR2.                             
      @2942   CPTM2_155                     $CHAR2.                             
      @2944   CPTM2_156                     $CHAR2.                             
      @2946   CPTM2_157                     $CHAR2.                             
      @2948   CPTM2_158                     $CHAR2.                             
      @2950   CPTM2_159                     $CHAR2.                             
      @2952   CPTM2_160                     $CHAR2.                             
      @2954   CPTM2_161                     $CHAR2.                             
      @2956   CPTM2_162                     $CHAR2.                             
      @2958   CPTM2_163                     $CHAR2.                             
      @2960   CPTM2_164                     $CHAR2.                             
      @2962   CPTM2_165                     $CHAR2.                             
      @2964   CPTM2_166                     $CHAR2.                             
      @2966   CPTM2_167                     $CHAR2.                             
      @2968   CPTM2_168                     $CHAR2.                             
      @2970   CPTM2_169                     $CHAR2.                             
      @2972   CPTM2_170                     $CHAR2.                             
      @2974   CPTM2_171                     $CHAR2.                             
      @2976   CPTM2_172                     $CHAR2.                             
      @2978   CPTM2_173                     $CHAR2.                             
      @2980   CPTM2_174                     $CHAR2.                             
      @2982   CPTM2_175                     $CHAR2.                             
      @2984   CPTM2_176                     $CHAR2.                             
      @2986   CPTM2_177                     $CHAR2.                             
      @2988   CPTM2_178                     $CHAR2.                             
      @2990   CPTM2_179                     $CHAR2.                             
      @2992   CPTM2_180                     $CHAR2.                             
      @2994   CPTM2_181                     $CHAR2.                             
      @2996   CPTM2_182                     $CHAR2.                             
      @2998   CPTM2_183                     $CHAR2.                             
      @3000   CPTM2_184                     $CHAR2.                             
      @3002   CPTM2_185                     $CHAR2.                             
      @3004   CPTM2_186                     $CHAR2.                             
      @3006   CPTM2_187                     $CHAR2.                             
      @3008   CPTM2_188                     $CHAR2.                             
      @3010   CPTM2_189                     $CHAR2.                             
      @3012   CPTM2_190                     $CHAR2.                             
      @3014   CPTM2_191                     $CHAR2.                             
      @3016   CPTM2_192                     $CHAR2.                             
      @3018   CPTM2_193                     $CHAR2.                             
      @3020   CPTM2_194                     $CHAR2.                             
      @3022   CPTM2_195                     $CHAR2.                             
      @3024   CPTM2_196                     $CHAR2.                             
      @3026   CPTM2_197                     $CHAR2.                             
      @3028   CPTM2_198                     $CHAR2.                             
      @3030   CPTM2_199                     $CHAR2.                             
      @3032   CPTM2_200                     $CHAR2.                             
      @3034   DaysToEvent                   N6PF.                               
      @3040   DHOUR                         N4PF.                               
      @3044   DIED                          N2PF.                               
      @3046   DISP_X                        $CHAR2.                             
      @3048   DISPUB04                      N2PF.                               
      @3050   DISPUNIFORM                   N2PF.                               
      @3052   DMONTH                        N2PF.                               
      @3054   DQTR                          N2PF.                               
      @3056   DSHOSPID                      $CHAR17.                            
      @3073   DURATION                      N6PF.                               
      @3079   FEMALE                        N2PF.                               
      @3081   HCUP_ED                       N2PF.                               
      @3083   HCUP_OS                       N2PF.                               
      @3085   HEART_RATE_X                  N4PF.                               
      @3089   HISPANIC                      N2PF.                               
      @3091   HISPANIC_X                    $CHAR49.                            
      @3140   Homeless                      N2PF.                               
      @3142   HOSP_NPI                      $CHAR10.                            
      @3152   HOSPST                        $CHAR2.                             
      @3154   I10_DX_Visit_Reason1          $CHAR7.                             
      @3161   I10_DX_Visit_Reason2          $CHAR7.                             
      @3168   I10_DX_Visit_Reason3          $CHAR7.                             
      @3175   I10_DX1                       $CHAR7.                             
      @3182   I10_DX2                       $CHAR7.                             
      @3189   I10_DX3                       $CHAR7.                             
      @3196   I10_DX4                       $CHAR7.                             
      @3203   I10_DX5                       $CHAR7.                             
      @3210   I10_DX6                       $CHAR7.                             
      @3217   I10_DX7                       $CHAR7.                             
      @3224   I10_DX8                       $CHAR7.                             
      @3231   I10_DX9                       $CHAR7.                             
      @3238   I10_DX10                      $CHAR7.                             
      @3245   I10_DX11                      $CHAR7.                             
      @3252   I10_DX12                      $CHAR7.                             
      @3259   I10_DX13                      $CHAR7.                             
      @3266   I10_DX14                      $CHAR7.                             
      @3273   I10_DX15                      $CHAR7.                             
      @3280   I10_DX16                      $CHAR7.                             
      @3287   I10_DX17                      $CHAR7.                             
      @3294   I10_DX18                      $CHAR7.                             
      @3301   I10_DX19                      $CHAR7.                             
      @3308   I10_DX20                      $CHAR7.                             
      @3315   I10_DX21                      $CHAR7.                             
      @3322   I10_DX22                      $CHAR7.                             
      @3329   I10_DX23                      $CHAR7.                             
      @3336   I10_DX24                      $CHAR7.                             
      @3343   I10_DX25                      $CHAR7.                             
      @3350   I10_DX26                      $CHAR7.                             
      @3357   I10_DX27                      $CHAR7.                             
      @3364   I10_DX28                      $CHAR7.                             
      @3371   I10_DX29                      $CHAR7.                             
      @3378   I10_DX30                      $CHAR7.                             
      @3385   I10_NDX                       N3PF.                               
      @3388   I10_PROCTYPE                  N3PF.                               
      @3391   KEY                           15.                                 
      @3406   LOS                           N5PF.                               
      @3411   LOS_X                         N6PF.                               
      @3417   MARITALSTATUS_X               $CHAR1.                             
      @3418   MARITALSTATUSUB04             $CHAR1.                             
      @3419   MDNUM1_R                      N9PF.                               
      @3428   MDNUM2_R                      N9PF.                               
      @3437   MEDINCSTQ                     N2PF.                               
      @3439   NCPT                          N4PF.                               
      @3443   OPservice                     $CHAR1.                             
      @3444   OS_TIME                       N11P2F.                             
      @3455   PAY1                          N2PF.                               
      @3457   PAY1_X                        $CHAR5.                             
      @3462   PAY2                          N2PF.                               
      @3464   PAY2_X                        $CHAR5.                             
      @3469   PAY3                          N2PF.                               
      @3471   PAY3_X                        $CHAR5.                             
      @3476   PL_CBSA                       N3PF.                               
      @3479   PL_NCHS                       N2PF.                               
      @3481   PL_RUCC                       N2PF.                               
      @3483   PL_UIC                        N2PF.                               
      @3485   PL_UR_CAT4                    N2PF.                               
      @3487   PointOfOrigin_X               $CHAR1.                             
      @3488   PointOfOriginUB04             $CHAR1.                             
      @3489   PSTATE                        $CHAR2.                             
      @3491   PSTCO                         N5PF.                               
      @3496   PSTCO2                        N5PF.                               
      @3501   RACE                          N2PF.                               
      @3503   RACE_X                        $CHAR95.                            
      @3598   STATE_AS                      N2PF.                               
      @3600   STATE_ED                      N2PF.                               
      @3602   STATE_OS                      N2PF.                               
      @3604   TOTCHG                        N10PF.                              
      @3614   TOTCHG_X                      N15P2F.                             
      @3629   VisitLink                     N9PF.                               
      @3638   YEAR                          N4PF.                               
      @3642   ZIP                           $CHAR5.                             
      @3647   ZIP3                          $CHAR3.                             
      @3650   ZIPINC_QRTL                   N3PF.                               
      @3653   AYEAR                         N4PF.                               
      @3657   BMONTH                        N2PF.                               
      @3659   BYEAR                         N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
