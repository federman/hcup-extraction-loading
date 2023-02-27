/*******************************************************************            
* Creation Date: 11/04/2014                                                     
*   VT_SEDD_2013_CORE.SAS:                                                      
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
DATA VT_SEDDC_2013_CORE;                                                        
INFILE 'VT_SEDD_2013_CORE.ASC' FIRSTOBS=3 LRECL = 1639;                         
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY                     LENGTH=3                                           
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AHOUR                      LENGTH=3                 FORMAT=Z4.                
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
                                                                                
  DSHOSPID                   LENGTH=$17                                         
  LABEL="Data source hospital identifier"                                       
                                                                                
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
                                                                                
  DX7                        LENGTH=$5                                          
  LABEL="Diagnosis 7"                                                           
                                                                                
  DX8                        LENGTH=$5                                          
  LABEL="Diagnosis 8"                                                           
                                                                                
  DX9                        LENGTH=$5                                          
  LABEL="Diagnosis 9"                                                           
                                                                                
  DX10                       LENGTH=$5                                          
  LABEL="Diagnosis 10"                                                          
                                                                                
  DX11                       LENGTH=$5                                          
  LABEL="Diagnosis 11"                                                          
                                                                                
  DX12                       LENGTH=$5                                          
  LABEL="Diagnosis 12"                                                          
                                                                                
  DX13                       LENGTH=$5                                          
  LABEL="Diagnosis 13"                                                          
                                                                                
  DX14                       LENGTH=$5                                          
  LABEL="Diagnosis 14"                                                          
                                                                                
  DX15                       LENGTH=$5                                          
  LABEL="Diagnosis 15"                                                          
                                                                                
  DX16                       LENGTH=$5                                          
  LABEL="Diagnosis 16"                                                          
                                                                                
  DX17                       LENGTH=$5                                          
  LABEL="Diagnosis 17"                                                          
                                                                                
  DX18                       LENGTH=$5                                          
  LABEL="Diagnosis 18"                                                          
                                                                                
  DX19                       LENGTH=$5                                          
  LABEL="Diagnosis 19"                                                          
                                                                                
  DX20                       LENGTH=$5                                          
  LABEL="Diagnosis 20"                                                          
                                                                                
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
                                                                                
  DXCCS7                     LENGTH=4                                           
  LABEL="CCS: diagnosis 7"                                                      
                                                                                
  DXCCS8                     LENGTH=4                                           
  LABEL="CCS: diagnosis 8"                                                      
                                                                                
  DXCCS9                     LENGTH=4                                           
  LABEL="CCS: diagnosis 9"                                                      
                                                                                
  DXCCS10                    LENGTH=4                                           
  LABEL="CCS: diagnosis 10"                                                     
                                                                                
  DXCCS11                    LENGTH=4                                           
  LABEL="CCS: diagnosis 11"                                                     
                                                                                
  DXCCS12                    LENGTH=4                                           
  LABEL="CCS: diagnosis 12"                                                     
                                                                                
  DXCCS13                    LENGTH=4                                           
  LABEL="CCS: diagnosis 13"                                                     
                                                                                
  DXCCS14                    LENGTH=4                                           
  LABEL="CCS: diagnosis 14"                                                     
                                                                                
  DXCCS15                    LENGTH=4                                           
  LABEL="CCS: diagnosis 15"                                                     
                                                                                
  DXCCS16                    LENGTH=4                                           
  LABEL="CCS: diagnosis 16"                                                     
                                                                                
  DXCCS17                    LENGTH=4                                           
  LABEL="CCS: diagnosis 17"                                                     
                                                                                
  DXCCS18                    LENGTH=4                                           
  LABEL="CCS: diagnosis 18"                                                     
                                                                                
  DXCCS19                    LENGTH=4                                           
  LABEL="CCS: diagnosis 19"                                                     
                                                                                
  DXCCS20                    LENGTH=4                                           
  LABEL="CCS: diagnosis 20"                                                     
                                                                                
  DX_Visit_Reason1           LENGTH=$5                                          
  LABEL="Reason for visit diagnosis 1"                                          
                                                                                
  DX_Visit_Reason2           LENGTH=$5                                          
  LABEL="Reason for visit diagnosis 2"                                          
                                                                                
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
                                                                                
  ECODE7                     LENGTH=$5                                          
  LABEL="E code 7"                                                              
                                                                                
  ECODE8                     LENGTH=$5                                          
  LABEL="E code 8"                                                              
                                                                                
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
                                                                                
  E_CCS7                     LENGTH=3                                           
  LABEL="CCS: E Code 7"                                                         
                                                                                
  E_CCS8                     LENGTH=3                                           
  LABEL="CCS: E Code 8"                                                         
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HISPANIC_X                 LENGTH=$1                                          
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  HOSPBRTH                   LENGTH=3                                           
  LABEL="Indicator of birth in this hospital"                                   
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  HOSP_NPI                   LENGTH=$10                                         
  LABEL="Hospital NPI"                                                          
                                                                                
  KEY                        LENGTH=8                 FORMAT=Z15.               
  LABEL="HCUP record identifier"                                                
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
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
                                                                                
  PAYER1_X                   LENGTH=$6                                          
  LABEL="Primary expected payer plan identifier (as received from source)"      
                                                                                
  PAYER2_X                   LENGTH=$6                                          
  LABEL="Secondary expected payer plan identifier (as received from source)"    
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_NCHS                    LENGTH=3                                           
  LABEL="Patient Location: NCHS Urban-Rural Code"                               
                                                                                
  PL_RUCA10_2005             LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, ten levels" 
                                                                                
  PL_RUCA2005                LENGTH=4                 FORMAT=4.1                
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes"             
                                                                                
  PL_RUCA4_2005              LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, four levels"
                                                                                
  PL_RUCC                    LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Continuum Codes(RUCC)"                   
                                                                                
  PL_UIC                     LENGTH=3                                           
  LABEL="Patient location: Urban Influence Codes"                               
                                                                                
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
                                                                                
  PR5                        LENGTH=$4                                          
  LABEL="Procedure 5"                                                           
                                                                                
  PR6                        LENGTH=$4                                          
  LABEL="Procedure 6"                                                           
                                                                                
  PR7                        LENGTH=$4                                          
  LABEL="Procedure 7"                                                           
                                                                                
  PR8                        LENGTH=$4                                          
  LABEL="Procedure 8"                                                           
                                                                                
  PR9                        LENGTH=$4                                          
  LABEL="Procedure 9"                                                           
                                                                                
  PR10                       LENGTH=$4                                          
  LABEL="Procedure 10"                                                          
                                                                                
  PR11                       LENGTH=$4                                          
  LABEL="Procedure 11"                                                          
                                                                                
  PR12                       LENGTH=$4                                          
  LABEL="Procedure 12"                                                          
                                                                                
  PR13                       LENGTH=$4                                          
  LABEL="Procedure 13"                                                          
                                                                                
  PR14                       LENGTH=$4                                          
  LABEL="Procedure 14"                                                          
                                                                                
  PR15                       LENGTH=$4                                          
  LABEL="Procedure 15"                                                          
                                                                                
  PR16                       LENGTH=$4                                          
  LABEL="Procedure 16"                                                          
                                                                                
  PR17                       LENGTH=$4                                          
  LABEL="Procedure 17"                                                          
                                                                                
  PR18                       LENGTH=$4                                          
  LABEL="Procedure 18"                                                          
                                                                                
  PR19                       LENGTH=$4                                          
  LABEL="Procedure 19"                                                          
                                                                                
  PR20                       LENGTH=$4                                          
  LABEL="Procedure 20"                                                          
                                                                                
  PRCCS1                     LENGTH=3                                           
  LABEL="CCS: procedure 1"                                                      
                                                                                
  PRCCS2                     LENGTH=3                                           
  LABEL="CCS: procedure 2"                                                      
                                                                                
  PRCCS3                     LENGTH=3                                           
  LABEL="CCS: procedure 3"                                                      
                                                                                
  PRCCS4                     LENGTH=3                                           
  LABEL="CCS: procedure 4"                                                      
                                                                                
  PRCCS5                     LENGTH=3                                           
  LABEL="CCS: procedure 5"                                                      
                                                                                
  PRCCS6                     LENGTH=3                                           
  LABEL="CCS: procedure 6"                                                      
                                                                                
  PRCCS7                     LENGTH=3                                           
  LABEL="CCS: procedure 7"                                                      
                                                                                
  PRCCS8                     LENGTH=3                                           
  LABEL="CCS: procedure 8"                                                      
                                                                                
  PRCCS9                     LENGTH=3                                           
  LABEL="CCS: procedure 9"                                                      
                                                                                
  PRCCS10                    LENGTH=3                                           
  LABEL="CCS: procedure 10"                                                     
                                                                                
  PRCCS11                    LENGTH=3                                           
  LABEL="CCS: procedure 11"                                                     
                                                                                
  PRCCS12                    LENGTH=3                                           
  LABEL="CCS: procedure 12"                                                     
                                                                                
  PRCCS13                    LENGTH=3                                           
  LABEL="CCS: procedure 13"                                                     
                                                                                
  PRCCS14                    LENGTH=3                                           
  LABEL="CCS: procedure 14"                                                     
                                                                                
  PRCCS15                    LENGTH=3                                           
  LABEL="CCS: procedure 15"                                                     
                                                                                
  PRCCS16                    LENGTH=3                                           
  LABEL="CCS: procedure 16"                                                     
                                                                                
  PRCCS17                    LENGTH=3                                           
  LABEL="CCS: procedure 17"                                                     
                                                                                
  PRCCS18                    LENGTH=3                                           
  LABEL="CCS: procedure 18"                                                     
                                                                                
  PRCCS19                    LENGTH=3                                           
  LABEL="CCS: procedure 19"                                                     
                                                                                
  PRCCS20                    LENGTH=3                                           
  LABEL="CCS: procedure 20"                                                     
                                                                                
  PRDAY1                     LENGTH=4                                           
  LABEL="Number of days from admission to PR1"                                  
                                                                                
  PRDAY2                     LENGTH=4                                           
  LABEL="Number of days from admission to PR2"                                  
                                                                                
  PRDAY3                     LENGTH=4                                           
  LABEL="Number of days from admission to PR3"                                  
                                                                                
  PRDAY4                     LENGTH=4                                           
  LABEL="Number of days from admission to PR4"                                  
                                                                                
  PRDAY5                     LENGTH=4                                           
  LABEL="Number of days from admission to PR5"                                  
                                                                                
  PRDAY6                     LENGTH=4                                           
  LABEL="Number of days from admission to PR6"                                  
                                                                                
  PRDAY7                     LENGTH=4                                           
  LABEL="Number of days from admission to PR7"                                  
                                                                                
  PRDAY8                     LENGTH=4                                           
  LABEL="Number of days from admission to PR8"                                  
                                                                                
  PRDAY9                     LENGTH=4                                           
  LABEL="Number of days from admission to PR9"                                  
                                                                                
  PRDAY10                    LENGTH=4                                           
  LABEL="Number of days from admission to PR10"                                 
                                                                                
  PRDAY11                    LENGTH=4                                           
  LABEL="Number of days from admission to PR11"                                 
                                                                                
  PRDAY12                    LENGTH=4                                           
  LABEL="Number of days from admission to PR12"                                 
                                                                                
  PRDAY13                    LENGTH=4                                           
  LABEL="Number of days from admission to PR13"                                 
                                                                                
  PRDAY14                    LENGTH=4                                           
  LABEL="Number of days from admission to PR14"                                 
                                                                                
  PRDAY15                    LENGTH=4                                           
  LABEL="Number of days from admission to PR15"                                 
                                                                                
  PRDAY16                    LENGTH=4                                           
  LABEL="Number of days from admission to PR16"                                 
                                                                                
  PRDAY17                    LENGTH=4                                           
  LABEL="Number of days from admission to PR17"                                 
                                                                                
  PRDAY18                    LENGTH=4                                           
  LABEL="Number of days from admission to PR18"                                 
                                                                                
  PRDAY19                    LENGTH=4                                           
  LABEL="Number of days from admission to PR19"                                 
                                                                                
  PRDAY20                    LENGTH=4                                           
  LABEL="Number of days from admission to PR20"                                 
                                                                                
  PROCTYPE                   LENGTH=3                                           
  LABEL="Procedure type indicator"                                              
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO                      LENGTH=4                 FORMAT=Z5.                
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO2                     LENGTH=4                 FORMAT=Z5.                
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  PointOfOriginUB04          LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, UB-04 standard coding"         
                                                                                
  PointOfOrigin_X            LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, as received from source"       
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_X                     LENGTH=$1                                          
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
                                                                                
  VisitLink                  LENGTH=8                                           
  LABEL="Visit linkage variable"                                                
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  TOWN                       LENGTH=$4                                          
  LABEL="Patient town of residence (as received from source)"                   
                                                                                
  ZIP                        LENGTH=$5                                          
  LABEL="Patient ZIP Code"                                                      
                                                                                
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                      N3PF.                                    
      @4      AGEDAY                   N3PF.                                    
      @7      AGEMONTH                 N3PF.                                    
      @10     AHOUR                    N4PF.                                    
      @14     AMONTH                   N2PF.                                    
      @16     ATYPE                    N2PF.                                    
      @18     AWEEKEND                 N2PF.                                    
      @20     BILLTYPE                 $CHAR4.                                  
      @24     CPT1                     $CHAR5.                                  
      @29     CPT2                     $CHAR5.                                  
      @34     CPT3                     $CHAR5.                                  
      @39     CPT4                     $CHAR5.                                  
      @44     CPT5                     $CHAR5.                                  
      @49     CPT6                     $CHAR5.                                  
      @54     CPT7                     $CHAR5.                                  
      @59     CPT8                     $CHAR5.                                  
      @64     CPT9                     $CHAR5.                                  
      @69     CPT10                    $CHAR5.                                  
      @74     CPT11                    $CHAR5.                                  
      @79     CPT12                    $CHAR5.                                  
      @84     CPT13                    $CHAR5.                                  
      @89     CPT14                    $CHAR5.                                  
      @94     CPT15                    $CHAR5.                                  
      @99     CPT16                    $CHAR5.                                  
      @104    CPT17                    $CHAR5.                                  
      @109    CPT18                    $CHAR5.                                  
      @114    CPT19                    $CHAR5.                                  
      @119    CPT20                    $CHAR5.                                  
      @124    CPT21                    $CHAR5.                                  
      @129    CPT22                    $CHAR5.                                  
      @134    CPT23                    $CHAR5.                                  
      @139    CPT24                    $CHAR5.                                  
      @144    CPT25                    $CHAR5.                                  
      @149    CPT26                    $CHAR5.                                  
      @154    CPT27                    $CHAR5.                                  
      @159    CPT28                    $CHAR5.                                  
      @164    CPT29                    $CHAR5.                                  
      @169    CPT30                    $CHAR5.                                  
      @174    CPT31                    $CHAR5.                                  
      @179    CPT32                    $CHAR5.                                  
      @184    CPT33                    $CHAR5.                                  
      @189    CPT34                    $CHAR5.                                  
      @194    CPT35                    $CHAR5.                                  
      @199    CPT36                    $CHAR5.                                  
      @204    CPT37                    $CHAR5.                                  
      @209    CPT38                    $CHAR5.                                  
      @214    CPT39                    $CHAR5.                                  
      @219    CPT40                    $CHAR5.                                  
      @224    CPT41                    $CHAR5.                                  
      @229    CPT42                    $CHAR5.                                  
      @234    CPT43                    $CHAR5.                                  
      @239    CPT44                    $CHAR5.                                  
      @244    CPT45                    $CHAR5.                                  
      @249    CPT46                    $CHAR5.                                  
      @254    CPT47                    $CHAR5.                                  
      @259    CPT48                    $CHAR5.                                  
      @264    CPT49                    $CHAR5.                                  
      @269    CPT50                    $CHAR5.                                  
      @274    CPTCCS1                  N3PF.                                    
      @277    CPTCCS2                  N3PF.                                    
      @280    CPTCCS3                  N3PF.                                    
      @283    CPTCCS4                  N3PF.                                    
      @286    CPTCCS5                  N3PF.                                    
      @289    CPTCCS6                  N3PF.                                    
      @292    CPTCCS7                  N3PF.                                    
      @295    CPTCCS8                  N3PF.                                    
      @298    CPTCCS9                  N3PF.                                    
      @301    CPTCCS10                 N3PF.                                    
      @304    CPTCCS11                 N3PF.                                    
      @307    CPTCCS12                 N3PF.                                    
      @310    CPTCCS13                 N3PF.                                    
      @313    CPTCCS14                 N3PF.                                    
      @316    CPTCCS15                 N3PF.                                    
      @319    CPTCCS16                 N3PF.                                    
      @322    CPTCCS17                 N3PF.                                    
      @325    CPTCCS18                 N3PF.                                    
      @328    CPTCCS19                 N3PF.                                    
      @331    CPTCCS20                 N3PF.                                    
      @334    CPTCCS21                 N3PF.                                    
      @337    CPTCCS22                 N3PF.                                    
      @340    CPTCCS23                 N3PF.                                    
      @343    CPTCCS24                 N3PF.                                    
      @346    CPTCCS25                 N3PF.                                    
      @349    CPTCCS26                 N3PF.                                    
      @352    CPTCCS27                 N3PF.                                    
      @355    CPTCCS28                 N3PF.                                    
      @358    CPTCCS29                 N3PF.                                    
      @361    CPTCCS30                 N3PF.                                    
      @364    CPTCCS31                 N3PF.                                    
      @367    CPTCCS32                 N3PF.                                    
      @370    CPTCCS33                 N3PF.                                    
      @373    CPTCCS34                 N3PF.                                    
      @376    CPTCCS35                 N3PF.                                    
      @379    CPTCCS36                 N3PF.                                    
      @382    CPTCCS37                 N3PF.                                    
      @385    CPTCCS38                 N3PF.                                    
      @388    CPTCCS39                 N3PF.                                    
      @391    CPTCCS40                 N3PF.                                    
      @394    CPTCCS41                 N3PF.                                    
      @397    CPTCCS42                 N3PF.                                    
      @400    CPTCCS43                 N3PF.                                    
      @403    CPTCCS44                 N3PF.                                    
      @406    CPTCCS45                 N3PF.                                    
      @409    CPTCCS46                 N3PF.                                    
      @412    CPTCCS47                 N3PF.                                    
      @415    CPTCCS48                 N3PF.                                    
      @418    CPTCCS49                 N3PF.                                    
      @421    CPTCCS50                 N3PF.                                    
      @424    CPTDAY1                  N3PF.                                    
      @427    CPTDAY2                  N3PF.                                    
      @430    CPTDAY3                  N3PF.                                    
      @433    CPTDAY4                  N3PF.                                    
      @436    CPTDAY5                  N3PF.                                    
      @439    CPTDAY6                  N3PF.                                    
      @442    CPTDAY7                  N3PF.                                    
      @445    CPTDAY8                  N3PF.                                    
      @448    CPTDAY9                  N3PF.                                    
      @451    CPTDAY10                 N3PF.                                    
      @454    CPTDAY11                 N3PF.                                    
      @457    CPTDAY12                 N3PF.                                    
      @460    CPTDAY13                 N3PF.                                    
      @463    CPTDAY14                 N3PF.                                    
      @466    CPTDAY15                 N3PF.                                    
      @469    CPTDAY16                 N3PF.                                    
      @472    CPTDAY17                 N3PF.                                    
      @475    CPTDAY18                 N3PF.                                    
      @478    CPTDAY19                 N3PF.                                    
      @481    CPTDAY20                 N3PF.                                    
      @484    CPTDAY21                 N3PF.                                    
      @487    CPTDAY22                 N3PF.                                    
      @490    CPTDAY23                 N3PF.                                    
      @493    CPTDAY24                 N3PF.                                    
      @496    CPTDAY25                 N3PF.                                    
      @499    CPTDAY26                 N3PF.                                    
      @502    CPTDAY27                 N3PF.                                    
      @505    CPTDAY28                 N3PF.                                    
      @508    CPTDAY29                 N3PF.                                    
      @511    CPTDAY30                 N3PF.                                    
      @514    CPTDAY31                 N3PF.                                    
      @517    CPTDAY32                 N3PF.                                    
      @520    CPTDAY33                 N3PF.                                    
      @523    CPTDAY34                 N3PF.                                    
      @526    CPTDAY35                 N3PF.                                    
      @529    CPTDAY36                 N3PF.                                    
      @532    CPTDAY37                 N3PF.                                    
      @535    CPTDAY38                 N3PF.                                    
      @538    CPTDAY39                 N3PF.                                    
      @541    CPTDAY40                 N3PF.                                    
      @544    CPTDAY41                 N3PF.                                    
      @547    CPTDAY42                 N3PF.                                    
      @550    CPTDAY43                 N3PF.                                    
      @553    CPTDAY44                 N3PF.                                    
      @556    CPTDAY45                 N3PF.                                    
      @559    CPTDAY46                 N3PF.                                    
      @562    CPTDAY47                 N3PF.                                    
      @565    CPTDAY48                 N3PF.                                    
      @568    CPTDAY49                 N3PF.                                    
      @571    CPTDAY50                 N3PF.                                    
      @574    CPTM1_1                  $CHAR2.                                  
      @576    CPTM1_2                  $CHAR2.                                  
      @578    CPTM1_3                  $CHAR2.                                  
      @580    CPTM1_4                  $CHAR2.                                  
      @582    CPTM1_5                  $CHAR2.                                  
      @584    CPTM1_6                  $CHAR2.                                  
      @586    CPTM1_7                  $CHAR2.                                  
      @588    CPTM1_8                  $CHAR2.                                  
      @590    CPTM1_9                  $CHAR2.                                  
      @592    CPTM1_10                 $CHAR2.                                  
      @594    CPTM1_11                 $CHAR2.                                  
      @596    CPTM1_12                 $CHAR2.                                  
      @598    CPTM1_13                 $CHAR2.                                  
      @600    CPTM1_14                 $CHAR2.                                  
      @602    CPTM1_15                 $CHAR2.                                  
      @604    CPTM1_16                 $CHAR2.                                  
      @606    CPTM1_17                 $CHAR2.                                  
      @608    CPTM1_18                 $CHAR2.                                  
      @610    CPTM1_19                 $CHAR2.                                  
      @612    CPTM1_20                 $CHAR2.                                  
      @614    CPTM1_21                 $CHAR2.                                  
      @616    CPTM1_22                 $CHAR2.                                  
      @618    CPTM1_23                 $CHAR2.                                  
      @620    CPTM1_24                 $CHAR2.                                  
      @622    CPTM1_25                 $CHAR2.                                  
      @624    CPTM1_26                 $CHAR2.                                  
      @626    CPTM1_27                 $CHAR2.                                  
      @628    CPTM1_28                 $CHAR2.                                  
      @630    CPTM1_29                 $CHAR2.                                  
      @632    CPTM1_30                 $CHAR2.                                  
      @634    CPTM1_31                 $CHAR2.                                  
      @636    CPTM1_32                 $CHAR2.                                  
      @638    CPTM1_33                 $CHAR2.                                  
      @640    CPTM1_34                 $CHAR2.                                  
      @642    CPTM1_35                 $CHAR2.                                  
      @644    CPTM1_36                 $CHAR2.                                  
      @646    CPTM1_37                 $CHAR2.                                  
      @648    CPTM1_38                 $CHAR2.                                  
      @650    CPTM1_39                 $CHAR2.                                  
      @652    CPTM1_40                 $CHAR2.                                  
      @654    CPTM1_41                 $CHAR2.                                  
      @656    CPTM1_42                 $CHAR2.                                  
      @658    CPTM1_43                 $CHAR2.                                  
      @660    CPTM1_44                 $CHAR2.                                  
      @662    CPTM1_45                 $CHAR2.                                  
      @664    CPTM1_46                 $CHAR2.                                  
      @666    CPTM1_47                 $CHAR2.                                  
      @668    CPTM1_48                 $CHAR2.                                  
      @670    CPTM1_49                 $CHAR2.                                  
      @672    CPTM1_50                 $CHAR2.                                  
      @674    CPTM2_1                  $CHAR2.                                  
      @676    CPTM2_2                  $CHAR2.                                  
      @678    CPTM2_3                  $CHAR2.                                  
      @680    CPTM2_4                  $CHAR2.                                  
      @682    CPTM2_5                  $CHAR2.                                  
      @684    CPTM2_6                  $CHAR2.                                  
      @686    CPTM2_7                  $CHAR2.                                  
      @688    CPTM2_8                  $CHAR2.                                  
      @690    CPTM2_9                  $CHAR2.                                  
      @692    CPTM2_10                 $CHAR2.                                  
      @694    CPTM2_11                 $CHAR2.                                  
      @696    CPTM2_12                 $CHAR2.                                  
      @698    CPTM2_13                 $CHAR2.                                  
      @700    CPTM2_14                 $CHAR2.                                  
      @702    CPTM2_15                 $CHAR2.                                  
      @704    CPTM2_16                 $CHAR2.                                  
      @706    CPTM2_17                 $CHAR2.                                  
      @708    CPTM2_18                 $CHAR2.                                  
      @710    CPTM2_19                 $CHAR2.                                  
      @712    CPTM2_20                 $CHAR2.                                  
      @714    CPTM2_21                 $CHAR2.                                  
      @716    CPTM2_22                 $CHAR2.                                  
      @718    CPTM2_23                 $CHAR2.                                  
      @720    CPTM2_24                 $CHAR2.                                  
      @722    CPTM2_25                 $CHAR2.                                  
      @724    CPTM2_26                 $CHAR2.                                  
      @726    CPTM2_27                 $CHAR2.                                  
      @728    CPTM2_28                 $CHAR2.                                  
      @730    CPTM2_29                 $CHAR2.                                  
      @732    CPTM2_30                 $CHAR2.                                  
      @734    CPTM2_31                 $CHAR2.                                  
      @736    CPTM2_32                 $CHAR2.                                  
      @738    CPTM2_33                 $CHAR2.                                  
      @740    CPTM2_34                 $CHAR2.                                  
      @742    CPTM2_35                 $CHAR2.                                  
      @744    CPTM2_36                 $CHAR2.                                  
      @746    CPTM2_37                 $CHAR2.                                  
      @748    CPTM2_38                 $CHAR2.                                  
      @750    CPTM2_39                 $CHAR2.                                  
      @752    CPTM2_40                 $CHAR2.                                  
      @754    CPTM2_41                 $CHAR2.                                  
      @756    CPTM2_42                 $CHAR2.                                  
      @758    CPTM2_43                 $CHAR2.                                  
      @760    CPTM2_44                 $CHAR2.                                  
      @762    CPTM2_45                 $CHAR2.                                  
      @764    CPTM2_46                 $CHAR2.                                  
      @766    CPTM2_47                 $CHAR2.                                  
      @768    CPTM2_48                 $CHAR2.                                  
      @770    CPTM2_49                 $CHAR2.                                  
      @772    CPTM2_50                 $CHAR2.                                  
      @774    DIED                     N2PF.                                    
      @776    DISPUB04                 N2PF.                                    
      @778    DISPUNIFORM              N2PF.                                    
      @780    DISP_X                   $CHAR2.                                  
      @782    DMONTH                   N2PF.                                    
      @784    DQTR                     N2PF.                                    
      @786    DSHOSPID                 $CHAR17.                                 
      @803    DX1                      $CHAR5.                                  
      @808    DX2                      $CHAR5.                                  
      @813    DX3                      $CHAR5.                                  
      @818    DX4                      $CHAR5.                                  
      @823    DX5                      $CHAR5.                                  
      @828    DX6                      $CHAR5.                                  
      @833    DX7                      $CHAR5.                                  
      @838    DX8                      $CHAR5.                                  
      @843    DX9                      $CHAR5.                                  
      @848    DX10                     $CHAR5.                                  
      @853    DX11                     $CHAR5.                                  
      @858    DX12                     $CHAR5.                                  
      @863    DX13                     $CHAR5.                                  
      @868    DX14                     $CHAR5.                                  
      @873    DX15                     $CHAR5.                                  
      @878    DX16                     $CHAR5.                                  
      @883    DX17                     $CHAR5.                                  
      @888    DX18                     $CHAR5.                                  
      @893    DX19                     $CHAR5.                                  
      @898    DX20                     $CHAR5.                                  
      @903    DXCCS1                   N4PF.                                    
      @907    DXCCS2                   N4PF.                                    
      @911    DXCCS3                   N4PF.                                    
      @915    DXCCS4                   N4PF.                                    
      @919    DXCCS5                   N4PF.                                    
      @923    DXCCS6                   N4PF.                                    
      @927    DXCCS7                   N4PF.                                    
      @931    DXCCS8                   N4PF.                                    
      @935    DXCCS9                   N4PF.                                    
      @939    DXCCS10                  N4PF.                                    
      @943    DXCCS11                  N4PF.                                    
      @947    DXCCS12                  N4PF.                                    
      @951    DXCCS13                  N4PF.                                    
      @955    DXCCS14                  N4PF.                                    
      @959    DXCCS15                  N4PF.                                    
      @963    DXCCS16                  N4PF.                                    
      @967    DXCCS17                  N4PF.                                    
      @971    DXCCS18                  N4PF.                                    
      @975    DXCCS19                  N4PF.                                    
      @979    DXCCS20                  N4PF.                                    
      @983    DX_Visit_Reason1         $CHAR5.                                  
      @988    DX_Visit_Reason2         $CHAR5.                                  
      @993    DaysToEvent              N6PF.                                    
      @999    ECODE1                   $CHAR5.                                  
      @1004   ECODE2                   $CHAR5.                                  
      @1009   ECODE3                   $CHAR5.                                  
      @1014   ECODE4                   $CHAR5.                                  
      @1019   ECODE5                   $CHAR5.                                  
      @1024   ECODE6                   $CHAR5.                                  
      @1029   ECODE7                   $CHAR5.                                  
      @1034   ECODE8                   $CHAR5.                                  
      @1039   E_CCS1                   N4PF.                                    
      @1043   E_CCS2                   N4PF.                                    
      @1047   E_CCS3                   N4PF.                                    
      @1051   E_CCS4                   N4PF.                                    
      @1055   E_CCS5                   N4PF.                                    
      @1059   E_CCS6                   N4PF.                                    
      @1063   E_CCS7                   N4PF.                                    
      @1067   E_CCS8                   N4PF.                                    
      @1071   FEMALE                   N2PF.                                    
      @1073   HCUP_ED                  N2PF.                                    
      @1075   HCUP_OS                  N2PF.                                    
      @1077   HISPANIC_X               $CHAR1.                                  
      @1078   HOSPBRTH                 N3PF.                                    
      @1081   HOSPST                   $CHAR2.                                  
      @1083   HOSP_NPI                 $CHAR10.                                 
      @1093   KEY                      15.                                      
      @1108   LOS                      N5PF.                                    
      @1113   LOS_X                    N6PF.                                    
      @1119   MEDINCSTQ                N2PF.                                    
      @1121   MRN_R                    N9PF.                                    
      @1130   NCHRONIC                 N3PF.                                    
      @1133   NCPT                     N3PF.                                    
      @1136   NDX                      N2PF.                                    
      @1138   NECODE                   N2PF.                                    
      @1140   NEOMAT                   N2PF.                                    
      @1142   NPR                      N2PF.                                    
      @1144   ORPROC                   N2PF.                                    
      @1146   PAY1                     N2PF.                                    
      @1148   PAY1_X                   $CHAR2.                                  
      @1150   PAY2                     N2PF.                                    
      @1152   PAY2_X                   $CHAR2.                                  
      @1154   PAY3                     N2PF.                                    
      @1156   PAY3_X                   $CHAR2.                                  
      @1158   PAYER1_X                 $CHAR6.                                  
      @1164   PAYER2_X                 $CHAR6.                                  
      @1170   PL_CBSA                  N3PF.                                    
      @1173   PL_NCHS                  N2PF.                                    
      @1175   PL_RUCA10_2005           N2PF.                                    
      @1177   PL_RUCA2005              N4P1F.                                   
      @1181   PL_RUCA4_2005            N2PF.                                    
      @1183   PL_RUCC                  N2PF.                                    
      @1185   PL_UIC                   N2PF.                                    
      @1187   PL_UR_CAT4               N2PF.                                    
      @1189   PR1                      $CHAR4.                                  
      @1193   PR2                      $CHAR4.                                  
      @1197   PR3                      $CHAR4.                                  
      @1201   PR4                      $CHAR4.                                  
      @1205   PR5                      $CHAR4.                                  
      @1209   PR6                      $CHAR4.                                  
      @1213   PR7                      $CHAR4.                                  
      @1217   PR8                      $CHAR4.                                  
      @1221   PR9                      $CHAR4.                                  
      @1225   PR10                     $CHAR4.                                  
      @1229   PR11                     $CHAR4.                                  
      @1233   PR12                     $CHAR4.                                  
      @1237   PR13                     $CHAR4.                                  
      @1241   PR14                     $CHAR4.                                  
      @1245   PR15                     $CHAR4.                                  
      @1249   PR16                     $CHAR4.                                  
      @1253   PR17                     $CHAR4.                                  
      @1257   PR18                     $CHAR4.                                  
      @1261   PR19                     $CHAR4.                                  
      @1265   PR20                     $CHAR4.                                  
      @1269   PRCCS1                   N3PF.                                    
      @1272   PRCCS2                   N3PF.                                    
      @1275   PRCCS3                   N3PF.                                    
      @1278   PRCCS4                   N3PF.                                    
      @1281   PRCCS5                   N3PF.                                    
      @1284   PRCCS6                   N3PF.                                    
      @1287   PRCCS7                   N3PF.                                    
      @1290   PRCCS8                   N3PF.                                    
      @1293   PRCCS9                   N3PF.                                    
      @1296   PRCCS10                  N3PF.                                    
      @1299   PRCCS11                  N3PF.                                    
      @1302   PRCCS12                  N3PF.                                    
      @1305   PRCCS13                  N3PF.                                    
      @1308   PRCCS14                  N3PF.                                    
      @1311   PRCCS15                  N3PF.                                    
      @1314   PRCCS16                  N3PF.                                    
      @1317   PRCCS17                  N3PF.                                    
      @1320   PRCCS18                  N3PF.                                    
      @1323   PRCCS19                  N3PF.                                    
      @1326   PRCCS20                  N3PF.                                    
      @1329   PRDAY1                   N5PF.                                    
      @1334   PRDAY2                   N5PF.                                    
      @1339   PRDAY3                   N5PF.                                    
      @1344   PRDAY4                   N5PF.                                    
      @1349   PRDAY5                   N5PF.                                    
      @1354   PRDAY6                   N5PF.                                    
      @1359   PRDAY7                   N5PF.                                    
      @1364   PRDAY8                   N5PF.                                    
      @1369   PRDAY9                   N5PF.                                    
      @1374   PRDAY10                  N5PF.                                    
      @1379   PRDAY11                  N5PF.                                    
      @1384   PRDAY12                  N5PF.                                    
      @1389   PRDAY13                  N5PF.                                    
      @1394   PRDAY14                  N5PF.                                    
      @1399   PRDAY15                  N5PF.                                    
      @1404   PRDAY16                  N5PF.                                    
      @1409   PRDAY17                  N5PF.                                    
      @1414   PRDAY18                  N5PF.                                    
      @1419   PRDAY19                  N5PF.                                    
      @1424   PRDAY20                  N5PF.                                    
      @1429   PROCTYPE                 N3PF.                                    
      @1432   PSTATE                   $CHAR2.                                  
      @1434   PSTCO                    N5PF.                                    
      @1439   PSTCO2                   N5PF.                                    
      @1444   PointOfOriginUB04        $CHAR1.                                  
      @1445   PointOfOrigin_X          $CHAR1.                                  
      @1446   RACE                     N2PF.                                    
      @1448   RACE_X                   $CHAR1.                                  
      @1449   READMIT                  N2PF.                                    
      @1451   STATE_AS                 N2PF.                                    
      @1453   STATE_ED                 N2PF.                                    
      @1455   STATE_OS                 N2PF.                                    
      @1457   TOTCHG                   N10PF.                                   
      @1467   TOTCHG_X                 N15P2F.                                  
      @1482   VisitLink                N9PF.                                    
      @1491   YEAR                     N4PF.                                    
      @1495   ZIP3                     $CHAR3.                                  
      @1498   ZIPINC_QRTL              N3PF.                                    
      @1501   TOWN                     $CHAR4.                                  
      @1505   ZIP                      $CHAR5.                                  
      @1510   AYEAR                    N4PF.                                    
      @1514   BMONTH                   N2PF.                                    
      @1516   BYEAR                    N4PF.                                    
      @1520   PRMONTH1                 N2PF.                                    
      @1522   PRMONTH2                 N2PF.                                    
      @1524   PRMONTH3                 N2PF.                                    
      @1526   PRMONTH4                 N2PF.                                    
      @1528   PRMONTH5                 N2PF.                                    
      @1530   PRMONTH6                 N2PF.                                    
      @1532   PRMONTH7                 N2PF.                                    
      @1534   PRMONTH8                 N2PF.                                    
      @1536   PRMONTH9                 N2PF.                                    
      @1538   PRMONTH10                N2PF.                                    
      @1540   PRMONTH11                N2PF.                                    
      @1542   PRMONTH12                N2PF.                                    
      @1544   PRMONTH13                N2PF.                                    
      @1546   PRMONTH14                N2PF.                                    
      @1548   PRMONTH15                N2PF.                                    
      @1550   PRMONTH16                N2PF.                                    
      @1552   PRMONTH17                N2PF.                                    
      @1554   PRMONTH18                N2PF.                                    
      @1556   PRMONTH19                N2PF.                                    
      @1558   PRMONTH20                N2PF.                                    
      @1560   PRYEAR1                  N4PF.                                    
      @1564   PRYEAR2                  N4PF.                                    
      @1568   PRYEAR3                  N4PF.                                    
      @1572   PRYEAR4                  N4PF.                                    
      @1576   PRYEAR5                  N4PF.                                    
      @1580   PRYEAR6                  N4PF.                                    
      @1584   PRYEAR7                  N4PF.                                    
      @1588   PRYEAR8                  N4PF.                                    
      @1592   PRYEAR9                  N4PF.                                    
      @1596   PRYEAR10                 N4PF.                                    
      @1600   PRYEAR11                 N4PF.                                    
      @1604   PRYEAR12                 N4PF.                                    
      @1608   PRYEAR13                 N4PF.                                    
      @1612   PRYEAR14                 N4PF.                                    
      @1616   PRYEAR15                 N4PF.                                    
      @1620   PRYEAR16                 N4PF.                                    
      @1624   PRYEAR17                 N4PF.                                    
      @1628   PRYEAR18                 N4PF.                                    
      @1632   PRYEAR19                 N4PF.                                    
      @1636   PRYEAR20                 N4PF.                                    
      ;                                                                         
                                                                                
                                                                                
RUN;
