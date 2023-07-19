/*******************************************************************            
* Creation Date: 02/02/2018                                                     
*   MD_SEDD_2015q4_DX_PR_GRPS.SAS:                                              
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      OUTPATIENT SEDD DX_PR_GRPS FILE INTO SAS                                 
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
DATA MD_SEDDC_2015q4_DX_PR_GRPS;                                                
INFILE 'MD_SEDD_2015q4_DX_PR_GRPS.ASC' FIRSTOBS=3 LRECL = 624;                  
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  I10_BODYSYSTEM1            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 1"                                               
                                                                                
  I10_BODYSYSTEM2            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 2"                                               
                                                                                
  I10_BODYSYSTEM3            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 3"                                               
                                                                                
  I10_BODYSYSTEM4            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 4"                                               
                                                                                
  I10_BODYSYSTEM5            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 5"                                               
                                                                                
  I10_BODYSYSTEM6            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 6"                                               
                                                                                
  I10_BODYSYSTEM7            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 7"                                               
                                                                                
  I10_BODYSYSTEM8            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 8"                                               
                                                                                
  I10_BODYSYSTEM9            LENGTH=3                                           
  LABEL="ICD-10-CM Body system 9"                                               
                                                                                
  I10_BODYSYSTEM10           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 10"                                              
                                                                                
  I10_BODYSYSTEM11           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 11"                                              
                                                                                
  I10_BODYSYSTEM12           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 12"                                              
                                                                                
  I10_BODYSYSTEM13           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 13"                                              
                                                                                
  I10_BODYSYSTEM14           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 14"                                              
                                                                                
  I10_BODYSYSTEM15           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 15"                                              
                                                                                
  I10_BODYSYSTEM16           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 16"                                              
                                                                                
  I10_BODYSYSTEM17           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 17"                                              
                                                                                
  I10_BODYSYSTEM18           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 18"                                              
                                                                                
  I10_BODYSYSTEM19           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 19"                                              
                                                                                
  I10_BODYSYSTEM20           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 20"                                              
                                                                                
  I10_BODYSYSTEM21           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 21"                                              
                                                                                
  I10_BODYSYSTEM22           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 22"                                              
                                                                                
  I10_BODYSYSTEM23           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 23"                                              
                                                                                
  I10_BODYSYSTEM24           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 24"                                              
                                                                                
  I10_BODYSYSTEM25           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 25"                                              
                                                                                
  I10_BODYSYSTEM26           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 26"                                              
                                                                                
  I10_BODYSYSTEM27           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 27"                                              
                                                                                
  I10_BODYSYSTEM28           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 28"                                              
                                                                                
  I10_BODYSYSTEM29           LENGTH=3                                           
  LABEL="ICD-10-CM Body system 29"                                              
                                                                                
  I10_CHRON1                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 1"                               
                                                                                
  I10_CHRON2                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 2"                               
                                                                                
  I10_CHRON3                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 3"                               
                                                                                
  I10_CHRON4                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 4"                               
                                                                                
  I10_CHRON5                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 5"                               
                                                                                
  I10_CHRON6                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 6"                               
                                                                                
  I10_CHRON7                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 7"                               
                                                                                
  I10_CHRON8                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 8"                               
                                                                                
  I10_CHRON9                 LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 9"                               
                                                                                
  I10_CHRON10                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 10"                              
                                                                                
  I10_CHRON11                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 11"                              
                                                                                
  I10_CHRON12                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 12"                              
                                                                                
  I10_CHRON13                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 13"                              
                                                                                
  I10_CHRON14                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 14"                              
                                                                                
  I10_CHRON15                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 15"                              
                                                                                
  I10_CHRON16                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 16"                              
                                                                                
  I10_CHRON17                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 17"                              
                                                                                
  I10_CHRON18                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 18"                              
                                                                                
  I10_CHRON19                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 19"                              
                                                                                
  I10_CHRON20                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 20"                              
                                                                                
  I10_CHRON21                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 21"                              
                                                                                
  I10_CHRON22                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 22"                              
                                                                                
  I10_CHRON23                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 23"                              
                                                                                
  I10_CHRON24                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 24"                              
                                                                                
  I10_CHRON25                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 25"                              
                                                                                
  I10_CHRON26                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 26"                              
                                                                                
  I10_CHRON27                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 27"                              
                                                                                
  I10_CHRON28                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 28"                              
                                                                                
  I10_CHRON29                LENGTH=3                                           
  LABEL="ICD-10-CM Chronic condition indicator 29"                              
                                                                                
  I10_DXMCCS1                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 1"                               
                                                                                
  I10_DXMCCS2                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 2"                               
                                                                                
  I10_DXMCCS3                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 3"                               
                                                                                
  I10_DXMCCS4                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 4"                               
                                                                                
  I10_DXMCCS5                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 5"                               
                                                                                
  I10_DXMCCS6                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 6"                               
                                                                                
  I10_DXMCCS7                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 7"                               
                                                                                
  I10_DXMCCS8                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 8"                               
                                                                                
  I10_DXMCCS9                LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 9"                               
                                                                                
  I10_DXMCCS10               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 10"                              
                                                                                
  I10_DXMCCS11               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 11"                              
                                                                                
  I10_DXMCCS12               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 12"                              
                                                                                
  I10_DXMCCS13               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 13"                              
                                                                                
  I10_DXMCCS14               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 14"                              
                                                                                
  I10_DXMCCS15               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 15"                              
                                                                                
  I10_DXMCCS16               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 16"                              
                                                                                
  I10_DXMCCS17               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 17"                              
                                                                                
  I10_DXMCCS18               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 18"                              
                                                                                
  I10_DXMCCS19               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 19"                              
                                                                                
  I10_DXMCCS20               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 20"                              
                                                                                
  I10_DXMCCS21               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 21"                              
                                                                                
  I10_DXMCCS22               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 22"                              
                                                                                
  I10_DXMCCS23               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 23"                              
                                                                                
  I10_DXMCCS24               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 24"                              
                                                                                
  I10_DXMCCS25               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 25"                              
                                                                                
  I10_DXMCCS26               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 26"                              
                                                                                
  I10_DXMCCS27               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 27"                              
                                                                                
  I10_DXMCCS28               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 28"                              
                                                                                
  I10_DXMCCS29               LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  Diagnosis 29"                              
                                                                                
  I10_ECauseMCCS1            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 1"                                 
                                                                                
  I10_ECauseMCCS2            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 2"                                 
                                                                                
  I10_ECauseMCCS3            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 3"                                 
                                                                                
  I10_ECauseMCCS4            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 4"                                 
                                                                                
  I10_ECauseMCCS5            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 5"                                 
                                                                                
  I10_ECauseMCCS6            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 6"                                 
                                                                                
  I10_ECauseMCCS7            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 7"                                 
                                                                                
  I10_ECauseMCCS8            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 8"                                 
                                                                                
  I10_ECauseMCCS9            LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 9"                                 
                                                                                
  I10_ECauseMCCS10           LENGTH=$11                                         
  LABEL="ICD-10-CM Multi-Level CCS:  E Cause 10"                                
                                                                                
  I10_INJURY                 LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"ICD-10-CM Injury diagnosis reported on record (1:I10_DX1 is an injury; 2:I10_DX
2+ is an injury; 0:No injury)"                                                  
                                                                                
  I10_MULTINJURY             LENGTH=3                                           
  LABEL="ICD-10-CM More than one injury diagnosis reported on record"           
                                                                                
  I10_U_BLOOD                LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Blood"                                    
                                                                                
  I10_U_CATH                 LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Cardiac Catheterization Lab"              
                                                                                
  I10_U_CTSCAN               LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Computed Tomography Scan"                 
                                                                                
  I10_U_EKG                  LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Electrocardiogram"                        
                                                                                
  I10_U_MHSA                 LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Mental Health and Substance Abuse"        
                                                                                
  I10_U_MRT                  LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Magnetic Resonance Technology"            
                                                                                
  I10_U_PACEMAKER            LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Pacemaker"                                
                                                                                
  I10_U_PHYTHERAPY           LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Physical Therapy"                         
                                                                                
  I10_U_RADTHERAPY           LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"ICD-10-PCS Utilization Flag: Radiology - Therapeutic and/or Chemotherapy Admini
stration"                                                                       
                                                                                
  I10_U_STRESS               LENGTH=3                                           
  LABEL="ICD-10-PCS Utilization Flag: Cardiac Stress Test"                      
                                                                                
  KEY                        LENGTH=8                      FORMAT=Z15.          
  LABEL="HCUP record identifier"                                                
                                                                                
  U_CCU                      LENGTH=3                                           
  LABEL="Utilization Flag: Coronary Care Unit (CCU)"                            
                                                                                
  U_CHESTXRAY                LENGTH=3                                           
  LABEL="Utilization Flag: Chest X-Ray"                                         
                                                                                
  U_DIALYSIS                 LENGTH=3                                           
  LABEL="Utilization Flag: Renal Dialysis"                                      
                                                                                
  U_ECHO                     LENGTH=3                                           
  LABEL="Utilization Flag: Echocardiology"                                      
                                                                                
  U_ED                       LENGTH=3                                           
  LABEL="Utilization Flag: Emergency Room"                                      
                                                                                
  U_EEG                      LENGTH=3                                           
  LABEL="Utilization Flag: Electroencephalogram"                                
                                                                                
  U_EPO                      LENGTH=3                                           
  LABEL="Utilization Flag: EPO"                                                 
                                                                                
  U_ICU                      LENGTH=3                                           
  LABEL="Utilization Flag: Intensive Care Unit (ICU)"                           
                                                                                
  U_LITHOTRIPSY              LENGTH=3                                           
  LABEL="Utilization Flag: Lithotripsy"                                         
                                                                                
  U_NEWBN2L                  LENGTH=3                                           
  LABEL="Utilization Flag: Nursery Level II"                                    
                                                                                
  U_NEWBN3L                  LENGTH=3                                           
  LABEL="Utilization Flag: Nursery Level III"                                   
                                                                                
  U_NEWBN4L                  LENGTH=3                                           
  LABEL="Utilization Flag: Nursery Level IV"                                    
                                                                                
  U_NUCMED                   LENGTH=3                                           
  LABEL="Utilization Flag: Nuclear Medicine"                                    
                                                                                
  U_OBSERVATION              LENGTH=3                                           
  LABEL="Utilization Flag: Observation Room"                                    
                                                                                
  U_OCCTHERAPY               LENGTH=3                                           
  LABEL="Utilization Flag: Occupational Therapy"                                
                                                                                
  U_ORGANACQ                 LENGTH=3                                           
  LABEL="Utilization Flag: Organ Acquisition"                                   
                                                                                
  U_OTHIMPLANTS              LENGTH=3                                           
  LABEL="Utilization Flag: Other Implants"                                      
                                                                                
  U_RESPTHERAPY              LENGTH=3                                           
  LABEL="Utilization Flag: Respiratory Services"                                
                                                                                
  U_SPEECHTHERAPY            LENGTH=3                                           
  LABEL="Utilization Flag: Speech - Language Pathology"                         
                                                                                
  U_ULTRASOUND               LENGTH=3                                           
  LABEL="Utilization Flag: Ultrasound"                                          
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      I10_BODYSYSTEM1               N2PF.                               
      @3      I10_BODYSYSTEM2               N2PF.                               
      @5      I10_BODYSYSTEM3               N2PF.                               
      @7      I10_BODYSYSTEM4               N2PF.                               
      @9      I10_BODYSYSTEM5               N2PF.                               
      @11     I10_BODYSYSTEM6               N2PF.                               
      @13     I10_BODYSYSTEM7               N2PF.                               
      @15     I10_BODYSYSTEM8               N2PF.                               
      @17     I10_BODYSYSTEM9               N2PF.                               
      @19     I10_BODYSYSTEM10              N2PF.                               
      @21     I10_BODYSYSTEM11              N2PF.                               
      @23     I10_BODYSYSTEM12              N2PF.                               
      @25     I10_BODYSYSTEM13              N2PF.                               
      @27     I10_BODYSYSTEM14              N2PF.                               
      @29     I10_BODYSYSTEM15              N2PF.                               
      @31     I10_BODYSYSTEM16              N2PF.                               
      @33     I10_BODYSYSTEM17              N2PF.                               
      @35     I10_BODYSYSTEM18              N2PF.                               
      @37     I10_BODYSYSTEM19              N2PF.                               
      @39     I10_BODYSYSTEM20              N2PF.                               
      @41     I10_BODYSYSTEM21              N2PF.                               
      @43     I10_BODYSYSTEM22              N2PF.                               
      @45     I10_BODYSYSTEM23              N2PF.                               
      @47     I10_BODYSYSTEM24              N2PF.                               
      @49     I10_BODYSYSTEM25              N2PF.                               
      @51     I10_BODYSYSTEM26              N2PF.                               
      @53     I10_BODYSYSTEM27              N2PF.                               
      @55     I10_BODYSYSTEM28              N2PF.                               
      @57     I10_BODYSYSTEM29              N2PF.                               
      @59     I10_CHRON1                    N2PF.                               
      @61     I10_CHRON2                    N2PF.                               
      @63     I10_CHRON3                    N2PF.                               
      @65     I10_CHRON4                    N2PF.                               
      @67     I10_CHRON5                    N2PF.                               
      @69     I10_CHRON6                    N2PF.                               
      @71     I10_CHRON7                    N2PF.                               
      @73     I10_CHRON8                    N2PF.                               
      @75     I10_CHRON9                    N2PF.                               
      @77     I10_CHRON10                   N2PF.                               
      @79     I10_CHRON11                   N2PF.                               
      @81     I10_CHRON12                   N2PF.                               
      @83     I10_CHRON13                   N2PF.                               
      @85     I10_CHRON14                   N2PF.                               
      @87     I10_CHRON15                   N2PF.                               
      @89     I10_CHRON16                   N2PF.                               
      @91     I10_CHRON17                   N2PF.                               
      @93     I10_CHRON18                   N2PF.                               
      @95     I10_CHRON19                   N2PF.                               
      @97     I10_CHRON20                   N2PF.                               
      @99     I10_CHRON21                   N2PF.                               
      @101    I10_CHRON22                   N2PF.                               
      @103    I10_CHRON23                   N2PF.                               
      @105    I10_CHRON24                   N2PF.                               
      @107    I10_CHRON25                   N2PF.                               
      @109    I10_CHRON26                   N2PF.                               
      @111    I10_CHRON27                   N2PF.                               
      @113    I10_CHRON28                   N2PF.                               
      @115    I10_CHRON29                   N2PF.                               
      @117    I10_DXMCCS1                   $CHAR11.                            
      @128    I10_DXMCCS2                   $CHAR11.                            
      @139    I10_DXMCCS3                   $CHAR11.                            
      @150    I10_DXMCCS4                   $CHAR11.                            
      @161    I10_DXMCCS5                   $CHAR11.                            
      @172    I10_DXMCCS6                   $CHAR11.                            
      @183    I10_DXMCCS7                   $CHAR11.                            
      @194    I10_DXMCCS8                   $CHAR11.                            
      @205    I10_DXMCCS9                   $CHAR11.                            
      @216    I10_DXMCCS10                  $CHAR11.                            
      @227    I10_DXMCCS11                  $CHAR11.                            
      @238    I10_DXMCCS12                  $CHAR11.                            
      @249    I10_DXMCCS13                  $CHAR11.                            
      @260    I10_DXMCCS14                  $CHAR11.                            
      @271    I10_DXMCCS15                  $CHAR11.                            
      @282    I10_DXMCCS16                  $CHAR11.                            
      @293    I10_DXMCCS17                  $CHAR11.                            
      @304    I10_DXMCCS18                  $CHAR11.                            
      @315    I10_DXMCCS19                  $CHAR11.                            
      @326    I10_DXMCCS20                  $CHAR11.                            
      @337    I10_DXMCCS21                  $CHAR11.                            
      @348    I10_DXMCCS22                  $CHAR11.                            
      @359    I10_DXMCCS23                  $CHAR11.                            
      @370    I10_DXMCCS24                  $CHAR11.                            
      @381    I10_DXMCCS25                  $CHAR11.                            
      @392    I10_DXMCCS26                  $CHAR11.                            
      @403    I10_DXMCCS27                  $CHAR11.                            
      @414    I10_DXMCCS28                  $CHAR11.                            
      @425    I10_DXMCCS29                  $CHAR11.                            
      @436    I10_ECauseMCCS1               $CHAR11.                            
      @447    I10_ECauseMCCS2               $CHAR11.                            
      @458    I10_ECauseMCCS3               $CHAR11.                            
      @469    I10_ECauseMCCS4               $CHAR11.                            
      @480    I10_ECauseMCCS5               $CHAR11.                            
      @491    I10_ECauseMCCS6               $CHAR11.                            
      @502    I10_ECauseMCCS7               $CHAR11.                            
      @513    I10_ECauseMCCS8               $CHAR11.                            
      @524    I10_ECauseMCCS9               $CHAR11.                            
      @535    I10_ECauseMCCS10              $CHAR11.                            
      @546    I10_INJURY                    N2PF.                               
      @548    I10_MULTINJURY                N2PF.                               
      @550    I10_U_BLOOD                   N2PF.                               
      @552    I10_U_CATH                    N2PF.                               
      @554    I10_U_CTSCAN                  N2PF.                               
      @556    I10_U_EKG                     N2PF.                               
      @558    I10_U_MHSA                    N2PF.                               
      @560    I10_U_MRT                     N2PF.                               
      @562    I10_U_PACEMAKER               N2PF.                               
      @564    I10_U_PHYTHERAPY              N2PF.                               
      @566    I10_U_RADTHERAPY              N2PF.                               
      @568    I10_U_STRESS                  N2PF.                               
      @570    KEY                           15.                                 
      @585    U_CCU                         N2PF.                               
      @587    U_CHESTXRAY                   N2PF.                               
      @589    U_DIALYSIS                    N2PF.                               
      @591    U_ECHO                        N2PF.                               
      @593    U_ED                          N2PF.                               
      @595    U_EEG                         N2PF.                               
      @597    U_EPO                         N2PF.                               
      @599    U_ICU                         N2PF.                               
      @601    U_LITHOTRIPSY                 N2PF.                               
      @603    U_NEWBN2L                     N2PF.                               
      @605    U_NEWBN3L                     N2PF.                               
      @607    U_NEWBN4L                     N2PF.                               
      @609    U_NUCMED                      N2PF.                               
      @611    U_OBSERVATION                 N2PF.                               
      @613    U_OCCTHERAPY                  N2PF.                               
      @615    U_ORGANACQ                    N2PF.                               
      @617    U_OTHIMPLANTS                 N2PF.                               
      @619    U_RESPTHERAPY                 N2PF.                               
      @621    U_SPEECHTHERAPY               N2PF.                               
      @623    U_ULTRASOUND                  N2PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
