/*******************************************************************            
* Creation Date: 05/11/2018                                                     
*   ME_SEDD_2015q4_CORE.SAS:                                                    
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
DATA ME_SEDDC_2015q4_CORE;                                                      
INFILE 'ME_SEDD_2015q4_CORE.ASC' FIRSTOBS=3 LRECL = 1285;                       
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
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
                                                                                
  DMONTH                     LENGTH=3                                           
  LABEL="Discharge month"                                                       
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DXVER                      LENGTH=3                                           
  LABEL="Diagnosis Version"                                                     
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
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
                                                                                
  I10_PROCTYPE               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure type indicator"                                   
                                                                                
  KEY                        LENGTH=8                      FORMAT=Z15.          
  LABEL="HCUP record identifier"                                                
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  MDSPEC1                    LENGTH=$2                                          
  LABEL="Physician 1 specialty (as received from source)"                       
                                                                                
  MDSPEC2                    LENGTH=$2                                          
  LABEL="Physician 2 specialty (as received from source)"                       
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures for this visit"                         
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_NCHS                    LENGTH=3                                           
  LABEL="Patient Location: NCHS Urban-Rural Code"                               
                                                                                
  PL_UIC                     LENGTH=3                                           
  LABEL="Patient location: Urban Influence Codes"                               
                                                                                
  PL_UR_CAT4                 LENGTH=3                                           
  LABEL="Patient Location: Urban-Rural 4 Categories"                            
                                                                                
  PointOfOriginUB04          LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, UB-04 standard coding"         
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO                      LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  STATE_AS                   LENGTH=3                                           
  LABEL="State Ambulatory Surgery service indicator"                            
                                                                                
  STATE_ED                   LENGTH=3                                           
  LABEL="State Emergency Department service indicator"                          
                                                                                
  STATE_OS                   LENGTH=3                                           
  LABEL="State Observation Stay service indicator"                              
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  AGEGROUP                   LENGTH=3                                           
  LABEL=" "                                                                     
                                                                                
  HOSPID                     LENGTH=4                      FORMAT=Z5.           
  LABEL="HCUP hospital identification number"                                   
                                                                                
  AYEAR                      LENGTH=3                                           
  LABEL="Admission year"                                                        
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AMONTH                        N2PF.                               
      @3      AWEEKEND                      N2PF.                               
      @5      BILLTYPE                      $CHAR4.                             
      @9      CPT1                          $CHAR5.                             
      @14     CPT2                          $CHAR5.                             
      @19     CPT3                          $CHAR5.                             
      @24     CPT4                          $CHAR5.                             
      @29     CPT5                          $CHAR5.                             
      @34     CPT6                          $CHAR5.                             
      @39     CPT7                          $CHAR5.                             
      @44     CPT8                          $CHAR5.                             
      @49     CPT9                          $CHAR5.                             
      @54     CPT10                         $CHAR5.                             
      @59     CPT11                         $CHAR5.                             
      @64     CPT12                         $CHAR5.                             
      @69     CPT13                         $CHAR5.                             
      @74     CPT14                         $CHAR5.                             
      @79     CPT15                         $CHAR5.                             
      @84     CPT16                         $CHAR5.                             
      @89     CPT17                         $CHAR5.                             
      @94     CPT18                         $CHAR5.                             
      @99     CPT19                         $CHAR5.                             
      @104    CPT20                         $CHAR5.                             
      @109    CPT21                         $CHAR5.                             
      @114    CPT22                         $CHAR5.                             
      @119    CPT23                         $CHAR5.                             
      @124    CPT24                         $CHAR5.                             
      @129    CPT25                         $CHAR5.                             
      @134    CPT26                         $CHAR5.                             
      @139    CPT27                         $CHAR5.                             
      @144    CPT28                         $CHAR5.                             
      @149    CPT29                         $CHAR5.                             
      @154    CPT30                         $CHAR5.                             
      @159    CPT31                         $CHAR5.                             
      @164    CPT32                         $CHAR5.                             
      @169    CPT33                         $CHAR5.                             
      @174    CPT34                         $CHAR5.                             
      @179    CPT35                         $CHAR5.                             
      @184    CPT36                         $CHAR5.                             
      @189    CPT37                         $CHAR5.                             
      @194    CPT38                         $CHAR5.                             
      @199    CPT39                         $CHAR5.                             
      @204    CPT40                         $CHAR5.                             
      @209    CPT41                         $CHAR5.                             
      @214    CPT42                         $CHAR5.                             
      @219    CPT43                         $CHAR5.                             
      @224    CPT44                         $CHAR5.                             
      @229    CPT45                         $CHAR5.                             
      @234    CPT46                         $CHAR5.                             
      @239    CPT47                         $CHAR5.                             
      @244    CPT48                         $CHAR5.                             
      @249    CPT49                         $CHAR5.                             
      @254    CPT50                         $CHAR5.                             
      @259    CPTCCS1                       N3PF.                               
      @262    CPTCCS2                       N3PF.                               
      @265    CPTCCS3                       N3PF.                               
      @268    CPTCCS4                       N3PF.                               
      @271    CPTCCS5                       N3PF.                               
      @274    CPTCCS6                       N3PF.                               
      @277    CPTCCS7                       N3PF.                               
      @280    CPTCCS8                       N3PF.                               
      @283    CPTCCS9                       N3PF.                               
      @286    CPTCCS10                      N3PF.                               
      @289    CPTCCS11                      N3PF.                               
      @292    CPTCCS12                      N3PF.                               
      @295    CPTCCS13                      N3PF.                               
      @298    CPTCCS14                      N3PF.                               
      @301    CPTCCS15                      N3PF.                               
      @304    CPTCCS16                      N3PF.                               
      @307    CPTCCS17                      N3PF.                               
      @310    CPTCCS18                      N3PF.                               
      @313    CPTCCS19                      N3PF.                               
      @316    CPTCCS20                      N3PF.                               
      @319    CPTCCS21                      N3PF.                               
      @322    CPTCCS22                      N3PF.                               
      @325    CPTCCS23                      N3PF.                               
      @328    CPTCCS24                      N3PF.                               
      @331    CPTCCS25                      N3PF.                               
      @334    CPTCCS26                      N3PF.                               
      @337    CPTCCS27                      N3PF.                               
      @340    CPTCCS28                      N3PF.                               
      @343    CPTCCS29                      N3PF.                               
      @346    CPTCCS30                      N3PF.                               
      @349    CPTCCS31                      N3PF.                               
      @352    CPTCCS32                      N3PF.                               
      @355    CPTCCS33                      N3PF.                               
      @358    CPTCCS34                      N3PF.                               
      @361    CPTCCS35                      N3PF.                               
      @364    CPTCCS36                      N3PF.                               
      @367    CPTCCS37                      N3PF.                               
      @370    CPTCCS38                      N3PF.                               
      @373    CPTCCS39                      N3PF.                               
      @376    CPTCCS40                      N3PF.                               
      @379    CPTCCS41                      N3PF.                               
      @382    CPTCCS42                      N3PF.                               
      @385    CPTCCS43                      N3PF.                               
      @388    CPTCCS44                      N3PF.                               
      @391    CPTCCS45                      N3PF.                               
      @394    CPTCCS46                      N3PF.                               
      @397    CPTCCS47                      N3PF.                               
      @400    CPTCCS48                      N3PF.                               
      @403    CPTCCS49                      N3PF.                               
      @406    CPTCCS50                      N3PF.                               
      @409    CPTDAY1                       N3PF.                               
      @412    CPTDAY2                       N3PF.                               
      @415    CPTDAY3                       N3PF.                               
      @418    CPTDAY4                       N3PF.                               
      @421    CPTDAY5                       N3PF.                               
      @424    CPTDAY6                       N3PF.                               
      @427    CPTDAY7                       N3PF.                               
      @430    CPTDAY8                       N3PF.                               
      @433    CPTDAY9                       N3PF.                               
      @436    CPTDAY10                      N3PF.                               
      @439    CPTDAY11                      N3PF.                               
      @442    CPTDAY12                      N3PF.                               
      @445    CPTDAY13                      N3PF.                               
      @448    CPTDAY14                      N3PF.                               
      @451    CPTDAY15                      N3PF.                               
      @454    CPTDAY16                      N3PF.                               
      @457    CPTDAY17                      N3PF.                               
      @460    CPTDAY18                      N3PF.                               
      @463    CPTDAY19                      N3PF.                               
      @466    CPTDAY20                      N3PF.                               
      @469    CPTDAY21                      N3PF.                               
      @472    CPTDAY22                      N3PF.                               
      @475    CPTDAY23                      N3PF.                               
      @478    CPTDAY24                      N3PF.                               
      @481    CPTDAY25                      N3PF.                               
      @484    CPTDAY26                      N3PF.                               
      @487    CPTDAY27                      N3PF.                               
      @490    CPTDAY28                      N3PF.                               
      @493    CPTDAY29                      N3PF.                               
      @496    CPTDAY30                      N3PF.                               
      @499    CPTDAY31                      N3PF.                               
      @502    CPTDAY32                      N3PF.                               
      @505    CPTDAY33                      N3PF.                               
      @508    CPTDAY34                      N3PF.                               
      @511    CPTDAY35                      N3PF.                               
      @514    CPTDAY36                      N3PF.                               
      @517    CPTDAY37                      N3PF.                               
      @520    CPTDAY38                      N3PF.                               
      @523    CPTDAY39                      N3PF.                               
      @526    CPTDAY40                      N3PF.                               
      @529    CPTDAY41                      N3PF.                               
      @532    CPTDAY42                      N3PF.                               
      @535    CPTDAY43                      N3PF.                               
      @538    CPTDAY44                      N3PF.                               
      @541    CPTDAY45                      N3PF.                               
      @544    CPTDAY46                      N3PF.                               
      @547    CPTDAY47                      N3PF.                               
      @550    CPTDAY48                      N3PF.                               
      @553    CPTDAY49                      N3PF.                               
      @556    CPTDAY50                      N3PF.                               
      @559    CPTM1_1                       $CHAR2.                             
      @561    CPTM1_2                       $CHAR2.                             
      @563    CPTM1_3                       $CHAR2.                             
      @565    CPTM1_4                       $CHAR2.                             
      @567    CPTM1_5                       $CHAR2.                             
      @569    CPTM1_6                       $CHAR2.                             
      @571    CPTM1_7                       $CHAR2.                             
      @573    CPTM1_8                       $CHAR2.                             
      @575    CPTM1_9                       $CHAR2.                             
      @577    CPTM1_10                      $CHAR2.                             
      @579    CPTM1_11                      $CHAR2.                             
      @581    CPTM1_12                      $CHAR2.                             
      @583    CPTM1_13                      $CHAR2.                             
      @585    CPTM1_14                      $CHAR2.                             
      @587    CPTM1_15                      $CHAR2.                             
      @589    CPTM1_16                      $CHAR2.                             
      @591    CPTM1_17                      $CHAR2.                             
      @593    CPTM1_18                      $CHAR2.                             
      @595    CPTM1_19                      $CHAR2.                             
      @597    CPTM1_20                      $CHAR2.                             
      @599    CPTM1_21                      $CHAR2.                             
      @601    CPTM1_22                      $CHAR2.                             
      @603    CPTM1_23                      $CHAR2.                             
      @605    CPTM1_24                      $CHAR2.                             
      @607    CPTM1_25                      $CHAR2.                             
      @609    CPTM1_26                      $CHAR2.                             
      @611    CPTM1_27                      $CHAR2.                             
      @613    CPTM1_28                      $CHAR2.                             
      @615    CPTM1_29                      $CHAR2.                             
      @617    CPTM1_30                      $CHAR2.                             
      @619    CPTM1_31                      $CHAR2.                             
      @621    CPTM1_32                      $CHAR2.                             
      @623    CPTM1_33                      $CHAR2.                             
      @625    CPTM1_34                      $CHAR2.                             
      @627    CPTM1_35                      $CHAR2.                             
      @629    CPTM1_36                      $CHAR2.                             
      @631    CPTM1_37                      $CHAR2.                             
      @633    CPTM1_38                      $CHAR2.                             
      @635    CPTM1_39                      $CHAR2.                             
      @637    CPTM1_40                      $CHAR2.                             
      @639    CPTM1_41                      $CHAR2.                             
      @641    CPTM1_42                      $CHAR2.                             
      @643    CPTM1_43                      $CHAR2.                             
      @645    CPTM1_44                      $CHAR2.                             
      @647    CPTM1_45                      $CHAR2.                             
      @649    CPTM1_46                      $CHAR2.                             
      @651    CPTM1_47                      $CHAR2.                             
      @653    CPTM1_48                      $CHAR2.                             
      @655    CPTM1_49                      $CHAR2.                             
      @657    CPTM1_50                      $CHAR2.                             
      @659    CPTM2_1                       $CHAR2.                             
      @661    CPTM2_2                       $CHAR2.                             
      @663    CPTM2_3                       $CHAR2.                             
      @665    CPTM2_4                       $CHAR2.                             
      @667    CPTM2_5                       $CHAR2.                             
      @669    CPTM2_6                       $CHAR2.                             
      @671    CPTM2_7                       $CHAR2.                             
      @673    CPTM2_8                       $CHAR2.                             
      @675    CPTM2_9                       $CHAR2.                             
      @677    CPTM2_10                      $CHAR2.                             
      @679    CPTM2_11                      $CHAR2.                             
      @681    CPTM2_12                      $CHAR2.                             
      @683    CPTM2_13                      $CHAR2.                             
      @685    CPTM2_14                      $CHAR2.                             
      @687    CPTM2_15                      $CHAR2.                             
      @689    CPTM2_16                      $CHAR2.                             
      @691    CPTM2_17                      $CHAR2.                             
      @693    CPTM2_18                      $CHAR2.                             
      @695    CPTM2_19                      $CHAR2.                             
      @697    CPTM2_20                      $CHAR2.                             
      @699    CPTM2_21                      $CHAR2.                             
      @701    CPTM2_22                      $CHAR2.                             
      @703    CPTM2_23                      $CHAR2.                             
      @705    CPTM2_24                      $CHAR2.                             
      @707    CPTM2_25                      $CHAR2.                             
      @709    CPTM2_26                      $CHAR2.                             
      @711    CPTM2_27                      $CHAR2.                             
      @713    CPTM2_28                      $CHAR2.                             
      @715    CPTM2_29                      $CHAR2.                             
      @717    CPTM2_30                      $CHAR2.                             
      @719    CPTM2_31                      $CHAR2.                             
      @721    CPTM2_32                      $CHAR2.                             
      @723    CPTM2_33                      $CHAR2.                             
      @725    CPTM2_34                      $CHAR2.                             
      @727    CPTM2_35                      $CHAR2.                             
      @729    CPTM2_36                      $CHAR2.                             
      @731    CPTM2_37                      $CHAR2.                             
      @733    CPTM2_38                      $CHAR2.                             
      @735    CPTM2_39                      $CHAR2.                             
      @737    CPTM2_40                      $CHAR2.                             
      @739    CPTM2_41                      $CHAR2.                             
      @741    CPTM2_42                      $CHAR2.                             
      @743    CPTM2_43                      $CHAR2.                             
      @745    CPTM2_44                      $CHAR2.                             
      @747    CPTM2_45                      $CHAR2.                             
      @749    CPTM2_46                      $CHAR2.                             
      @751    CPTM2_47                      $CHAR2.                             
      @753    CPTM2_48                      $CHAR2.                             
      @755    CPTM2_49                      $CHAR2.                             
      @757    CPTM2_50                      $CHAR2.                             
      @759    DIED                          N2PF.                               
      @761    DISPUB04                      N2PF.                               
      @763    DISPUNIFORM                   N2PF.                               
      @765    DMONTH                        N2PF.                               
      @767    DQTR                          N2PF.                               
      @769    DXVER                         N3PF.                               
      @772    FEMALE                        N2PF.                               
      @774    HCUP_ED                       N2PF.                               
      @776    HCUP_OS                       N2PF.                               
      @778    HOSPST                        $CHAR2.                             
      @780    I10_DX_Visit_Reason1          $CHAR7.                             
      @787    I10_DX_Visit_Reason2          $CHAR7.                             
      @794    I10_DX_Visit_Reason3          $CHAR7.                             
      @801    I10_DX1                       $CHAR7.                             
      @808    I10_DX2                       $CHAR7.                             
      @815    I10_DX3                       $CHAR7.                             
      @822    I10_DX4                       $CHAR7.                             
      @829    I10_DX5                       $CHAR7.                             
      @836    I10_DX6                       $CHAR7.                             
      @843    I10_DX7                       $CHAR7.                             
      @850    I10_DX8                       $CHAR7.                             
      @857    I10_DX9                       $CHAR7.                             
      @864    I10_DX10                      $CHAR7.                             
      @871    I10_DX11                      $CHAR7.                             
      @878    I10_DX12                      $CHAR7.                             
      @885    I10_DX13                      $CHAR7.                             
      @892    I10_DX14                      $CHAR7.                             
      @899    I10_DX15                      $CHAR7.                             
      @906    I10_DX16                      $CHAR7.                             
      @913    I10_DX17                      $CHAR7.                             
      @920    I10_DX18                      $CHAR7.                             
      @927    I10_DX19                      $CHAR7.                             
      @934    I10_DX20                      $CHAR7.                             
      @941    I10_DX21                      $CHAR7.                             
      @948    I10_DX22                      $CHAR7.                             
      @955    I10_DX23                      $CHAR7.                             
      @962    I10_DX24                      $CHAR7.                             
      @969    I10_DX25                      $CHAR7.                             
      @976    I10_DXCCS1                    N4PF.                               
      @980    I10_DXCCS2                    N4PF.                               
      @984    I10_DXCCS3                    N4PF.                               
      @988    I10_DXCCS4                    N4PF.                               
      @992    I10_DXCCS5                    N4PF.                               
      @996    I10_DXCCS6                    N4PF.                               
      @1000   I10_DXCCS7                    N4PF.                               
      @1004   I10_DXCCS8                    N4PF.                               
      @1008   I10_DXCCS9                    N4PF.                               
      @1012   I10_DXCCS10                   N4PF.                               
      @1016   I10_DXCCS11                   N4PF.                               
      @1020   I10_DXCCS12                   N4PF.                               
      @1024   I10_DXCCS13                   N4PF.                               
      @1028   I10_DXCCS14                   N4PF.                               
      @1032   I10_DXCCS15                   N4PF.                               
      @1036   I10_DXCCS16                   N4PF.                               
      @1040   I10_DXCCS17                   N4PF.                               
      @1044   I10_DXCCS18                   N4PF.                               
      @1048   I10_DXCCS19                   N4PF.                               
      @1052   I10_DXCCS20                   N4PF.                               
      @1056   I10_DXCCS21                   N4PF.                               
      @1060   I10_DXCCS22                   N4PF.                               
      @1064   I10_DXCCS23                   N4PF.                               
      @1068   I10_DXCCS24                   N4PF.                               
      @1072   I10_DXCCS25                   N4PF.                               
      @1076   I10_ECAUSE1                   $CHAR7.                             
      @1083   I10_ECAUSE2                   $CHAR7.                             
      @1090   I10_ECAUSE3                   $CHAR7.                             
      @1097   I10_ECAUSE4                   $CHAR7.                             
      @1104   I10_ECAUSE5                   $CHAR7.                             
      @1111   I10_ECAUSE6                   $CHAR7.                             
      @1118   I10_ECAUSE7                   $CHAR7.                             
      @1125   I10_ECAUSE8                   $CHAR7.                             
      @1132   I10_ECauseCCS1                N4PF.                               
      @1136   I10_ECauseCCS2                N4PF.                               
      @1140   I10_ECauseCCS3                N4PF.                               
      @1144   I10_ECauseCCS4                N4PF.                               
      @1148   I10_ECauseCCS5                N4PF.                               
      @1152   I10_ECauseCCS6                N4PF.                               
      @1156   I10_ECauseCCS7                N4PF.                               
      @1160   I10_ECauseCCS8                N4PF.                               
      @1164   I10_HOSPBRTH                  N3PF.                               
      @1167   I10_NCHRONIC                  N3PF.                               
      @1170   I10_NDX                       N3PF.                               
      @1173   I10_NECAUSE                   N2PF.                               
      @1175   I10_NEOMAT                    N2PF.                               
      @1177   I10_PROCTYPE                  N3PF.                               
      @1180   KEY                           15.                                 
      @1195   LOS                           N5PF.                               
      @1200   MDSPEC1                       $CHAR2.                             
      @1202   MDSPEC2                       $CHAR2.                             
      @1204   MEDINCSTQ                     N2PF.                               
      @1206   MRN_R                         N9PF.                               
      @1215   NCPT                          N4PF.                               
      @1219   OS_TIME                       N11P2F.                             
      @1230   PAY1                          N2PF.                               
      @1232   PAY2                          N2PF.                               
      @1234   PAY3                          N2PF.                               
      @1236   PL_CBSA                       N3PF.                               
      @1239   PL_NCHS                       N2PF.                               
      @1241   PL_UIC                        N2PF.                               
      @1243   PL_UR_CAT4                    N2PF.                               
      @1245   PointOfOriginUB04             $CHAR1.                             
      @1246   PSTATE                        $CHAR2.                             
      @1248   PSTCO                         N5PF.                               
      @1253   PSTCO2                        N5PF.                               
      @1258   STATE_AS                      N2PF.                               
      @1260   STATE_ED                      N2PF.                               
      @1262   STATE_OS                      N2PF.                               
      @1264   YEAR                          N4PF.                               
      @1268   ZIP3                          $CHAR3.                             
      @1271   ZIPINC_QRTL                   N3PF.                               
      @1274   AGEGROUP                      N3PF.                               
      @1277   HOSPID                        N5PF.                               
      @1282   AYEAR                         N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
