/*******************************************************************            
* Creation Date: 03/30/2017                                                     
*   FL_SEDD_2015q4_CORE.SAS:                                                    
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
DATA FL_SEDDC_2015q4_CORE;                                                      
INFILE 'FL_SEDD_2015q4_CORE.ASC' FIRSTOBS=3 LRECL = 721;                        
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
  AHOUR                      LENGTH=3                      FORMAT=Z4.           
  LABEL="Admission Hour"                                                        
                                                                                
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
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DSHOSPID                   LENGTH=$17                                         
  LABEL="Data source hospital identifier"                                       
                                                                                
  DURATION                   LENGTH=4                                           
  LABEL="Elapsed time for hospital care in hours and minutes"                   
                                                                                
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
                                                                                
  HISPANIC_X                 LENGTH=$2                                          
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  Homeless                   LENGTH=3                                           
  LABEL="Indicator that patient is homeless"                                    
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  I10_DX_Visit_Reason1       LENGTH=$7                                          
  LABEL="ICD-10-CM Reason for visit diagnosis 1"                                
                                                                                
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
                                                                                
  I10_ECAUSE1                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 1"                                                   
                                                                                
  I10_ECAUSE2                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 2"                                                   
                                                                                
  I10_ECAUSE3                LENGTH=$7                                          
  LABEL="ICD-10-CM E Cause 3"                                                   
                                                                                
  I10_ECauseCCS1             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 1"                                              
                                                                                
  I10_ECauseCCS2             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 2"                                              
                                                                                
  I10_ECauseCCS3             LENGTH=3                                           
  LABEL="ICD-10-CM CCS: E Cause 3"                                              
                                                                                
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
                                                                                
  NCPT                       LENGTH=3                                           
  LABEL="Number of CPT/HCPCS procedures for this visit"                         
                                                                                
  OFFSITE_ED_X               LENGTH=$1                                          
  LABEL=                                                                        
                                                                                
"Indicator of services performed at an offsite location (as received from source
)"                                                                              
                                                                                
  OPservice                  LENGTH=$2                                          
  LABEL="Indicator of outpatient service (as received from source)"             
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$1                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
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
                                                                                
  PointOfOrigin_X            LENGTH=$2                                          
  LABEL="Point of origin for admission or visit, as received from source"       
                                                                                
  PointOfOriginUB04          LENGTH=$1                                          
  LABEL="Point of origin for admission or visit, UB-04 standard coding"         
                                                                                
  PRVER                      LENGTH=3                                           
  LABEL="Procedure Version"                                                     
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
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
                                                                                
  AYEAR                      LENGTH=3                                           
  LABEL="Admission year"                                                        
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                           N3PF.                               
      @4      AHOUR                         N4PF.                               
      @8      AWEEKEND                      N2PF.                               
      @10     CPT1                          $CHAR5.                             
      @15     CPT2                          $CHAR5.                             
      @20     CPT3                          $CHAR5.                             
      @25     CPT4                          $CHAR5.                             
      @30     CPT5                          $CHAR5.                             
      @35     CPT6                          $CHAR5.                             
      @40     CPT7                          $CHAR5.                             
      @45     CPT8                          $CHAR5.                             
      @50     CPT9                          $CHAR5.                             
      @55     CPT10                         $CHAR5.                             
      @60     CPT11                         $CHAR5.                             
      @65     CPT12                         $CHAR5.                             
      @70     CPT13                         $CHAR5.                             
      @75     CPT14                         $CHAR5.                             
      @80     CPT15                         $CHAR5.                             
      @85     CPT16                         $CHAR5.                             
      @90     CPT17                         $CHAR5.                             
      @95     CPT18                         $CHAR5.                             
      @100    CPT19                         $CHAR5.                             
      @105    CPT20                         $CHAR5.                             
      @110    CPT21                         $CHAR5.                             
      @115    CPT22                         $CHAR5.                             
      @120    CPT23                         $CHAR5.                             
      @125    CPT24                         $CHAR5.                             
      @130    CPT25                         $CHAR5.                             
      @135    CPT26                         $CHAR5.                             
      @140    CPT27                         $CHAR5.                             
      @145    CPT28                         $CHAR5.                             
      @150    CPT29                         $CHAR5.                             
      @155    CPT30                         $CHAR5.                             
      @160    CPT31                         $CHAR5.                             
      @165    CPT32                         $CHAR5.                             
      @170    CPT33                         $CHAR5.                             
      @175    CPT34                         $CHAR5.                             
      @180    CPT35                         $CHAR5.                             
      @185    CPTCCS1                       N3PF.                               
      @188    CPTCCS2                       N3PF.                               
      @191    CPTCCS3                       N3PF.                               
      @194    CPTCCS4                       N3PF.                               
      @197    CPTCCS5                       N3PF.                               
      @200    CPTCCS6                       N3PF.                               
      @203    CPTCCS7                       N3PF.                               
      @206    CPTCCS8                       N3PF.                               
      @209    CPTCCS9                       N3PF.                               
      @212    CPTCCS10                      N3PF.                               
      @215    CPTCCS11                      N3PF.                               
      @218    CPTCCS12                      N3PF.                               
      @221    CPTCCS13                      N3PF.                               
      @224    CPTCCS14                      N3PF.                               
      @227    CPTCCS15                      N3PF.                               
      @230    CPTCCS16                      N3PF.                               
      @233    CPTCCS17                      N3PF.                               
      @236    CPTCCS18                      N3PF.                               
      @239    CPTCCS19                      N3PF.                               
      @242    CPTCCS20                      N3PF.                               
      @245    CPTCCS21                      N3PF.                               
      @248    CPTCCS22                      N3PF.                               
      @251    CPTCCS23                      N3PF.                               
      @254    CPTCCS24                      N3PF.                               
      @257    CPTCCS25                      N3PF.                               
      @260    CPTCCS26                      N3PF.                               
      @263    CPTCCS27                      N3PF.                               
      @266    CPTCCS28                      N3PF.                               
      @269    CPTCCS29                      N3PF.                               
      @272    CPTCCS30                      N3PF.                               
      @275    CPTCCS31                      N3PF.                               
      @278    CPTCCS32                      N3PF.                               
      @281    CPTCCS33                      N3PF.                               
      @284    CPTCCS34                      N3PF.                               
      @287    CPTCCS35                      N3PF.                               
      @290    DaysToEvent                   N6PF.                               
      @296    DHOUR                         N4PF.                               
      @300    DIED                          N2PF.                               
      @302    DISP_X                        $CHAR2.                             
      @304    DISPUB04                      N2PF.                               
      @306    DISPUNIFORM                   N2PF.                               
      @308    DQTR                          N2PF.                               
      @310    DSHOSPID                      $CHAR17.                            
      @327    DURATION                      N6PF.                               
      @333    DXVER                         N3PF.                               
      @336    FEMALE                        N2PF.                               
      @338    HCUP_ED                       N2PF.                               
      @340    HCUP_OS                       N2PF.                               
      @342    HISPANIC                      N2PF.                               
      @344    HISPANIC_X                    $CHAR2.                             
      @346    Homeless                      N2PF.                               
      @348    HOSPST                        $CHAR2.                             
      @350    I10_DX_Visit_Reason1          $CHAR7.                             
      @357    I10_DX1                       $CHAR7.                             
      @364    I10_DX2                       $CHAR7.                             
      @371    I10_DX3                       $CHAR7.                             
      @378    I10_DX4                       $CHAR7.                             
      @385    I10_DX5                       $CHAR7.                             
      @392    I10_DX6                       $CHAR7.                             
      @399    I10_DX7                       $CHAR7.                             
      @406    I10_DX8                       $CHAR7.                             
      @413    I10_DX9                       $CHAR7.                             
      @420    I10_DX10                      $CHAR7.                             
      @427    I10_DXCCS1                    N4PF.                               
      @431    I10_DXCCS2                    N4PF.                               
      @435    I10_DXCCS3                    N4PF.                               
      @439    I10_DXCCS4                    N4PF.                               
      @443    I10_DXCCS5                    N4PF.                               
      @447    I10_DXCCS6                    N4PF.                               
      @451    I10_DXCCS7                    N4PF.                               
      @455    I10_DXCCS8                    N4PF.                               
      @459    I10_DXCCS9                    N4PF.                               
      @463    I10_DXCCS10                   N4PF.                               
      @467    I10_ECAUSE1                   $CHAR7.                             
      @474    I10_ECAUSE2                   $CHAR7.                             
      @481    I10_ECAUSE3                   $CHAR7.                             
      @488    I10_ECauseCCS1                N4PF.                               
      @492    I10_ECauseCCS2                N4PF.                               
      @496    I10_ECauseCCS3                N4PF.                               
      @500    I10_HOSPBRTH                  N3PF.                               
      @503    I10_NCHRONIC                  N3PF.                               
      @506    I10_NDX                       N3PF.                               
      @509    I10_NECAUSE                   N2PF.                               
      @511    I10_NEOMAT                    N2PF.                               
      @513    I10_NPR                       N3PF.                               
      @516    I10_ORPROC                    N2PF.                               
      @518    I10_PR1                       $CHAR7.                             
      @525    I10_PR2                       $CHAR7.                             
      @532    I10_PR3                       $CHAR7.                             
      @539    I10_PR4                       $CHAR7.                             
      @546    I10_PR5                       $CHAR7.                             
      @553    I10_PRCCS1                    N3PF.                               
      @556    I10_PRCCS2                    N3PF.                               
      @559    I10_PRCCS3                    N3PF.                               
      @562    I10_PRCCS4                    N3PF.                               
      @565    I10_PRCCS5                    N3PF.                               
      @568    I10_PROCTYPE                  N3PF.                               
      @571    KEY                           15.                                 
      @586    LOS                           N5PF.                               
      @591    LOS_X                         N6PF.                               
      @597    MDNUM1_R                      N9PF.                               
      @606    MDNUM2_R                      N9PF.                               
      @615    MDNUM3_R                      N9PF.                               
      @624    MEDINCSTQ                     N2PF.                               
      @626    NCPT                          N4PF.                               
      @630    OFFSITE_ED_X                  $CHAR1.                             
      @631    OPservice                     $CHAR2.                             
      @633    PAY1                          N2PF.                               
      @635    PAY1_X                        $CHAR1.                             
      @636    PL_CBSA                       N3PF.                               
      @639    PL_NCHS                       N2PF.                               
      @641    PL_RUCC                       N2PF.                               
      @643    PL_UIC                        N2PF.                               
      @645    PL_UR_CAT4                    N2PF.                               
      @647    PointOfOrigin_X               $CHAR2.                             
      @649    PointOfOriginUB04             $CHAR1.                             
      @650    PRVER                         N3PF.                               
      @653    PSTATE                        $CHAR2.                             
      @655    PSTCO2                        N5PF.                               
      @660    RACE                          N2PF.                               
      @662    RACE_X                        $CHAR1.                             
      @663    STATE_AS                      N2PF.                               
      @665    STATE_ED                      N2PF.                               
      @667    STATE_OS                      N2PF.                               
      @669    TOTCHG                        N10PF.                              
      @679    TOTCHG_X                      N15P2F.                             
      @694    VisitLink                     N9PF.                               
      @703    YEAR                          N4PF.                               
      @707    ZIP                           $CHAR5.                             
      @712    ZIP3                          $CHAR3.                             
      @715    ZIPINC_QRTL                   N3PF.                               
      @718    AYEAR                         N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
