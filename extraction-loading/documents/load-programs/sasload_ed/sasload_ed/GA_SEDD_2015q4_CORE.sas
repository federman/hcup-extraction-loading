/*******************************************************************            
* Creation Date: 04/19/2018                                                     
*   GA_SEDD_2015q4_CORE.SAS:                                                    
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
DATA GA_SEDDC_2015q4_CORE;                                                      
INFILE 'GA_SEDD_2015q4_CORE.ASC' FIRSTOBS=3 LRECL = 2089;                       
                                                                                
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
                                                                                
  DXVER                      LENGTH=3                                           
  LABEL="Diagnosis Version"                                                     
                                                                                
  E_POA1                     LENGTH=$1                                          
  LABEL="E Cause 1, present on admission indicator"                             
                                                                                
  E_POA2                     LENGTH=$1                                          
  LABEL="E Cause 2, present on admission indicator"                             
                                                                                
  E_POA3                     LENGTH=$1                                          
  LABEL="E Cause 3, present on admission indicator"                             
                                                                                
  E_POA4                     LENGTH=$1                                          
  LABEL="E Cause 4, present on admission indicator"                             
                                                                                
  E_POA5                     LENGTH=$1                                          
  LABEL="E Cause 5, present on admission indicator"                             
                                                                                
  E_POA6                     LENGTH=$1                                          
  LABEL="E Cause 6, present on admission indicator"                             
                                                                                
  E_POA7                     LENGTH=$1                                          
  LABEL="E Cause 7, present on admission indicator"                             
                                                                                
  E_POA8                     LENGTH=$1                                          
  LABEL="E Cause 8, present on admission indicator"                             
                                                                                
  E_POA9                     LENGTH=$1                                          
  LABEL="E Cause 9, present on admission indicator"                             
                                                                                
  E_POA10                    LENGTH=$1                                          
  LABEL="E Cause 10, present on admission indicator"                            
                                                                                
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
                                                                                
  I10_DXCCS1                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 1"                                            
                                                                                
  I10_DXCCS2                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 2"                                            
                                                                                
  I10_DXCCS3                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 3"                                            
                                                                                
  I10_DXCCS4                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 4"                                            
                                                                                
  I10_DXCCS5                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 5"                                            
                                                                                
  I10_DXCCS6                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 6"                                            
                                                                                
  I10_DXCCS7                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 7"                                            
                                                                                
  I10_DXCCS8                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 8"                                            
                                                                                
  I10_DXCCS9                 LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 9"                                            
                                                                                
  I10_DXCCS10                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 10"                                           
                                                                                
  I10_DXCCS11                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 11"                                           
                                                                                
  I10_DXCCS12                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 12"                                           
                                                                                
  I10_DXCCS13                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 13"                                           
                                                                                
  I10_DXCCS14                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 14"                                           
                                                                                
  I10_DXCCS15                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 15"                                           
                                                                                
  I10_DXCCS16                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 16"                                           
                                                                                
  I10_DXCCS17                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 17"                                           
                                                                                
  I10_DXCCS18                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 18"                                           
                                                                                
  I10_DXCCS19                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 19"                                           
                                                                                
  I10_DXCCS20                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 20"                                           
                                                                                
  I10_DXCCS21                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 21"                                           
                                                                                
  I10_DXCCS22                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 22"                                           
                                                                                
  I10_DXCCS23                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 23"                                           
                                                                                
  I10_DXCCS24                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 24"                                           
                                                                                
  I10_DXCCS25                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 25"                                           
                                                                                
  I10_DXCCS26                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 26"                                           
                                                                                
  I10_DXCCS27                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 27"                                           
                                                                                
  I10_DXCCS28                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 28"                                           
                                                                                
  I10_DXCCS29                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 29"                                           
                                                                                
  I10_DXCCS30                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 30"                                           
                                                                                
  I10_DXCCS31                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 31"                                           
                                                                                
  I10_DXCCS32                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 32"                                           
                                                                                
  I10_DXCCS33                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 33"                                           
                                                                                
  I10_DXCCS34                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 34"                                           
                                                                                
  I10_DXCCS35                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 35"                                           
                                                                                
  I10_DXCCS36                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 36"                                           
                                                                                
  I10_DXCCS37                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 37"                                           
                                                                                
  I10_DXCCS38                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 38"                                           
                                                                                
  I10_DXCCS39                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 39"                                           
                                                                                
  I10_DXCCS40                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 40"                                           
                                                                                
  I10_DXCCS41                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 41"                                           
                                                                                
  I10_DXCCS42                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 42"                                           
                                                                                
  I10_DXCCS43                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 43"                                           
                                                                                
  I10_DXCCS44                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 44"                                           
                                                                                
  I10_DXCCS45                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 45"                                           
                                                                                
  I10_DXCCS46                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 46"                                           
                                                                                
  I10_DXCCS47                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 47"                                           
                                                                                
  I10_DXCCS48                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 48"                                           
                                                                                
  I10_DXCCS49                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 49"                                           
                                                                                
  I10_DXCCS50                LENGTH=4                                           
  LABEL="ICD-10-CM CCS: diagnosis 50"                                           
                                                                                
  I10_ECAUSE1                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 1"                                                   
                                                                                
  I10_ECAUSE2                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 2"                                                   
                                                                                
  I10_ECAUSE3                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 3"                                                   
                                                                                
  I10_ECAUSE4                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 4"                                                   
                                                                                
  I10_ECAUSE5                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 5"                                                   
                                                                                
  I10_ECAUSE6                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 6"                                                   
                                                                                
  I10_ECAUSE7                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 7"                                                   
                                                                                
  I10_ECAUSE8                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 8"                                                   
                                                                                
  I10_ECAUSE9                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 9"                                                   
                                                                                
  I10_ECAUSE10               LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 10"                                                  
                                                                                
  I10_ECauseCCS1             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 1"                                              
                                                                                
  I10_ECauseCCS2             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 2"                                              
                                                                                
  I10_ECauseCCS3             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 3"                                              
                                                                                
  I10_ECauseCCS4             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 4"                                              
                                                                                
  I10_ECauseCCS5             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 5"                                              
                                                                                
  I10_ECauseCCS6             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 6"                                              
                                                                                
  I10_ECauseCCS7             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 7"                                              
                                                                                
  I10_ECauseCCS8             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 8"                                              
                                                                                
  I10_ECauseCCS9             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 9"                                              
                                                                                
  I10_ECauseCCS10            LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 10"                                             
                                                                                
  I10_HOSPBRTH               LENGTH=3                                           
  LABEL="ICD-10-CM Indicator of birth in this hospital"                         
                                                                                
  I10_NCHRONIC               LENGTH=3                                           
  LABEL="ICD-10-CM Number of chronic conditions"                                
                                                                                
  I10_NDX                    LENGTH=3                                           
  LABEL="ICD-10-CM Number of diagnoses on this record"                          
                                                                                
  I10_NECAUSE                LENGTH=3                                           
  LABEL="ICD-10-CM Number of E Causes on this record"                           
                                                                                
  I10_NEOMAT                 LENGTH=3                                           
  LABEL="ICD-10-CM/PCS Neonatal and/or maternal I10_DX and/or I10_PR"           
                                                                                
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
                                                                                
  I10_PRCCS1                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 1"                                           
                                                                                
  I10_PRCCS2                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 2"                                           
                                                                                
  I10_PRCCS3                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 3"                                           
                                                                                
  I10_PRCCS4                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 4"                                           
                                                                                
  I10_PRCCS5                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 5"                                           
                                                                                
  I10_PRCCS6                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 6"                                           
                                                                                
  I10_PRCCS7                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 7"                                           
                                                                                
  I10_PRCCS8                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 8"                                           
                                                                                
  I10_PRCCS9                 LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 9"                                           
                                                                                
  I10_PRCCS10                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 10"                                          
                                                                                
  I10_PRCCS11                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 11"                                          
                                                                                
  I10_PRCCS12                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 12"                                          
                                                                                
  I10_PRCCS13                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 13"                                          
                                                                                
  I10_PRCCS14                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 14"                                          
                                                                                
  I10_PRCCS15                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 15"                                          
                                                                                
  I10_PRCCS16                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 16"                                          
                                                                                
  I10_PRCCS17                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 17"                                          
                                                                                
  I10_PRCCS18                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 18"                                          
                                                                                
  I10_PRCCS19                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 19"                                          
                                                                                
  I10_PRCCS20                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 20"                                          
                                                                                
  I10_PRCCS21                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 21"                                          
                                                                                
  I10_PRCCS22                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 22"                                          
                                                                                
  I10_PRCCS23                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 23"                                          
                                                                                
  I10_PRCCS24                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 24"                                          
                                                                                
  I10_PRCCS25                LENGTH=3                                           
  LABEL="ICD-10-PCS CCS: procedure 25"                                          
                                                                                
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
  LABEL="Patient location: Rural-Urban Continuum Codes(RUCC)"                   
                                                                                
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
                                                                                
  PRVER                      LENGTH=3                                           
  LABEL="Procedure Version"                                                     
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO                      LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
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
      @270    CPTCCS1                       N3PF.                               
      @273    CPTCCS2                       N3PF.                               
      @276    CPTCCS3                       N3PF.                               
      @279    CPTCCS4                       N3PF.                               
      @282    CPTCCS5                       N3PF.                               
      @285    CPTCCS6                       N3PF.                               
      @288    CPTCCS7                       N3PF.                               
      @291    CPTCCS8                       N3PF.                               
      @294    CPTCCS9                       N3PF.                               
      @297    CPTCCS10                      N3PF.                               
      @300    CPTCCS11                      N3PF.                               
      @303    CPTCCS12                      N3PF.                               
      @306    CPTCCS13                      N3PF.                               
      @309    CPTCCS14                      N3PF.                               
      @312    CPTCCS15                      N3PF.                               
      @315    CPTCCS16                      N3PF.                               
      @318    CPTCCS17                      N3PF.                               
      @321    CPTCCS18                      N3PF.                               
      @324    CPTCCS19                      N3PF.                               
      @327    CPTCCS20                      N3PF.                               
      @330    CPTCCS21                      N3PF.                               
      @333    CPTCCS22                      N3PF.                               
      @336    CPTCCS23                      N3PF.                               
      @339    CPTCCS24                      N3PF.                               
      @342    CPTCCS25                      N3PF.                               
      @345    CPTCCS26                      N3PF.                               
      @348    CPTCCS27                      N3PF.                               
      @351    CPTCCS28                      N3PF.                               
      @354    CPTCCS29                      N3PF.                               
      @357    CPTCCS30                      N3PF.                               
      @360    CPTCCS31                      N3PF.                               
      @363    CPTCCS32                      N3PF.                               
      @366    CPTCCS33                      N3PF.                               
      @369    CPTCCS34                      N3PF.                               
      @372    CPTCCS35                      N3PF.                               
      @375    CPTCCS36                      N3PF.                               
      @378    CPTCCS37                      N3PF.                               
      @381    CPTCCS38                      N3PF.                               
      @384    CPTCCS39                      N3PF.                               
      @387    CPTCCS40                      N3PF.                               
      @390    CPTCCS41                      N3PF.                               
      @393    CPTCCS42                      N3PF.                               
      @396    CPTCCS43                      N3PF.                               
      @399    CPTCCS44                      N3PF.                               
      @402    CPTCCS45                      N3PF.                               
      @405    CPTCCS46                      N3PF.                               
      @408    CPTCCS47                      N3PF.                               
      @411    CPTCCS48                      N3PF.                               
      @414    CPTCCS49                      N3PF.                               
      @417    CPTCCS50                      N3PF.                               
      @420    CPTDAY1                       N3PF.                               
      @423    CPTDAY2                       N3PF.                               
      @426    CPTDAY3                       N3PF.                               
      @429    CPTDAY4                       N3PF.                               
      @432    CPTDAY5                       N3PF.                               
      @435    CPTDAY6                       N3PF.                               
      @438    CPTDAY7                       N3PF.                               
      @441    CPTDAY8                       N3PF.                               
      @444    CPTDAY9                       N3PF.                               
      @447    CPTDAY10                      N3PF.                               
      @450    CPTDAY11                      N3PF.                               
      @453    CPTDAY12                      N3PF.                               
      @456    CPTDAY13                      N3PF.                               
      @459    CPTDAY14                      N3PF.                               
      @462    CPTDAY15                      N3PF.                               
      @465    CPTDAY16                      N3PF.                               
      @468    CPTDAY17                      N3PF.                               
      @471    CPTDAY18                      N3PF.                               
      @474    CPTDAY19                      N3PF.                               
      @477    CPTDAY20                      N3PF.                               
      @480    CPTDAY21                      N3PF.                               
      @483    CPTDAY22                      N3PF.                               
      @486    CPTDAY23                      N3PF.                               
      @489    CPTDAY24                      N3PF.                               
      @492    CPTDAY25                      N3PF.                               
      @495    CPTDAY26                      N3PF.                               
      @498    CPTDAY27                      N3PF.                               
      @501    CPTDAY28                      N3PF.                               
      @504    CPTDAY29                      N3PF.                               
      @507    CPTDAY30                      N3PF.                               
      @510    CPTDAY31                      N3PF.                               
      @513    CPTDAY32                      N3PF.                               
      @516    CPTDAY33                      N3PF.                               
      @519    CPTDAY34                      N3PF.                               
      @522    CPTDAY35                      N3PF.                               
      @525    CPTDAY36                      N3PF.                               
      @528    CPTDAY37                      N3PF.                               
      @531    CPTDAY38                      N3PF.                               
      @534    CPTDAY39                      N3PF.                               
      @537    CPTDAY40                      N3PF.                               
      @540    CPTDAY41                      N3PF.                               
      @543    CPTDAY42                      N3PF.                               
      @546    CPTDAY43                      N3PF.                               
      @549    CPTDAY44                      N3PF.                               
      @552    CPTDAY45                      N3PF.                               
      @555    CPTDAY46                      N3PF.                               
      @558    CPTDAY47                      N3PF.                               
      @561    CPTDAY48                      N3PF.                               
      @564    CPTDAY49                      N3PF.                               
      @567    CPTDAY50                      N3PF.                               
      @570    DaysToEvent                   N6PF.                               
      @576    DIED                          N2PF.                               
      @578    DISP_X                        $CHAR2.                             
      @580    DISPUB04                      N2PF.                               
      @582    DISPUNIFORM                   N2PF.                               
      @584    DMONTH                        N2PF.                               
      @586    DQTR                          N2PF.                               
      @588    DXPOA1                        $CHAR1.                             
      @589    DXPOA2                        $CHAR1.                             
      @590    DXPOA3                        $CHAR1.                             
      @591    DXPOA4                        $CHAR1.                             
      @592    DXPOA5                        $CHAR1.                             
      @593    DXPOA6                        $CHAR1.                             
      @594    DXPOA7                        $CHAR1.                             
      @595    DXPOA8                        $CHAR1.                             
      @596    DXPOA9                        $CHAR1.                             
      @597    DXPOA10                       $CHAR1.                             
      @598    DXPOA11                       $CHAR1.                             
      @599    DXPOA12                       $CHAR1.                             
      @600    DXPOA13                       $CHAR1.                             
      @601    DXPOA14                       $CHAR1.                             
      @602    DXPOA15                       $CHAR1.                             
      @603    DXPOA16                       $CHAR1.                             
      @604    DXPOA17                       $CHAR1.                             
      @605    DXPOA18                       $CHAR1.                             
      @606    DXPOA19                       $CHAR1.                             
      @607    DXPOA20                       $CHAR1.                             
      @608    DXPOA21                       $CHAR1.                             
      @609    DXPOA22                       $CHAR1.                             
      @610    DXPOA23                       $CHAR1.                             
      @611    DXPOA24                       $CHAR1.                             
      @612    DXPOA25                       $CHAR1.                             
      @613    DXPOA26                       $CHAR1.                             
      @614    DXPOA27                       $CHAR1.                             
      @615    DXPOA28                       $CHAR1.                             
      @616    DXPOA29                       $CHAR1.                             
      @617    DXPOA30                       $CHAR1.                             
      @618    DXPOA31                       $CHAR1.                             
      @619    DXPOA32                       $CHAR1.                             
      @620    DXPOA33                       $CHAR1.                             
      @621    DXPOA34                       $CHAR1.                             
      @622    DXPOA35                       $CHAR1.                             
      @623    DXPOA36                       $CHAR1.                             
      @624    DXPOA37                       $CHAR1.                             
      @625    DXPOA38                       $CHAR1.                             
      @626    DXPOA39                       $CHAR1.                             
      @627    DXPOA40                       $CHAR1.                             
      @628    DXPOA41                       $CHAR1.                             
      @629    DXPOA42                       $CHAR1.                             
      @630    DXPOA43                       $CHAR1.                             
      @631    DXPOA44                       $CHAR1.                             
      @632    DXPOA45                       $CHAR1.                             
      @633    DXPOA46                       $CHAR1.                             
      @634    DXPOA47                       $CHAR1.                             
      @635    DXPOA48                       $CHAR1.                             
      @636    DXPOA49                       $CHAR1.                             
      @637    DXPOA50                       $CHAR1.                             
      @638    DXVER                         N3PF.                               
      @641    E_POA1                        $CHAR1.                             
      @642    E_POA2                        $CHAR1.                             
      @643    E_POA3                        $CHAR1.                             
      @644    E_POA4                        $CHAR1.                             
      @645    E_POA5                        $CHAR1.                             
      @646    E_POA6                        $CHAR1.                             
      @647    E_POA7                        $CHAR1.                             
      @648    E_POA8                        $CHAR1.                             
      @649    E_POA9                        $CHAR1.                             
      @650    E_POA10                       $CHAR1.                             
      @651    FEMALE                        N2PF.                               
      @653    HCUP_ED                       N2PF.                               
      @655    HCUP_OS                       N2PF.                               
      @657    HISPANIC                      N2PF.                               
      @659    HISPANIC_X                    $CHAR1.                             
      @660    Homeless                      N2PF.                               
      @662    HOSPST                        $CHAR2.                             
      @664    I10_DX1                       $CHAR7.                             
      @671    I10_DX2                       $CHAR7.                             
      @678    I10_DX3                       $CHAR7.                             
      @685    I10_DX4                       $CHAR7.                             
      @692    I10_DX5                       $CHAR7.                             
      @699    I10_DX6                       $CHAR7.                             
      @706    I10_DX7                       $CHAR7.                             
      @713    I10_DX8                       $CHAR7.                             
      @720    I10_DX9                       $CHAR7.                             
      @727    I10_DX10                      $CHAR7.                             
      @734    I10_DX11                      $CHAR7.                             
      @741    I10_DX12                      $CHAR7.                             
      @748    I10_DX13                      $CHAR7.                             
      @755    I10_DX14                      $CHAR7.                             
      @762    I10_DX15                      $CHAR7.                             
      @769    I10_DX16                      $CHAR7.                             
      @776    I10_DX17                      $CHAR7.                             
      @783    I10_DX18                      $CHAR7.                             
      @790    I10_DX19                      $CHAR7.                             
      @797    I10_DX20                      $CHAR7.                             
      @804    I10_DX21                      $CHAR7.                             
      @811    I10_DX22                      $CHAR7.                             
      @818    I10_DX23                      $CHAR7.                             
      @825    I10_DX24                      $CHAR7.                             
      @832    I10_DX25                      $CHAR7.                             
      @839    I10_DX26                      $CHAR7.                             
      @846    I10_DX27                      $CHAR7.                             
      @853    I10_DX28                      $CHAR7.                             
      @860    I10_DX29                      $CHAR7.                             
      @867    I10_DX30                      $CHAR7.                             
      @874    I10_DX31                      $CHAR7.                             
      @881    I10_DX32                      $CHAR7.                             
      @888    I10_DX33                      $CHAR7.                             
      @895    I10_DX34                      $CHAR7.                             
      @902    I10_DX35                      $CHAR7.                             
      @909    I10_DX36                      $CHAR7.                             
      @916    I10_DX37                      $CHAR7.                             
      @923    I10_DX38                      $CHAR7.                             
      @930    I10_DX39                      $CHAR7.                             
      @937    I10_DX40                      $CHAR7.                             
      @944    I10_DX41                      $CHAR7.                             
      @951    I10_DX42                      $CHAR7.                             
      @958    I10_DX43                      $CHAR7.                             
      @965    I10_DX44                      $CHAR7.                             
      @972    I10_DX45                      $CHAR7.                             
      @979    I10_DX46                      $CHAR7.                             
      @986    I10_DX47                      $CHAR7.                             
      @993    I10_DX48                      $CHAR7.                             
      @1000   I10_DX49                      $CHAR7.                             
      @1007   I10_DX50                      $CHAR7.                             
      @1014   I10_DXCCS1                    N4PF.                               
      @1018   I10_DXCCS2                    N4PF.                               
      @1022   I10_DXCCS3                    N4PF.                               
      @1026   I10_DXCCS4                    N4PF.                               
      @1030   I10_DXCCS5                    N4PF.                               
      @1034   I10_DXCCS6                    N4PF.                               
      @1038   I10_DXCCS7                    N4PF.                               
      @1042   I10_DXCCS8                    N4PF.                               
      @1046   I10_DXCCS9                    N4PF.                               
      @1050   I10_DXCCS10                   N4PF.                               
      @1054   I10_DXCCS11                   N4PF.                               
      @1058   I10_DXCCS12                   N4PF.                               
      @1062   I10_DXCCS13                   N4PF.                               
      @1066   I10_DXCCS14                   N4PF.                               
      @1070   I10_DXCCS15                   N4PF.                               
      @1074   I10_DXCCS16                   N4PF.                               
      @1078   I10_DXCCS17                   N4PF.                               
      @1082   I10_DXCCS18                   N4PF.                               
      @1086   I10_DXCCS19                   N4PF.                               
      @1090   I10_DXCCS20                   N4PF.                               
      @1094   I10_DXCCS21                   N4PF.                               
      @1098   I10_DXCCS22                   N4PF.                               
      @1102   I10_DXCCS23                   N4PF.                               
      @1106   I10_DXCCS24                   N4PF.                               
      @1110   I10_DXCCS25                   N4PF.                               
      @1114   I10_DXCCS26                   N4PF.                               
      @1118   I10_DXCCS27                   N4PF.                               
      @1122   I10_DXCCS28                   N4PF.                               
      @1126   I10_DXCCS29                   N4PF.                               
      @1130   I10_DXCCS30                   N4PF.                               
      @1134   I10_DXCCS31                   N4PF.                               
      @1138   I10_DXCCS32                   N4PF.                               
      @1142   I10_DXCCS33                   N4PF.                               
      @1146   I10_DXCCS34                   N4PF.                               
      @1150   I10_DXCCS35                   N4PF.                               
      @1154   I10_DXCCS36                   N4PF.                               
      @1158   I10_DXCCS37                   N4PF.                               
      @1162   I10_DXCCS38                   N4PF.                               
      @1166   I10_DXCCS39                   N4PF.                               
      @1170   I10_DXCCS40                   N4PF.                               
      @1174   I10_DXCCS41                   N4PF.                               
      @1178   I10_DXCCS42                   N4PF.                               
      @1182   I10_DXCCS43                   N4PF.                               
      @1186   I10_DXCCS44                   N4PF.                               
      @1190   I10_DXCCS45                   N4PF.                               
      @1194   I10_DXCCS46                   N4PF.                               
      @1198   I10_DXCCS47                   N4PF.                               
      @1202   I10_DXCCS48                   N4PF.                               
      @1206   I10_DXCCS49                   N4PF.                               
      @1210   I10_DXCCS50                   N4PF.                               
      @1214   I10_ECAUSE1                   $CHAR7.                             
      @1221   I10_ECAUSE2                   $CHAR7.                             
      @1228   I10_ECAUSE3                   $CHAR7.                             
      @1235   I10_ECAUSE4                   $CHAR7.                             
      @1242   I10_ECAUSE5                   $CHAR7.                             
      @1249   I10_ECAUSE6                   $CHAR7.                             
      @1256   I10_ECAUSE7                   $CHAR7.                             
      @1263   I10_ECAUSE8                   $CHAR7.                             
      @1270   I10_ECAUSE9                   $CHAR7.                             
      @1277   I10_ECAUSE10                  $CHAR7.                             
      @1284   I10_ECauseCCS1                N4PF.                               
      @1288   I10_ECauseCCS2                N4PF.                               
      @1292   I10_ECauseCCS3                N4PF.                               
      @1296   I10_ECauseCCS4                N4PF.                               
      @1300   I10_ECauseCCS5                N4PF.                               
      @1304   I10_ECauseCCS6                N4PF.                               
      @1308   I10_ECauseCCS7                N4PF.                               
      @1312   I10_ECauseCCS8                N4PF.                               
      @1316   I10_ECauseCCS9                N4PF.                               
      @1320   I10_ECauseCCS10               N4PF.                               
      @1324   I10_HOSPBRTH                  N3PF.                               
      @1327   I10_NCHRONIC                  N3PF.                               
      @1330   I10_NDX                       N3PF.                               
      @1333   I10_NECAUSE                   N2PF.                               
      @1335   I10_NEOMAT                    N2PF.                               
      @1337   I10_NPR                       N3PF.                               
      @1340   I10_ORPROC                    N2PF.                               
      @1342   I10_PR1                       $CHAR7.                             
      @1349   I10_PR2                       $CHAR7.                             
      @1356   I10_PR3                       $CHAR7.                             
      @1363   I10_PR4                       $CHAR7.                             
      @1370   I10_PR5                       $CHAR7.                             
      @1377   I10_PR6                       $CHAR7.                             
      @1384   I10_PR7                       $CHAR7.                             
      @1391   I10_PR8                       $CHAR7.                             
      @1398   I10_PR9                       $CHAR7.                             
      @1405   I10_PR10                      $CHAR7.                             
      @1412   I10_PR11                      $CHAR7.                             
      @1419   I10_PR12                      $CHAR7.                             
      @1426   I10_PR13                      $CHAR7.                             
      @1433   I10_PR14                      $CHAR7.                             
      @1440   I10_PR15                      $CHAR7.                             
      @1447   I10_PR16                      $CHAR7.                             
      @1454   I10_PR17                      $CHAR7.                             
      @1461   I10_PR18                      $CHAR7.                             
      @1468   I10_PR19                      $CHAR7.                             
      @1475   I10_PR20                      $CHAR7.                             
      @1482   I10_PR21                      $CHAR7.                             
      @1489   I10_PR22                      $CHAR7.                             
      @1496   I10_PR23                      $CHAR7.                             
      @1503   I10_PR24                      $CHAR7.                             
      @1510   I10_PR25                      $CHAR7.                             
      @1517   I10_PRCCS1                    N3PF.                               
      @1520   I10_PRCCS2                    N3PF.                               
      @1523   I10_PRCCS3                    N3PF.                               
      @1526   I10_PRCCS4                    N3PF.                               
      @1529   I10_PRCCS5                    N3PF.                               
      @1532   I10_PRCCS6                    N3PF.                               
      @1535   I10_PRCCS7                    N3PF.                               
      @1538   I10_PRCCS8                    N3PF.                               
      @1541   I10_PRCCS9                    N3PF.                               
      @1544   I10_PRCCS10                   N3PF.                               
      @1547   I10_PRCCS11                   N3PF.                               
      @1550   I10_PRCCS12                   N3PF.                               
      @1553   I10_PRCCS13                   N3PF.                               
      @1556   I10_PRCCS14                   N3PF.                               
      @1559   I10_PRCCS15                   N3PF.                               
      @1562   I10_PRCCS16                   N3PF.                               
      @1565   I10_PRCCS17                   N3PF.                               
      @1568   I10_PRCCS18                   N3PF.                               
      @1571   I10_PRCCS19                   N3PF.                               
      @1574   I10_PRCCS20                   N3PF.                               
      @1577   I10_PRCCS21                   N3PF.                               
      @1580   I10_PRCCS22                   N3PF.                               
      @1583   I10_PRCCS23                   N3PF.                               
      @1586   I10_PRCCS24                   N3PF.                               
      @1589   I10_PRCCS25                   N3PF.                               
      @1592   I10_PROCTYPE                  N3PF.                               
      @1595   KEY                           15.                                 
      @1610   LOS                           N5PF.                               
      @1615   LOS_X                         N6PF.                               
      @1621   MARITALSTATUS_X               $CHAR1.                             
      @1622   MARITALSTATUSUB04             $CHAR1.                             
      @1623   MDNUM1_R                      N9PF.                               
      @1632   MDNUM2_R                      N9PF.                               
      @1641   MDNUM3_R                      N9PF.                               
      @1650   MDNUM4_R                      N9PF.                               
      @1659   MEDINCSTQ                     N2PF.                               
      @1661   NCPT                          N4PF.                               
      @1665   OPservice                     $CHAR2.                             
      @1667   OS_TIME                       N11P2F.                             
      @1678   PAY1                          N2PF.                               
      @1680   PAY1_X                        $CHAR4.                             
      @1684   PAY2                          N2PF.                               
      @1686   PAY2_X                        $CHAR4.                             
      @1690   PAY3                          N2PF.                               
      @1692   PAY3_X                        $CHAR4.                             
      @1696   PL_CBSA                       N3PF.                               
      @1699   PL_NCHS                       N2PF.                               
      @1701   PL_RUCC                       N2PF.                               
      @1703   PL_UIC                        N2PF.                               
      @1705   PL_UR_CAT4                    N2PF.                               
      @1707   POA_Disch_Edit1               N2PF.                               
      @1709   POA_Disch_Edit2               N2PF.                               
      @1711   POA_Hosp_Edit1                N2PF.                               
      @1713   POA_Hosp_Edit2                N2PF.                               
      @1715   POA_Hosp_Edit3                N2PF.                               
      @1717   POA_Hosp_Edit3_Value          N8P2F.                              
      @1725   PointOfOrigin_X               $CHAR1.                             
      @1726   PointOfOriginUB04             $CHAR1.                             
      @1727   PRDAY1                        N5PF.                               
      @1732   PRDAY2                        N5PF.                               
      @1737   PRDAY3                        N5PF.                               
      @1742   PRDAY4                        N5PF.                               
      @1747   PRDAY5                        N5PF.                               
      @1752   PRDAY6                        N5PF.                               
      @1757   PRDAY7                        N5PF.                               
      @1762   PRDAY8                        N5PF.                               
      @1767   PRDAY9                        N5PF.                               
      @1772   PRDAY10                       N5PF.                               
      @1777   PRDAY11                       N5PF.                               
      @1782   PRDAY12                       N5PF.                               
      @1787   PRDAY13                       N5PF.                               
      @1792   PRDAY14                       N5PF.                               
      @1797   PRDAY15                       N5PF.                               
      @1802   PRDAY16                       N5PF.                               
      @1807   PRDAY17                       N5PF.                               
      @1812   PRDAY18                       N5PF.                               
      @1817   PRDAY19                       N5PF.                               
      @1822   PRDAY20                       N5PF.                               
      @1827   PRDAY21                       N5PF.                               
      @1832   PRDAY22                       N5PF.                               
      @1837   PRDAY23                       N5PF.                               
      @1842   PRDAY24                       N5PF.                               
      @1847   PRDAY25                       N5PF.                               
      @1852   PRVER                         N3PF.                               
      @1855   PSTATE                        $CHAR2.                             
      @1857   PSTCO                         N5PF.                               
      @1862   PSTCO2                        N5PF.                               
      @1867   RACE                          N2PF.                               
      @1869   RACE_X                        $CHAR1.                             
      @1870   STATE_AS                      N2PF.                               
      @1872   STATE_ED                      N2PF.                               
      @1874   STATE_OS                      N2PF.                               
      @1876   TOTCHG                        N10PF.                              
      @1886   TOTCHG_X                      N15P2F.                             
      @1901   VisitLink                     N9PF.                               
      @1910   YEAR                          N4PF.                               
      @1914   ZIP                           $CHAR5.                             
      @1919   ZIP3                          $CHAR3.                             
      @1922   ZIPINC_QRTL                   N3PF.                               
      @1925   HOSPID                        N5PF.                               
      @1930   AYEAR                         N4PF.                               
      @1934   BMONTH                        N2PF.                               
      @1936   BYEAR                         N4PF.                               
      @1940   PRMONTH1                      N2PF.                               
      @1942   PRMONTH2                      N2PF.                               
      @1944   PRMONTH3                      N2PF.                               
      @1946   PRMONTH4                      N2PF.                               
      @1948   PRMONTH5                      N2PF.                               
      @1950   PRMONTH6                      N2PF.                               
      @1952   PRMONTH7                      N2PF.                               
      @1954   PRMONTH8                      N2PF.                               
      @1956   PRMONTH9                      N2PF.                               
      @1958   PRMONTH10                     N2PF.                               
      @1960   PRMONTH11                     N2PF.                               
      @1962   PRMONTH12                     N2PF.                               
      @1964   PRMONTH13                     N2PF.                               
      @1966   PRMONTH14                     N2PF.                               
      @1968   PRMONTH15                     N2PF.                               
      @1970   PRMONTH16                     N2PF.                               
      @1972   PRMONTH17                     N2PF.                               
      @1974   PRMONTH18                     N2PF.                               
      @1976   PRMONTH19                     N2PF.                               
      @1978   PRMONTH20                     N2PF.                               
      @1980   PRMONTH21                     N2PF.                               
      @1982   PRMONTH22                     N2PF.                               
      @1984   PRMONTH23                     N2PF.                               
      @1986   PRMONTH24                     N2PF.                               
      @1988   PRMONTH25                     N2PF.                               
      @1990   PRYEAR1                       N4PF.                               
      @1994   PRYEAR2                       N4PF.                               
      @1998   PRYEAR3                       N4PF.                               
      @2002   PRYEAR4                       N4PF.                               
      @2006   PRYEAR5                       N4PF.                               
      @2010   PRYEAR6                       N4PF.                               
      @2014   PRYEAR7                       N4PF.                               
      @2018   PRYEAR8                       N4PF.                               
      @2022   PRYEAR9                       N4PF.                               
      @2026   PRYEAR10                      N4PF.                               
      @2030   PRYEAR11                      N4PF.                               
      @2034   PRYEAR12                      N4PF.                               
      @2038   PRYEAR13                      N4PF.                               
      @2042   PRYEAR14                      N4PF.                               
      @2046   PRYEAR15                      N4PF.                               
      @2050   PRYEAR16                      N4PF.                               
      @2054   PRYEAR17                      N4PF.                               
      @2058   PRYEAR18                      N4PF.                               
      @2062   PRYEAR19                      N4PF.                               
      @2066   PRYEAR20                      N4PF.                               
      @2070   PRYEAR21                      N4PF.                               
      @2074   PRYEAR22                      N4PF.                               
      @2078   PRYEAR23                      N4PF.                               
      @2082   PRYEAR24                      N4PF.                               
      @2086   PRYEAR25                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
