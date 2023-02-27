/*******************************************************************            
* Creation Date: 02/20/2018                                                     
*   KS_SEDD_2011_CORE.SAS:                                                      
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
DATA KS_SEDDC_2011_CORE;                                                        
INFILE 'KS_SEDD_2011_CORE.ASC' FIRSTOBS=3 LRECL = 1018;                         
                                                                                
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
                                                                                
  BILLTYPE                   LENGTH=$4                                          
  LABEL="UB-92 bill type"                                                       
                                                                                
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
                                                                                
  DURATION                   LENGTH=4                                           
  LABEL="Hours in Emergency Department"                                         
                                                                                
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
                                                                                
  ECODE17                    LENGTH=$7                                          
  LABEL="E code 17"                                                             
                                                                                
  ECODE18                    LENGTH=$7                                          
  LABEL="E code 18"                                                             
                                                                                
  ECODE19                    LENGTH=$7                                          
  LABEL="E code 19"                                                             
                                                                                
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
                                                                                
  E_CCS17                    LENGTH=3                                           
  LABEL="CCS: E Code 17"                                                        
                                                                                
  E_CCS18                    LENGTH=3                                           
  LABEL="CCS: E Code 18"                                                        
                                                                                
  E_CCS19                    LENGTH=3                                           
  LABEL="CCS: E Code 19"                                                        
                                                                                
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
                                                                                
  KEY                        LENGTH=8                      FORMAT=Z18.          
  LABEL="HCUP record identifier"                                                
                                                                                
  LOS                        LENGTH=4                                           
  LABEL="Length of stay (cleaned)"                                              
                                                                                
  LOS_X                      LENGTH=4                                           
  LABEL="Length of stay (as received from source)"                              
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
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
                                                                                
  OPservice                  LENGTH=$1                                          
  LABEL="Indicator of outpatient service (as received from source)"             
                                                                                
  ORPROC                     LENGTH=3                                           
  LABEL="Major operating room procedure indicator"                              
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$3                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$3                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAY3                       LENGTH=3                                           
  LABEL="Tertiary expected payer (uniform)"                                     
                                                                                
  PAY3_X                     LENGTH=$3                                          
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
                                                                                
  YEAR                       LENGTH=3                                           
  LABEL="Calendar year"                                                         
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  HOSPID                     LENGTH=4                      FORMAT=Z5.           
  LABEL="HCUP hospital identification number"                                   
                                                                                
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
                                                                                
  PRYEAR1                    LENGTH=3                                           
  LABEL="Year of procedure 1"                                                   
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
      @20     BILLTYPE                      $CHAR4.                             
      @24     DHOUR                         N4PF.                               
      @28     DIED                          N2PF.                               
      @30     DISPUB04                      N2PF.                               
      @32     DISPUNIFORM                   N2PF.                               
      @34     DISP_X                        $CHAR2.                             
      @36     DQTR                          N2PF.                               
      @38     DURATION                      N6PF.                               
      @44     DX1                           $CHAR7.                             
      @51     DX2                           $CHAR7.                             
      @58     DX3                           $CHAR7.                             
      @65     DX4                           $CHAR7.                             
      @72     DX5                           $CHAR7.                             
      @79     DX6                           $CHAR7.                             
      @86     DX7                           $CHAR7.                             
      @93     DX8                           $CHAR7.                             
      @100    DX9                           $CHAR7.                             
      @107    DX10                          $CHAR7.                             
      @114    DX11                          $CHAR7.                             
      @121    DX12                          $CHAR7.                             
      @128    DX13                          $CHAR7.                             
      @135    DX14                          $CHAR7.                             
      @142    DX15                          $CHAR7.                             
      @149    DX16                          $CHAR7.                             
      @156    DX17                          $CHAR7.                             
      @163    DX18                          $CHAR7.                             
      @170    DX19                          $CHAR7.                             
      @177    DX20                          $CHAR7.                             
      @184    DX21                          $CHAR7.                             
      @191    DX22                          $CHAR7.                             
      @198    DX23                          $CHAR7.                             
      @205    DX24                          $CHAR7.                             
      @212    DX25                          $CHAR7.                             
      @219    DX26                          $CHAR7.                             
      @226    DX27                          $CHAR7.                             
      @233    DX28                          $CHAR7.                             
      @240    DX29                          $CHAR7.                             
      @247    DX30                          $CHAR7.                             
      @254    DXCCS1                        N4PF.                               
      @258    DXCCS2                        N4PF.                               
      @262    DXCCS3                        N4PF.                               
      @266    DXCCS4                        N4PF.                               
      @270    DXCCS5                        N4PF.                               
      @274    DXCCS6                        N4PF.                               
      @278    DXCCS7                        N4PF.                               
      @282    DXCCS8                        N4PF.                               
      @286    DXCCS9                        N4PF.                               
      @290    DXCCS10                       N4PF.                               
      @294    DXCCS11                       N4PF.                               
      @298    DXCCS12                       N4PF.                               
      @302    DXCCS13                       N4PF.                               
      @306    DXCCS14                       N4PF.                               
      @310    DXCCS15                       N4PF.                               
      @314    DXCCS16                       N4PF.                               
      @318    DXCCS17                       N4PF.                               
      @322    DXCCS18                       N4PF.                               
      @326    DXCCS19                       N4PF.                               
      @330    DXCCS20                       N4PF.                               
      @334    DXCCS21                       N4PF.                               
      @338    DXCCS22                       N4PF.                               
      @342    DXCCS23                       N4PF.                               
      @346    DXCCS24                       N4PF.                               
      @350    DXCCS25                       N4PF.                               
      @354    DXCCS26                       N4PF.                               
      @358    DXCCS27                       N4PF.                               
      @362    DXCCS28                       N4PF.                               
      @366    DXCCS29                       N4PF.                               
      @370    DXCCS30                       N4PF.                               
      @374    ECODE1                        $CHAR7.                             
      @381    ECODE2                        $CHAR7.                             
      @388    ECODE3                        $CHAR7.                             
      @395    ECODE4                        $CHAR7.                             
      @402    ECODE5                        $CHAR7.                             
      @409    ECODE6                        $CHAR7.                             
      @416    ECODE7                        $CHAR7.                             
      @423    ECODE8                        $CHAR7.                             
      @430    ECODE9                        $CHAR7.                             
      @437    ECODE10                       $CHAR7.                             
      @444    ECODE11                       $CHAR7.                             
      @451    ECODE12                       $CHAR7.                             
      @458    ECODE13                       $CHAR7.                             
      @465    ECODE14                       $CHAR7.                             
      @472    ECODE15                       $CHAR7.                             
      @479    ECODE16                       $CHAR7.                             
      @486    ECODE17                       $CHAR7.                             
      @493    ECODE18                       $CHAR7.                             
      @500    ECODE19                       $CHAR7.                             
      @507    E_CCS1                        N4PF.                               
      @511    E_CCS2                        N4PF.                               
      @515    E_CCS3                        N4PF.                               
      @519    E_CCS4                        N4PF.                               
      @523    E_CCS5                        N4PF.                               
      @527    E_CCS6                        N4PF.                               
      @531    E_CCS7                        N4PF.                               
      @535    E_CCS8                        N4PF.                               
      @539    E_CCS9                        N4PF.                               
      @543    E_CCS10                       N4PF.                               
      @547    E_CCS11                       N4PF.                               
      @551    E_CCS12                       N4PF.                               
      @555    E_CCS13                       N4PF.                               
      @559    E_CCS14                       N4PF.                               
      @563    E_CCS15                       N4PF.                               
      @567    E_CCS16                       N4PF.                               
      @571    E_CCS17                       N4PF.                               
      @575    E_CCS18                       N4PF.                               
      @579    E_CCS19                       N4PF.                               
      @583    FEMALE                        N2PF.                               
      @585    HCUP_ED                       N2PF.                               
      @587    HCUP_OS                       N2PF.                               
      @589    HCUP_SURGERY_BROAD            N2PF.                               
      @591    HCUP_SURGERY_NARROW           N2PF.                               
      @593    HISPANIC_X                    $CHAR1.                             
      @594    HOSPBRTH                      N3PF.                               
      @597    HOSPST                        $CHAR2.                             
      @599    KEY                           15.                                 
      @614    LOS                           N5PF.                               
      @619    LOS_X                         N6PF.                               
      @625    MEDINCSTQ                     N2PF.                               
      @627    NCHRONIC                      N3PF.                               
      @630    NDX                           N3PF.                               
      @633    NECODE                        N2PF.                               
      @635    NEOMAT                        N2PF.                               
      @637    NPR                           N3PF.                               
      @640    OPservice                     $CHAR1.                             
      @641    ORPROC                        N2PF.                               
      @643    PAY1                          N2PF.                               
      @645    PAY1_X                        $CHAR3.                             
      @648    PAY2                          N2PF.                               
      @650    PAY2_X                        $CHAR3.                             
      @653    PAY3                          N2PF.                               
      @655    PAY3_X                        $CHAR3.                             
      @658    PL_CBSA                       N3PF.                               
      @661    PL_MSA1993                    N3PF.                               
      @664    PL_NCHS2006                   N2PF.                               
      @666    PL_RUCA10_2005                N2PF.                               
      @668    PL_RUCA2005                   N4P1F.                              
      @672    PL_RUCA4_2005                 N2PF.                               
      @674    PL_RUCC2003                   N2PF.                               
      @676    PL_UIC2003                    N2PF.                               
      @678    PL_UR_CAT4                    N2PF.                               
      @680    PR1                           $CHAR7.                             
      @687    PR2                           $CHAR7.                             
      @694    PR3                           $CHAR7.                             
      @701    PR4                           $CHAR7.                             
      @708    PR5                           $CHAR7.                             
      @715    PR6                           $CHAR7.                             
      @722    PR7                           $CHAR7.                             
      @729    PR8                           $CHAR7.                             
      @736    PR9                           $CHAR7.                             
      @743    PR10                          $CHAR7.                             
      @750    PR11                          $CHAR7.                             
      @757    PR12                          $CHAR7.                             
      @764    PR13                          $CHAR7.                             
      @771    PR14                          $CHAR7.                             
      @778    PR15                          $CHAR7.                             
      @785    PR16                          $CHAR7.                             
      @792    PR17                          $CHAR7.                             
      @799    PR18                          $CHAR7.                             
      @806    PR19                          $CHAR7.                             
      @813    PR20                          $CHAR7.                             
      @820    PR21                          $CHAR7.                             
      @827    PR22                          $CHAR7.                             
      @834    PR23                          $CHAR7.                             
      @841    PR24                          $CHAR7.                             
      @848    PR25                          $CHAR7.                             
      @855    PRCCS1                        N3PF.                               
      @858    PRCCS2                        N3PF.                               
      @861    PRCCS3                        N3PF.                               
      @864    PRCCS4                        N3PF.                               
      @867    PRCCS5                        N3PF.                               
      @870    PRCCS6                        N3PF.                               
      @873    PRCCS7                        N3PF.                               
      @876    PRCCS8                        N3PF.                               
      @879    PRCCS9                        N3PF.                               
      @882    PRCCS10                       N3PF.                               
      @885    PRCCS11                       N3PF.                               
      @888    PRCCS12                       N3PF.                               
      @891    PRCCS13                       N3PF.                               
      @894    PRCCS14                       N3PF.                               
      @897    PRCCS15                       N3PF.                               
      @900    PRCCS16                       N3PF.                               
      @903    PRCCS17                       N3PF.                               
      @906    PRCCS18                       N3PF.                               
      @909    PRCCS19                       N3PF.                               
      @912    PRCCS20                       N3PF.                               
      @915    PRCCS21                       N3PF.                               
      @918    PRCCS22                       N3PF.                               
      @921    PRCCS23                       N3PF.                               
      @924    PRCCS24                       N3PF.                               
      @927    PRCCS25                       N3PF.                               
      @930    PRDAY1                        N5PF.                               
      @935    PROCTYPE                      N3PF.                               
      @938    PSTATE                        $CHAR2.                             
      @940    PSTCO                         N5PF.                               
      @945    PSTCO2                        N5PF.                               
      @950    PointOfOriginUB04             $CHAR1.                             
      @951    PointOfOrigin_X               $CHAR1.                             
      @952    RACE                          N2PF.                               
      @954    RACE_X                        $CHAR1.                             
      @955    STATE_AS                      N2PF.                               
      @957    STATE_ED                      N2PF.                               
      @959    STATE_OS                      N2PF.                               
      @961    TOTCHG                        N10PF.                              
      @971    TOTCHG_X                      N15P2F.                             
      @986    YEAR                          N4PF.                               
      @990    ZIP3                          $CHAR3.                             
      @993    ZIPINC_QRTL                   N3PF.                               
      @996    HOSPID                        N5PF.                               
      @1001   AYEAR                         N4PF.                               
      @1005   DMONTH                        N2PF.                               
      @1007   BMONTH                        N2PF.                               
      @1009   BYEAR                         N4PF.                               
      @1013   PRMONTH1                      N2PF.                               
      @1015   PRYEAR1                       N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
