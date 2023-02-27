/*******************************************************************            
* Creation Date: 10/24/2019                                                     
*   AK_SID_2015q4_CORE.SAS:                                                     
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
DATA AK_SIDC_2015q4_CORE;                                                       
INFILE 'AK_SID_2015q4_CORE.ASC' FIRSTOBS=3 LRECL = 1710;                        
                                                                                
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
                                                                                
  DRG32                      LENGTH=3                                           
  LABEL="DRG, version 32"                                                       
                                                                                
  DRGVER                     LENGTH=3                                           
  LABEL="DRG grouper version used on discharge date"                            
                                                                                
  DXVER                      LENGTH=3                                           
  LABEL="Diagnosis Version"                                                     
                                                                                
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
                                                                                
  MDC32                      LENGTH=3                                           
  LABEL="MDC, version 32"                                                       
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures for this visit"                         
                                                                                
  OBSERVATION                LENGTH=4                                           
  LABEL="Time for observation services (as received from source)"               
                                                                                
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
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
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
      @271    CPTCCS1                       N3PF.                               
      @274    CPTCCS2                       N3PF.                               
      @277    CPTCCS3                       N3PF.                               
      @280    CPTCCS4                       N3PF.                               
      @283    CPTCCS5                       N3PF.                               
      @286    CPTCCS6                       N3PF.                               
      @289    CPTCCS7                       N3PF.                               
      @292    CPTCCS8                       N3PF.                               
      @295    CPTCCS9                       N3PF.                               
      @298    CPTCCS10                      N3PF.                               
      @301    CPTCCS11                      N3PF.                               
      @304    CPTCCS12                      N3PF.                               
      @307    CPTCCS13                      N3PF.                               
      @310    CPTCCS14                      N3PF.                               
      @313    CPTCCS15                      N3PF.                               
      @316    CPTCCS16                      N3PF.                               
      @319    CPTCCS17                      N3PF.                               
      @322    CPTCCS18                      N3PF.                               
      @325    CPTCCS19                      N3PF.                               
      @328    CPTCCS20                      N3PF.                               
      @331    CPTCCS21                      N3PF.                               
      @334    CPTCCS22                      N3PF.                               
      @337    CPTCCS23                      N3PF.                               
      @340    CPTCCS24                      N3PF.                               
      @343    CPTCCS25                      N3PF.                               
      @346    CPTCCS26                      N3PF.                               
      @349    CPTCCS27                      N3PF.                               
      @352    CPTCCS28                      N3PF.                               
      @355    CPTCCS29                      N3PF.                               
      @358    CPTCCS30                      N3PF.                               
      @361    CPTCCS31                      N3PF.                               
      @364    CPTCCS32                      N3PF.                               
      @367    CPTCCS33                      N3PF.                               
      @370    CPTCCS34                      N3PF.                               
      @373    CPTCCS35                      N3PF.                               
      @376    CPTCCS36                      N3PF.                               
      @379    CPTCCS37                      N3PF.                               
      @382    CPTCCS38                      N3PF.                               
      @385    CPTCCS39                      N3PF.                               
      @388    CPTCCS40                      N3PF.                               
      @391    CPTCCS41                      N3PF.                               
      @394    CPTCCS42                      N3PF.                               
      @397    CPTCCS43                      N3PF.                               
      @400    CPTCCS44                      N3PF.                               
      @403    CPTCCS45                      N3PF.                               
      @406    CPTCCS46                      N3PF.                               
      @409    CPTCCS47                      N3PF.                               
      @412    CPTCCS48                      N3PF.                               
      @415    CPTCCS49                      N3PF.                               
      @418    CPTCCS50                      N3PF.                               
      @421    CPTDAY1                       N3PF.                               
      @424    CPTDAY2                       N3PF.                               
      @427    CPTDAY3                       N3PF.                               
      @430    CPTDAY4                       N3PF.                               
      @433    CPTDAY5                       N3PF.                               
      @436    CPTDAY6                       N3PF.                               
      @439    CPTDAY7                       N3PF.                               
      @442    CPTDAY8                       N3PF.                               
      @445    CPTDAY9                       N3PF.                               
      @448    CPTDAY10                      N3PF.                               
      @451    CPTDAY11                      N3PF.                               
      @454    CPTDAY12                      N3PF.                               
      @457    CPTDAY13                      N3PF.                               
      @460    CPTDAY14                      N3PF.                               
      @463    CPTDAY15                      N3PF.                               
      @466    CPTDAY16                      N3PF.                               
      @469    CPTDAY17                      N3PF.                               
      @472    CPTDAY18                      N3PF.                               
      @475    CPTDAY19                      N3PF.                               
      @478    CPTDAY20                      N3PF.                               
      @481    CPTDAY21                      N3PF.                               
      @484    CPTDAY22                      N3PF.                               
      @487    CPTDAY23                      N3PF.                               
      @490    CPTDAY24                      N3PF.                               
      @493    CPTDAY25                      N3PF.                               
      @496    CPTDAY26                      N3PF.                               
      @499    CPTDAY27                      N3PF.                               
      @502    CPTDAY28                      N3PF.                               
      @505    CPTDAY29                      N3PF.                               
      @508    CPTDAY30                      N3PF.                               
      @511    CPTDAY31                      N3PF.                               
      @514    CPTDAY32                      N3PF.                               
      @517    CPTDAY33                      N3PF.                               
      @520    CPTDAY34                      N3PF.                               
      @523    CPTDAY35                      N3PF.                               
      @526    CPTDAY36                      N3PF.                               
      @529    CPTDAY37                      N3PF.                               
      @532    CPTDAY38                      N3PF.                               
      @535    CPTDAY39                      N3PF.                               
      @538    CPTDAY40                      N3PF.                               
      @541    CPTDAY41                      N3PF.                               
      @544    CPTDAY42                      N3PF.                               
      @547    CPTDAY43                      N3PF.                               
      @550    CPTDAY44                      N3PF.                               
      @553    CPTDAY45                      N3PF.                               
      @556    CPTDAY46                      N3PF.                               
      @559    CPTDAY47                      N3PF.                               
      @562    CPTDAY48                      N3PF.                               
      @565    CPTDAY49                      N3PF.                               
      @568    CPTDAY50                      N3PF.                               
      @571    DaysToEvent                   N6PF.                               
      @577    DHOUR                         N4PF.                               
      @581    DIED                          N2PF.                               
      @583    DISP_X                        $CHAR2.                             
      @585    DISPUB04                      N2PF.                               
      @587    DISPUNIFORM                   N2PF.                               
      @589    DMONTH                        N2PF.                               
      @591    DQTR                          N2PF.                               
      @593    DRG                           N3PF.                               
      @596    DRG_NoPOA                     N3PF.                               
      @599    DRG32                         N3PF.                               
      @602    DRGVER                        N2PF.                               
      @604    DXVER                         N3PF.                               
      @607    FEMALE                        N2PF.                               
      @609    HCUP_ED                       N2PF.                               
      @611    HCUP_OS                       N2PF.                               
      @613    HISPANIC                      N2PF.                               
      @615    HISPANIC_X                    $CHAR1.                             
      @616    HospitalUnit                  N2PF.                               
      @618    HOSPST                        $CHAR2.                             
      @620    I10_DX_Admitting              $CHAR7.                             
      @627    I10_DX1                       $CHAR7.                             
      @634    I10_DX2                       $CHAR7.                             
      @641    I10_DX3                       $CHAR7.                             
      @648    I10_DX4                       $CHAR7.                             
      @655    I10_DX5                       $CHAR7.                             
      @662    I10_DX6                       $CHAR7.                             
      @669    I10_DX7                       $CHAR7.                             
      @676    I10_DX8                       $CHAR7.                             
      @683    I10_DX9                       $CHAR7.                             
      @690    I10_DX10                      $CHAR7.                             
      @697    I10_DX11                      $CHAR7.                             
      @704    I10_DX12                      $CHAR7.                             
      @711    I10_DX13                      $CHAR7.                             
      @718    I10_DX14                      $CHAR7.                             
      @725    I10_DX15                      $CHAR7.                             
      @732    I10_DX16                      $CHAR7.                             
      @739    I10_DX17                      $CHAR7.                             
      @746    I10_DX18                      $CHAR7.                             
      @753    I10_DX19                      $CHAR7.                             
      @760    I10_DX20                      $CHAR7.                             
      @767    I10_DX21                      $CHAR7.                             
      @774    I10_DX22                      $CHAR7.                             
      @781    I10_DX23                      $CHAR7.                             
      @788    I10_DX24                      $CHAR7.                             
      @795    I10_DX25                      $CHAR7.                             
      @802    I10_DX26                      $CHAR7.                             
      @809    I10_DX27                      $CHAR7.                             
      @816    I10_DX28                      $CHAR7.                             
      @823    I10_DX29                      $CHAR7.                             
      @830    I10_DX30                      $CHAR7.                             
      @837    I10_DXCCS1                    N4PF.                               
      @841    I10_DXCCS2                    N4PF.                               
      @845    I10_DXCCS3                    N4PF.                               
      @849    I10_DXCCS4                    N4PF.                               
      @853    I10_DXCCS5                    N4PF.                               
      @857    I10_DXCCS6                    N4PF.                               
      @861    I10_DXCCS7                    N4PF.                               
      @865    I10_DXCCS8                    N4PF.                               
      @869    I10_DXCCS9                    N4PF.                               
      @873    I10_DXCCS10                   N4PF.                               
      @877    I10_DXCCS11                   N4PF.                               
      @881    I10_DXCCS12                   N4PF.                               
      @885    I10_DXCCS13                   N4PF.                               
      @889    I10_DXCCS14                   N4PF.                               
      @893    I10_DXCCS15                   N4PF.                               
      @897    I10_DXCCS16                   N4PF.                               
      @901    I10_DXCCS17                   N4PF.                               
      @905    I10_DXCCS18                   N4PF.                               
      @909    I10_DXCCS19                   N4PF.                               
      @913    I10_DXCCS20                   N4PF.                               
      @917    I10_DXCCS21                   N4PF.                               
      @921    I10_DXCCS22                   N4PF.                               
      @925    I10_DXCCS23                   N4PF.                               
      @929    I10_DXCCS24                   N4PF.                               
      @933    I10_DXCCS25                   N4PF.                               
      @937    I10_DXCCS26                   N4PF.                               
      @941    I10_DXCCS27                   N4PF.                               
      @945    I10_DXCCS28                   N4PF.                               
      @949    I10_DXCCS29                   N4PF.                               
      @953    I10_DXCCS30                   N4PF.                               
      @957    I10_ECAUSE1                   $CHAR7.                             
      @964    I10_ECAUSE2                   $CHAR7.                             
      @971    I10_ECAUSE3                   $CHAR7.                             
      @978    I10_ECAUSE4                   $CHAR7.                             
      @985    I10_ECAUSE5                   $CHAR7.                             
      @992    I10_ECAUSE6                   $CHAR7.                             
      @999    I10_ECauseCCS1                N4PF.                               
      @1003   I10_ECauseCCS2                N4PF.                               
      @1007   I10_ECauseCCS3                N4PF.                               
      @1011   I10_ECauseCCS4                N4PF.                               
      @1015   I10_ECauseCCS5                N4PF.                               
      @1019   I10_ECauseCCS6                N4PF.                               
      @1023   I10_HOSPBRTH                  N3PF.                               
      @1026   I10_NCHRONIC                  N3PF.                               
      @1029   I10_NDX                       N3PF.                               
      @1032   I10_NECAUSE                   N2PF.                               
      @1034   I10_NEOMAT                    N2PF.                               
      @1036   I10_NPR                       N3PF.                               
      @1039   I10_ORPROC                    N2PF.                               
      @1041   I10_PR1                       $CHAR7.                             
      @1048   I10_PR2                       $CHAR7.                             
      @1055   I10_PR3                       $CHAR7.                             
      @1062   I10_PR4                       $CHAR7.                             
      @1069   I10_PR5                       $CHAR7.                             
      @1076   I10_PR6                       $CHAR7.                             
      @1083   I10_PR7                       $CHAR7.                             
      @1090   I10_PR8                       $CHAR7.                             
      @1097   I10_PR9                       $CHAR7.                             
      @1104   I10_PR10                      $CHAR7.                             
      @1111   I10_PR11                      $CHAR7.                             
      @1118   I10_PR12                      $CHAR7.                             
      @1125   I10_PR13                      $CHAR7.                             
      @1132   I10_PR14                      $CHAR7.                             
      @1139   I10_PR15                      $CHAR7.                             
      @1146   I10_PR16                      $CHAR7.                             
      @1153   I10_PR17                      $CHAR7.                             
      @1160   I10_PR18                      $CHAR7.                             
      @1167   I10_PR19                      $CHAR7.                             
      @1174   I10_PR20                      $CHAR7.                             
      @1181   I10_PR21                      $CHAR7.                             
      @1188   I10_PR22                      $CHAR7.                             
      @1195   I10_PR23                      $CHAR7.                             
      @1202   I10_PR24                      $CHAR7.                             
      @1209   I10_PR25                      $CHAR7.                             
      @1216   I10_PRCCS1                    N3PF.                               
      @1219   I10_PRCCS2                    N3PF.                               
      @1222   I10_PRCCS3                    N3PF.                               
      @1225   I10_PRCCS4                    N3PF.                               
      @1228   I10_PRCCS5                    N3PF.                               
      @1231   I10_PRCCS6                    N3PF.                               
      @1234   I10_PRCCS7                    N3PF.                               
      @1237   I10_PRCCS8                    N3PF.                               
      @1240   I10_PRCCS9                    N3PF.                               
      @1243   I10_PRCCS10                   N3PF.                               
      @1246   I10_PRCCS11                   N3PF.                               
      @1249   I10_PRCCS12                   N3PF.                               
      @1252   I10_PRCCS13                   N3PF.                               
      @1255   I10_PRCCS14                   N3PF.                               
      @1258   I10_PRCCS15                   N3PF.                               
      @1261   I10_PRCCS16                   N3PF.                               
      @1264   I10_PRCCS17                   N3PF.                               
      @1267   I10_PRCCS18                   N3PF.                               
      @1270   I10_PRCCS19                   N3PF.                               
      @1273   I10_PRCCS20                   N3PF.                               
      @1276   I10_PRCCS21                   N3PF.                               
      @1279   I10_PRCCS22                   N3PF.                               
      @1282   I10_PRCCS23                   N3PF.                               
      @1285   I10_PRCCS24                   N3PF.                               
      @1288   I10_PRCCS25                   N3PF.                               
      @1291   I10_PROCTYPE                  N3PF.                               
      @1294   I10_SERVICELINE               N2PF.                               
      @1296   KEY                           15.                                 
      @1311   LOS                           N5PF.                               
      @1316   LOS_X                         N6PF.                               
      @1322   MDC                           N2PF.                               
      @1324   MDC_NoPOA                     N2PF.                               
      @1326   MDC32                         N2PF.                               
      @1328   MEDINCSTQ                     N2PF.                               
      @1330   NCPT                          N4PF.                               
      @1334   OBSERVATION                   N4PF.                               
      @1338   OS_TIME                       N11P2F.                             
      @1349   PAY1                          N2PF.                               
      @1351   PAY1_X                        $CHAR2.                             
      @1353   PAY2                          N2PF.                               
      @1355   PAY2_X                        $CHAR2.                             
      @1357   PAY3                          N2PF.                               
      @1359   PAY3_X                        $CHAR2.                             
      @1361   PL_CBSA                       N3PF.                               
      @1364   PL_NCHS                       N2PF.                               
      @1366   PointOfOrigin_X               $CHAR1.                             
      @1367   PointOfOriginUB04             $CHAR1.                             
      @1368   PRDAY1                        N5PF.                               
      @1373   PRDAY2                        N5PF.                               
      @1378   PRDAY3                        N5PF.                               
      @1383   PRDAY4                        N5PF.                               
      @1388   PRDAY5                        N5PF.                               
      @1393   PRDAY6                        N5PF.                               
      @1398   PRDAY7                        N5PF.                               
      @1403   PRDAY8                        N5PF.                               
      @1408   PRDAY9                        N5PF.                               
      @1413   PRDAY10                       N5PF.                               
      @1418   PRDAY11                       N5PF.                               
      @1423   PRDAY12                       N5PF.                               
      @1428   PRDAY13                       N5PF.                               
      @1433   PRDAY14                       N5PF.                               
      @1438   PRDAY15                       N5PF.                               
      @1443   PRDAY16                       N5PF.                               
      @1448   PRDAY17                       N5PF.                               
      @1453   PRDAY18                       N5PF.                               
      @1458   PRDAY19                       N5PF.                               
      @1463   PRDAY20                       N5PF.                               
      @1468   PRDAY21                       N5PF.                               
      @1473   PRDAY22                       N5PF.                               
      @1478   PRDAY23                       N5PF.                               
      @1483   PRDAY24                       N5PF.                               
      @1488   PRDAY25                       N5PF.                               
      @1493   PRVER                         N3PF.                               
      @1496   PSTATE                        $CHAR2.                             
      @1498   RACE                          N2PF.                               
      @1500   RACE_X                        $CHAR1.                             
      @1501   TOTCHG                        N10PF.                              
      @1511   TOTCHG_X                      N15P2F.                             
      @1526   TRAN_IN                       N2PF.                               
      @1528   TRAN_OUT                      N2PF.                               
      @1530   VisitLink                     N9PF.                               
      @1539   YEAR                          N4PF.                               
      @1543   ZIPINC_QRTL                   N3PF.                               
      @1546   HOSPID                        N5PF.                               
      @1551   AYEAR                         N4PF.                               
      @1555   BMONTH                        N2PF.                               
      @1557   BYEAR                         N4PF.                               
      @1561   PRMONTH1                      N2PF.                               
      @1563   PRMONTH2                      N2PF.                               
      @1565   PRMONTH3                      N2PF.                               
      @1567   PRMONTH4                      N2PF.                               
      @1569   PRMONTH5                      N2PF.                               
      @1571   PRMONTH6                      N2PF.                               
      @1573   PRMONTH7                      N2PF.                               
      @1575   PRMONTH8                      N2PF.                               
      @1577   PRMONTH9                      N2PF.                               
      @1579   PRMONTH10                     N2PF.                               
      @1581   PRMONTH11                     N2PF.                               
      @1583   PRMONTH12                     N2PF.                               
      @1585   PRMONTH13                     N2PF.                               
      @1587   PRMONTH14                     N2PF.                               
      @1589   PRMONTH15                     N2PF.                               
      @1591   PRMONTH16                     N2PF.                               
      @1593   PRMONTH17                     N2PF.                               
      @1595   PRMONTH18                     N2PF.                               
      @1597   PRMONTH19                     N2PF.                               
      @1599   PRMONTH20                     N2PF.                               
      @1601   PRMONTH21                     N2PF.                               
      @1603   PRMONTH22                     N2PF.                               
      @1605   PRMONTH23                     N2PF.                               
      @1607   PRMONTH24                     N2PF.                               
      @1609   PRMONTH25                     N2PF.                               
      @1611   PRYEAR1                       N4PF.                               
      @1615   PRYEAR2                       N4PF.                               
      @1619   PRYEAR3                       N4PF.                               
      @1623   PRYEAR4                       N4PF.                               
      @1627   PRYEAR5                       N4PF.                               
      @1631   PRYEAR6                       N4PF.                               
      @1635   PRYEAR7                       N4PF.                               
      @1639   PRYEAR8                       N4PF.                               
      @1643   PRYEAR9                       N4PF.                               
      @1647   PRYEAR10                      N4PF.                               
      @1651   PRYEAR11                      N4PF.                               
      @1655   PRYEAR12                      N4PF.                               
      @1659   PRYEAR13                      N4PF.                               
      @1663   PRYEAR14                      N4PF.                               
      @1667   PRYEAR15                      N4PF.                               
      @1671   PRYEAR16                      N4PF.                               
      @1675   PRYEAR17                      N4PF.                               
      @1679   PRYEAR18                      N4PF.                               
      @1683   PRYEAR19                      N4PF.                               
      @1687   PRYEAR20                      N4PF.                               
      @1691   PRYEAR21                      N4PF.                               
      @1695   PRYEAR22                      N4PF.                               
      @1699   PRYEAR23                      N4PF.                               
      @1703   PRYEAR24                      N4PF.                               
      @1707   PRYEAR25                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
