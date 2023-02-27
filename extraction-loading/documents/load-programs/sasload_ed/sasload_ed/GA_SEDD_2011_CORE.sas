/*******************************************************************            
* Creation Date: 05/13/2016                                                     
*   GA_SEDD_2011_CORE.SAS:                                                      
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
DATA GA_SEDDC_2011_CORE;                                                        
INFILE 'GA_SEDD_2011_CORE.ASC' FIRSTOBS=3 LRECL = 1783;                         
                                                                                
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
  LABEL="UB-92 bill type"                                                       
                                                                                
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
                                                                                
  DIED                       LENGTH=3                                           
  LABEL="Died during hospitalization"                                           
                                                                                
  DISPUB04                   LENGTH=3                                           
  LABEL="Disposition of patient (UB-04 standard coding)"                        
                                                                                
  DISPUNIFORM                LENGTH=3                                           
  LABEL="Disposition of patient (uniform)"                                      
                                                                                
  DISP_X                     LENGTH=$2                                          
  LABEL="Disposition of patient (as received from source)"                      
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DX1                        LENGTH=$7                                          
  LABEL="Diagnosis 1"                                                           
                                                                                
  DX2                        LENGTH=$7                                          
  LABEL="Diagnosis 2"                                                           
                                                                                
  DX3                        LENGTH=$7                                          
  LABEL="Diagnosis 3"                                                           
                                                                                
  DX4                        LENGTH=$7                                          
  LABEL="Diagnosis 4"                                                           
                                                                                
  DX5                        LENGTH=$7                                          
  LABEL="Diagnosis 5"                                                           
                                                                                
  DX6                        LENGTH=$7                                          
  LABEL="Diagnosis 6"                                                           
                                                                                
  DX7                        LENGTH=$7                                          
  LABEL="Diagnosis 7"                                                           
                                                                                
  DX8                        LENGTH=$7                                          
  LABEL="Diagnosis 8"                                                           
                                                                                
  DX9                        LENGTH=$7                                          
  LABEL="Diagnosis 9"                                                           
                                                                                
  DX10                       LENGTH=$7                                          
  LABEL="Diagnosis 10"                                                          
                                                                                
  DX11                       LENGTH=$7                                          
  LABEL="Diagnosis 11"                                                          
                                                                                
  DX12                       LENGTH=$7                                          
  LABEL="Diagnosis 12"                                                          
                                                                                
  DX13                       LENGTH=$7                                          
  LABEL="Diagnosis 13"                                                          
                                                                                
  DX14                       LENGTH=$7                                          
  LABEL="Diagnosis 14"                                                          
                                                                                
  DX15                       LENGTH=$7                                          
  LABEL="Diagnosis 15"                                                          
                                                                                
  DX16                       LENGTH=$7                                          
  LABEL="Diagnosis 16"                                                          
                                                                                
  DX17                       LENGTH=$7                                          
  LABEL="Diagnosis 17"                                                          
                                                                                
  DX18                       LENGTH=$7                                          
  LABEL="Diagnosis 18"                                                          
                                                                                
  DX19                       LENGTH=$7                                          
  LABEL="Diagnosis 19"                                                          
                                                                                
  DX20                       LENGTH=$7                                          
  LABEL="Diagnosis 20"                                                          
                                                                                
  DX21                       LENGTH=$7                                          
  LABEL="Diagnosis 21"                                                          
                                                                                
  DX22                       LENGTH=$7                                          
  LABEL="Diagnosis 22"                                                          
                                                                                
  DX23                       LENGTH=$7                                          
  LABEL="Diagnosis 23"                                                          
                                                                                
  DX24                       LENGTH=$7                                          
  LABEL="Diagnosis 24"                                                          
                                                                                
  DX25                       LENGTH=$7                                          
  LABEL="Diagnosis 25"                                                          
                                                                                
  DX26                       LENGTH=$7                                          
  LABEL="Diagnosis 26"                                                          
                                                                                
  DX27                       LENGTH=$7                                          
  LABEL="Diagnosis 27"                                                          
                                                                                
  DX28                       LENGTH=$7                                          
  LABEL="Diagnosis 28"                                                          
                                                                                
  DX29                       LENGTH=$7                                          
  LABEL="Diagnosis 29"                                                          
                                                                                
  DX30                       LENGTH=$7                                          
  LABEL="Diagnosis 30"                                                          
                                                                                
  DX31                       LENGTH=$7                                          
  LABEL="Diagnosis 31"                                                          
                                                                                
  DX32                       LENGTH=$7                                          
  LABEL="Diagnosis 32"                                                          
                                                                                
  DX33                       LENGTH=$7                                          
  LABEL="Diagnosis 33"                                                          
                                                                                
  DX34                       LENGTH=$7                                          
  LABEL="Diagnosis 34"                                                          
                                                                                
  DX35                       LENGTH=$7                                          
  LABEL="Diagnosis 35"                                                          
                                                                                
  DX36                       LENGTH=$7                                          
  LABEL="Diagnosis 36"                                                          
                                                                                
  DX37                       LENGTH=$7                                          
  LABEL="Diagnosis 37"                                                          
                                                                                
  DX38                       LENGTH=$7                                          
  LABEL="Diagnosis 38"                                                          
                                                                                
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
                                                                                
  DXCCS21                    LENGTH=4                                           
  LABEL="CCS: diagnosis 21"                                                     
                                                                                
  DXCCS22                    LENGTH=4                                           
  LABEL="CCS: diagnosis 22"                                                     
                                                                                
  DXCCS23                    LENGTH=4                                           
  LABEL="CCS: diagnosis 23"                                                     
                                                                                
  DXCCS24                    LENGTH=4                                           
  LABEL="CCS: diagnosis 24"                                                     
                                                                                
  DXCCS25                    LENGTH=4                                           
  LABEL="CCS: diagnosis 25"                                                     
                                                                                
  DXCCS26                    LENGTH=4                                           
  LABEL="CCS: diagnosis 26"                                                     
                                                                                
  DXCCS27                    LENGTH=4                                           
  LABEL="CCS: diagnosis 27"                                                     
                                                                                
  DXCCS28                    LENGTH=4                                           
  LABEL="CCS: diagnosis 28"                                                     
                                                                                
  DXCCS29                    LENGTH=4                                           
  LABEL="CCS: diagnosis 29"                                                     
                                                                                
  DXCCS30                    LENGTH=4                                           
  LABEL="CCS: diagnosis 30"                                                     
                                                                                
  DXCCS31                    LENGTH=4                                           
  LABEL="CCS: diagnosis 31"                                                     
                                                                                
  DXCCS32                    LENGTH=4                                           
  LABEL="CCS: diagnosis 32"                                                     
                                                                                
  DXCCS33                    LENGTH=4                                           
  LABEL="CCS: diagnosis 33"                                                     
                                                                                
  DXCCS34                    LENGTH=4                                           
  LABEL="CCS: diagnosis 34"                                                     
                                                                                
  DXCCS35                    LENGTH=4                                           
  LABEL="CCS: diagnosis 35"                                                     
                                                                                
  DXCCS36                    LENGTH=4                                           
  LABEL="CCS: diagnosis 36"                                                     
                                                                                
  DXCCS37                    LENGTH=4                                           
  LABEL="CCS: diagnosis 37"                                                     
                                                                                
  DXCCS38                    LENGTH=4                                           
  LABEL="CCS: diagnosis 38"                                                     
                                                                                
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
                                                                                
  DaysToEvent                LENGTH=8                                           
  LABEL="Days from 'start date' to admission"                                   
                                                                                
  ECODE1                     LENGTH=$7                                          
  LABEL="E code 1"                                                              
                                                                                
  ECODE2                     LENGTH=$7                                          
  LABEL="E code 2"                                                              
                                                                                
  ECODE3                     LENGTH=$7                                          
  LABEL="E code 3"                                                              
                                                                                
  ECODE4                     LENGTH=$7                                          
  LABEL="E code 4"                                                              
                                                                                
  ECODE5                     LENGTH=$7                                          
  LABEL="E code 5"                                                              
                                                                                
  ECODE6                     LENGTH=$7                                          
  LABEL="E code 6"                                                              
                                                                                
  ECODE7                     LENGTH=$7                                          
  LABEL="E code 7"                                                              
                                                                                
  ECODE8                     LENGTH=$7                                          
  LABEL="E code 8"                                                              
                                                                                
  ECODE9                     LENGTH=$7                                          
  LABEL="E code 9"                                                              
                                                                                
  ECODE10                    LENGTH=$7                                          
  LABEL="E code 10"                                                             
                                                                                
  ECODE11                    LENGTH=$7                                          
  LABEL="E code 11"                                                             
                                                                                
  ECODE12                    LENGTH=$7                                          
  LABEL="E code 12"                                                             
                                                                                
  ECODE13                    LENGTH=$7                                          
  LABEL="E code 13"                                                             
                                                                                
  ECODE14                    LENGTH=$7                                          
  LABEL="E code 14"                                                             
                                                                                
  ECODE15                    LENGTH=$7                                          
  LABEL="E code 15"                                                             
                                                                                
  ECODE16                    LENGTH=$7                                          
  LABEL="E code 16"                                                             
                                                                                
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
                                                                                
  E_CCS9                     LENGTH=3                                           
  LABEL="CCS: E Code 9"                                                         
                                                                                
  E_CCS10                    LENGTH=3                                           
  LABEL="CCS: E Code 10"                                                        
                                                                                
  E_CCS11                    LENGTH=3                                           
  LABEL="CCS: E Code 11"                                                        
                                                                                
  E_CCS12                    LENGTH=3                                           
  LABEL="CCS: E Code 12"                                                        
                                                                                
  E_CCS13                    LENGTH=3                                           
  LABEL="CCS: E Code 13"                                                        
                                                                                
  E_CCS14                    LENGTH=3                                           
  LABEL="CCS: E Code 14"                                                        
                                                                                
  E_CCS15                    LENGTH=3                                           
  LABEL="CCS: E Code 15"                                                        
                                                                                
  E_CCS16                    LENGTH=3                                           
  LABEL="CCS: E Code 16"                                                        
                                                                                
  E_POA1                     LENGTH=$1                                          
  LABEL="E Code 1, present on admission indicator"                              
                                                                                
  E_POA2                     LENGTH=$1                                          
  LABEL="E Code 2, present on admission indicator"                              
                                                                                
  E_POA3                     LENGTH=$1                                          
  LABEL="E Code 3, present on admission indicator"                              
                                                                                
  E_POA4                     LENGTH=$1                                          
  LABEL="E Code 4, present on admission indicator"                              
                                                                                
  E_POA5                     LENGTH=$1                                          
  LABEL="E Code 5, present on admission indicator"                              
                                                                                
  E_POA6                     LENGTH=$1                                          
  LABEL="E Code 6, present on admission indicator"                              
                                                                                
  E_POA7                     LENGTH=$1                                          
  LABEL="E Code 7, present on admission indicator"                              
                                                                                
  E_POA8                     LENGTH=$1                                          
  LABEL="E Code 8, present on admission indicator"                              
                                                                                
  E_POA9                     LENGTH=$1                                          
  LABEL="E Code 9, present on admission indicator"                              
                                                                                
  E_POA10                    LENGTH=$1                                          
  LABEL="E Code 10, present on admission indicator"                             
                                                                                
  E_POA11                    LENGTH=$1                                          
  LABEL="E Code 11, present on admission indicator"                             
                                                                                
  E_POA12                    LENGTH=$1                                          
  LABEL="E Code 12, present on admission indicator"                             
                                                                                
  E_POA13                    LENGTH=$1                                          
  LABEL="E Code 13, present on admission indicator"                             
                                                                                
  E_POA14                    LENGTH=$1                                          
  LABEL="E Code 14, present on admission indicator"                             
                                                                                
  E_POA15                    LENGTH=$1                                          
  LABEL="E Code 15, present on admission indicator"                             
                                                                                
  E_POA16                    LENGTH=$1                                          
  LABEL="E Code 16, present on admission indicator"                             
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HCUP_SURGERY_BROAD         LENGTH=3                                           
  LABEL="Revised HCUP_AS (PCLASSn=3 or 4, or broad definition)"                 
                                                                                
  HCUP_SURGERY_NARROW        LENGTH=3                                           
  LABEL="Revised HCUP_AS (PCLASSn=4, or narrow definition)"                     
                                                                                
  HISPANIC_X                 LENGTH=$1                                          
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  HOSPBRTH                   LENGTH=3                                           
  LABEL="Indicator of birth in this hospital"                                   
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  Homeless                   LENGTH=3                                           
  LABEL="Indicator that patient is homeless"                                    
                                                                                
  KEY                        LENGTH=8                      FORMAT=Z18.          
  LABEL="HCUP record identifier"                                                
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MARITALSTATUSUB04          LENGTH=$1                                          
  LABEL="Patient's marital status, UB-04 standard coding"                       
                                                                                
  MARITALSTATUS_X            LENGTH=$1                                          
  LABEL="Patient's marital status (as received from source)"                    
                                                                                
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
                                                                                
  OPservice                  LENGTH=$2                                          
  LABEL="Indicator of outpatient service (as received from source)"             
                                                                                
  ORPROC                     LENGTH=3                                           
  LABEL="Major operating room procedure indicator"                              
                                                                                
  OS_TIME                    LENGTH=4                                           
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
                                                                                
  PL_MSA1993                 LENGTH=3                                           
  LABEL="Patient location: Metropolitan Statistical Area (MSA), 1993"           
                                                                                
  PL_NCHS2006                LENGTH=3                                           
  LABEL="Patient Location: NCHS Urban-Rural Code (V2006)"                       
                                                                                
  PL_RUCA10_2005             LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, ten levels" 
                                                                                
  PL_RUCA2005                LENGTH=4                      FORMAT=4.1           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes"             
                                                                                
  PL_RUCA4_2005              LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Commuting Area (RUCA) Codes, four levels"
                                                                                
  PL_RUCC2003                LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Continuum Codes(RUCC), 2003"             
                                                                                
  PL_UIC2003                 LENGTH=3                                           
  LABEL="Patient location: Urban Influence Codes, 2003"                         
                                                                                
  PL_UR_CAT4                 LENGTH=3                                           
  LABEL="Patient Location: Urban-Rural 4 Categories"                            
                                                                                
  PR1                        LENGTH=$7                                          
  LABEL="Procedure 1"                                                           
                                                                                
  PR2                        LENGTH=$7                                          
  LABEL="Procedure 2"                                                           
                                                                                
  PR3                        LENGTH=$7                                          
  LABEL="Procedure 3"                                                           
                                                                                
  PR4                        LENGTH=$7                                          
  LABEL="Procedure 4"                                                           
                                                                                
  PR5                        LENGTH=$7                                          
  LABEL="Procedure 5"                                                           
                                                                                
  PR6                        LENGTH=$7                                          
  LABEL="Procedure 6"                                                           
                                                                                
  PR7                        LENGTH=$7                                          
  LABEL="Procedure 7"                                                           
                                                                                
  PR8                        LENGTH=$7                                          
  LABEL="Procedure 8"                                                           
                                                                                
  PR9                        LENGTH=$7                                          
  LABEL="Procedure 9"                                                           
                                                                                
  PR10                       LENGTH=$7                                          
  LABEL="Procedure 10"                                                          
                                                                                
  PR11                       LENGTH=$7                                          
  LABEL="Procedure 11"                                                          
                                                                                
  PR12                       LENGTH=$7                                          
  LABEL="Procedure 12"                                                          
                                                                                
  PR13                       LENGTH=$7                                          
  LABEL="Procedure 13"                                                          
                                                                                
  PR14                       LENGTH=$7                                          
  LABEL="Procedure 14"                                                          
                                                                                
  PR15                       LENGTH=$7                                          
  LABEL="Procedure 15"                                                          
                                                                                
  PR16                       LENGTH=$7                                          
  LABEL="Procedure 16"                                                          
                                                                                
  PR17                       LENGTH=$7                                          
  LABEL="Procedure 17"                                                          
                                                                                
  PR18                       LENGTH=$7                                          
  LABEL="Procedure 18"                                                          
                                                                                
  PR19                       LENGTH=$7                                          
  LABEL="Procedure 19"                                                          
                                                                                
  PR20                       LENGTH=$7                                          
  LABEL="Procedure 20"                                                          
                                                                                
  PR21                       LENGTH=$7                                          
  LABEL="Procedure 21"                                                          
                                                                                
  PR22                       LENGTH=$7                                          
  LABEL="Procedure 22"                                                          
                                                                                
  PR23                       LENGTH=$7                                          
  LABEL="Procedure 23"                                                          
                                                                                
  PR24                       LENGTH=$7                                          
  LABEL="Procedure 24"                                                          
                                                                                
  PR25                       LENGTH=$7                                          
  LABEL="Procedure 25"                                                          
                                                                                
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
                                                                                
  PRCCS21                    LENGTH=3                                           
  LABEL="CCS: procedure 21"                                                     
                                                                                
  PRCCS22                    LENGTH=3                                           
  LABEL="CCS: procedure 22"                                                     
                                                                                
  PRCCS23                    LENGTH=3                                           
  LABEL="CCS: procedure 23"                                                     
                                                                                
  PRCCS24                    LENGTH=3                                           
  LABEL="CCS: procedure 24"                                                     
                                                                                
  PRCCS25                    LENGTH=3                                           
  LABEL="CCS: procedure 25"                                                     
                                                                                
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
                                                                                
  PRDAY21                    LENGTH=4                                           
  LABEL="Number of days from admission to PR21"                                 
                                                                                
  PRDAY22                    LENGTH=4                                           
  LABEL="Number of days from admission to PR22"                                 
                                                                                
  PRDAY23                    LENGTH=4                                           
  LABEL="Number of days from admission to PR23"                                 
                                                                                
  PRDAY24                    LENGTH=4                                           
  LABEL="Number of days from admission to PR24"                                 
                                                                                
  PRDAY25                    LENGTH=4                                           
  LABEL="Number of days from admission to PR25"                                 
                                                                                
  PROCTYPE                   LENGTH=3                                           
  LABEL="Procedure type indicator"                                              
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO                      LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  PointOfOriginUB04          LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, UB-04 standard coding"         
                                                                                
  PointOfOrigin_X            LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, as received from source"       
                                                                                
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
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  HOSPID                     LENGTH=4                      FORMAT=Z5.           
  LABEL="HCUP hospital identification number"                                   
                                                                                
  ZIP                        LENGTH=$5                                          
  LABEL="Patient ZIP Code"                                                      
                                                                                
  AYEAR                      LENGTH=3                                           
  LABEL="Admission year"                                                        
                                                                                
  DMONTH                     LENGTH=3                                           
  LABEL="Discharge month"                                                       
                                                                                
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
      @170    CPTCCS1                       N3PF.                               
      @173    CPTCCS2                       N3PF.                               
      @176    CPTCCS3                       N3PF.                               
      @179    CPTCCS4                       N3PF.                               
      @182    CPTCCS5                       N3PF.                               
      @185    CPTCCS6                       N3PF.                               
      @188    CPTCCS7                       N3PF.                               
      @191    CPTCCS8                       N3PF.                               
      @194    CPTCCS9                       N3PF.                               
      @197    CPTCCS10                      N3PF.                               
      @200    CPTCCS11                      N3PF.                               
      @203    CPTCCS12                      N3PF.                               
      @206    CPTCCS13                      N3PF.                               
      @209    CPTCCS14                      N3PF.                               
      @212    CPTCCS15                      N3PF.                               
      @215    CPTCCS16                      N3PF.                               
      @218    CPTCCS17                      N3PF.                               
      @221    CPTCCS18                      N3PF.                               
      @224    CPTCCS19                      N3PF.                               
      @227    CPTCCS20                      N3PF.                               
      @230    CPTCCS21                      N3PF.                               
      @233    CPTCCS22                      N3PF.                               
      @236    CPTCCS23                      N3PF.                               
      @239    CPTCCS24                      N3PF.                               
      @242    CPTCCS25                      N3PF.                               
      @245    CPTCCS26                      N3PF.                               
      @248    CPTCCS27                      N3PF.                               
      @251    CPTCCS28                      N3PF.                               
      @254    CPTCCS29                      N3PF.                               
      @257    CPTCCS30                      N3PF.                               
      @260    CPTDAY1                       N3PF.                               
      @263    CPTDAY2                       N3PF.                               
      @266    CPTDAY3                       N3PF.                               
      @269    CPTDAY4                       N3PF.                               
      @272    CPTDAY5                       N3PF.                               
      @275    CPTDAY6                       N3PF.                               
      @278    CPTDAY7                       N3PF.                               
      @281    CPTDAY8                       N3PF.                               
      @284    CPTDAY9                       N3PF.                               
      @287    CPTDAY10                      N3PF.                               
      @290    CPTDAY11                      N3PF.                               
      @293    CPTDAY12                      N3PF.                               
      @296    CPTDAY13                      N3PF.                               
      @299    CPTDAY14                      N3PF.                               
      @302    CPTDAY15                      N3PF.                               
      @305    CPTDAY16                      N3PF.                               
      @308    CPTDAY17                      N3PF.                               
      @311    CPTDAY18                      N3PF.                               
      @314    CPTDAY19                      N3PF.                               
      @317    CPTDAY20                      N3PF.                               
      @320    CPTDAY21                      N3PF.                               
      @323    CPTDAY22                      N3PF.                               
      @326    CPTDAY23                      N3PF.                               
      @329    CPTDAY24                      N3PF.                               
      @332    CPTDAY25                      N3PF.                               
      @335    CPTDAY26                      N3PF.                               
      @338    CPTDAY27                      N3PF.                               
      @341    CPTDAY28                      N3PF.                               
      @344    CPTDAY29                      N3PF.                               
      @347    CPTDAY30                      N3PF.                               
      @350    DIED                          N2PF.                               
      @352    DISPUB04                      N2PF.                               
      @354    DISPUNIFORM                   N2PF.                               
      @356    DISP_X                        $CHAR2.                             
      @358    DQTR                          N2PF.                               
      @360    DX1                           $CHAR7.                             
      @367    DX2                           $CHAR7.                             
      @374    DX3                           $CHAR7.                             
      @381    DX4                           $CHAR7.                             
      @388    DX5                           $CHAR7.                             
      @395    DX6                           $CHAR7.                             
      @402    DX7                           $CHAR7.                             
      @409    DX8                           $CHAR7.                             
      @416    DX9                           $CHAR7.                             
      @423    DX10                          $CHAR7.                             
      @430    DX11                          $CHAR7.                             
      @437    DX12                          $CHAR7.                             
      @444    DX13                          $CHAR7.                             
      @451    DX14                          $CHAR7.                             
      @458    DX15                          $CHAR7.                             
      @465    DX16                          $CHAR7.                             
      @472    DX17                          $CHAR7.                             
      @479    DX18                          $CHAR7.                             
      @486    DX19                          $CHAR7.                             
      @493    DX20                          $CHAR7.                             
      @500    DX21                          $CHAR7.                             
      @507    DX22                          $CHAR7.                             
      @514    DX23                          $CHAR7.                             
      @521    DX24                          $CHAR7.                             
      @528    DX25                          $CHAR7.                             
      @535    DX26                          $CHAR7.                             
      @542    DX27                          $CHAR7.                             
      @549    DX28                          $CHAR7.                             
      @556    DX29                          $CHAR7.                             
      @563    DX30                          $CHAR7.                             
      @570    DX31                          $CHAR7.                             
      @577    DX32                          $CHAR7.                             
      @584    DX33                          $CHAR7.                             
      @591    DX34                          $CHAR7.                             
      @598    DX35                          $CHAR7.                             
      @605    DX36                          $CHAR7.                             
      @612    DX37                          $CHAR7.                             
      @619    DX38                          $CHAR7.                             
      @626    DXCCS1                        N4PF.                               
      @630    DXCCS2                        N4PF.                               
      @634    DXCCS3                        N4PF.                               
      @638    DXCCS4                        N4PF.                               
      @642    DXCCS5                        N4PF.                               
      @646    DXCCS6                        N4PF.                               
      @650    DXCCS7                        N4PF.                               
      @654    DXCCS8                        N4PF.                               
      @658    DXCCS9                        N4PF.                               
      @662    DXCCS10                       N4PF.                               
      @666    DXCCS11                       N4PF.                               
      @670    DXCCS12                       N4PF.                               
      @674    DXCCS13                       N4PF.                               
      @678    DXCCS14                       N4PF.                               
      @682    DXCCS15                       N4PF.                               
      @686    DXCCS16                       N4PF.                               
      @690    DXCCS17                       N4PF.                               
      @694    DXCCS18                       N4PF.                               
      @698    DXCCS19                       N4PF.                               
      @702    DXCCS20                       N4PF.                               
      @706    DXCCS21                       N4PF.                               
      @710    DXCCS22                       N4PF.                               
      @714    DXCCS23                       N4PF.                               
      @718    DXCCS24                       N4PF.                               
      @722    DXCCS25                       N4PF.                               
      @726    DXCCS26                       N4PF.                               
      @730    DXCCS27                       N4PF.                               
      @734    DXCCS28                       N4PF.                               
      @738    DXCCS29                       N4PF.                               
      @742    DXCCS30                       N4PF.                               
      @746    DXCCS31                       N4PF.                               
      @750    DXCCS32                       N4PF.                               
      @754    DXCCS33                       N4PF.                               
      @758    DXCCS34                       N4PF.                               
      @762    DXCCS35                       N4PF.                               
      @766    DXCCS36                       N4PF.                               
      @770    DXCCS37                       N4PF.                               
      @774    DXCCS38                       N4PF.                               
      @778    DXPOA1                        $CHAR1.                             
      @779    DXPOA2                        $CHAR1.                             
      @780    DXPOA3                        $CHAR1.                             
      @781    DXPOA4                        $CHAR1.                             
      @782    DXPOA5                        $CHAR1.                             
      @783    DXPOA6                        $CHAR1.                             
      @784    DXPOA7                        $CHAR1.                             
      @785    DXPOA8                        $CHAR1.                             
      @786    DXPOA9                        $CHAR1.                             
      @787    DXPOA10                       $CHAR1.                             
      @788    DXPOA11                       $CHAR1.                             
      @789    DXPOA12                       $CHAR1.                             
      @790    DXPOA13                       $CHAR1.                             
      @791    DXPOA14                       $CHAR1.                             
      @792    DXPOA15                       $CHAR1.                             
      @793    DXPOA16                       $CHAR1.                             
      @794    DXPOA17                       $CHAR1.                             
      @795    DXPOA18                       $CHAR1.                             
      @796    DXPOA19                       $CHAR1.                             
      @797    DXPOA20                       $CHAR1.                             
      @798    DXPOA21                       $CHAR1.                             
      @799    DXPOA22                       $CHAR1.                             
      @800    DXPOA23                       $CHAR1.                             
      @801    DXPOA24                       $CHAR1.                             
      @802    DXPOA25                       $CHAR1.                             
      @803    DXPOA26                       $CHAR1.                             
      @804    DXPOA27                       $CHAR1.                             
      @805    DXPOA28                       $CHAR1.                             
      @806    DXPOA29                       $CHAR1.                             
      @807    DXPOA30                       $CHAR1.                             
      @808    DXPOA31                       $CHAR1.                             
      @809    DXPOA32                       $CHAR1.                             
      @810    DXPOA33                       $CHAR1.                             
      @811    DXPOA34                       $CHAR1.                             
      @812    DXPOA35                       $CHAR1.                             
      @813    DXPOA36                       $CHAR1.                             
      @814    DXPOA37                       $CHAR1.                             
      @815    DXPOA38                       $CHAR1.                             
      @816    DaysToEvent                   N6PF.                               
      @822    ECODE1                        $CHAR7.                             
      @829    ECODE2                        $CHAR7.                             
      @836    ECODE3                        $CHAR7.                             
      @843    ECODE4                        $CHAR7.                             
      @850    ECODE5                        $CHAR7.                             
      @857    ECODE6                        $CHAR7.                             
      @864    ECODE7                        $CHAR7.                             
      @871    ECODE8                        $CHAR7.                             
      @878    ECODE9                        $CHAR7.                             
      @885    ECODE10                       $CHAR7.                             
      @892    ECODE11                       $CHAR7.                             
      @899    ECODE12                       $CHAR7.                             
      @906    ECODE13                       $CHAR7.                             
      @913    ECODE14                       $CHAR7.                             
      @920    ECODE15                       $CHAR7.                             
      @927    ECODE16                       $CHAR7.                             
      @934    E_CCS1                        N4PF.                               
      @938    E_CCS2                        N4PF.                               
      @942    E_CCS3                        N4PF.                               
      @946    E_CCS4                        N4PF.                               
      @950    E_CCS5                        N4PF.                               
      @954    E_CCS6                        N4PF.                               
      @958    E_CCS7                        N4PF.                               
      @962    E_CCS8                        N4PF.                               
      @966    E_CCS9                        N4PF.                               
      @970    E_CCS10                       N4PF.                               
      @974    E_CCS11                       N4PF.                               
      @978    E_CCS12                       N4PF.                               
      @982    E_CCS13                       N4PF.                               
      @986    E_CCS14                       N4PF.                               
      @990    E_CCS15                       N4PF.                               
      @994    E_CCS16                       N4PF.                               
      @998    E_POA1                        $CHAR1.                             
      @999    E_POA2                        $CHAR1.                             
      @1000   E_POA3                        $CHAR1.                             
      @1001   E_POA4                        $CHAR1.                             
      @1002   E_POA5                        $CHAR1.                             
      @1003   E_POA6                        $CHAR1.                             
      @1004   E_POA7                        $CHAR1.                             
      @1005   E_POA8                        $CHAR1.                             
      @1006   E_POA9                        $CHAR1.                             
      @1007   E_POA10                       $CHAR1.                             
      @1008   E_POA11                       $CHAR1.                             
      @1009   E_POA12                       $CHAR1.                             
      @1010   E_POA13                       $CHAR1.                             
      @1011   E_POA14                       $CHAR1.                             
      @1012   E_POA15                       $CHAR1.                             
      @1013   E_POA16                       $CHAR1.                             
      @1014   FEMALE                        N2PF.                               
      @1016   HCUP_ED                       N2PF.                               
      @1018   HCUP_OS                       N2PF.                               
      @1020   HCUP_SURGERY_BROAD            N2PF.                               
      @1022   HCUP_SURGERY_NARROW           N2PF.                               
      @1024   HISPANIC_X                    $CHAR1.                             
      @1025   HOSPBRTH                      N3PF.                               
      @1028   HOSPST                        $CHAR2.                             
      @1030   Homeless                      N2PF.                               
      @1032   KEY                           15.                                 
      @1047   LOS                           N5PF.                               
      @1052   LOS_X                         N6PF.                               
      @1058   MARITALSTATUSUB04             $CHAR1.                             
      @1059   MARITALSTATUS_X               $CHAR1.                             
      @1060   MDNUM1_R                      N9PF.                               
      @1069   MDNUM2_R                      N9PF.                               
      @1078   MDNUM3_R                      N9PF.                               
      @1087   MDNUM4_R                      N9PF.                               
      @1096   MEDINCSTQ                     N2PF.                               
      @1098   NCHRONIC                      N3PF.                               
      @1101   NCPT                          N4PF.                               
      @1105   NDX                           N3PF.                               
      @1108   NECODE                        N2PF.                               
      @1110   NEOMAT                        N2PF.                               
      @1112   NPR                           N3PF.                               
      @1115   OPservice                     $CHAR2.                             
      @1117   ORPROC                        N2PF.                               
      @1119   OS_TIME                       N8PF.                               
      @1127   PAY1                          N2PF.                               
      @1129   PAY1_X                        $CHAR4.                             
      @1133   PAY2                          N2PF.                               
      @1135   PAY2_X                        $CHAR4.                             
      @1139   PAY3                          N2PF.                               
      @1141   PAY3_X                        $CHAR4.                             
      @1145   PL_CBSA                       N3PF.                               
      @1148   PL_MSA1993                    N3PF.                               
      @1151   PL_NCHS2006                   N2PF.                               
      @1153   PL_RUCA10_2005                N2PF.                               
      @1155   PL_RUCA2005                   N4P1F.                              
      @1159   PL_RUCA4_2005                 N2PF.                               
      @1161   PL_RUCC2003                   N2PF.                               
      @1163   PL_UIC2003                    N2PF.                               
      @1165   PL_UR_CAT4                    N2PF.                               
      @1167   PR1                           $CHAR7.                             
      @1174   PR2                           $CHAR7.                             
      @1181   PR3                           $CHAR7.                             
      @1188   PR4                           $CHAR7.                             
      @1195   PR5                           $CHAR7.                             
      @1202   PR6                           $CHAR7.                             
      @1209   PR7                           $CHAR7.                             
      @1216   PR8                           $CHAR7.                             
      @1223   PR9                           $CHAR7.                             
      @1230   PR10                          $CHAR7.                             
      @1237   PR11                          $CHAR7.                             
      @1244   PR12                          $CHAR7.                             
      @1251   PR13                          $CHAR7.                             
      @1258   PR14                          $CHAR7.                             
      @1265   PR15                          $CHAR7.                             
      @1272   PR16                          $CHAR7.                             
      @1279   PR17                          $CHAR7.                             
      @1286   PR18                          $CHAR7.                             
      @1293   PR19                          $CHAR7.                             
      @1300   PR20                          $CHAR7.                             
      @1307   PR21                          $CHAR7.                             
      @1314   PR22                          $CHAR7.                             
      @1321   PR23                          $CHAR7.                             
      @1328   PR24                          $CHAR7.                             
      @1335   PR25                          $CHAR7.                             
      @1342   PRCCS1                        N3PF.                               
      @1345   PRCCS2                        N3PF.                               
      @1348   PRCCS3                        N3PF.                               
      @1351   PRCCS4                        N3PF.                               
      @1354   PRCCS5                        N3PF.                               
      @1357   PRCCS6                        N3PF.                               
      @1360   PRCCS7                        N3PF.                               
      @1363   PRCCS8                        N3PF.                               
      @1366   PRCCS9                        N3PF.                               
      @1369   PRCCS10                       N3PF.                               
      @1372   PRCCS11                       N3PF.                               
      @1375   PRCCS12                       N3PF.                               
      @1378   PRCCS13                       N3PF.                               
      @1381   PRCCS14                       N3PF.                               
      @1384   PRCCS15                       N3PF.                               
      @1387   PRCCS16                       N3PF.                               
      @1390   PRCCS17                       N3PF.                               
      @1393   PRCCS18                       N3PF.                               
      @1396   PRCCS19                       N3PF.                               
      @1399   PRCCS20                       N3PF.                               
      @1402   PRCCS21                       N3PF.                               
      @1405   PRCCS22                       N3PF.                               
      @1408   PRCCS23                       N3PF.                               
      @1411   PRCCS24                       N3PF.                               
      @1414   PRCCS25                       N3PF.                               
      @1417   PRDAY1                        N5PF.                               
      @1422   PRDAY2                        N5PF.                               
      @1427   PRDAY3                        N5PF.                               
      @1432   PRDAY4                        N5PF.                               
      @1437   PRDAY5                        N5PF.                               
      @1442   PRDAY6                        N5PF.                               
      @1447   PRDAY7                        N5PF.                               
      @1452   PRDAY8                        N5PF.                               
      @1457   PRDAY9                        N5PF.                               
      @1462   PRDAY10                       N5PF.                               
      @1467   PRDAY11                       N5PF.                               
      @1472   PRDAY12                       N5PF.                               
      @1477   PRDAY13                       N5PF.                               
      @1482   PRDAY14                       N5PF.                               
      @1487   PRDAY15                       N5PF.                               
      @1492   PRDAY16                       N5PF.                               
      @1497   PRDAY17                       N5PF.                               
      @1502   PRDAY18                       N5PF.                               
      @1507   PRDAY19                       N5PF.                               
      @1512   PRDAY20                       N5PF.                               
      @1517   PRDAY21                       N5PF.                               
      @1522   PRDAY22                       N5PF.                               
      @1527   PRDAY23                       N5PF.                               
      @1532   PRDAY24                       N5PF.                               
      @1537   PRDAY25                       N5PF.                               
      @1542   PROCTYPE                      N3PF.                               
      @1545   PSTATE                        $CHAR2.                             
      @1547   PSTCO                         N5PF.                               
      @1552   PSTCO2                        N5PF.                               
      @1557   PointOfOriginUB04             $CHAR1.                             
      @1558   PointOfOrigin_X               $CHAR1.                             
      @1559   RACE                          N2PF.                               
      @1561   RACE_X                        $CHAR1.                             
      @1562   STATE_AS                      N2PF.                               
      @1564   STATE_ED                      N2PF.                               
      @1566   STATE_OS                      N2PF.                               
      @1568   TOTCHG                        N10PF.                              
      @1578   TOTCHG_X                      N15P2F.                             
      @1593   VisitLink                     N9PF.                               
      @1602   YEAR                          N4PF.                               
      @1606   ZIP3                          $CHAR3.                             
      @1609   ZIPINC_QRTL                   N3PF.                               
      @1612   HOSPID                        N5PF.                               
      @1617   ZIP                           $CHAR5.                             
      @1622   AYEAR                         N4PF.                               
      @1626   DMONTH                        N2PF.                               
      @1628   BMONTH                        N2PF.                               
      @1630   BYEAR                         N4PF.                               
      @1634   PRMONTH1                      N2PF.                               
      @1636   PRMONTH2                      N2PF.                               
      @1638   PRMONTH3                      N2PF.                               
      @1640   PRMONTH4                      N2PF.                               
      @1642   PRMONTH5                      N2PF.                               
      @1644   PRMONTH6                      N2PF.                               
      @1646   PRMONTH7                      N2PF.                               
      @1648   PRMONTH8                      N2PF.                               
      @1650   PRMONTH9                      N2PF.                               
      @1652   PRMONTH10                     N2PF.                               
      @1654   PRMONTH11                     N2PF.                               
      @1656   PRMONTH12                     N2PF.                               
      @1658   PRMONTH13                     N2PF.                               
      @1660   PRMONTH14                     N2PF.                               
      @1662   PRMONTH15                     N2PF.                               
      @1664   PRMONTH16                     N2PF.                               
      @1666   PRMONTH17                     N2PF.                               
      @1668   PRMONTH18                     N2PF.                               
      @1670   PRMONTH19                     N2PF.                               
      @1672   PRMONTH20                     N2PF.                               
      @1674   PRMONTH21                     N2PF.                               
      @1676   PRMONTH22                     N2PF.                               
      @1678   PRMONTH23                     N2PF.                               
      @1680   PRMONTH24                     N2PF.                               
      @1682   PRMONTH25                     N2PF.                               
      @1684   PRYEAR1                       N4PF.                               
      @1688   PRYEAR2                       N4PF.                               
      @1692   PRYEAR3                       N4PF.                               
      @1696   PRYEAR4                       N4PF.                               
      @1700   PRYEAR5                       N4PF.                               
      @1704   PRYEAR6                       N4PF.                               
      @1708   PRYEAR7                       N4PF.                               
      @1712   PRYEAR8                       N4PF.                               
      @1716   PRYEAR9                       N4PF.                               
      @1720   PRYEAR10                      N4PF.                               
      @1724   PRYEAR11                      N4PF.                               
      @1728   PRYEAR12                      N4PF.                               
      @1732   PRYEAR13                      N4PF.                               
      @1736   PRYEAR14                      N4PF.                               
      @1740   PRYEAR15                      N4PF.                               
      @1744   PRYEAR16                      N4PF.                               
      @1748   PRYEAR17                      N4PF.                               
      @1752   PRYEAR18                      N4PF.                               
      @1756   PRYEAR19                      N4PF.                               
      @1760   PRYEAR20                      N4PF.                               
      @1764   PRYEAR21                      N4PF.                               
      @1768   PRYEAR22                      N4PF.                               
      @1772   PRYEAR23                      N4PF.                               
      @1776   PRYEAR24                      N4PF.                               
      @1780   PRYEAR25                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
