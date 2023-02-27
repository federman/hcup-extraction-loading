/*******************************************************************            
* Creation Date: 04/01/2019                                                     
*   MN_SID_2011_CORE.SAS:                                                       
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
DATA MN_SIDC_2011_CORE;                                                         
INFILE 'MN_SID_2011_CORE.ASC' FIRSTOBS=3 LRECL = 1672;                          
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  ADRG                       LENGTH=3                                           
  LABEL="All Patient Refined DRG"                                               
                                                                                
  ADRGRISKMORTALITY          LENGTH=3                                           
  LABEL="All Patient Refined DRG mortality risk"                                
                                                                                
  ADRGSEV                    LENGTH=3                                           
  LABEL="All Patient Refined DRG severity level"                                
                                                                                
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY                     LENGTH=3                                           
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AHOUR                      LENGTH=3                      FORMAT=Z4.           
  LABEL="Admission Hour"                                                        
                                                                                
  AMDC                       LENGTH=3                                           
  LABEL="All Patient Refined MDC"                                               
                                                                                
  AMONTH                     LENGTH=3                                           
  LABEL="Admission month"                                                       
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  DHOUR                      LENGTH=3                      FORMAT=Z4.           
  LABEL="Discharge Hour"                                                        
                                                                                
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
                                                                                
  DRG                        LENGTH=3                                           
  LABEL="DRG in effect on discharge date"                                       
                                                                                
  DRG24                      LENGTH=3                                           
  LABEL="DRG, version 24"                                                       
                                                                                
  DRGVER                     LENGTH=3                                           
  LABEL="DRG grouper version used on discharge date"                            
                                                                                
  DRG_NoPOA                  LENGTH=3                                           
  LABEL="DRG in use on discharge date, calculated without POA"                  
                                                                                
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
                                                                                
  DX39                       LENGTH=$7                                          
  LABEL="Diagnosis 39"                                                          
                                                                                
  DX40                       LENGTH=$7                                          
  LABEL="Diagnosis 40"                                                          
                                                                                
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
                                                                                
  DXCCS39                    LENGTH=4                                           
  LABEL="CCS: diagnosis 39"                                                     
                                                                                
  DXCCS40                    LENGTH=4                                           
  LABEL="CCS: diagnosis 40"                                                     
                                                                                
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
                                                                                
  HOSPBRTH                   LENGTH=3                                           
  LABEL="Indicator of birth in this hospital"                                   
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
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
                                                                                
  MDC                        LENGTH=3                                           
  LABEL="MDC in effect on discharge date"                                       
                                                                                
  MDC24                      LENGTH=3                                           
  LABEL="MDC, version 24"                                                       
                                                                                
  MDC_NoPOA                  LENGTH=3                                           
  LABEL="MDC in use on discharge date, calculated without POA"                  
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
  NCHRONIC                   LENGTH=3                                           
  LABEL="Number of chronic conditions"                                          
                                                                                
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
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$7                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$7                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$7                                          
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
                                                                                
  PR26                       LENGTH=$7                                          
  LABEL="Procedure 26"                                                          
                                                                                
  PR27                       LENGTH=$7                                          
  LABEL="Procedure 27"                                                          
                                                                                
  PR28                       LENGTH=$7                                          
  LABEL="Procedure 28"                                                          
                                                                                
  PR29                       LENGTH=$7                                          
  LABEL="Procedure 29"                                                          
                                                                                
  PR30                       LENGTH=$7                                          
  LABEL="Procedure 30"                                                          
                                                                                
  PR31                       LENGTH=$7                                          
  LABEL="Procedure 31"                                                          
                                                                                
  PR32                       LENGTH=$7                                          
  LABEL="Procedure 32"                                                          
                                                                                
  PR33                       LENGTH=$7                                          
  LABEL="Procedure 33"                                                          
                                                                                
  PR34                       LENGTH=$7                                          
  LABEL="Procedure 34"                                                          
                                                                                
  PR35                       LENGTH=$7                                          
  LABEL="Procedure 35"                                                          
                                                                                
  PR36                       LENGTH=$7                                          
  LABEL="Procedure 36"                                                          
                                                                                
  PR37                       LENGTH=$7                                          
  LABEL="Procedure 37"                                                          
                                                                                
  PR38                       LENGTH=$7                                          
  LABEL="Procedure 38"                                                          
                                                                                
  PR39                       LENGTH=$7                                          
  LABEL="Procedure 39"                                                          
                                                                                
  PR40                       LENGTH=$7                                          
  LABEL="Procedure 40"                                                          
                                                                                
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
                                                                                
  PRCCS26                    LENGTH=3                                           
  LABEL="CCS: procedure 26"                                                     
                                                                                
  PRCCS27                    LENGTH=3                                           
  LABEL="CCS: procedure 27"                                                     
                                                                                
  PRCCS28                    LENGTH=3                                           
  LABEL="CCS: procedure 28"                                                     
                                                                                
  PRCCS29                    LENGTH=3                                           
  LABEL="CCS: procedure 29"                                                     
                                                                                
  PRCCS30                    LENGTH=3                                           
  LABEL="CCS: procedure 30"                                                     
                                                                                
  PRCCS31                    LENGTH=3                                           
  LABEL="CCS: procedure 31"                                                     
                                                                                
  PRCCS32                    LENGTH=3                                           
  LABEL="CCS: procedure 32"                                                     
                                                                                
  PRCCS33                    LENGTH=3                                           
  LABEL="CCS: procedure 33"                                                     
                                                                                
  PRCCS34                    LENGTH=3                                           
  LABEL="CCS: procedure 34"                                                     
                                                                                
  PRCCS35                    LENGTH=3                                           
  LABEL="CCS: procedure 35"                                                     
                                                                                
  PRCCS36                    LENGTH=3                                           
  LABEL="CCS: procedure 36"                                                     
                                                                                
  PRCCS37                    LENGTH=3                                           
  LABEL="CCS: procedure 37"                                                     
                                                                                
  PRCCS38                    LENGTH=3                                           
  LABEL="CCS: procedure 38"                                                     
                                                                                
  PRCCS39                    LENGTH=3                                           
  LABEL="CCS: procedure 39"                                                     
                                                                                
  PRCCS40                    LENGTH=3                                           
  LABEL="CCS: procedure 40"                                                     
                                                                                
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
                                                                                
  PRDAY26                    LENGTH=4                                           
  LABEL="Number of days from admission to PR26"                                 
                                                                                
  PRDAY27                    LENGTH=4                                           
  LABEL="Number of days from admission to PR27"                                 
                                                                                
  PRDAY28                    LENGTH=4                                           
  LABEL="Number of days from admission to PR28"                                 
                                                                                
  PRDAY29                    LENGTH=4                                           
  LABEL="Number of days from admission to PR29"                                 
                                                                                
  PRDAY30                    LENGTH=4                                           
  LABEL="Number of days from admission to PR30"                                 
                                                                                
  PRDAY31                    LENGTH=4                                           
  LABEL="Number of days from admission to PR31"                                 
                                                                                
  PRDAY32                    LENGTH=4                                           
  LABEL="Number of days from admission to PR32"                                 
                                                                                
  PRDAY33                    LENGTH=4                                           
  LABEL="Number of days from admission to PR33"                                 
                                                                                
  PRDAY34                    LENGTH=4                                           
  LABEL="Number of days from admission to PR34"                                 
                                                                                
  PRDAY35                    LENGTH=4                                           
  LABEL="Number of days from admission to PR35"                                 
                                                                                
  PRDAY36                    LENGTH=4                                           
  LABEL="Number of days from admission to PR36"                                 
                                                                                
  PRDAY37                    LENGTH=4                                           
  LABEL="Number of days from admission to PR37"                                 
                                                                                
  PRDAY38                    LENGTH=4                                           
  LABEL="Number of days from admission to PR38"                                 
                                                                                
  PRDAY39                    LENGTH=4                                           
  LABEL="Number of days from admission to PR39"                                 
                                                                                
  PRDAY40                    LENGTH=4                                           
  LABEL="Number of days from admission to PR40"                                 
                                                                                
  PROCTYPE                   LENGTH=3                                           
  LABEL="Procedure type indicator"                                              
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  PointOfOriginUB04          LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, UB-04 standard coding"         
                                                                                
  PointOfOrigin_X            LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, as received from source"       
                                                                                
  TOTCHG                     LENGTH=6                                           
  LABEL="Total charges (cleaned)"                                               
                                                                                
  TOTCHG_X                   LENGTH=7                                           
  LABEL="Total charges (as received from source)"                               
                                                                                
  TRAN_IN                    LENGTH=3                                           
  LABEL="Transfer in indicator"                                                 
                                                                                
  TRAN_OUT                   LENGTH=3                                           
  LABEL="Transfer out indicator"                                                
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
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
                                                                                
  PRMONTH31                  LENGTH=3                                           
  LABEL="Month of procedure 31"                                                 
                                                                                
  PRMONTH32                  LENGTH=3                                           
  LABEL="Month of procedure 32"                                                 
                                                                                
  PRMONTH33                  LENGTH=3                                           
  LABEL="Month of procedure 33"                                                 
                                                                                
  PRMONTH34                  LENGTH=3                                           
  LABEL="Month of procedure 34"                                                 
                                                                                
  PRMONTH35                  LENGTH=3                                           
  LABEL="Month of procedure 35"                                                 
                                                                                
  PRMONTH36                  LENGTH=3                                           
  LABEL="Month of procedure 36"                                                 
                                                                                
  PRMONTH37                  LENGTH=3                                           
  LABEL="Month of procedure 37"                                                 
                                                                                
  PRMONTH38                  LENGTH=3                                           
  LABEL="Month of procedure 38"                                                 
                                                                                
  PRMONTH39                  LENGTH=3                                           
  LABEL="Month of procedure 39"                                                 
                                                                                
  PRMONTH40                  LENGTH=3                                           
  LABEL="Month of procedure 40"                                                 
                                                                                
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
                                                                                
  PRYEAR31                   LENGTH=3                                           
  LABEL="Year of procedure 31"                                                  
                                                                                
  PRYEAR32                   LENGTH=3                                           
  LABEL="Year of procedure 32"                                                  
                                                                                
  PRYEAR33                   LENGTH=3                                           
  LABEL="Year of procedure 33"                                                  
                                                                                
  PRYEAR34                   LENGTH=3                                           
  LABEL="Year of procedure 34"                                                  
                                                                                
  PRYEAR35                   LENGTH=3                                           
  LABEL="Year of procedure 35"                                                  
                                                                                
  PRYEAR36                   LENGTH=3                                           
  LABEL="Year of procedure 36"                                                  
                                                                                
  PRYEAR37                   LENGTH=3                                           
  LABEL="Year of procedure 37"                                                  
                                                                                
  PRYEAR38                   LENGTH=3                                           
  LABEL="Year of procedure 38"                                                  
                                                                                
  PRYEAR39                   LENGTH=3                                           
  LABEL="Year of procedure 39"                                                  
                                                                                
  PRYEAR40                   LENGTH=3                                           
  LABEL="Year of procedure 40"                                                  
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      ADRG                          N3PF.                               
      @4      ADRGRISKMORTALITY             N2PF.                               
      @6      ADRGSEV                       N2PF.                               
      @8      AGE                           N3PF.                               
      @11     AGEDAY                        N3PF.                               
      @14     AGEMONTH                      N3PF.                               
      @17     AHOUR                         N4PF.                               
      @21     AMDC                          N2PF.                               
      @23     AMONTH                        N2PF.                               
      @25     ATYPE                         N2PF.                               
      @27     AWEEKEND                      N2PF.                               
      @29     DHOUR                         N4PF.                               
      @33     DIED                          N2PF.                               
      @35     DISPUB04                      N2PF.                               
      @37     DISPUNIFORM                   N2PF.                               
      @39     DISP_X                        $CHAR2.                             
      @41     DQTR                          N2PF.                               
      @43     DRG                           N3PF.                               
      @46     DRG24                         N3PF.                               
      @49     DRGVER                        N2PF.                               
      @51     DRG_NoPOA                     N3PF.                               
      @54     DX1                           $CHAR7.                             
      @61     DX2                           $CHAR7.                             
      @68     DX3                           $CHAR7.                             
      @75     DX4                           $CHAR7.                             
      @82     DX5                           $CHAR7.                             
      @89     DX6                           $CHAR7.                             
      @96     DX7                           $CHAR7.                             
      @103    DX8                           $CHAR7.                             
      @110    DX9                           $CHAR7.                             
      @117    DX10                          $CHAR7.                             
      @124    DX11                          $CHAR7.                             
      @131    DX12                          $CHAR7.                             
      @138    DX13                          $CHAR7.                             
      @145    DX14                          $CHAR7.                             
      @152    DX15                          $CHAR7.                             
      @159    DX16                          $CHAR7.                             
      @166    DX17                          $CHAR7.                             
      @173    DX18                          $CHAR7.                             
      @180    DX19                          $CHAR7.                             
      @187    DX20                          $CHAR7.                             
      @194    DX21                          $CHAR7.                             
      @201    DX22                          $CHAR7.                             
      @208    DX23                          $CHAR7.                             
      @215    DX24                          $CHAR7.                             
      @222    DX25                          $CHAR7.                             
      @229    DX26                          $CHAR7.                             
      @236    DX27                          $CHAR7.                             
      @243    DX28                          $CHAR7.                             
      @250    DX29                          $CHAR7.                             
      @257    DX30                          $CHAR7.                             
      @264    DX31                          $CHAR7.                             
      @271    DX32                          $CHAR7.                             
      @278    DX33                          $CHAR7.                             
      @285    DX34                          $CHAR7.                             
      @292    DX35                          $CHAR7.                             
      @299    DX36                          $CHAR7.                             
      @306    DX37                          $CHAR7.                             
      @313    DX38                          $CHAR7.                             
      @320    DX39                          $CHAR7.                             
      @327    DX40                          $CHAR7.                             
      @334    DXCCS1                        N4PF.                               
      @338    DXCCS2                        N4PF.                               
      @342    DXCCS3                        N4PF.                               
      @346    DXCCS4                        N4PF.                               
      @350    DXCCS5                        N4PF.                               
      @354    DXCCS6                        N4PF.                               
      @358    DXCCS7                        N4PF.                               
      @362    DXCCS8                        N4PF.                               
      @366    DXCCS9                        N4PF.                               
      @370    DXCCS10                       N4PF.                               
      @374    DXCCS11                       N4PF.                               
      @378    DXCCS12                       N4PF.                               
      @382    DXCCS13                       N4PF.                               
      @386    DXCCS14                       N4PF.                               
      @390    DXCCS15                       N4PF.                               
      @394    DXCCS16                       N4PF.                               
      @398    DXCCS17                       N4PF.                               
      @402    DXCCS18                       N4PF.                               
      @406    DXCCS19                       N4PF.                               
      @410    DXCCS20                       N4PF.                               
      @414    DXCCS21                       N4PF.                               
      @418    DXCCS22                       N4PF.                               
      @422    DXCCS23                       N4PF.                               
      @426    DXCCS24                       N4PF.                               
      @430    DXCCS25                       N4PF.                               
      @434    DXCCS26                       N4PF.                               
      @438    DXCCS27                       N4PF.                               
      @442    DXCCS28                       N4PF.                               
      @446    DXCCS29                       N4PF.                               
      @450    DXCCS30                       N4PF.                               
      @454    DXCCS31                       N4PF.                               
      @458    DXCCS32                       N4PF.                               
      @462    DXCCS33                       N4PF.                               
      @466    DXCCS34                       N4PF.                               
      @470    DXCCS35                       N4PF.                               
      @474    DXCCS36                       N4PF.                               
      @478    DXCCS37                       N4PF.                               
      @482    DXCCS38                       N4PF.                               
      @486    DXCCS39                       N4PF.                               
      @490    DXCCS40                       N4PF.                               
      @494    DXPOA1                        $CHAR1.                             
      @495    DXPOA2                        $CHAR1.                             
      @496    DXPOA3                        $CHAR1.                             
      @497    DXPOA4                        $CHAR1.                             
      @498    DXPOA5                        $CHAR1.                             
      @499    DXPOA6                        $CHAR1.                             
      @500    DXPOA7                        $CHAR1.                             
      @501    DXPOA8                        $CHAR1.                             
      @502    DXPOA9                        $CHAR1.                             
      @503    DXPOA10                       $CHAR1.                             
      @504    DXPOA11                       $CHAR1.                             
      @505    DXPOA12                       $CHAR1.                             
      @506    DXPOA13                       $CHAR1.                             
      @507    DXPOA14                       $CHAR1.                             
      @508    DXPOA15                       $CHAR1.                             
      @509    DXPOA16                       $CHAR1.                             
      @510    DXPOA17                       $CHAR1.                             
      @511    DXPOA18                       $CHAR1.                             
      @512    DXPOA19                       $CHAR1.                             
      @513    DXPOA20                       $CHAR1.                             
      @514    DXPOA21                       $CHAR1.                             
      @515    DXPOA22                       $CHAR1.                             
      @516    DXPOA23                       $CHAR1.                             
      @517    DXPOA24                       $CHAR1.                             
      @518    DXPOA25                       $CHAR1.                             
      @519    DXPOA26                       $CHAR1.                             
      @520    DXPOA27                       $CHAR1.                             
      @521    DXPOA28                       $CHAR1.                             
      @522    DXPOA29                       $CHAR1.                             
      @523    DXPOA30                       $CHAR1.                             
      @524    DXPOA31                       $CHAR1.                             
      @525    DXPOA32                       $CHAR1.                             
      @526    DXPOA33                       $CHAR1.                             
      @527    DXPOA34                       $CHAR1.                             
      @528    DXPOA35                       $CHAR1.                             
      @529    DXPOA36                       $CHAR1.                             
      @530    DXPOA37                       $CHAR1.                             
      @531    DXPOA38                       $CHAR1.                             
      @532    DXPOA39                       $CHAR1.                             
      @533    DXPOA40                       $CHAR1.                             
      @534    ECODE1                        $CHAR7.                             
      @541    ECODE2                        $CHAR7.                             
      @548    ECODE3                        $CHAR7.                             
      @555    ECODE4                        $CHAR7.                             
      @562    ECODE5                        $CHAR7.                             
      @569    ECODE6                        $CHAR7.                             
      @576    ECODE7                        $CHAR7.                             
      @583    ECODE8                        $CHAR7.                             
      @590    E_CCS1                        N4PF.                               
      @594    E_CCS2                        N4PF.                               
      @598    E_CCS3                        N4PF.                               
      @602    E_CCS4                        N4PF.                               
      @606    E_CCS5                        N4PF.                               
      @610    E_CCS6                        N4PF.                               
      @614    E_CCS7                        N4PF.                               
      @618    E_CCS8                        N4PF.                               
      @622    E_POA1                        $CHAR1.                             
      @623    E_POA2                        $CHAR1.                             
      @624    E_POA3                        $CHAR1.                             
      @625    E_POA4                        $CHAR1.                             
      @626    E_POA5                        $CHAR1.                             
      @627    E_POA6                        $CHAR1.                             
      @628    E_POA7                        $CHAR1.                             
      @629    E_POA8                        $CHAR1.                             
      @630    FEMALE                        N2PF.                               
      @632    HCUP_ED                       N2PF.                               
      @634    HCUP_OS                       N2PF.                               
      @636    HCUP_SURGERY_BROAD            N2PF.                               
      @638    HCUP_SURGERY_NARROW           N2PF.                               
      @640    HOSPBRTH                      N3PF.                               
      @643    HOSPST                        $CHAR2.                             
      @645    KEY                           15.                                 
      @660    LOS                           N5PF.                               
      @665    LOS_X                         N6PF.                               
      @671    MARITALSTATUSUB04             $CHAR1.                             
      @672    MARITALSTATUS_X               $CHAR1.                             
      @673    MDC                           N2PF.                               
      @675    MDC24                         N2PF.                               
      @677    MDC_NoPOA                     N2PF.                               
      @679    MEDINCSTQ                     N2PF.                               
      @681    MRN_R                         N9PF.                               
      @690    NCHRONIC                      N3PF.                               
      @693    NDX                           N3PF.                               
      @696    NECODE                        N2PF.                               
      @698    NEOMAT                        N2PF.                               
      @700    NPR                           N3PF.                               
      @703    ORPROC                        N2PF.                               
      @705    OS_TIME                       N11P2F.                             
      @716    PAY1                          N2PF.                               
      @718    PAY1_X                        $CHAR7.                             
      @725    PAY2                          N2PF.                               
      @727    PAY2_X                        $CHAR7.                             
      @734    PAY3                          N2PF.                               
      @736    PAY3_X                        $CHAR7.                             
      @743    PL_CBSA                       N3PF.                               
      @746    PL_MSA1993                    N3PF.                               
      @749    PL_NCHS2006                   N2PF.                               
      @751    PL_RUCA10_2005                N2PF.                               
      @753    PL_RUCA2005                   N4P1F.                              
      @757    PL_RUCA4_2005                 N2PF.                               
      @759    PL_RUCC2003                   N2PF.                               
      @761    PL_UIC2003                    N2PF.                               
      @763    PL_UR_CAT4                    N2PF.                               
      @765    PR1                           $CHAR7.                             
      @772    PR2                           $CHAR7.                             
      @779    PR3                           $CHAR7.                             
      @786    PR4                           $CHAR7.                             
      @793    PR5                           $CHAR7.                             
      @800    PR6                           $CHAR7.                             
      @807    PR7                           $CHAR7.                             
      @814    PR8                           $CHAR7.                             
      @821    PR9                           $CHAR7.                             
      @828    PR10                          $CHAR7.                             
      @835    PR11                          $CHAR7.                             
      @842    PR12                          $CHAR7.                             
      @849    PR13                          $CHAR7.                             
      @856    PR14                          $CHAR7.                             
      @863    PR15                          $CHAR7.                             
      @870    PR16                          $CHAR7.                             
      @877    PR17                          $CHAR7.                             
      @884    PR18                          $CHAR7.                             
      @891    PR19                          $CHAR7.                             
      @898    PR20                          $CHAR7.                             
      @905    PR21                          $CHAR7.                             
      @912    PR22                          $CHAR7.                             
      @919    PR23                          $CHAR7.                             
      @926    PR24                          $CHAR7.                             
      @933    PR25                          $CHAR7.                             
      @940    PR26                          $CHAR7.                             
      @947    PR27                          $CHAR7.                             
      @954    PR28                          $CHAR7.                             
      @961    PR29                          $CHAR7.                             
      @968    PR30                          $CHAR7.                             
      @975    PR31                          $CHAR7.                             
      @982    PR32                          $CHAR7.                             
      @989    PR33                          $CHAR7.                             
      @996    PR34                          $CHAR7.                             
      @1003   PR35                          $CHAR7.                             
      @1010   PR36                          $CHAR7.                             
      @1017   PR37                          $CHAR7.                             
      @1024   PR38                          $CHAR7.                             
      @1031   PR39                          $CHAR7.                             
      @1038   PR40                          $CHAR7.                             
      @1045   PRCCS1                        N3PF.                               
      @1048   PRCCS2                        N3PF.                               
      @1051   PRCCS3                        N3PF.                               
      @1054   PRCCS4                        N3PF.                               
      @1057   PRCCS5                        N3PF.                               
      @1060   PRCCS6                        N3PF.                               
      @1063   PRCCS7                        N3PF.                               
      @1066   PRCCS8                        N3PF.                               
      @1069   PRCCS9                        N3PF.                               
      @1072   PRCCS10                       N3PF.                               
      @1075   PRCCS11                       N3PF.                               
      @1078   PRCCS12                       N3PF.                               
      @1081   PRCCS13                       N3PF.                               
      @1084   PRCCS14                       N3PF.                               
      @1087   PRCCS15                       N3PF.                               
      @1090   PRCCS16                       N3PF.                               
      @1093   PRCCS17                       N3PF.                               
      @1096   PRCCS18                       N3PF.                               
      @1099   PRCCS19                       N3PF.                               
      @1102   PRCCS20                       N3PF.                               
      @1105   PRCCS21                       N3PF.                               
      @1108   PRCCS22                       N3PF.                               
      @1111   PRCCS23                       N3PF.                               
      @1114   PRCCS24                       N3PF.                               
      @1117   PRCCS25                       N3PF.                               
      @1120   PRCCS26                       N3PF.                               
      @1123   PRCCS27                       N3PF.                               
      @1126   PRCCS28                       N3PF.                               
      @1129   PRCCS29                       N3PF.                               
      @1132   PRCCS30                       N3PF.                               
      @1135   PRCCS31                       N3PF.                               
      @1138   PRCCS32                       N3PF.                               
      @1141   PRCCS33                       N3PF.                               
      @1144   PRCCS34                       N3PF.                               
      @1147   PRCCS35                       N3PF.                               
      @1150   PRCCS36                       N3PF.                               
      @1153   PRCCS37                       N3PF.                               
      @1156   PRCCS38                       N3PF.                               
      @1159   PRCCS39                       N3PF.                               
      @1162   PRCCS40                       N3PF.                               
      @1165   PRDAY1                        N5PF.                               
      @1170   PRDAY2                        N5PF.                               
      @1175   PRDAY3                        N5PF.                               
      @1180   PRDAY4                        N5PF.                               
      @1185   PRDAY5                        N5PF.                               
      @1190   PRDAY6                        N5PF.                               
      @1195   PRDAY7                        N5PF.                               
      @1200   PRDAY8                        N5PF.                               
      @1205   PRDAY9                        N5PF.                               
      @1210   PRDAY10                       N5PF.                               
      @1215   PRDAY11                       N5PF.                               
      @1220   PRDAY12                       N5PF.                               
      @1225   PRDAY13                       N5PF.                               
      @1230   PRDAY14                       N5PF.                               
      @1235   PRDAY15                       N5PF.                               
      @1240   PRDAY16                       N5PF.                               
      @1245   PRDAY17                       N5PF.                               
      @1250   PRDAY18                       N5PF.                               
      @1255   PRDAY19                       N5PF.                               
      @1260   PRDAY20                       N5PF.                               
      @1265   PRDAY21                       N5PF.                               
      @1270   PRDAY22                       N5PF.                               
      @1275   PRDAY23                       N5PF.                               
      @1280   PRDAY24                       N5PF.                               
      @1285   PRDAY25                       N5PF.                               
      @1290   PRDAY26                       N5PF.                               
      @1295   PRDAY27                       N5PF.                               
      @1300   PRDAY28                       N5PF.                               
      @1305   PRDAY29                       N5PF.                               
      @1310   PRDAY30                       N5PF.                               
      @1315   PRDAY31                       N5PF.                               
      @1320   PRDAY32                       N5PF.                               
      @1325   PRDAY33                       N5PF.                               
      @1330   PRDAY34                       N5PF.                               
      @1335   PRDAY35                       N5PF.                               
      @1340   PRDAY36                       N5PF.                               
      @1345   PRDAY37                       N5PF.                               
      @1350   PRDAY38                       N5PF.                               
      @1355   PRDAY39                       N5PF.                               
      @1360   PRDAY40                       N5PF.                               
      @1365   PROCTYPE                      N3PF.                               
      @1368   PSTATE                        $CHAR2.                             
      @1370   PSTCO2                        N5PF.                               
      @1375   PointOfOriginUB04             $CHAR1.                             
      @1376   PointOfOrigin_X               $CHAR1.                             
      @1377   TOTCHG                        N10PF.                              
      @1387   TOTCHG_X                      N15P2F.                             
      @1402   TRAN_IN                       N2PF.                               
      @1404   TRAN_OUT                      N2PF.                               
      @1406   YEAR                          N4PF.                               
      @1410   ZIP3                          $CHAR3.                             
      @1413   ZIPINC_QRTL                   N3PF.                               
      @1416   ZIP                           $CHAR5.                             
      @1421   AYEAR                         N4PF.                               
      @1425   DMONTH                        N2PF.                               
      @1427   BMONTH                        N2PF.                               
      @1429   BYEAR                         N4PF.                               
      @1433   PRMONTH1                      N2PF.                               
      @1435   PRMONTH2                      N2PF.                               
      @1437   PRMONTH3                      N2PF.                               
      @1439   PRMONTH4                      N2PF.                               
      @1441   PRMONTH5                      N2PF.                               
      @1443   PRMONTH6                      N2PF.                               
      @1445   PRMONTH7                      N2PF.                               
      @1447   PRMONTH8                      N2PF.                               
      @1449   PRMONTH9                      N2PF.                               
      @1451   PRMONTH10                     N2PF.                               
      @1453   PRMONTH11                     N2PF.                               
      @1455   PRMONTH12                     N2PF.                               
      @1457   PRMONTH13                     N2PF.                               
      @1459   PRMONTH14                     N2PF.                               
      @1461   PRMONTH15                     N2PF.                               
      @1463   PRMONTH16                     N2PF.                               
      @1465   PRMONTH17                     N2PF.                               
      @1467   PRMONTH18                     N2PF.                               
      @1469   PRMONTH19                     N2PF.                               
      @1471   PRMONTH20                     N2PF.                               
      @1473   PRMONTH21                     N2PF.                               
      @1475   PRMONTH22                     N2PF.                               
      @1477   PRMONTH23                     N2PF.                               
      @1479   PRMONTH24                     N2PF.                               
      @1481   PRMONTH25                     N2PF.                               
      @1483   PRMONTH26                     N2PF.                               
      @1485   PRMONTH27                     N2PF.                               
      @1487   PRMONTH28                     N2PF.                               
      @1489   PRMONTH29                     N2PF.                               
      @1491   PRMONTH30                     N2PF.                               
      @1493   PRMONTH31                     N2PF.                               
      @1495   PRMONTH32                     N2PF.                               
      @1497   PRMONTH33                     N2PF.                               
      @1499   PRMONTH34                     N2PF.                               
      @1501   PRMONTH35                     N2PF.                               
      @1503   PRMONTH36                     N2PF.                               
      @1505   PRMONTH37                     N2PF.                               
      @1507   PRMONTH38                     N2PF.                               
      @1509   PRMONTH39                     N2PF.                               
      @1511   PRMONTH40                     N2PF.                               
      @1513   PRYEAR1                       N4PF.                               
      @1517   PRYEAR2                       N4PF.                               
      @1521   PRYEAR3                       N4PF.                               
      @1525   PRYEAR4                       N4PF.                               
      @1529   PRYEAR5                       N4PF.                               
      @1533   PRYEAR6                       N4PF.                               
      @1537   PRYEAR7                       N4PF.                               
      @1541   PRYEAR8                       N4PF.                               
      @1545   PRYEAR9                       N4PF.                               
      @1549   PRYEAR10                      N4PF.                               
      @1553   PRYEAR11                      N4PF.                               
      @1557   PRYEAR12                      N4PF.                               
      @1561   PRYEAR13                      N4PF.                               
      @1565   PRYEAR14                      N4PF.                               
      @1569   PRYEAR15                      N4PF.                               
      @1573   PRYEAR16                      N4PF.                               
      @1577   PRYEAR17                      N4PF.                               
      @1581   PRYEAR18                      N4PF.                               
      @1585   PRYEAR19                      N4PF.                               
      @1589   PRYEAR20                      N4PF.                               
      @1593   PRYEAR21                      N4PF.                               
      @1597   PRYEAR22                      N4PF.                               
      @1601   PRYEAR23                      N4PF.                               
      @1605   PRYEAR24                      N4PF.                               
      @1609   PRYEAR25                      N4PF.                               
      @1613   PRYEAR26                      N4PF.                               
      @1617   PRYEAR27                      N4PF.                               
      @1621   PRYEAR28                      N4PF.                               
      @1625   PRYEAR29                      N4PF.                               
      @1629   PRYEAR30                      N4PF.                               
      @1633   PRYEAR31                      N4PF.                               
      @1637   PRYEAR32                      N4PF.                               
      @1641   PRYEAR33                      N4PF.                               
      @1645   PRYEAR34                      N4PF.                               
      @1649   PRYEAR35                      N4PF.                               
      @1653   PRYEAR36                      N4PF.                               
      @1657   PRYEAR37                      N4PF.                               
      @1661   PRYEAR38                      N4PF.                               
      @1665   PRYEAR39                      N4PF.                               
      @1669   PRYEAR40                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
