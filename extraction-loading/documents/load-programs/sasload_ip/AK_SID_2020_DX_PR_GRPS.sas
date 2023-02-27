/*******************************************************************            
* Creation Date: 02/16/2022                                                     
*   AK_SID_2020_DX_PR_GRPS.SAS:                                                 
*      THE SAS CODE SHOWN BELOW WILL LOAD THE ASCII                             
*      INPATIENT STAY DX_PR_GRPS FILE INTO SAS                                  
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
DATA AK_SIDC_2020_DX_PR_GRPS;                                                   
INFILE 'AK_SID_2020_DX_PR_GRPS.ASC' FIRSTOBS=3 LRECL = 2813;                    
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  CMR_AIDS                   LENGTH=3                                           
  LABEL="Acquired immune deficiency syndrome"                                   
                                                                                
  CMR_ALCOHOL                LENGTH=3                                           
  LABEL="Alcohol abuse"                                                         
                                                                                
  CMR_ANEMDEF                LENGTH=3                                           
  LABEL="Deficiency anemias"                                                    
                                                                                
  CMR_ARTH                   LENGTH=3                                           
  LABEL="Arthropathies"                                                         
                                                                                
  CMR_BLDLOSS                LENGTH=3                                           
  LABEL="Chronic blood loss anemia"                                             
                                                                                
  CMR_CANCER_LEUK            LENGTH=3                                           
  LABEL="Leukemia"                                                              
                                                                                
  CMR_CANCER_LYMPH           LENGTH=3                                           
  LABEL="Lymphoma"                                                              
                                                                                
  CMR_CANCER_METS            LENGTH=3                                           
  LABEL="Metastatic cancer"                                                     
                                                                                
  CMR_CANCER_NSITU           LENGTH=3                                           
  LABEL="Solid tumor without metastasis, in situ"                               
                                                                                
  CMR_CANCER_SOLID           LENGTH=3                                           
  LABEL="Solid tumor without metastasis, malignant"                             
                                                                                
  CMR_CBVD                   LENGTH=3                                           
  LABEL="Cerebrovascular disease"                                               
                                                                                
  CMR_CHF                    LENGTH=3                                           
  LABEL="Congestive heart failure"                                              
                                                                                
  CMR_COAG                   LENGTH=3                                           
  LABEL="Coagulopathy"                                                          
                                                                                
  CMR_DEMENTIA               LENGTH=3                                           
  LABEL="Dementia"                                                              
                                                                                
  CMR_DEPRESS                LENGTH=3                                           
  LABEL="Depression"                                                            
                                                                                
  CMR_DIAB_CX                LENGTH=3                                           
  LABEL="Diabetes with chronic complications"                                   
                                                                                
  CMR_DIAB_UNCX              LENGTH=3                                           
  LABEL="Diabetes without chronic complications"                                
                                                                                
  CMR_DRUG_ABUSE             LENGTH=3                                           
  LABEL="Drug abuse"                                                            
                                                                                
  CMR_HTN_CX                 LENGTH=3                                           
  LABEL="Hypertension, complicated"                                             
                                                                                
  CMR_HTN_UNCX               LENGTH=3                                           
  LABEL="Hypertension, uncomplicated"                                           
                                                                                
  CMR_LIVER_MLD              LENGTH=3                                           
  LABEL="Liver disease, mild"                                                   
                                                                                
  CMR_LIVER_SEV              LENGTH=3                                           
  LABEL="Liver disease, moderate to severe"                                     
                                                                                
  CMR_LUNG_CHRONIC           LENGTH=3                                           
  LABEL="Chronic pulmonary disease"                                             
                                                                                
  CMR_NEURO_MOVT             LENGTH=3                                           
  LABEL="Neurological disorders affecting movement"                             
                                                                                
  CMR_NEURO_OTH              LENGTH=3                                           
  LABEL="Other neurological disorders"                                          
                                                                                
  CMR_NEURO_SEIZ             LENGTH=3                                           
  LABEL="Seizures and epilepsy"                                                 
                                                                                
  CMR_OBESE                  LENGTH=3                                           
  LABEL="Obesity"                                                               
                                                                                
  CMR_PARALYSIS              LENGTH=3                                           
  LABEL="Paralysis"                                                             
                                                                                
  CMR_PERIVASC               LENGTH=3                                           
  LABEL="Peripheral vascular disease"                                           
                                                                                
  CMR_PSYCHOSES              LENGTH=3                                           
  LABEL="Psychoses"                                                             
                                                                                
  CMR_PULMCIRC               LENGTH=3                                           
  LABEL="Pulmonary circulation disease"                                         
                                                                                
  CMR_RENLFL_MOD             LENGTH=3                                           
  LABEL="Renal failure, moderate"                                               
                                                                                
  CMR_RENLFL_SEV             LENGTH=3                                           
  LABEL="Renal failure, severe"                                                 
                                                                                
  CMR_THYROID_HYPO           LENGTH=3                                           
  LABEL="Hypothyroidism"                                                        
                                                                                
  CMR_THYROID_OTH            LENGTH=3                                           
  LABEL="Other thyroid disorders"                                               
                                                                                
  CMR_ULCER_PEPTIC           LENGTH=3                                           
  LABEL="Peptic ulcer disease x bleeding"                                       
                                                                                
  CMR_VALVE                  LENGTH=3                                           
  LABEL="Valvular disease"                                                      
                                                                                
  CMR_VERSION                LENGTH=$6                                          
  LABEL="Version of Elixhauser Comorbidity Software Refined for ICD-10-CM"      
                                                                                
  CMR_WGHTLOSS               LENGTH=3                                           
  LABEL="Weight loss"                                                           
                                                                                
  I10_INJURY                 LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Injury ICD-10-CM diagnosis reported on record (1: First-listed injury; 2: Other
 than first-listed injury; 0: No injury)"                                       
                                                                                
  I10_INJURY_CUT             LENGTH=3                                           
  LABEL="Mechanism of injury: cut or pierce"                                    
                                                                                
  I10_INJURY_DROWN           LENGTH=3                                           
  LABEL="Mechanism of injury: drowning or submersion"                           
                                                                                
  I10_INJURY_FALL            LENGTH=3                                           
  LABEL="Mechanism of injury: fall"                                             
                                                                                
  I10_INJURY_FIRE            LENGTH=3                                           
  LABEL="Mechanism of injury: fire, flame, hot object, or hot substance"        
                                                                                
  I10_INJURY_FIREARM         LENGTH=3                                           
  LABEL="Mechanism of injury: firearm"                                          
                                                                                
  I10_INJURY_MACHINERY       LENGTH=3                                           
  LABEL="Mechanism of injury: machinery"                                        
                                                                                
  I10_INJURY_MVT             LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Mechanism of injury: motor vehicle traffic, including the occupant of a car, mo
torcyclist, pedal cyclist, pedestrian, other, or unspecified"                   
                                                                                
  I10_INJURY_NATURE          LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Mechanism of injury: natural or environmental, included venomous and nonvenomou
s bites and stings"                                                             
                                                                                
  I10_INJURY_OVEREXERTION    LENGTH=3                                           
  LABEL="Mechanism of injury: overexertion"                                     
                                                                                
  I10_INJURY_POISON          LENGTH=3                                           
  LABEL="Mechanism of injury: poisoning, including drugs and nondrugs"          
                                                                                
  I10_INJURY_STRUCK          LENGTH=3                                           
  LABEL="Mechanism of injury: struck by or against"                             
                                                                                
  I10_INJURY_SUFFOCATION     LENGTH=3                                           
  LABEL="Mechanism of injury: suffocation"                                      
                                                                                
  I10_INTENT_ASSAULT         LENGTH=3                                           
  LABEL="Intent of injury: assault"                                             
                                                                                
  I10_INTENT_SELF_HARM       LENGTH=3                                           
  LABEL="Intent of injury: intentional self-harm"                               
                                                                                
  I10_INTENT_UNINTENTIONAL   LENGTH=3                                           
  LABEL="Intent of injury: unintentional"                                       
                                                                                
  I10_MULTINJURY             LENGTH=3                                           
  LABEL="Multiple ICD-10-CM injuries reported on record"                        
                                                                                
  KEY                        LENGTH=8                      FORMAT=Z15.          
  LABEL="HCUP record identifier"                                                
                                                                                
  PCLASS_VERSION             LENGTH=$6                                          
  LABEL="Version of ICD-10-PCS Procedure class"                                 
                                                                                
  PCLASS1                    LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 1"                                          
                                                                                
  PCLASS2                    LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 2"                                          
                                                                                
  PCLASS3                    LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 3"                                          
                                                                                
  PCLASS4                    LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 4"                                          
                                                                                
  PCLASS5                    LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 5"                                          
                                                                                
  PCLASS6                    LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 6"                                          
                                                                                
  PCLASS7                    LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 7"                                          
                                                                                
  PCLASS8                    LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 8"                                          
                                                                                
  PCLASS9                    LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 9"                                          
                                                                                
  PCLASS10                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 10"                                         
                                                                                
  PCLASS11                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 11"                                         
                                                                                
  PCLASS12                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 12"                                         
                                                                                
  PCLASS13                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 13"                                         
                                                                                
  PCLASS14                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 14"                                         
                                                                                
  PCLASS15                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 15"                                         
                                                                                
  PCLASS16                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 16"                                         
                                                                                
  PCLASS17                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 17"                                         
                                                                                
  PCLASS18                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 18"                                         
                                                                                
  PCLASS19                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 19"                                         
                                                                                
  PCLASS20                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 20"                                         
                                                                                
  PCLASS21                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 21"                                         
                                                                                
  PCLASS22                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 22"                                         
                                                                                
  PCLASS23                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 23"                                         
                                                                                
  PCLASS24                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 24"                                         
                                                                                
  PCLASS25                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 25"                                         
                                                                                
  PCLASS26                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 26"                                         
                                                                                
  PCLASS27                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 27"                                         
                                                                                
  PCLASS28                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 28"                                         
                                                                                
  PCLASS29                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 29"                                         
                                                                                
  PCLASS30                   LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure class 30"                                         
                                                                                
  DXCCSR_Default_DX1         LENGTH=$6                                          
  LABEL="Default CCSR for principal/first-listed ICD-10-CM diagnosis"           
                                                                                
  DXCCSR_BLD001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR BLD001"                                                                     
                                                                                
  DXCCSR_BLD002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR BLD002"                                                                     
                                                                                
  DXCCSR_BLD003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR BLD003"                                                                     
                                                                                
  DXCCSR_BLD004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR BLD004"                                                                     
                                                                                
  DXCCSR_BLD005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR BLD005"                                                                     
                                                                                
  DXCCSR_BLD006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR BLD006"                                                                     
                                                                                
  DXCCSR_BLD007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR BLD007"                                                                     
                                                                                
  DXCCSR_BLD008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR BLD008"                                                                     
                                                                                
  DXCCSR_BLD009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR BLD009"                                                                     
                                                                                
  DXCCSR_BLD010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR BLD010"                                                                     
                                                                                
  DXCCSR_CIR001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR001"                                                                     
                                                                                
  DXCCSR_CIR002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR002"                                                                     
                                                                                
  DXCCSR_CIR003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR003"                                                                     
                                                                                
  DXCCSR_CIR004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR004"                                                                     
                                                                                
  DXCCSR_CIR005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR005"                                                                     
                                                                                
  DXCCSR_CIR006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR006"                                                                     
                                                                                
  DXCCSR_CIR007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR007"                                                                     
                                                                                
  DXCCSR_CIR008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR008"                                                                     
                                                                                
  DXCCSR_CIR009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR009"                                                                     
                                                                                
  DXCCSR_CIR010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR010"                                                                     
                                                                                
  DXCCSR_CIR011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR011"                                                                     
                                                                                
  DXCCSR_CIR012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR012"                                                                     
                                                                                
  DXCCSR_CIR013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR013"                                                                     
                                                                                
  DXCCSR_CIR014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR014"                                                                     
                                                                                
  DXCCSR_CIR015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR015"                                                                     
                                                                                
  DXCCSR_CIR016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR016"                                                                     
                                                                                
  DXCCSR_CIR017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR017"                                                                     
                                                                                
  DXCCSR_CIR018              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR018"                                                                     
                                                                                
  DXCCSR_CIR019              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR019"                                                                     
                                                                                
  DXCCSR_CIR020              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR020"                                                                     
                                                                                
  DXCCSR_CIR021              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR021"                                                                     
                                                                                
  DXCCSR_CIR022              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR022"                                                                     
                                                                                
  DXCCSR_CIR023              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR023"                                                                     
                                                                                
  DXCCSR_CIR024              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR024"                                                                     
                                                                                
  DXCCSR_CIR025              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR025"                                                                     
                                                                                
  DXCCSR_CIR026              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR026"                                                                     
                                                                                
  DXCCSR_CIR027              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR027"                                                                     
                                                                                
  DXCCSR_CIR028              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR028"                                                                     
                                                                                
  DXCCSR_CIR029              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR029"                                                                     
                                                                                
  DXCCSR_CIR030              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR030"                                                                     
                                                                                
  DXCCSR_CIR031              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR031"                                                                     
                                                                                
  DXCCSR_CIR032              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR032"                                                                     
                                                                                
  DXCCSR_CIR033              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR033"                                                                     
                                                                                
  DXCCSR_CIR034              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR034"                                                                     
                                                                                
  DXCCSR_CIR035              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR035"                                                                     
                                                                                
  DXCCSR_CIR036              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR036"                                                                     
                                                                                
  DXCCSR_CIR037              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR037"                                                                     
                                                                                
  DXCCSR_CIR038              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR038"                                                                     
                                                                                
  DXCCSR_CIR039              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR CIR039"                                                                     
                                                                                
  DXCCSR_DIG001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG001"                                                                     
                                                                                
  DXCCSR_DIG002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG002"                                                                     
                                                                                
  DXCCSR_DIG003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG003"                                                                     
                                                                                
  DXCCSR_DIG004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG004"                                                                     
                                                                                
  DXCCSR_DIG005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG005"                                                                     
                                                                                
  DXCCSR_DIG006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG006"                                                                     
                                                                                
  DXCCSR_DIG007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG007"                                                                     
                                                                                
  DXCCSR_DIG008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG008"                                                                     
                                                                                
  DXCCSR_DIG009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG009"                                                                     
                                                                                
  DXCCSR_DIG010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG010"                                                                     
                                                                                
  DXCCSR_DIG011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG011"                                                                     
                                                                                
  DXCCSR_DIG012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG012"                                                                     
                                                                                
  DXCCSR_DIG013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG013"                                                                     
                                                                                
  DXCCSR_DIG014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG014"                                                                     
                                                                                
  DXCCSR_DIG015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG015"                                                                     
                                                                                
  DXCCSR_DIG016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG016"                                                                     
                                                                                
  DXCCSR_DIG017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG017"                                                                     
                                                                                
  DXCCSR_DIG018              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG018"                                                                     
                                                                                
  DXCCSR_DIG019              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG019"                                                                     
                                                                                
  DXCCSR_DIG020              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG020"                                                                     
                                                                                
  DXCCSR_DIG021              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG021"                                                                     
                                                                                
  DXCCSR_DIG022              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG022"                                                                     
                                                                                
  DXCCSR_DIG023              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG023"                                                                     
                                                                                
  DXCCSR_DIG024              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG024"                                                                     
                                                                                
  DXCCSR_DIG025              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR DIG025"                                                                     
                                                                                
  DXCCSR_EAR001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EAR001"                                                                     
                                                                                
  DXCCSR_EAR002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EAR002"                                                                     
                                                                                
  DXCCSR_EAR003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EAR003"                                                                     
                                                                                
  DXCCSR_EAR004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EAR004"                                                                     
                                                                                
  DXCCSR_EAR005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EAR005"                                                                     
                                                                                
  DXCCSR_EAR006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EAR006"                                                                     
                                                                                
  DXCCSR_END001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END001"                                                                     
                                                                                
  DXCCSR_END002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END002"                                                                     
                                                                                
  DXCCSR_END003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END003"                                                                     
                                                                                
  DXCCSR_END004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END004"                                                                     
                                                                                
  DXCCSR_END005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END005"                                                                     
                                                                                
  DXCCSR_END006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END006"                                                                     
                                                                                
  DXCCSR_END007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END007"                                                                     
                                                                                
  DXCCSR_END008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END008"                                                                     
                                                                                
  DXCCSR_END009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END009"                                                                     
                                                                                
  DXCCSR_END010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END010"                                                                     
                                                                                
  DXCCSR_END011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END011"                                                                     
                                                                                
  DXCCSR_END012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END012"                                                                     
                                                                                
  DXCCSR_END013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END013"                                                                     
                                                                                
  DXCCSR_END014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END014"                                                                     
                                                                                
  DXCCSR_END015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END015"                                                                     
                                                                                
  DXCCSR_END016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END016"                                                                     
                                                                                
  DXCCSR_END017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR END017"                                                                     
                                                                                
  DXCCSR_EXT001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT001"                                                                     
                                                                                
  DXCCSR_EXT002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT002"                                                                     
                                                                                
  DXCCSR_EXT003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT003"                                                                     
                                                                                
  DXCCSR_EXT004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT004"                                                                     
                                                                                
  DXCCSR_EXT005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT005"                                                                     
                                                                                
  DXCCSR_EXT006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT006"                                                                     
                                                                                
  DXCCSR_EXT007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT007"                                                                     
                                                                                
  DXCCSR_EXT008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT008"                                                                     
                                                                                
  DXCCSR_EXT009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT009"                                                                     
                                                                                
  DXCCSR_EXT010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT010"                                                                     
                                                                                
  DXCCSR_EXT011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT011"                                                                     
                                                                                
  DXCCSR_EXT012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT012"                                                                     
                                                                                
  DXCCSR_EXT013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT013"                                                                     
                                                                                
  DXCCSR_EXT014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT014"                                                                     
                                                                                
  DXCCSR_EXT015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT015"                                                                     
                                                                                
  DXCCSR_EXT016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT016"                                                                     
                                                                                
  DXCCSR_EXT017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT017"                                                                     
                                                                                
  DXCCSR_EXT018              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT018"                                                                     
                                                                                
  DXCCSR_EXT019              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT019"                                                                     
                                                                                
  DXCCSR_EXT020              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT020"                                                                     
                                                                                
  DXCCSR_EXT021              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT021"                                                                     
                                                                                
  DXCCSR_EXT022              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT022"                                                                     
                                                                                
  DXCCSR_EXT023              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT023"                                                                     
                                                                                
  DXCCSR_EXT024              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT024"                                                                     
                                                                                
  DXCCSR_EXT025              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT025"                                                                     
                                                                                
  DXCCSR_EXT026              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT026"                                                                     
                                                                                
  DXCCSR_EXT027              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT027"                                                                     
                                                                                
  DXCCSR_EXT028              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT028"                                                                     
                                                                                
  DXCCSR_EXT029              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT029"                                                                     
                                                                                
  DXCCSR_EXT030              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EXT030"                                                                     
                                                                                
  DXCCSR_EYE001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EYE001"                                                                     
                                                                                
  DXCCSR_EYE002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EYE002"                                                                     
                                                                                
  DXCCSR_EYE003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EYE003"                                                                     
                                                                                
  DXCCSR_EYE004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EYE004"                                                                     
                                                                                
  DXCCSR_EYE005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EYE005"                                                                     
                                                                                
  DXCCSR_EYE006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EYE006"                                                                     
                                                                                
  DXCCSR_EYE007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EYE007"                                                                     
                                                                                
  DXCCSR_EYE008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EYE008"                                                                     
                                                                                
  DXCCSR_EYE009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EYE009"                                                                     
                                                                                
  DXCCSR_EYE010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EYE010"                                                                     
                                                                                
  DXCCSR_EYE011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EYE011"                                                                     
                                                                                
  DXCCSR_EYE012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR EYE012"                                                                     
                                                                                
  DXCCSR_FAC001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC001"                                                                     
                                                                                
  DXCCSR_FAC002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC002"                                                                     
                                                                                
  DXCCSR_FAC003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC003"                                                                     
                                                                                
  DXCCSR_FAC004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC004"                                                                     
                                                                                
  DXCCSR_FAC005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC005"                                                                     
                                                                                
  DXCCSR_FAC006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC006"                                                                     
                                                                                
  DXCCSR_FAC007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC007"                                                                     
                                                                                
  DXCCSR_FAC008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC008"                                                                     
                                                                                
  DXCCSR_FAC009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC009"                                                                     
                                                                                
  DXCCSR_FAC010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC010"                                                                     
                                                                                
  DXCCSR_FAC011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC011"                                                                     
                                                                                
  DXCCSR_FAC012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC012"                                                                     
                                                                                
  DXCCSR_FAC013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC013"                                                                     
                                                                                
  DXCCSR_FAC014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC014"                                                                     
                                                                                
  DXCCSR_FAC015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC015"                                                                     
                                                                                
  DXCCSR_FAC016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC016"                                                                     
                                                                                
  DXCCSR_FAC017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC017"                                                                     
                                                                                
  DXCCSR_FAC018              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC018"                                                                     
                                                                                
  DXCCSR_FAC019              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC019"                                                                     
                                                                                
  DXCCSR_FAC020              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC020"                                                                     
                                                                                
  DXCCSR_FAC021              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC021"                                                                     
                                                                                
  DXCCSR_FAC022              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC022"                                                                     
                                                                                
  DXCCSR_FAC023              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC023"                                                                     
                                                                                
  DXCCSR_FAC024              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC024"                                                                     
                                                                                
  DXCCSR_FAC025              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR FAC025"                                                                     
                                                                                
  DXCCSR_GEN001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN001"                                                                     
                                                                                
  DXCCSR_GEN002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN002"                                                                     
                                                                                
  DXCCSR_GEN003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN003"                                                                     
                                                                                
  DXCCSR_GEN004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN004"                                                                     
                                                                                
  DXCCSR_GEN005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN005"                                                                     
                                                                                
  DXCCSR_GEN006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN006"                                                                     
                                                                                
  DXCCSR_GEN007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN007"                                                                     
                                                                                
  DXCCSR_GEN008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN008"                                                                     
                                                                                
  DXCCSR_GEN009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN009"                                                                     
                                                                                
  DXCCSR_GEN010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN010"                                                                     
                                                                                
  DXCCSR_GEN011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN011"                                                                     
                                                                                
  DXCCSR_GEN012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN012"                                                                     
                                                                                
  DXCCSR_GEN013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN013"                                                                     
                                                                                
  DXCCSR_GEN014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN014"                                                                     
                                                                                
  DXCCSR_GEN015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN015"                                                                     
                                                                                
  DXCCSR_GEN016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN016"                                                                     
                                                                                
  DXCCSR_GEN017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN017"                                                                     
                                                                                
  DXCCSR_GEN018              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN018"                                                                     
                                                                                
  DXCCSR_GEN019              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN019"                                                                     
                                                                                
  DXCCSR_GEN020              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN020"                                                                     
                                                                                
  DXCCSR_GEN021              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN021"                                                                     
                                                                                
  DXCCSR_GEN022              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN022"                                                                     
                                                                                
  DXCCSR_GEN023              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN023"                                                                     
                                                                                
  DXCCSR_GEN024              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN024"                                                                     
                                                                                
  DXCCSR_GEN025              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN025"                                                                     
                                                                                
  DXCCSR_GEN026              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR GEN026"                                                                     
                                                                                
  DXCCSR_INF001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INF001"                                                                     
                                                                                
  DXCCSR_INF002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INF002"                                                                     
                                                                                
  DXCCSR_INF003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INF003"                                                                     
                                                                                
  DXCCSR_INF004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INF004"                                                                     
                                                                                
  DXCCSR_INF005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INF005"                                                                     
                                                                                
  DXCCSR_INF006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INF006"                                                                     
                                                                                
  DXCCSR_INF007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INF007"                                                                     
                                                                                
  DXCCSR_INF008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INF008"                                                                     
                                                                                
  DXCCSR_INF009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INF009"                                                                     
                                                                                
  DXCCSR_INF010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INF010"                                                                     
                                                                                
  DXCCSR_INF011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INF011"                                                                     
                                                                                
  DXCCSR_INF012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INF012"                                                                     
                                                                                
  DXCCSR_INJ001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ001"                                                                     
                                                                                
  DXCCSR_INJ002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ002"                                                                     
                                                                                
  DXCCSR_INJ003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ003"                                                                     
                                                                                
  DXCCSR_INJ004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ004"                                                                     
                                                                                
  DXCCSR_INJ005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ005"                                                                     
                                                                                
  DXCCSR_INJ006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ006"                                                                     
                                                                                
  DXCCSR_INJ007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ007"                                                                     
                                                                                
  DXCCSR_INJ008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ008"                                                                     
                                                                                
  DXCCSR_INJ009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ009"                                                                     
                                                                                
  DXCCSR_INJ010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ010"                                                                     
                                                                                
  DXCCSR_INJ011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ011"                                                                     
                                                                                
  DXCCSR_INJ012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ012"                                                                     
                                                                                
  DXCCSR_INJ013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ013"                                                                     
                                                                                
  DXCCSR_INJ014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ014"                                                                     
                                                                                
  DXCCSR_INJ015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ015"                                                                     
                                                                                
  DXCCSR_INJ016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ016"                                                                     
                                                                                
  DXCCSR_INJ017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ017"                                                                     
                                                                                
  DXCCSR_INJ018              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ018"                                                                     
                                                                                
  DXCCSR_INJ019              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ019"                                                                     
                                                                                
  DXCCSR_INJ020              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ020"                                                                     
                                                                                
  DXCCSR_INJ021              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ021"                                                                     
                                                                                
  DXCCSR_INJ022              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ022"                                                                     
                                                                                
  DXCCSR_INJ023              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ023"                                                                     
                                                                                
  DXCCSR_INJ024              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ024"                                                                     
                                                                                
  DXCCSR_INJ025              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ025"                                                                     
                                                                                
  DXCCSR_INJ026              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ026"                                                                     
                                                                                
  DXCCSR_INJ027              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ027"                                                                     
                                                                                
  DXCCSR_INJ028              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ028"                                                                     
                                                                                
  DXCCSR_INJ029              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ029"                                                                     
                                                                                
  DXCCSR_INJ030              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ030"                                                                     
                                                                                
  DXCCSR_INJ031              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ031"                                                                     
                                                                                
  DXCCSR_INJ032              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ032"                                                                     
                                                                                
  DXCCSR_INJ033              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ033"                                                                     
                                                                                
  DXCCSR_INJ034              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ034"                                                                     
                                                                                
  DXCCSR_INJ035              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ035"                                                                     
                                                                                
  DXCCSR_INJ036              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ036"                                                                     
                                                                                
  DXCCSR_INJ037              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ037"                                                                     
                                                                                
  DXCCSR_INJ038              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ038"                                                                     
                                                                                
  DXCCSR_INJ039              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ039"                                                                     
                                                                                
  DXCCSR_INJ040              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ040"                                                                     
                                                                                
  DXCCSR_INJ041              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ041"                                                                     
                                                                                
  DXCCSR_INJ042              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ042"                                                                     
                                                                                
  DXCCSR_INJ043              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ043"                                                                     
                                                                                
  DXCCSR_INJ044              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ044"                                                                     
                                                                                
  DXCCSR_INJ045              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ045"                                                                     
                                                                                
  DXCCSR_INJ046              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ046"                                                                     
                                                                                
  DXCCSR_INJ047              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ047"                                                                     
                                                                                
  DXCCSR_INJ048              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ048"                                                                     
                                                                                
  DXCCSR_INJ049              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ049"                                                                     
                                                                                
  DXCCSR_INJ050              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ050"                                                                     
                                                                                
  DXCCSR_INJ051              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ051"                                                                     
                                                                                
  DXCCSR_INJ052              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ052"                                                                     
                                                                                
  DXCCSR_INJ053              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ053"                                                                     
                                                                                
  DXCCSR_INJ054              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ054"                                                                     
                                                                                
  DXCCSR_INJ055              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ055"                                                                     
                                                                                
  DXCCSR_INJ056              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ056"                                                                     
                                                                                
  DXCCSR_INJ057              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ057"                                                                     
                                                                                
  DXCCSR_INJ058              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ058"                                                                     
                                                                                
  DXCCSR_INJ059              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ059"                                                                     
                                                                                
  DXCCSR_INJ060              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ060"                                                                     
                                                                                
  DXCCSR_INJ061              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ061"                                                                     
                                                                                
  DXCCSR_INJ062              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ062"                                                                     
                                                                                
  DXCCSR_INJ063              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ063"                                                                     
                                                                                
  DXCCSR_INJ064              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ064"                                                                     
                                                                                
  DXCCSR_INJ065              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ065"                                                                     
                                                                                
  DXCCSR_INJ066              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ066"                                                                     
                                                                                
  DXCCSR_INJ067              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ067"                                                                     
                                                                                
  DXCCSR_INJ068              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ068"                                                                     
                                                                                
  DXCCSR_INJ069              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ069"                                                                     
                                                                                
  DXCCSR_INJ070              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ070"                                                                     
                                                                                
  DXCCSR_INJ071              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ071"                                                                     
                                                                                
  DXCCSR_INJ072              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ072"                                                                     
                                                                                
  DXCCSR_INJ073              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ073"                                                                     
                                                                                
  DXCCSR_INJ074              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ074"                                                                     
                                                                                
  DXCCSR_INJ075              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ075"                                                                     
                                                                                
  DXCCSR_INJ076              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR INJ076"                                                                     
                                                                                
  DXCCSR_MAL001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MAL001"                                                                     
                                                                                
  DXCCSR_MAL002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MAL002"                                                                     
                                                                                
  DXCCSR_MAL003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MAL003"                                                                     
                                                                                
  DXCCSR_MAL004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MAL004"                                                                     
                                                                                
  DXCCSR_MAL005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MAL005"                                                                     
                                                                                
  DXCCSR_MAL006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MAL006"                                                                     
                                                                                
  DXCCSR_MAL007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MAL007"                                                                     
                                                                                
  DXCCSR_MAL008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MAL008"                                                                     
                                                                                
  DXCCSR_MAL009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MAL009"                                                                     
                                                                                
  DXCCSR_MAL010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MAL010"                                                                     
                                                                                
  DXCCSR_MBD001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD001"                                                                     
                                                                                
  DXCCSR_MBD002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD002"                                                                     
                                                                                
  DXCCSR_MBD003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD003"                                                                     
                                                                                
  DXCCSR_MBD004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD004"                                                                     
                                                                                
  DXCCSR_MBD005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD005"                                                                     
                                                                                
  DXCCSR_MBD006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD006"                                                                     
                                                                                
  DXCCSR_MBD007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD007"                                                                     
                                                                                
  DXCCSR_MBD008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD008"                                                                     
                                                                                
  DXCCSR_MBD009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD009"                                                                     
                                                                                
  DXCCSR_MBD010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD010"                                                                     
                                                                                
  DXCCSR_MBD011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD011"                                                                     
                                                                                
  DXCCSR_MBD012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD012"                                                                     
                                                                                
  DXCCSR_MBD013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD013"                                                                     
                                                                                
  DXCCSR_MBD014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD014"                                                                     
                                                                                
  DXCCSR_MBD017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD017"                                                                     
                                                                                
  DXCCSR_MBD018              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD018"                                                                     
                                                                                
  DXCCSR_MBD019              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD019"                                                                     
                                                                                
  DXCCSR_MBD020              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD020"                                                                     
                                                                                
  DXCCSR_MBD021              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD021"                                                                     
                                                                                
  DXCCSR_MBD022              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD022"                                                                     
                                                                                
  DXCCSR_MBD023              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD023"                                                                     
                                                                                
  DXCCSR_MBD024              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD024"                                                                     
                                                                                
  DXCCSR_MBD025              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD025"                                                                     
                                                                                
  DXCCSR_MBD026              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD026"                                                                     
                                                                                
  DXCCSR_MBD027              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD027"                                                                     
                                                                                
  DXCCSR_MBD028              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD028"                                                                     
                                                                                
  DXCCSR_MBD029              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD029"                                                                     
                                                                                
  DXCCSR_MBD030              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD030"                                                                     
                                                                                
  DXCCSR_MBD031              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD031"                                                                     
                                                                                
  DXCCSR_MBD032              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD032"                                                                     
                                                                                
  DXCCSR_MBD033              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD033"                                                                     
                                                                                
  DXCCSR_MBD034              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MBD034"                                                                     
                                                                                
  DXCCSR_MUS001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS001"                                                                     
                                                                                
  DXCCSR_MUS002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS002"                                                                     
                                                                                
  DXCCSR_MUS003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS003"                                                                     
                                                                                
  DXCCSR_MUS004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS004"                                                                     
                                                                                
  DXCCSR_MUS005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS005"                                                                     
                                                                                
  DXCCSR_MUS006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS006"                                                                     
                                                                                
  DXCCSR_MUS007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS007"                                                                     
                                                                                
  DXCCSR_MUS008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS008"                                                                     
                                                                                
  DXCCSR_MUS009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS009"                                                                     
                                                                                
  DXCCSR_MUS010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS010"                                                                     
                                                                                
  DXCCSR_MUS011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS011"                                                                     
                                                                                
  DXCCSR_MUS012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS012"                                                                     
                                                                                
  DXCCSR_MUS013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS013"                                                                     
                                                                                
  DXCCSR_MUS014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS014"                                                                     
                                                                                
  DXCCSR_MUS015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS015"                                                                     
                                                                                
  DXCCSR_MUS016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS016"                                                                     
                                                                                
  DXCCSR_MUS017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS017"                                                                     
                                                                                
  DXCCSR_MUS018              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS018"                                                                     
                                                                                
  DXCCSR_MUS019              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS019"                                                                     
                                                                                
  DXCCSR_MUS020              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS020"                                                                     
                                                                                
  DXCCSR_MUS021              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS021"                                                                     
                                                                                
  DXCCSR_MUS022              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS022"                                                                     
                                                                                
  DXCCSR_MUS023              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS023"                                                                     
                                                                                
  DXCCSR_MUS024              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS024"                                                                     
                                                                                
  DXCCSR_MUS025              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS025"                                                                     
                                                                                
  DXCCSR_MUS026              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS026"                                                                     
                                                                                
  DXCCSR_MUS027              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS027"                                                                     
                                                                                
  DXCCSR_MUS028              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS028"                                                                     
                                                                                
  DXCCSR_MUS029              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS029"                                                                     
                                                                                
  DXCCSR_MUS030              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS030"                                                                     
                                                                                
  DXCCSR_MUS031              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS031"                                                                     
                                                                                
  DXCCSR_MUS032              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS032"                                                                     
                                                                                
  DXCCSR_MUS033              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS033"                                                                     
                                                                                
  DXCCSR_MUS034              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS034"                                                                     
                                                                                
  DXCCSR_MUS035              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS035"                                                                     
                                                                                
  DXCCSR_MUS036              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS036"                                                                     
                                                                                
  DXCCSR_MUS037              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS037"                                                                     
                                                                                
  DXCCSR_MUS038              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR MUS038"                                                                     
                                                                                
  DXCCSR_NEO001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO001"                                                                     
                                                                                
  DXCCSR_NEO002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO002"                                                                     
                                                                                
  DXCCSR_NEO003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO003"                                                                     
                                                                                
  DXCCSR_NEO004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO004"                                                                     
                                                                                
  DXCCSR_NEO005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO005"                                                                     
                                                                                
  DXCCSR_NEO006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO006"                                                                     
                                                                                
  DXCCSR_NEO007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO007"                                                                     
                                                                                
  DXCCSR_NEO008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO008"                                                                     
                                                                                
  DXCCSR_NEO009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO009"                                                                     
                                                                                
  DXCCSR_NEO010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO010"                                                                     
                                                                                
  DXCCSR_NEO011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO011"                                                                     
                                                                                
  DXCCSR_NEO012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO012"                                                                     
                                                                                
  DXCCSR_NEO013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO013"                                                                     
                                                                                
  DXCCSR_NEO014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO014"                                                                     
                                                                                
  DXCCSR_NEO015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO015"                                                                     
                                                                                
  DXCCSR_NEO016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO016"                                                                     
                                                                                
  DXCCSR_NEO017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO017"                                                                     
                                                                                
  DXCCSR_NEO018              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO018"                                                                     
                                                                                
  DXCCSR_NEO019              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO019"                                                                     
                                                                                
  DXCCSR_NEO020              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO020"                                                                     
                                                                                
  DXCCSR_NEO021              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO021"                                                                     
                                                                                
  DXCCSR_NEO022              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO022"                                                                     
                                                                                
  DXCCSR_NEO023              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO023"                                                                     
                                                                                
  DXCCSR_NEO024              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO024"                                                                     
                                                                                
  DXCCSR_NEO025              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO025"                                                                     
                                                                                
  DXCCSR_NEO026              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO026"                                                                     
                                                                                
  DXCCSR_NEO027              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO027"                                                                     
                                                                                
  DXCCSR_NEO028              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO028"                                                                     
                                                                                
  DXCCSR_NEO029              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO029"                                                                     
                                                                                
  DXCCSR_NEO030              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO030"                                                                     
                                                                                
  DXCCSR_NEO031              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO031"                                                                     
                                                                                
  DXCCSR_NEO032              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO032"                                                                     
                                                                                
  DXCCSR_NEO033              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO033"                                                                     
                                                                                
  DXCCSR_NEO034              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO034"                                                                     
                                                                                
  DXCCSR_NEO035              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO035"                                                                     
                                                                                
  DXCCSR_NEO036              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO036"                                                                     
                                                                                
  DXCCSR_NEO037              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO037"                                                                     
                                                                                
  DXCCSR_NEO038              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO038"                                                                     
                                                                                
  DXCCSR_NEO039              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO039"                                                                     
                                                                                
  DXCCSR_NEO040              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO040"                                                                     
                                                                                
  DXCCSR_NEO041              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO041"                                                                     
                                                                                
  DXCCSR_NEO042              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO042"                                                                     
                                                                                
  DXCCSR_NEO043              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO043"                                                                     
                                                                                
  DXCCSR_NEO044              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO044"                                                                     
                                                                                
  DXCCSR_NEO045              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO045"                                                                     
                                                                                
  DXCCSR_NEO046              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO046"                                                                     
                                                                                
  DXCCSR_NEO047              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO047"                                                                     
                                                                                
  DXCCSR_NEO048              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO048"                                                                     
                                                                                
  DXCCSR_NEO049              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO049"                                                                     
                                                                                
  DXCCSR_NEO050              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO050"                                                                     
                                                                                
  DXCCSR_NEO051              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO051"                                                                     
                                                                                
  DXCCSR_NEO052              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO052"                                                                     
                                                                                
  DXCCSR_NEO053              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO053"                                                                     
                                                                                
  DXCCSR_NEO054              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO054"                                                                     
                                                                                
  DXCCSR_NEO055              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO055"                                                                     
                                                                                
  DXCCSR_NEO056              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO056"                                                                     
                                                                                
  DXCCSR_NEO057              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO057"                                                                     
                                                                                
  DXCCSR_NEO058              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO058"                                                                     
                                                                                
  DXCCSR_NEO059              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO059"                                                                     
                                                                                
  DXCCSR_NEO060              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO060"                                                                     
                                                                                
  DXCCSR_NEO061              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO061"                                                                     
                                                                                
  DXCCSR_NEO062              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO062"                                                                     
                                                                                
  DXCCSR_NEO063              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO063"                                                                     
                                                                                
  DXCCSR_NEO064              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO064"                                                                     
                                                                                
  DXCCSR_NEO065              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO065"                                                                     
                                                                                
  DXCCSR_NEO066              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO066"                                                                     
                                                                                
  DXCCSR_NEO067              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO067"                                                                     
                                                                                
  DXCCSR_NEO068              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO068"                                                                     
                                                                                
  DXCCSR_NEO069              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO069"                                                                     
                                                                                
  DXCCSR_NEO070              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO070"                                                                     
                                                                                
  DXCCSR_NEO071              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO071"                                                                     
                                                                                
  DXCCSR_NEO072              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO072"                                                                     
                                                                                
  DXCCSR_NEO073              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO073"                                                                     
                                                                                
  DXCCSR_NEO074              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NEO074"                                                                     
                                                                                
  DXCCSR_NVS001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS001"                                                                     
                                                                                
  DXCCSR_NVS002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS002"                                                                     
                                                                                
  DXCCSR_NVS003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS003"                                                                     
                                                                                
  DXCCSR_NVS004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS004"                                                                     
                                                                                
  DXCCSR_NVS005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS005"                                                                     
                                                                                
  DXCCSR_NVS006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS006"                                                                     
                                                                                
  DXCCSR_NVS007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS007"                                                                     
                                                                                
  DXCCSR_NVS008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS008"                                                                     
                                                                                
  DXCCSR_NVS009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS009"                                                                     
                                                                                
  DXCCSR_NVS010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS010"                                                                     
                                                                                
  DXCCSR_NVS011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS011"                                                                     
                                                                                
  DXCCSR_NVS012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS012"                                                                     
                                                                                
  DXCCSR_NVS013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS013"                                                                     
                                                                                
  DXCCSR_NVS014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS014"                                                                     
                                                                                
  DXCCSR_NVS015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS015"                                                                     
                                                                                
  DXCCSR_NVS016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS016"                                                                     
                                                                                
  DXCCSR_NVS017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS017"                                                                     
                                                                                
  DXCCSR_NVS018              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS018"                                                                     
                                                                                
  DXCCSR_NVS019              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS019"                                                                     
                                                                                
  DXCCSR_NVS020              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS020"                                                                     
                                                                                
  DXCCSR_NVS021              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS021"                                                                     
                                                                                
  DXCCSR_NVS022              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR NVS022"                                                                     
                                                                                
  DXCCSR_PNL001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PNL001"                                                                     
                                                                                
  DXCCSR_PNL002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PNL002"                                                                     
                                                                                
  DXCCSR_PNL003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PNL003"                                                                     
                                                                                
  DXCCSR_PNL004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PNL004"                                                                     
                                                                                
  DXCCSR_PNL005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PNL005"                                                                     
                                                                                
  DXCCSR_PNL006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PNL006"                                                                     
                                                                                
  DXCCSR_PNL007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PNL007"                                                                     
                                                                                
  DXCCSR_PNL008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PNL008"                                                                     
                                                                                
  DXCCSR_PNL009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PNL009"                                                                     
                                                                                
  DXCCSR_PNL010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PNL010"                                                                     
                                                                                
  DXCCSR_PNL011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PNL011"                                                                     
                                                                                
  DXCCSR_PNL012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PNL012"                                                                     
                                                                                
  DXCCSR_PNL013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PNL013"                                                                     
                                                                                
  DXCCSR_PNL014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PNL014"                                                                     
                                                                                
  DXCCSR_PNL015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PNL015"                                                                     
                                                                                
  DXCCSR_PRG001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG001"                                                                     
                                                                                
  DXCCSR_PRG002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG002"                                                                     
                                                                                
  DXCCSR_PRG003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG003"                                                                     
                                                                                
  DXCCSR_PRG004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG004"                                                                     
                                                                                
  DXCCSR_PRG005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG005"                                                                     
                                                                                
  DXCCSR_PRG006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG006"                                                                     
                                                                                
  DXCCSR_PRG007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG007"                                                                     
                                                                                
  DXCCSR_PRG008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG008"                                                                     
                                                                                
  DXCCSR_PRG009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG009"                                                                     
                                                                                
  DXCCSR_PRG010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG010"                                                                     
                                                                                
  DXCCSR_PRG011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG011"                                                                     
                                                                                
  DXCCSR_PRG012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG012"                                                                     
                                                                                
  DXCCSR_PRG013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG013"                                                                     
                                                                                
  DXCCSR_PRG014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG014"                                                                     
                                                                                
  DXCCSR_PRG015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG015"                                                                     
                                                                                
  DXCCSR_PRG016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG016"                                                                     
                                                                                
  DXCCSR_PRG017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG017"                                                                     
                                                                                
  DXCCSR_PRG018              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG018"                                                                     
                                                                                
  DXCCSR_PRG019              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG019"                                                                     
                                                                                
  DXCCSR_PRG020              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG020"                                                                     
                                                                                
  DXCCSR_PRG021              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG021"                                                                     
                                                                                
  DXCCSR_PRG022              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG022"                                                                     
                                                                                
  DXCCSR_PRG023              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG023"                                                                     
                                                                                
  DXCCSR_PRG024              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG024"                                                                     
                                                                                
  DXCCSR_PRG025              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG025"                                                                     
                                                                                
  DXCCSR_PRG026              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG026"                                                                     
                                                                                
  DXCCSR_PRG027              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG027"                                                                     
                                                                                
  DXCCSR_PRG028              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG028"                                                                     
                                                                                
  DXCCSR_PRG029              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG029"                                                                     
                                                                                
  DXCCSR_PRG030              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR PRG030"                                                                     
                                                                                
  DXCCSR_RSP001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP001"                                                                     
                                                                                
  DXCCSR_RSP002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP002"                                                                     
                                                                                
  DXCCSR_RSP003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP003"                                                                     
                                                                                
  DXCCSR_RSP004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP004"                                                                     
                                                                                
  DXCCSR_RSP005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP005"                                                                     
                                                                                
  DXCCSR_RSP006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP006"                                                                     
                                                                                
  DXCCSR_RSP007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP007"                                                                     
                                                                                
  DXCCSR_RSP008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP008"                                                                     
                                                                                
  DXCCSR_RSP009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP009"                                                                     
                                                                                
  DXCCSR_RSP010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP010"                                                                     
                                                                                
  DXCCSR_RSP011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP011"                                                                     
                                                                                
  DXCCSR_RSP012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP012"                                                                     
                                                                                
  DXCCSR_RSP013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP013"                                                                     
                                                                                
  DXCCSR_RSP014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP014"                                                                     
                                                                                
  DXCCSR_RSP015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP015"                                                                     
                                                                                
  DXCCSR_RSP016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP016"                                                                     
                                                                                
  DXCCSR_RSP017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR RSP017"                                                                     
                                                                                
  DXCCSR_SKN001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SKN001"                                                                     
                                                                                
  DXCCSR_SKN002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SKN002"                                                                     
                                                                                
  DXCCSR_SKN003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SKN003"                                                                     
                                                                                
  DXCCSR_SKN004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SKN004"                                                                     
                                                                                
  DXCCSR_SKN005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SKN005"                                                                     
                                                                                
  DXCCSR_SKN006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SKN006"                                                                     
                                                                                
  DXCCSR_SKN007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SKN007"                                                                     
                                                                                
  DXCCSR_SYM001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM001"                                                                     
                                                                                
  DXCCSR_SYM002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM002"                                                                     
                                                                                
  DXCCSR_SYM003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM003"                                                                     
                                                                                
  DXCCSR_SYM004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM004"                                                                     
                                                                                
  DXCCSR_SYM005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM005"                                                                     
                                                                                
  DXCCSR_SYM006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM006"                                                                     
                                                                                
  DXCCSR_SYM007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM007"                                                                     
                                                                                
  DXCCSR_SYM008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM008"                                                                     
                                                                                
  DXCCSR_SYM009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM009"                                                                     
                                                                                
  DXCCSR_SYM010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM010"                                                                     
                                                                                
  DXCCSR_SYM011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM011"                                                                     
                                                                                
  DXCCSR_SYM012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM012"                                                                     
                                                                                
  DXCCSR_SYM013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM013"                                                                     
                                                                                
  DXCCSR_SYM014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM014"                                                                     
                                                                                
  DXCCSR_SYM015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM015"                                                                     
                                                                                
  DXCCSR_SYM016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM016"                                                                     
                                                                                
  DXCCSR_SYM017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-CM diagnosis on the record is included in C
CSR SYM017"                                                                     
                                                                                
  DXCCSR_VERSION             LENGTH=$6                                          
  LABEL="Version of CCSR for ICD-10-CM diagnoses"                               
                                                                                
  PRCCSR_ADM001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM001"                                                                    
                                                                                
  PRCCSR_ADM002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM002"                                                                    
                                                                                
  PRCCSR_ADM003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM003"                                                                    
                                                                                
  PRCCSR_ADM004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM004"                                                                    
                                                                                
  PRCCSR_ADM005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM005"                                                                    
                                                                                
  PRCCSR_ADM006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM006"                                                                    
                                                                                
  PRCCSR_ADM007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM007"                                                                    
                                                                                
  PRCCSR_ADM008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM008"                                                                    
                                                                                
  PRCCSR_ADM009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM009"                                                                    
                                                                                
  PRCCSR_ADM010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM010"                                                                    
                                                                                
  PRCCSR_ADM011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM011"                                                                    
                                                                                
  PRCCSR_ADM012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM012"                                                                    
                                                                                
  PRCCSR_ADM013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM013"                                                                    
                                                                                
  PRCCSR_ADM014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM014"                                                                    
                                                                                
  PRCCSR_ADM015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM015"                                                                    
                                                                                
  PRCCSR_ADM016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM016"                                                                    
                                                                                
  PRCCSR_ADM017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM017"                                                                    
                                                                                
  PRCCSR_ADM018              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM018"                                                                    
                                                                                
  PRCCSR_ADM019              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM019"                                                                    
                                                                                
  PRCCSR_ADM020              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM020"                                                                    
                                                                                
  PRCCSR_ADM021              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ADM021"                                                                    
                                                                                
  PRCCSR_CAR001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR001"                                                                    
                                                                                
  PRCCSR_CAR002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR002"                                                                    
                                                                                
  PRCCSR_CAR003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR003"                                                                    
                                                                                
  PRCCSR_CAR004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR004"                                                                    
                                                                                
  PRCCSR_CAR005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR005"                                                                    
                                                                                
  PRCCSR_CAR006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR006"                                                                    
                                                                                
  PRCCSR_CAR007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR007"                                                                    
                                                                                
  PRCCSR_CAR008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR008"                                                                    
                                                                                
  PRCCSR_CAR009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR009"                                                                    
                                                                                
  PRCCSR_CAR010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR010"                                                                    
                                                                                
  PRCCSR_CAR011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR011"                                                                    
                                                                                
  PRCCSR_CAR012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR012"                                                                    
                                                                                
  PRCCSR_CAR013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR013"                                                                    
                                                                                
  PRCCSR_CAR014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR014"                                                                    
                                                                                
  PRCCSR_CAR015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR015"                                                                    
                                                                                
  PRCCSR_CAR016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR016"                                                                    
                                                                                
  PRCCSR_CAR017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR017"                                                                    
                                                                                
  PRCCSR_CAR018              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR018"                                                                    
                                                                                
  PRCCSR_CAR019              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR019"                                                                    
                                                                                
  PRCCSR_CAR020              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR020"                                                                    
                                                                                
  PRCCSR_CAR021              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR021"                                                                    
                                                                                
  PRCCSR_CAR022              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR022"                                                                    
                                                                                
  PRCCSR_CAR023              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR023"                                                                    
                                                                                
  PRCCSR_CAR024              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR024"                                                                    
                                                                                
  PRCCSR_CAR025              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR025"                                                                    
                                                                                
  PRCCSR_CAR026              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR026"                                                                    
                                                                                
  PRCCSR_CAR027              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR027"                                                                    
                                                                                
  PRCCSR_CAR028              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR028"                                                                    
                                                                                
  PRCCSR_CAR029              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CAR029"                                                                    
                                                                                
  PRCCSR_CHP001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CHP001"                                                                    
                                                                                
  PRCCSR_CNS001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CNS001"                                                                    
                                                                                
  PRCCSR_CNS002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CNS002"                                                                    
                                                                                
  PRCCSR_CNS003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CNS003"                                                                    
                                                                                
  PRCCSR_CNS004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CNS004"                                                                    
                                                                                
  PRCCSR_CNS005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CNS005"                                                                    
                                                                                
  PRCCSR_CNS006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CNS006"                                                                    
                                                                                
  PRCCSR_CNS007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CNS007"                                                                    
                                                                                
  PRCCSR_CNS008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CNS008"                                                                    
                                                                                
  PRCCSR_CNS009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CNS009"                                                                    
                                                                                
  PRCCSR_CNS010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CNS010"                                                                    
                                                                                
  PRCCSR_CNS011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CNS011"                                                                    
                                                                                
  PRCCSR_CNS012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CNS012"                                                                    
                                                                                
  PRCCSR_CNS013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CNS013"                                                                    
                                                                                
  PRCCSR_CNS014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR CNS014"                                                                    
                                                                                
  PRCCSR_ENP001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENP001"                                                                    
                                                                                
  PRCCSR_ENP002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENP002"                                                                    
                                                                                
  PRCCSR_ENP003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENP003"                                                                    
                                                                                
  PRCCSR_ENP004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENP004"                                                                    
                                                                                
  PRCCSR_ENP005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENP005"                                                                    
                                                                                
  PRCCSR_ENP006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENP006"                                                                    
                                                                                
  PRCCSR_ENT001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT001"                                                                    
                                                                                
  PRCCSR_ENT002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT002"                                                                    
                                                                                
  PRCCSR_ENT003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT003"                                                                    
                                                                                
  PRCCSR_ENT004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT004"                                                                    
                                                                                
  PRCCSR_ENT005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT005"                                                                    
                                                                                
  PRCCSR_ENT006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT006"                                                                    
                                                                                
  PRCCSR_ENT007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT007"                                                                    
                                                                                
  PRCCSR_ENT008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT008"                                                                    
                                                                                
  PRCCSR_ENT009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT009"                                                                    
                                                                                
  PRCCSR_ENT010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT010"                                                                    
                                                                                
  PRCCSR_ENT011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT011"                                                                    
                                                                                
  PRCCSR_ENT012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT012"                                                                    
                                                                                
  PRCCSR_ENT013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT013"                                                                    
                                                                                
  PRCCSR_ENT014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT014"                                                                    
                                                                                
  PRCCSR_ENT015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT015"                                                                    
                                                                                
  PRCCSR_ENT016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT016"                                                                    
                                                                                
  PRCCSR_ENT017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ENT017"                                                                    
                                                                                
  PRCCSR_ESA001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ESA001"                                                                    
                                                                                
  PRCCSR_ESA002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ESA002"                                                                    
                                                                                
  PRCCSR_ESA003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ESA003"                                                                    
                                                                                
  PRCCSR_ESA004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ESA004"                                                                    
                                                                                
  PRCCSR_ESA005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ESA005"                                                                    
                                                                                
  PRCCSR_ESA006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ESA006"                                                                    
                                                                                
  PRCCSR_ESA007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ESA007"                                                                    
                                                                                
  PRCCSR_ESA008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ESA008"                                                                    
                                                                                
  PRCCSR_ESA009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ESA009"                                                                    
                                                                                
  PRCCSR_ESA010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ESA010"                                                                    
                                                                                
  PRCCSR_ESA011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR ESA011"                                                                    
                                                                                
  PRCCSR_EST001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR EST001"                                                                    
                                                                                
  PRCCSR_EST002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR EST002"                                                                    
                                                                                
  PRCCSR_EST003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR EST003"                                                                    
                                                                                
  PRCCSR_EST004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR EST004"                                                                    
                                                                                
  PRCCSR_EST005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR EST005"                                                                    
                                                                                
  PRCCSR_EYP001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR EYP001"                                                                    
                                                                                
  PRCCSR_EYP002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR EYP002"                                                                    
                                                                                
  PRCCSR_FRS001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR FRS001"                                                                    
                                                                                
  PRCCSR_FRS002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR FRS002"                                                                    
                                                                                
  PRCCSR_FRS003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR FRS003"                                                                    
                                                                                
  PRCCSR_FRS004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR FRS004"                                                                    
                                                                                
  PRCCSR_FRS005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR FRS005"                                                                    
                                                                                
  PRCCSR_FRS006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR FRS006"                                                                    
                                                                                
  PRCCSR_FRS007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR FRS007"                                                                    
                                                                                
  PRCCSR_FRS008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR FRS008"                                                                    
                                                                                
  PRCCSR_FRS009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR FRS009"                                                                    
                                                                                
  PRCCSR_FRS010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR FRS010"                                                                    
                                                                                
  PRCCSR_FRS011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR FRS011"                                                                    
                                                                                
  PRCCSR_FRS012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR FRS012"                                                                    
                                                                                
  PRCCSR_FRS013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR FRS013"                                                                    
                                                                                
  PRCCSR_FRS014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR FRS014"                                                                    
                                                                                
  PRCCSR_FRS015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR FRS015"                                                                    
                                                                                
  PRCCSR_GIS001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS001"                                                                    
                                                                                
  PRCCSR_GIS002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS002"                                                                    
                                                                                
  PRCCSR_GIS003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS003"                                                                    
                                                                                
  PRCCSR_GIS004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS004"                                                                    
                                                                                
  PRCCSR_GIS005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS005"                                                                    
                                                                                
  PRCCSR_GIS006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS006"                                                                    
                                                                                
  PRCCSR_GIS007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS007"                                                                    
                                                                                
  PRCCSR_GIS008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS008"                                                                    
                                                                                
  PRCCSR_GIS009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS009"                                                                    
                                                                                
  PRCCSR_GIS010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS010"                                                                    
                                                                                
  PRCCSR_GIS011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS011"                                                                    
                                                                                
  PRCCSR_GIS012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS012"                                                                    
                                                                                
  PRCCSR_GIS013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS013"                                                                    
                                                                                
  PRCCSR_GIS014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS014"                                                                    
                                                                                
  PRCCSR_GIS015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS015"                                                                    
                                                                                
  PRCCSR_GIS016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS016"                                                                    
                                                                                
  PRCCSR_GIS017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS017"                                                                    
                                                                                
  PRCCSR_GIS018              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS018"                                                                    
                                                                                
  PRCCSR_GIS019              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS019"                                                                    
                                                                                
  PRCCSR_GIS020              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS020"                                                                    
                                                                                
  PRCCSR_GIS021              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS021"                                                                    
                                                                                
  PRCCSR_GIS022              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS022"                                                                    
                                                                                
  PRCCSR_GIS023              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS023"                                                                    
                                                                                
  PRCCSR_GIS024              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS024"                                                                    
                                                                                
  PRCCSR_GIS025              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS025"                                                                    
                                                                                
  PRCCSR_GIS026              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS026"                                                                    
                                                                                
  PRCCSR_GIS027              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS027"                                                                    
                                                                                
  PRCCSR_GIS028              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS028"                                                                    
                                                                                
  PRCCSR_GIS029              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GIS029"                                                                    
                                                                                
  PRCCSR_GNR001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GNR001"                                                                    
                                                                                
  PRCCSR_GNR002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GNR002"                                                                    
                                                                                
  PRCCSR_GNR003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GNR003"                                                                    
                                                                                
  PRCCSR_GNR004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GNR004"                                                                    
                                                                                
  PRCCSR_GNR005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GNR005"                                                                    
                                                                                
  PRCCSR_GNR006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GNR006"                                                                    
                                                                                
  PRCCSR_GNR007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GNR007"                                                                    
                                                                                
  PRCCSR_GNR008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GNR008"                                                                    
                                                                                
  PRCCSR_GNR009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GNR009"                                                                    
                                                                                
  PRCCSR_GNR010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR GNR010"                                                                    
                                                                                
  PRCCSR_HEP001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR HEP001"                                                                    
                                                                                
  PRCCSR_HEP002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR HEP002"                                                                    
                                                                                
  PRCCSR_HEP003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR HEP003"                                                                    
                                                                                
  PRCCSR_HEP004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR HEP004"                                                                    
                                                                                
  PRCCSR_HEP005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR HEP005"                                                                    
                                                                                
  PRCCSR_HEP006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR HEP006"                                                                    
                                                                                
  PRCCSR_HEP007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR HEP007"                                                                    
                                                                                
  PRCCSR_HEP008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR HEP008"                                                                    
                                                                                
  PRCCSR_HEP009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR HEP009"                                                                    
                                                                                
  PRCCSR_HEP010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR HEP010"                                                                    
                                                                                
  PRCCSR_HEP011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR HEP011"                                                                    
                                                                                
  PRCCSR_HEP012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR HEP012"                                                                    
                                                                                
  PRCCSR_HEP013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR HEP013"                                                                    
                                                                                
  PRCCSR_IMG001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR IMG001"                                                                    
                                                                                
  PRCCSR_IMG002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR IMG002"                                                                    
                                                                                
  PRCCSR_IMG003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR IMG003"                                                                    
                                                                                
  PRCCSR_IMG004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR IMG004"                                                                    
                                                                                
  PRCCSR_IMG005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR IMG005"                                                                    
                                                                                
  PRCCSR_IMG006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR IMG006"                                                                    
                                                                                
  PRCCSR_IMG007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR IMG007"                                                                    
                                                                                
  PRCCSR_IMG008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR IMG008"                                                                    
                                                                                
  PRCCSR_IMG009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR IMG009"                                                                    
                                                                                
  PRCCSR_IMG010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR IMG010"                                                                    
                                                                                
  PRCCSR_LYM001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR LYM001"                                                                    
                                                                                
  PRCCSR_LYM002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR LYM002"                                                                    
                                                                                
  PRCCSR_LYM003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR LYM003"                                                                    
                                                                                
  PRCCSR_LYM004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR LYM004"                                                                    
                                                                                
  PRCCSR_LYM005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR LYM005"                                                                    
                                                                                
  PRCCSR_LYM006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR LYM006"                                                                    
                                                                                
  PRCCSR_LYM007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR LYM007"                                                                    
                                                                                
  PRCCSR_LYM008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR LYM008"                                                                    
                                                                                
  PRCCSR_LYM009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR LYM009"                                                                    
                                                                                
  PRCCSR_LYM010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR LYM010"                                                                    
                                                                                
  PRCCSR_LYM011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR LYM011"                                                                    
                                                                                
  PRCCSR_MAM001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MAM001"                                                                    
                                                                                
  PRCCSR_MAM002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MAM002"                                                                    
                                                                                
  PRCCSR_MAM003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MAM003"                                                                    
                                                                                
  PRCCSR_MAM004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MAM004"                                                                    
                                                                                
  PRCCSR_MAM005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MAM005"                                                                    
                                                                                
  PRCCSR_MAM006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MAM006"                                                                    
                                                                                
  PRCCSR_MAM007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MAM007"                                                                    
                                                                                
  PRCCSR_MAM008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MAM008"                                                                    
                                                                                
  PRCCSR_MAM009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MAM009"                                                                    
                                                                                
  PRCCSR_MAM010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MAM010"                                                                    
                                                                                
  PRCCSR_MAM011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MAM011"                                                                    
                                                                                
  PRCCSR_MAM012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MAM012"                                                                    
                                                                                
  PRCCSR_MAM013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MAM013"                                                                    
                                                                                
  PRCCSR_MAM014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MAM014"                                                                    
                                                                                
  PRCCSR_MAM015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MAM015"                                                                    
                                                                                
  PRCCSR_MHT001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MHT001"                                                                    
                                                                                
  PRCCSR_MHT002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MHT002"                                                                    
                                                                                
  PRCCSR_MHT003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MHT003"                                                                    
                                                                                
  PRCCSR_MHT004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MHT004"                                                                    
                                                                                
  PRCCSR_MHT005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MHT005"                                                                    
                                                                                
  PRCCSR_MRS001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MRS001"                                                                    
                                                                                
  PRCCSR_MRS002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MRS002"                                                                    
                                                                                
  PRCCSR_MRS003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MRS003"                                                                    
                                                                                
  PRCCSR_MRS004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MRS004"                                                                    
                                                                                
  PRCCSR_MRS005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MRS005"                                                                    
                                                                                
  PRCCSR_MRS006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MRS006"                                                                    
                                                                                
  PRCCSR_MRS007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MRS007"                                                                    
                                                                                
  PRCCSR_MST001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST001"                                                                    
                                                                                
  PRCCSR_MST002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST002"                                                                    
                                                                                
  PRCCSR_MST003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST003"                                                                    
                                                                                
  PRCCSR_MST004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST004"                                                                    
                                                                                
  PRCCSR_MST005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST005"                                                                    
                                                                                
  PRCCSR_MST006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST006"                                                                    
                                                                                
  PRCCSR_MST007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST007"                                                                    
                                                                                
  PRCCSR_MST008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST008"                                                                    
                                                                                
  PRCCSR_MST009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST009"                                                                    
                                                                                
  PRCCSR_MST010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST010"                                                                    
                                                                                
  PRCCSR_MST011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST011"                                                                    
                                                                                
  PRCCSR_MST012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST012"                                                                    
                                                                                
  PRCCSR_MST013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST013"                                                                    
                                                                                
  PRCCSR_MST014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST014"                                                                    
                                                                                
  PRCCSR_MST015              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST015"                                                                    
                                                                                
  PRCCSR_MST016              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST016"                                                                    
                                                                                
  PRCCSR_MST017              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST017"                                                                    
                                                                                
  PRCCSR_MST018              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST018"                                                                    
                                                                                
  PRCCSR_MST019              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST019"                                                                    
                                                                                
  PRCCSR_MST020              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST020"                                                                    
                                                                                
  PRCCSR_MST021              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST021"                                                                    
                                                                                
  PRCCSR_MST022              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST022"                                                                    
                                                                                
  PRCCSR_MST023              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST023"                                                                    
                                                                                
  PRCCSR_MST024              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST024"                                                                    
                                                                                
  PRCCSR_MST025              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST025"                                                                    
                                                                                
  PRCCSR_MST026              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST026"                                                                    
                                                                                
  PRCCSR_MST027              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST027"                                                                    
                                                                                
  PRCCSR_MST028              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST028"                                                                    
                                                                                
  PRCCSR_MST029              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST029"                                                                    
                                                                                
  PRCCSR_MST030              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR MST030"                                                                    
                                                                                
  PRCCSR_NCM001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR NCM001"                                                                    
                                                                                
  PRCCSR_NCM002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR NCM002"                                                                    
                                                                                
  PRCCSR_NCM003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR NCM003"                                                                    
                                                                                
  PRCCSR_NCM004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR NCM004"                                                                    
                                                                                
  PRCCSR_OST001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR OST001"                                                                    
                                                                                
  PRCCSR_OTR001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR OTR001"                                                                    
                                                                                
  PRCCSR_OTR002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR OTR002"                                                                    
                                                                                
  PRCCSR_OTR003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR OTR003"                                                                    
                                                                                
  PRCCSR_OTR004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR OTR004"                                                                    
                                                                                
  PRCCSR_OTR005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR OTR005"                                                                    
                                                                                
  PRCCSR_PGN001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PGN001"                                                                    
                                                                                
  PRCCSR_PGN002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PGN002"                                                                    
                                                                                
  PRCCSR_PGN003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PGN003"                                                                    
                                                                                
  PRCCSR_PGN004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PGN004"                                                                    
                                                                                
  PRCCSR_PGN005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PGN005"                                                                    
                                                                                
  PRCCSR_PGN006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PGN006"                                                                    
                                                                                
  PRCCSR_PGN007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PGN007"                                                                    
                                                                                
  PRCCSR_PGN008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PGN008"                                                                    
                                                                                
  PRCCSR_PGN009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PGN009"                                                                    
                                                                                
  PRCCSR_PLC001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PLC001"                                                                    
                                                                                
  PRCCSR_PLC002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PLC002"                                                                    
                                                                                
  PRCCSR_PNS001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PNS001"                                                                    
                                                                                
  PRCCSR_PNS002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PNS002"                                                                    
                                                                                
  PRCCSR_PNS003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PNS003"                                                                    
                                                                                
  PRCCSR_PNS004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PNS004"                                                                    
                                                                                
  PRCCSR_PNS005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PNS005"                                                                    
                                                                                
  PRCCSR_PNS006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR PNS006"                                                                    
                                                                                
  PRCCSR_RAD001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RAD001"                                                                    
                                                                                
  PRCCSR_RAD002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RAD002"                                                                    
                                                                                
  PRCCSR_RAD003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RAD003"                                                                    
                                                                                
  PRCCSR_RAD004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RAD004"                                                                    
                                                                                
  PRCCSR_RES001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RES001"                                                                    
                                                                                
  PRCCSR_RES002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RES002"                                                                    
                                                                                
  PRCCSR_RES003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RES003"                                                                    
                                                                                
  PRCCSR_RES004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RES004"                                                                    
                                                                                
  PRCCSR_RES005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RES005"                                                                    
                                                                                
  PRCCSR_RES006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RES006"                                                                    
                                                                                
  PRCCSR_RES007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RES007"                                                                    
                                                                                
  PRCCSR_RES008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RES008"                                                                    
                                                                                
  PRCCSR_RES009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RES009"                                                                    
                                                                                
  PRCCSR_RES010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RES010"                                                                    
                                                                                
  PRCCSR_RES011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RES011"                                                                    
                                                                                
  PRCCSR_RES012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RES012"                                                                    
                                                                                
  PRCCSR_RES013              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RES013"                                                                    
                                                                                
  PRCCSR_RES014              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RES014"                                                                    
                                                                                
  PRCCSR_RHB001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RHB001"                                                                    
                                                                                
  PRCCSR_RHB002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RHB002"                                                                    
                                                                                
  PRCCSR_RHB003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RHB003"                                                                    
                                                                                
  PRCCSR_RHB004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR RHB004"                                                                    
                                                                                
  PRCCSR_SKB001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR SKB001"                                                                    
                                                                                
  PRCCSR_SKB002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR SKB002"                                                                    
                                                                                
  PRCCSR_SKB003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR SKB003"                                                                    
                                                                                
  PRCCSR_SKB004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR SKB004"                                                                    
                                                                                
  PRCCSR_SKB005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR SKB005"                                                                    
                                                                                
  PRCCSR_SKB006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR SKB006"                                                                    
                                                                                
  PRCCSR_SKB007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR SKB007"                                                                    
                                                                                
  PRCCSR_SKB008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR SKB008"                                                                    
                                                                                
  PRCCSR_SKB009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR SKB009"                                                                    
                                                                                
  PRCCSR_SKB010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR SKB010"                                                                    
                                                                                
  PRCCSR_SUD001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR SUD001"                                                                    
                                                                                
  PRCCSR_SUD002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR SUD002"                                                                    
                                                                                
  PRCCSR_SUD003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR SUD003"                                                                    
                                                                                
  PRCCSR_SUD004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR SUD004"                                                                    
                                                                                
  PRCCSR_URN001              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR URN001"                                                                    
                                                                                
  PRCCSR_URN002              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR URN002"                                                                    
                                                                                
  PRCCSR_URN003              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR URN003"                                                                    
                                                                                
  PRCCSR_URN004              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR URN004"                                                                    
                                                                                
  PRCCSR_URN005              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR URN005"                                                                    
                                                                                
  PRCCSR_URN006              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR URN006"                                                                    
                                                                                
  PRCCSR_URN007              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR URN007"                                                                    
                                                                                
  PRCCSR_URN008              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR URN008"                                                                    
                                                                                
  PRCCSR_URN009              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR URN009"                                                                    
                                                                                
  PRCCSR_URN010              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR URN010"                                                                    
                                                                                
  PRCCSR_URN011              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR URN011"                                                                    
                                                                                
  PRCCSR_URN012              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indication that at least one ICD-10-PCS procedure on the record is included in 
CCSR URN012"                                                                    
                                                                                
  PRCCSR_VERSION             LENGTH=$6                                          
  LABEL="Version of CCSR for ICD-10-PCS procedures"                             
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      CMR_AIDS                      N2PF.                               
      @3      CMR_ALCOHOL                   N2PF.                               
      @5      CMR_ANEMDEF                   N2PF.                               
      @7      CMR_ARTH                      N2PF.                               
      @9      CMR_BLDLOSS                   N2PF.                               
      @11     CMR_CANCER_LEUK               N2PF.                               
      @13     CMR_CANCER_LYMPH              N2PF.                               
      @15     CMR_CANCER_METS               N2PF.                               
      @17     CMR_CANCER_NSITU              N2PF.                               
      @19     CMR_CANCER_SOLID              N2PF.                               
      @21     CMR_CBVD                      N2PF.                               
      @23     CMR_CHF                       N2PF.                               
      @25     CMR_COAG                      N2PF.                               
      @27     CMR_DEMENTIA                  N2PF.                               
      @29     CMR_DEPRESS                   N2PF.                               
      @31     CMR_DIAB_CX                   N2PF.                               
      @33     CMR_DIAB_UNCX                 N2PF.                               
      @35     CMR_DRUG_ABUSE                N2PF.                               
      @37     CMR_HTN_CX                    N2PF.                               
      @39     CMR_HTN_UNCX                  N2PF.                               
      @41     CMR_LIVER_MLD                 N2PF.                               
      @43     CMR_LIVER_SEV                 N2PF.                               
      @45     CMR_LUNG_CHRONIC              N2PF.                               
      @47     CMR_NEURO_MOVT                N2PF.                               
      @49     CMR_NEURO_OTH                 N2PF.                               
      @51     CMR_NEURO_SEIZ                N2PF.                               
      @53     CMR_OBESE                     N2PF.                               
      @55     CMR_PARALYSIS                 N2PF.                               
      @57     CMR_PERIVASC                  N2PF.                               
      @59     CMR_PSYCHOSES                 N2PF.                               
      @61     CMR_PULMCIRC                  N2PF.                               
      @63     CMR_RENLFL_MOD                N2PF.                               
      @65     CMR_RENLFL_SEV                N2PF.                               
      @67     CMR_THYROID_HYPO              N2PF.                               
      @69     CMR_THYROID_OTH               N2PF.                               
      @71     CMR_ULCER_PEPTIC              N2PF.                               
      @73     CMR_VALVE                     N2PF.                               
      @75     CMR_VERSION                   $CHAR6.                             
      @81     CMR_WGHTLOSS                  N2PF.                               
      @83     I10_INJURY                    N2PF.                               
      @85     I10_INJURY_CUT                N2PF.                               
      @87     I10_INJURY_DROWN              N2PF.                               
      @89     I10_INJURY_FALL               N2PF.                               
      @91     I10_INJURY_FIRE               N2PF.                               
      @93     I10_INJURY_FIREARM            N2PF.                               
      @95     I10_INJURY_MACHINERY          N2PF.                               
      @97     I10_INJURY_MVT                N2PF.                               
      @99     I10_INJURY_NATURE             N2PF.                               
      @101    I10_INJURY_OVEREXERTION       N2PF.                               
      @103    I10_INJURY_POISON             N2PF.                               
      @105    I10_INJURY_STRUCK             N2PF.                               
      @107    I10_INJURY_SUFFOCATION        N2PF.                               
      @109    I10_INTENT_ASSAULT            N2PF.                               
      @111    I10_INTENT_SELF_HARM          N2PF.                               
      @113    I10_INTENT_UNINTENTIONAL      N2PF.                               
      @115    I10_MULTINJURY                N2PF.                               
      @117    KEY                           15.                                 
      @132    PCLASS_VERSION                $CHAR6.                             
      @138    PCLASS1                       N2PF.                               
      @140    PCLASS2                       N2PF.                               
      @142    PCLASS3                       N2PF.                               
      @144    PCLASS4                       N2PF.                               
      @146    PCLASS5                       N2PF.                               
      @148    PCLASS6                       N2PF.                               
      @150    PCLASS7                       N2PF.                               
      @152    PCLASS8                       N2PF.                               
      @154    PCLASS9                       N2PF.                               
      @156    PCLASS10                      N2PF.                               
      @158    PCLASS11                      N2PF.                               
      @160    PCLASS12                      N2PF.                               
      @162    PCLASS13                      N2PF.                               
      @164    PCLASS14                      N2PF.                               
      @166    PCLASS15                      N2PF.                               
      @168    PCLASS16                      N2PF.                               
      @170    PCLASS17                      N2PF.                               
      @172    PCLASS18                      N2PF.                               
      @174    PCLASS19                      N2PF.                               
      @176    PCLASS20                      N2PF.                               
      @178    PCLASS21                      N2PF.                               
      @180    PCLASS22                      N2PF.                               
      @182    PCLASS23                      N2PF.                               
      @184    PCLASS24                      N2PF.                               
      @186    PCLASS25                      N2PF.                               
      @188    PCLASS26                      N2PF.                               
      @190    PCLASS27                      N2PF.                               
      @192    PCLASS28                      N2PF.                               
      @194    PCLASS29                      N2PF.                               
      @196    PCLASS30                      N2PF.                               
      @198    DXCCSR_Default_DX1            $CHAR6.                             
      @204    DXCCSR_BLD001                 N3PF.                               
      @207    DXCCSR_BLD002                 N3PF.                               
      @210    DXCCSR_BLD003                 N3PF.                               
      @213    DXCCSR_BLD004                 N3PF.                               
      @216    DXCCSR_BLD005                 N3PF.                               
      @219    DXCCSR_BLD006                 N3PF.                               
      @222    DXCCSR_BLD007                 N3PF.                               
      @225    DXCCSR_BLD008                 N3PF.                               
      @228    DXCCSR_BLD009                 N3PF.                               
      @231    DXCCSR_BLD010                 N3PF.                               
      @234    DXCCSR_CIR001                 N3PF.                               
      @237    DXCCSR_CIR002                 N3PF.                               
      @240    DXCCSR_CIR003                 N3PF.                               
      @243    DXCCSR_CIR004                 N3PF.                               
      @246    DXCCSR_CIR005                 N3PF.                               
      @249    DXCCSR_CIR006                 N3PF.                               
      @252    DXCCSR_CIR007                 N3PF.                               
      @255    DXCCSR_CIR008                 N3PF.                               
      @258    DXCCSR_CIR009                 N3PF.                               
      @261    DXCCSR_CIR010                 N3PF.                               
      @264    DXCCSR_CIR011                 N3PF.                               
      @267    DXCCSR_CIR012                 N3PF.                               
      @270    DXCCSR_CIR013                 N3PF.                               
      @273    DXCCSR_CIR014                 N3PF.                               
      @276    DXCCSR_CIR015                 N3PF.                               
      @279    DXCCSR_CIR016                 N3PF.                               
      @282    DXCCSR_CIR017                 N3PF.                               
      @285    DXCCSR_CIR018                 N3PF.                               
      @288    DXCCSR_CIR019                 N3PF.                               
      @291    DXCCSR_CIR020                 N3PF.                               
      @294    DXCCSR_CIR021                 N3PF.                               
      @297    DXCCSR_CIR022                 N3PF.                               
      @300    DXCCSR_CIR023                 N3PF.                               
      @303    DXCCSR_CIR024                 N3PF.                               
      @306    DXCCSR_CIR025                 N3PF.                               
      @309    DXCCSR_CIR026                 N3PF.                               
      @312    DXCCSR_CIR027                 N3PF.                               
      @315    DXCCSR_CIR028                 N3PF.                               
      @318    DXCCSR_CIR029                 N3PF.                               
      @321    DXCCSR_CIR030                 N3PF.                               
      @324    DXCCSR_CIR031                 N3PF.                               
      @327    DXCCSR_CIR032                 N3PF.                               
      @330    DXCCSR_CIR033                 N3PF.                               
      @333    DXCCSR_CIR034                 N3PF.                               
      @336    DXCCSR_CIR035                 N3PF.                               
      @339    DXCCSR_CIR036                 N3PF.                               
      @342    DXCCSR_CIR037                 N3PF.                               
      @345    DXCCSR_CIR038                 N3PF.                               
      @348    DXCCSR_CIR039                 N3PF.                               
      @351    DXCCSR_DIG001                 N3PF.                               
      @354    DXCCSR_DIG002                 N3PF.                               
      @357    DXCCSR_DIG003                 N3PF.                               
      @360    DXCCSR_DIG004                 N3PF.                               
      @363    DXCCSR_DIG005                 N3PF.                               
      @366    DXCCSR_DIG006                 N3PF.                               
      @369    DXCCSR_DIG007                 N3PF.                               
      @372    DXCCSR_DIG008                 N3PF.                               
      @375    DXCCSR_DIG009                 N3PF.                               
      @378    DXCCSR_DIG010                 N3PF.                               
      @381    DXCCSR_DIG011                 N3PF.                               
      @384    DXCCSR_DIG012                 N3PF.                               
      @387    DXCCSR_DIG013                 N3PF.                               
      @390    DXCCSR_DIG014                 N3PF.                               
      @393    DXCCSR_DIG015                 N3PF.                               
      @396    DXCCSR_DIG016                 N3PF.                               
      @399    DXCCSR_DIG017                 N3PF.                               
      @402    DXCCSR_DIG018                 N3PF.                               
      @405    DXCCSR_DIG019                 N3PF.                               
      @408    DXCCSR_DIG020                 N3PF.                               
      @411    DXCCSR_DIG021                 N3PF.                               
      @414    DXCCSR_DIG022                 N3PF.                               
      @417    DXCCSR_DIG023                 N3PF.                               
      @420    DXCCSR_DIG024                 N3PF.                               
      @423    DXCCSR_DIG025                 N3PF.                               
      @426    DXCCSR_EAR001                 N3PF.                               
      @429    DXCCSR_EAR002                 N3PF.                               
      @432    DXCCSR_EAR003                 N3PF.                               
      @435    DXCCSR_EAR004                 N3PF.                               
      @438    DXCCSR_EAR005                 N3PF.                               
      @441    DXCCSR_EAR006                 N3PF.                               
      @444    DXCCSR_END001                 N3PF.                               
      @447    DXCCSR_END002                 N3PF.                               
      @450    DXCCSR_END003                 N3PF.                               
      @453    DXCCSR_END004                 N3PF.                               
      @456    DXCCSR_END005                 N3PF.                               
      @459    DXCCSR_END006                 N3PF.                               
      @462    DXCCSR_END007                 N3PF.                               
      @465    DXCCSR_END008                 N3PF.                               
      @468    DXCCSR_END009                 N3PF.                               
      @471    DXCCSR_END010                 N3PF.                               
      @474    DXCCSR_END011                 N3PF.                               
      @477    DXCCSR_END012                 N3PF.                               
      @480    DXCCSR_END013                 N3PF.                               
      @483    DXCCSR_END014                 N3PF.                               
      @486    DXCCSR_END015                 N3PF.                               
      @489    DXCCSR_END016                 N3PF.                               
      @492    DXCCSR_END017                 N3PF.                               
      @495    DXCCSR_EXT001                 N3PF.                               
      @498    DXCCSR_EXT002                 N3PF.                               
      @501    DXCCSR_EXT003                 N3PF.                               
      @504    DXCCSR_EXT004                 N3PF.                               
      @507    DXCCSR_EXT005                 N3PF.                               
      @510    DXCCSR_EXT006                 N3PF.                               
      @513    DXCCSR_EXT007                 N3PF.                               
      @516    DXCCSR_EXT008                 N3PF.                               
      @519    DXCCSR_EXT009                 N3PF.                               
      @522    DXCCSR_EXT010                 N3PF.                               
      @525    DXCCSR_EXT011                 N3PF.                               
      @528    DXCCSR_EXT012                 N3PF.                               
      @531    DXCCSR_EXT013                 N3PF.                               
      @534    DXCCSR_EXT014                 N3PF.                               
      @537    DXCCSR_EXT015                 N3PF.                               
      @540    DXCCSR_EXT016                 N3PF.                               
      @543    DXCCSR_EXT017                 N3PF.                               
      @546    DXCCSR_EXT018                 N3PF.                               
      @549    DXCCSR_EXT019                 N3PF.                               
      @552    DXCCSR_EXT020                 N3PF.                               
      @555    DXCCSR_EXT021                 N3PF.                               
      @558    DXCCSR_EXT022                 N3PF.                               
      @561    DXCCSR_EXT023                 N3PF.                               
      @564    DXCCSR_EXT024                 N3PF.                               
      @567    DXCCSR_EXT025                 N3PF.                               
      @570    DXCCSR_EXT026                 N3PF.                               
      @573    DXCCSR_EXT027                 N3PF.                               
      @576    DXCCSR_EXT028                 N3PF.                               
      @579    DXCCSR_EXT029                 N3PF.                               
      @582    DXCCSR_EXT030                 N3PF.                               
      @585    DXCCSR_EYE001                 N3PF.                               
      @588    DXCCSR_EYE002                 N3PF.                               
      @591    DXCCSR_EYE003                 N3PF.                               
      @594    DXCCSR_EYE004                 N3PF.                               
      @597    DXCCSR_EYE005                 N3PF.                               
      @600    DXCCSR_EYE006                 N3PF.                               
      @603    DXCCSR_EYE007                 N3PF.                               
      @606    DXCCSR_EYE008                 N3PF.                               
      @609    DXCCSR_EYE009                 N3PF.                               
      @612    DXCCSR_EYE010                 N3PF.                               
      @615    DXCCSR_EYE011                 N3PF.                               
      @618    DXCCSR_EYE012                 N3PF.                               
      @621    DXCCSR_FAC001                 N3PF.                               
      @624    DXCCSR_FAC002                 N3PF.                               
      @627    DXCCSR_FAC003                 N3PF.                               
      @630    DXCCSR_FAC004                 N3PF.                               
      @633    DXCCSR_FAC005                 N3PF.                               
      @636    DXCCSR_FAC006                 N3PF.                               
      @639    DXCCSR_FAC007                 N3PF.                               
      @642    DXCCSR_FAC008                 N3PF.                               
      @645    DXCCSR_FAC009                 N3PF.                               
      @648    DXCCSR_FAC010                 N3PF.                               
      @651    DXCCSR_FAC011                 N3PF.                               
      @654    DXCCSR_FAC012                 N3PF.                               
      @657    DXCCSR_FAC013                 N3PF.                               
      @660    DXCCSR_FAC014                 N3PF.                               
      @663    DXCCSR_FAC015                 N3PF.                               
      @666    DXCCSR_FAC016                 N3PF.                               
      @669    DXCCSR_FAC017                 N3PF.                               
      @672    DXCCSR_FAC018                 N3PF.                               
      @675    DXCCSR_FAC019                 N3PF.                               
      @678    DXCCSR_FAC020                 N3PF.                               
      @681    DXCCSR_FAC021                 N3PF.                               
      @684    DXCCSR_FAC022                 N3PF.                               
      @687    DXCCSR_FAC023                 N3PF.                               
      @690    DXCCSR_FAC024                 N3PF.                               
      @693    DXCCSR_FAC025                 N3PF.                               
      @696    DXCCSR_GEN001                 N3PF.                               
      @699    DXCCSR_GEN002                 N3PF.                               
      @702    DXCCSR_GEN003                 N3PF.                               
      @705    DXCCSR_GEN004                 N3PF.                               
      @708    DXCCSR_GEN005                 N3PF.                               
      @711    DXCCSR_GEN006                 N3PF.                               
      @714    DXCCSR_GEN007                 N3PF.                               
      @717    DXCCSR_GEN008                 N3PF.                               
      @720    DXCCSR_GEN009                 N3PF.                               
      @723    DXCCSR_GEN010                 N3PF.                               
      @726    DXCCSR_GEN011                 N3PF.                               
      @729    DXCCSR_GEN012                 N3PF.                               
      @732    DXCCSR_GEN013                 N3PF.                               
      @735    DXCCSR_GEN014                 N3PF.                               
      @738    DXCCSR_GEN015                 N3PF.                               
      @741    DXCCSR_GEN016                 N3PF.                               
      @744    DXCCSR_GEN017                 N3PF.                               
      @747    DXCCSR_GEN018                 N3PF.                               
      @750    DXCCSR_GEN019                 N3PF.                               
      @753    DXCCSR_GEN020                 N3PF.                               
      @756    DXCCSR_GEN021                 N3PF.                               
      @759    DXCCSR_GEN022                 N3PF.                               
      @762    DXCCSR_GEN023                 N3PF.                               
      @765    DXCCSR_GEN024                 N3PF.                               
      @768    DXCCSR_GEN025                 N3PF.                               
      @771    DXCCSR_GEN026                 N3PF.                               
      @774    DXCCSR_INF001                 N3PF.                               
      @777    DXCCSR_INF002                 N3PF.                               
      @780    DXCCSR_INF003                 N3PF.                               
      @783    DXCCSR_INF004                 N3PF.                               
      @786    DXCCSR_INF005                 N3PF.                               
      @789    DXCCSR_INF006                 N3PF.                               
      @792    DXCCSR_INF007                 N3PF.                               
      @795    DXCCSR_INF008                 N3PF.                               
      @798    DXCCSR_INF009                 N3PF.                               
      @801    DXCCSR_INF010                 N3PF.                               
      @804    DXCCSR_INF011                 N3PF.                               
      @807    DXCCSR_INF012                 N3PF.                               
      @810    DXCCSR_INJ001                 N3PF.                               
      @813    DXCCSR_INJ002                 N3PF.                               
      @816    DXCCSR_INJ003                 N3PF.                               
      @819    DXCCSR_INJ004                 N3PF.                               
      @822    DXCCSR_INJ005                 N3PF.                               
      @825    DXCCSR_INJ006                 N3PF.                               
      @828    DXCCSR_INJ007                 N3PF.                               
      @831    DXCCSR_INJ008                 N3PF.                               
      @834    DXCCSR_INJ009                 N3PF.                               
      @837    DXCCSR_INJ010                 N3PF.                               
      @840    DXCCSR_INJ011                 N3PF.                               
      @843    DXCCSR_INJ012                 N3PF.                               
      @846    DXCCSR_INJ013                 N3PF.                               
      @849    DXCCSR_INJ014                 N3PF.                               
      @852    DXCCSR_INJ015                 N3PF.                               
      @855    DXCCSR_INJ016                 N3PF.                               
      @858    DXCCSR_INJ017                 N3PF.                               
      @861    DXCCSR_INJ018                 N3PF.                               
      @864    DXCCSR_INJ019                 N3PF.                               
      @867    DXCCSR_INJ020                 N3PF.                               
      @870    DXCCSR_INJ021                 N3PF.                               
      @873    DXCCSR_INJ022                 N3PF.                               
      @876    DXCCSR_INJ023                 N3PF.                               
      @879    DXCCSR_INJ024                 N3PF.                               
      @882    DXCCSR_INJ025                 N3PF.                               
      @885    DXCCSR_INJ026                 N3PF.                               
      @888    DXCCSR_INJ027                 N3PF.                               
      @891    DXCCSR_INJ028                 N3PF.                               
      @894    DXCCSR_INJ029                 N3PF.                               
      @897    DXCCSR_INJ030                 N3PF.                               
      @900    DXCCSR_INJ031                 N3PF.                               
      @903    DXCCSR_INJ032                 N3PF.                               
      @906    DXCCSR_INJ033                 N3PF.                               
      @909    DXCCSR_INJ034                 N3PF.                               
      @912    DXCCSR_INJ035                 N3PF.                               
      @915    DXCCSR_INJ036                 N3PF.                               
      @918    DXCCSR_INJ037                 N3PF.                               
      @921    DXCCSR_INJ038                 N3PF.                               
      @924    DXCCSR_INJ039                 N3PF.                               
      @927    DXCCSR_INJ040                 N3PF.                               
      @930    DXCCSR_INJ041                 N3PF.                               
      @933    DXCCSR_INJ042                 N3PF.                               
      @936    DXCCSR_INJ043                 N3PF.                               
      @939    DXCCSR_INJ044                 N3PF.                               
      @942    DXCCSR_INJ045                 N3PF.                               
      @945    DXCCSR_INJ046                 N3PF.                               
      @948    DXCCSR_INJ047                 N3PF.                               
      @951    DXCCSR_INJ048                 N3PF.                               
      @954    DXCCSR_INJ049                 N3PF.                               
      @957    DXCCSR_INJ050                 N3PF.                               
      @960    DXCCSR_INJ051                 N3PF.                               
      @963    DXCCSR_INJ052                 N3PF.                               
      @966    DXCCSR_INJ053                 N3PF.                               
      @969    DXCCSR_INJ054                 N3PF.                               
      @972    DXCCSR_INJ055                 N3PF.                               
      @975    DXCCSR_INJ056                 N3PF.                               
      @978    DXCCSR_INJ057                 N3PF.                               
      @981    DXCCSR_INJ058                 N3PF.                               
      @984    DXCCSR_INJ059                 N3PF.                               
      @987    DXCCSR_INJ060                 N3PF.                               
      @990    DXCCSR_INJ061                 N3PF.                               
      @993    DXCCSR_INJ062                 N3PF.                               
      @996    DXCCSR_INJ063                 N3PF.                               
      @999    DXCCSR_INJ064                 N3PF.                               
      @1002   DXCCSR_INJ065                 N3PF.                               
      @1005   DXCCSR_INJ066                 N3PF.                               
      @1008   DXCCSR_INJ067                 N3PF.                               
      @1011   DXCCSR_INJ068                 N3PF.                               
      @1014   DXCCSR_INJ069                 N3PF.                               
      @1017   DXCCSR_INJ070                 N3PF.                               
      @1020   DXCCSR_INJ071                 N3PF.                               
      @1023   DXCCSR_INJ072                 N3PF.                               
      @1026   DXCCSR_INJ073                 N3PF.                               
      @1029   DXCCSR_INJ074                 N3PF.                               
      @1032   DXCCSR_INJ075                 N3PF.                               
      @1035   DXCCSR_INJ076                 N3PF.                               
      @1038   DXCCSR_MAL001                 N3PF.                               
      @1041   DXCCSR_MAL002                 N3PF.                               
      @1044   DXCCSR_MAL003                 N3PF.                               
      @1047   DXCCSR_MAL004                 N3PF.                               
      @1050   DXCCSR_MAL005                 N3PF.                               
      @1053   DXCCSR_MAL006                 N3PF.                               
      @1056   DXCCSR_MAL007                 N3PF.                               
      @1059   DXCCSR_MAL008                 N3PF.                               
      @1062   DXCCSR_MAL009                 N3PF.                               
      @1065   DXCCSR_MAL010                 N3PF.                               
      @1068   DXCCSR_MBD001                 N3PF.                               
      @1071   DXCCSR_MBD002                 N3PF.                               
      @1074   DXCCSR_MBD003                 N3PF.                               
      @1077   DXCCSR_MBD004                 N3PF.                               
      @1080   DXCCSR_MBD005                 N3PF.                               
      @1083   DXCCSR_MBD006                 N3PF.                               
      @1086   DXCCSR_MBD007                 N3PF.                               
      @1089   DXCCSR_MBD008                 N3PF.                               
      @1092   DXCCSR_MBD009                 N3PF.                               
      @1095   DXCCSR_MBD010                 N3PF.                               
      @1098   DXCCSR_MBD011                 N3PF.                               
      @1101   DXCCSR_MBD012                 N3PF.                               
      @1104   DXCCSR_MBD013                 N3PF.                               
      @1107   DXCCSR_MBD014                 N3PF.                               
      @1110   DXCCSR_MBD017                 N3PF.                               
      @1113   DXCCSR_MBD018                 N3PF.                               
      @1116   DXCCSR_MBD019                 N3PF.                               
      @1119   DXCCSR_MBD020                 N3PF.                               
      @1122   DXCCSR_MBD021                 N3PF.                               
      @1125   DXCCSR_MBD022                 N3PF.                               
      @1128   DXCCSR_MBD023                 N3PF.                               
      @1131   DXCCSR_MBD024                 N3PF.                               
      @1134   DXCCSR_MBD025                 N3PF.                               
      @1137   DXCCSR_MBD026                 N3PF.                               
      @1140   DXCCSR_MBD027                 N3PF.                               
      @1143   DXCCSR_MBD028                 N3PF.                               
      @1146   DXCCSR_MBD029                 N3PF.                               
      @1149   DXCCSR_MBD030                 N3PF.                               
      @1152   DXCCSR_MBD031                 N3PF.                               
      @1155   DXCCSR_MBD032                 N3PF.                               
      @1158   DXCCSR_MBD033                 N3PF.                               
      @1161   DXCCSR_MBD034                 N3PF.                               
      @1164   DXCCSR_MUS001                 N3PF.                               
      @1167   DXCCSR_MUS002                 N3PF.                               
      @1170   DXCCSR_MUS003                 N3PF.                               
      @1173   DXCCSR_MUS004                 N3PF.                               
      @1176   DXCCSR_MUS005                 N3PF.                               
      @1179   DXCCSR_MUS006                 N3PF.                               
      @1182   DXCCSR_MUS007                 N3PF.                               
      @1185   DXCCSR_MUS008                 N3PF.                               
      @1188   DXCCSR_MUS009                 N3PF.                               
      @1191   DXCCSR_MUS010                 N3PF.                               
      @1194   DXCCSR_MUS011                 N3PF.                               
      @1197   DXCCSR_MUS012                 N3PF.                               
      @1200   DXCCSR_MUS013                 N3PF.                               
      @1203   DXCCSR_MUS014                 N3PF.                               
      @1206   DXCCSR_MUS015                 N3PF.                               
      @1209   DXCCSR_MUS016                 N3PF.                               
      @1212   DXCCSR_MUS017                 N3PF.                               
      @1215   DXCCSR_MUS018                 N3PF.                               
      @1218   DXCCSR_MUS019                 N3PF.                               
      @1221   DXCCSR_MUS020                 N3PF.                               
      @1224   DXCCSR_MUS021                 N3PF.                               
      @1227   DXCCSR_MUS022                 N3PF.                               
      @1230   DXCCSR_MUS023                 N3PF.                               
      @1233   DXCCSR_MUS024                 N3PF.                               
      @1236   DXCCSR_MUS025                 N3PF.                               
      @1239   DXCCSR_MUS026                 N3PF.                               
      @1242   DXCCSR_MUS027                 N3PF.                               
      @1245   DXCCSR_MUS028                 N3PF.                               
      @1248   DXCCSR_MUS029                 N3PF.                               
      @1251   DXCCSR_MUS030                 N3PF.                               
      @1254   DXCCSR_MUS031                 N3PF.                               
      @1257   DXCCSR_MUS032                 N3PF.                               
      @1260   DXCCSR_MUS033                 N3PF.                               
      @1263   DXCCSR_MUS034                 N3PF.                               
      @1266   DXCCSR_MUS035                 N3PF.                               
      @1269   DXCCSR_MUS036                 N3PF.                               
      @1272   DXCCSR_MUS037                 N3PF.                               
      @1275   DXCCSR_MUS038                 N3PF.                               
      @1278   DXCCSR_NEO001                 N3PF.                               
      @1281   DXCCSR_NEO002                 N3PF.                               
      @1284   DXCCSR_NEO003                 N3PF.                               
      @1287   DXCCSR_NEO004                 N3PF.                               
      @1290   DXCCSR_NEO005                 N3PF.                               
      @1293   DXCCSR_NEO006                 N3PF.                               
      @1296   DXCCSR_NEO007                 N3PF.                               
      @1299   DXCCSR_NEO008                 N3PF.                               
      @1302   DXCCSR_NEO009                 N3PF.                               
      @1305   DXCCSR_NEO010                 N3PF.                               
      @1308   DXCCSR_NEO011                 N3PF.                               
      @1311   DXCCSR_NEO012                 N3PF.                               
      @1314   DXCCSR_NEO013                 N3PF.                               
      @1317   DXCCSR_NEO014                 N3PF.                               
      @1320   DXCCSR_NEO015                 N3PF.                               
      @1323   DXCCSR_NEO016                 N3PF.                               
      @1326   DXCCSR_NEO017                 N3PF.                               
      @1329   DXCCSR_NEO018                 N3PF.                               
      @1332   DXCCSR_NEO019                 N3PF.                               
      @1335   DXCCSR_NEO020                 N3PF.                               
      @1338   DXCCSR_NEO021                 N3PF.                               
      @1341   DXCCSR_NEO022                 N3PF.                               
      @1344   DXCCSR_NEO023                 N3PF.                               
      @1347   DXCCSR_NEO024                 N3PF.                               
      @1350   DXCCSR_NEO025                 N3PF.                               
      @1353   DXCCSR_NEO026                 N3PF.                               
      @1356   DXCCSR_NEO027                 N3PF.                               
      @1359   DXCCSR_NEO028                 N3PF.                               
      @1362   DXCCSR_NEO029                 N3PF.                               
      @1365   DXCCSR_NEO030                 N3PF.                               
      @1368   DXCCSR_NEO031                 N3PF.                               
      @1371   DXCCSR_NEO032                 N3PF.                               
      @1374   DXCCSR_NEO033                 N3PF.                               
      @1377   DXCCSR_NEO034                 N3PF.                               
      @1380   DXCCSR_NEO035                 N3PF.                               
      @1383   DXCCSR_NEO036                 N3PF.                               
      @1386   DXCCSR_NEO037                 N3PF.                               
      @1389   DXCCSR_NEO038                 N3PF.                               
      @1392   DXCCSR_NEO039                 N3PF.                               
      @1395   DXCCSR_NEO040                 N3PF.                               
      @1398   DXCCSR_NEO041                 N3PF.                               
      @1401   DXCCSR_NEO042                 N3PF.                               
      @1404   DXCCSR_NEO043                 N3PF.                               
      @1407   DXCCSR_NEO044                 N3PF.                               
      @1410   DXCCSR_NEO045                 N3PF.                               
      @1413   DXCCSR_NEO046                 N3PF.                               
      @1416   DXCCSR_NEO047                 N3PF.                               
      @1419   DXCCSR_NEO048                 N3PF.                               
      @1422   DXCCSR_NEO049                 N3PF.                               
      @1425   DXCCSR_NEO050                 N3PF.                               
      @1428   DXCCSR_NEO051                 N3PF.                               
      @1431   DXCCSR_NEO052                 N3PF.                               
      @1434   DXCCSR_NEO053                 N3PF.                               
      @1437   DXCCSR_NEO054                 N3PF.                               
      @1440   DXCCSR_NEO055                 N3PF.                               
      @1443   DXCCSR_NEO056                 N3PF.                               
      @1446   DXCCSR_NEO057                 N3PF.                               
      @1449   DXCCSR_NEO058                 N3PF.                               
      @1452   DXCCSR_NEO059                 N3PF.                               
      @1455   DXCCSR_NEO060                 N3PF.                               
      @1458   DXCCSR_NEO061                 N3PF.                               
      @1461   DXCCSR_NEO062                 N3PF.                               
      @1464   DXCCSR_NEO063                 N3PF.                               
      @1467   DXCCSR_NEO064                 N3PF.                               
      @1470   DXCCSR_NEO065                 N3PF.                               
      @1473   DXCCSR_NEO066                 N3PF.                               
      @1476   DXCCSR_NEO067                 N3PF.                               
      @1479   DXCCSR_NEO068                 N3PF.                               
      @1482   DXCCSR_NEO069                 N3PF.                               
      @1485   DXCCSR_NEO070                 N3PF.                               
      @1488   DXCCSR_NEO071                 N3PF.                               
      @1491   DXCCSR_NEO072                 N3PF.                               
      @1494   DXCCSR_NEO073                 N3PF.                               
      @1497   DXCCSR_NEO074                 N3PF.                               
      @1500   DXCCSR_NVS001                 N3PF.                               
      @1503   DXCCSR_NVS002                 N3PF.                               
      @1506   DXCCSR_NVS003                 N3PF.                               
      @1509   DXCCSR_NVS004                 N3PF.                               
      @1512   DXCCSR_NVS005                 N3PF.                               
      @1515   DXCCSR_NVS006                 N3PF.                               
      @1518   DXCCSR_NVS007                 N3PF.                               
      @1521   DXCCSR_NVS008                 N3PF.                               
      @1524   DXCCSR_NVS009                 N3PF.                               
      @1527   DXCCSR_NVS010                 N3PF.                               
      @1530   DXCCSR_NVS011                 N3PF.                               
      @1533   DXCCSR_NVS012                 N3PF.                               
      @1536   DXCCSR_NVS013                 N3PF.                               
      @1539   DXCCSR_NVS014                 N3PF.                               
      @1542   DXCCSR_NVS015                 N3PF.                               
      @1545   DXCCSR_NVS016                 N3PF.                               
      @1548   DXCCSR_NVS017                 N3PF.                               
      @1551   DXCCSR_NVS018                 N3PF.                               
      @1554   DXCCSR_NVS019                 N3PF.                               
      @1557   DXCCSR_NVS020                 N3PF.                               
      @1560   DXCCSR_NVS021                 N3PF.                               
      @1563   DXCCSR_NVS022                 N3PF.                               
      @1566   DXCCSR_PNL001                 N3PF.                               
      @1569   DXCCSR_PNL002                 N3PF.                               
      @1572   DXCCSR_PNL003                 N3PF.                               
      @1575   DXCCSR_PNL004                 N3PF.                               
      @1578   DXCCSR_PNL005                 N3PF.                               
      @1581   DXCCSR_PNL006                 N3PF.                               
      @1584   DXCCSR_PNL007                 N3PF.                               
      @1587   DXCCSR_PNL008                 N3PF.                               
      @1590   DXCCSR_PNL009                 N3PF.                               
      @1593   DXCCSR_PNL010                 N3PF.                               
      @1596   DXCCSR_PNL011                 N3PF.                               
      @1599   DXCCSR_PNL012                 N3PF.                               
      @1602   DXCCSR_PNL013                 N3PF.                               
      @1605   DXCCSR_PNL014                 N3PF.                               
      @1608   DXCCSR_PNL015                 N3PF.                               
      @1611   DXCCSR_PRG001                 N3PF.                               
      @1614   DXCCSR_PRG002                 N3PF.                               
      @1617   DXCCSR_PRG003                 N3PF.                               
      @1620   DXCCSR_PRG004                 N3PF.                               
      @1623   DXCCSR_PRG005                 N3PF.                               
      @1626   DXCCSR_PRG006                 N3PF.                               
      @1629   DXCCSR_PRG007                 N3PF.                               
      @1632   DXCCSR_PRG008                 N3PF.                               
      @1635   DXCCSR_PRG009                 N3PF.                               
      @1638   DXCCSR_PRG010                 N3PF.                               
      @1641   DXCCSR_PRG011                 N3PF.                               
      @1644   DXCCSR_PRG012                 N3PF.                               
      @1647   DXCCSR_PRG013                 N3PF.                               
      @1650   DXCCSR_PRG014                 N3PF.                               
      @1653   DXCCSR_PRG015                 N3PF.                               
      @1656   DXCCSR_PRG016                 N3PF.                               
      @1659   DXCCSR_PRG017                 N3PF.                               
      @1662   DXCCSR_PRG018                 N3PF.                               
      @1665   DXCCSR_PRG019                 N3PF.                               
      @1668   DXCCSR_PRG020                 N3PF.                               
      @1671   DXCCSR_PRG021                 N3PF.                               
      @1674   DXCCSR_PRG022                 N3PF.                               
      @1677   DXCCSR_PRG023                 N3PF.                               
      @1680   DXCCSR_PRG024                 N3PF.                               
      @1683   DXCCSR_PRG025                 N3PF.                               
      @1686   DXCCSR_PRG026                 N3PF.                               
      @1689   DXCCSR_PRG027                 N3PF.                               
      @1692   DXCCSR_PRG028                 N3PF.                               
      @1695   DXCCSR_PRG029                 N3PF.                               
      @1698   DXCCSR_PRG030                 N3PF.                               
      @1701   DXCCSR_RSP001                 N3PF.                               
      @1704   DXCCSR_RSP002                 N3PF.                               
      @1707   DXCCSR_RSP003                 N3PF.                               
      @1710   DXCCSR_RSP004                 N3PF.                               
      @1713   DXCCSR_RSP005                 N3PF.                               
      @1716   DXCCSR_RSP006                 N3PF.                               
      @1719   DXCCSR_RSP007                 N3PF.                               
      @1722   DXCCSR_RSP008                 N3PF.                               
      @1725   DXCCSR_RSP009                 N3PF.                               
      @1728   DXCCSR_RSP010                 N3PF.                               
      @1731   DXCCSR_RSP011                 N3PF.                               
      @1734   DXCCSR_RSP012                 N3PF.                               
      @1737   DXCCSR_RSP013                 N3PF.                               
      @1740   DXCCSR_RSP014                 N3PF.                               
      @1743   DXCCSR_RSP015                 N3PF.                               
      @1746   DXCCSR_RSP016                 N3PF.                               
      @1749   DXCCSR_RSP017                 N3PF.                               
      @1752   DXCCSR_SKN001                 N3PF.                               
      @1755   DXCCSR_SKN002                 N3PF.                               
      @1758   DXCCSR_SKN003                 N3PF.                               
      @1761   DXCCSR_SKN004                 N3PF.                               
      @1764   DXCCSR_SKN005                 N3PF.                               
      @1767   DXCCSR_SKN006                 N3PF.                               
      @1770   DXCCSR_SKN007                 N3PF.                               
      @1773   DXCCSR_SYM001                 N3PF.                               
      @1776   DXCCSR_SYM002                 N3PF.                               
      @1779   DXCCSR_SYM003                 N3PF.                               
      @1782   DXCCSR_SYM004                 N3PF.                               
      @1785   DXCCSR_SYM005                 N3PF.                               
      @1788   DXCCSR_SYM006                 N3PF.                               
      @1791   DXCCSR_SYM007                 N3PF.                               
      @1794   DXCCSR_SYM008                 N3PF.                               
      @1797   DXCCSR_SYM009                 N3PF.                               
      @1800   DXCCSR_SYM010                 N3PF.                               
      @1803   DXCCSR_SYM011                 N3PF.                               
      @1806   DXCCSR_SYM012                 N3PF.                               
      @1809   DXCCSR_SYM013                 N3PF.                               
      @1812   DXCCSR_SYM014                 N3PF.                               
      @1815   DXCCSR_SYM015                 N3PF.                               
      @1818   DXCCSR_SYM016                 N3PF.                               
      @1821   DXCCSR_SYM017                 N3PF.                               
      @1824   DXCCSR_VERSION                $CHAR6.                             
      @1830   PRCCSR_ADM001                 N3PF.                               
      @1833   PRCCSR_ADM002                 N3PF.                               
      @1836   PRCCSR_ADM003                 N3PF.                               
      @1839   PRCCSR_ADM004                 N3PF.                               
      @1842   PRCCSR_ADM005                 N3PF.                               
      @1845   PRCCSR_ADM006                 N3PF.                               
      @1848   PRCCSR_ADM007                 N3PF.                               
      @1851   PRCCSR_ADM008                 N3PF.                               
      @1854   PRCCSR_ADM009                 N3PF.                               
      @1857   PRCCSR_ADM010                 N3PF.                               
      @1860   PRCCSR_ADM011                 N3PF.                               
      @1863   PRCCSR_ADM012                 N3PF.                               
      @1866   PRCCSR_ADM013                 N3PF.                               
      @1869   PRCCSR_ADM014                 N3PF.                               
      @1872   PRCCSR_ADM015                 N3PF.                               
      @1875   PRCCSR_ADM016                 N3PF.                               
      @1878   PRCCSR_ADM017                 N3PF.                               
      @1881   PRCCSR_ADM018                 N3PF.                               
      @1884   PRCCSR_ADM019                 N3PF.                               
      @1887   PRCCSR_ADM020                 N3PF.                               
      @1890   PRCCSR_ADM021                 N3PF.                               
      @1893   PRCCSR_CAR001                 N3PF.                               
      @1896   PRCCSR_CAR002                 N3PF.                               
      @1899   PRCCSR_CAR003                 N3PF.                               
      @1902   PRCCSR_CAR004                 N3PF.                               
      @1905   PRCCSR_CAR005                 N3PF.                               
      @1908   PRCCSR_CAR006                 N3PF.                               
      @1911   PRCCSR_CAR007                 N3PF.                               
      @1914   PRCCSR_CAR008                 N3PF.                               
      @1917   PRCCSR_CAR009                 N3PF.                               
      @1920   PRCCSR_CAR010                 N3PF.                               
      @1923   PRCCSR_CAR011                 N3PF.                               
      @1926   PRCCSR_CAR012                 N3PF.                               
      @1929   PRCCSR_CAR013                 N3PF.                               
      @1932   PRCCSR_CAR014                 N3PF.                               
      @1935   PRCCSR_CAR015                 N3PF.                               
      @1938   PRCCSR_CAR016                 N3PF.                               
      @1941   PRCCSR_CAR017                 N3PF.                               
      @1944   PRCCSR_CAR018                 N3PF.                               
      @1947   PRCCSR_CAR019                 N3PF.                               
      @1950   PRCCSR_CAR020                 N3PF.                               
      @1953   PRCCSR_CAR021                 N3PF.                               
      @1956   PRCCSR_CAR022                 N3PF.                               
      @1959   PRCCSR_CAR023                 N3PF.                               
      @1962   PRCCSR_CAR024                 N3PF.                               
      @1965   PRCCSR_CAR025                 N3PF.                               
      @1968   PRCCSR_CAR026                 N3PF.                               
      @1971   PRCCSR_CAR027                 N3PF.                               
      @1974   PRCCSR_CAR028                 N3PF.                               
      @1977   PRCCSR_CAR029                 N3PF.                               
      @1980   PRCCSR_CHP001                 N3PF.                               
      @1983   PRCCSR_CNS001                 N3PF.                               
      @1986   PRCCSR_CNS002                 N3PF.                               
      @1989   PRCCSR_CNS003                 N3PF.                               
      @1992   PRCCSR_CNS004                 N3PF.                               
      @1995   PRCCSR_CNS005                 N3PF.                               
      @1998   PRCCSR_CNS006                 N3PF.                               
      @2001   PRCCSR_CNS007                 N3PF.                               
      @2004   PRCCSR_CNS008                 N3PF.                               
      @2007   PRCCSR_CNS009                 N3PF.                               
      @2010   PRCCSR_CNS010                 N3PF.                               
      @2013   PRCCSR_CNS011                 N3PF.                               
      @2016   PRCCSR_CNS012                 N3PF.                               
      @2019   PRCCSR_CNS013                 N3PF.                               
      @2022   PRCCSR_CNS014                 N3PF.                               
      @2025   PRCCSR_ENP001                 N3PF.                               
      @2028   PRCCSR_ENP002                 N3PF.                               
      @2031   PRCCSR_ENP003                 N3PF.                               
      @2034   PRCCSR_ENP004                 N3PF.                               
      @2037   PRCCSR_ENP005                 N3PF.                               
      @2040   PRCCSR_ENP006                 N3PF.                               
      @2043   PRCCSR_ENT001                 N3PF.                               
      @2046   PRCCSR_ENT002                 N3PF.                               
      @2049   PRCCSR_ENT003                 N3PF.                               
      @2052   PRCCSR_ENT004                 N3PF.                               
      @2055   PRCCSR_ENT005                 N3PF.                               
      @2058   PRCCSR_ENT006                 N3PF.                               
      @2061   PRCCSR_ENT007                 N3PF.                               
      @2064   PRCCSR_ENT008                 N3PF.                               
      @2067   PRCCSR_ENT009                 N3PF.                               
      @2070   PRCCSR_ENT010                 N3PF.                               
      @2073   PRCCSR_ENT011                 N3PF.                               
      @2076   PRCCSR_ENT012                 N3PF.                               
      @2079   PRCCSR_ENT013                 N3PF.                               
      @2082   PRCCSR_ENT014                 N3PF.                               
      @2085   PRCCSR_ENT015                 N3PF.                               
      @2088   PRCCSR_ENT016                 N3PF.                               
      @2091   PRCCSR_ENT017                 N3PF.                               
      @2094   PRCCSR_ESA001                 N3PF.                               
      @2097   PRCCSR_ESA002                 N3PF.                               
      @2100   PRCCSR_ESA003                 N3PF.                               
      @2103   PRCCSR_ESA004                 N3PF.                               
      @2106   PRCCSR_ESA005                 N3PF.                               
      @2109   PRCCSR_ESA006                 N3PF.                               
      @2112   PRCCSR_ESA007                 N3PF.                               
      @2115   PRCCSR_ESA008                 N3PF.                               
      @2118   PRCCSR_ESA009                 N3PF.                               
      @2121   PRCCSR_ESA010                 N3PF.                               
      @2124   PRCCSR_ESA011                 N3PF.                               
      @2127   PRCCSR_EST001                 N3PF.                               
      @2130   PRCCSR_EST002                 N3PF.                               
      @2133   PRCCSR_EST003                 N3PF.                               
      @2136   PRCCSR_EST004                 N3PF.                               
      @2139   PRCCSR_EST005                 N3PF.                               
      @2142   PRCCSR_EYP001                 N3PF.                               
      @2145   PRCCSR_EYP002                 N3PF.                               
      @2148   PRCCSR_FRS001                 N3PF.                               
      @2151   PRCCSR_FRS002                 N3PF.                               
      @2154   PRCCSR_FRS003                 N3PF.                               
      @2157   PRCCSR_FRS004                 N3PF.                               
      @2160   PRCCSR_FRS005                 N3PF.                               
      @2163   PRCCSR_FRS006                 N3PF.                               
      @2166   PRCCSR_FRS007                 N3PF.                               
      @2169   PRCCSR_FRS008                 N3PF.                               
      @2172   PRCCSR_FRS009                 N3PF.                               
      @2175   PRCCSR_FRS010                 N3PF.                               
      @2178   PRCCSR_FRS011                 N3PF.                               
      @2181   PRCCSR_FRS012                 N3PF.                               
      @2184   PRCCSR_FRS013                 N3PF.                               
      @2187   PRCCSR_FRS014                 N3PF.                               
      @2190   PRCCSR_FRS015                 N3PF.                               
      @2193   PRCCSR_GIS001                 N3PF.                               
      @2196   PRCCSR_GIS002                 N3PF.                               
      @2199   PRCCSR_GIS003                 N3PF.                               
      @2202   PRCCSR_GIS004                 N3PF.                               
      @2205   PRCCSR_GIS005                 N3PF.                               
      @2208   PRCCSR_GIS006                 N3PF.                               
      @2211   PRCCSR_GIS007                 N3PF.                               
      @2214   PRCCSR_GIS008                 N3PF.                               
      @2217   PRCCSR_GIS009                 N3PF.                               
      @2220   PRCCSR_GIS010                 N3PF.                               
      @2223   PRCCSR_GIS011                 N3PF.                               
      @2226   PRCCSR_GIS012                 N3PF.                               
      @2229   PRCCSR_GIS013                 N3PF.                               
      @2232   PRCCSR_GIS014                 N3PF.                               
      @2235   PRCCSR_GIS015                 N3PF.                               
      @2238   PRCCSR_GIS016                 N3PF.                               
      @2241   PRCCSR_GIS017                 N3PF.                               
      @2244   PRCCSR_GIS018                 N3PF.                               
      @2247   PRCCSR_GIS019                 N3PF.                               
      @2250   PRCCSR_GIS020                 N3PF.                               
      @2253   PRCCSR_GIS021                 N3PF.                               
      @2256   PRCCSR_GIS022                 N3PF.                               
      @2259   PRCCSR_GIS023                 N3PF.                               
      @2262   PRCCSR_GIS024                 N3PF.                               
      @2265   PRCCSR_GIS025                 N3PF.                               
      @2268   PRCCSR_GIS026                 N3PF.                               
      @2271   PRCCSR_GIS027                 N3PF.                               
      @2274   PRCCSR_GIS028                 N3PF.                               
      @2277   PRCCSR_GIS029                 N3PF.                               
      @2280   PRCCSR_GNR001                 N3PF.                               
      @2283   PRCCSR_GNR002                 N3PF.                               
      @2286   PRCCSR_GNR003                 N3PF.                               
      @2289   PRCCSR_GNR004                 N3PF.                               
      @2292   PRCCSR_GNR005                 N3PF.                               
      @2295   PRCCSR_GNR006                 N3PF.                               
      @2298   PRCCSR_GNR007                 N3PF.                               
      @2301   PRCCSR_GNR008                 N3PF.                               
      @2304   PRCCSR_GNR009                 N3PF.                               
      @2307   PRCCSR_GNR010                 N3PF.                               
      @2310   PRCCSR_HEP001                 N3PF.                               
      @2313   PRCCSR_HEP002                 N3PF.                               
      @2316   PRCCSR_HEP003                 N3PF.                               
      @2319   PRCCSR_HEP004                 N3PF.                               
      @2322   PRCCSR_HEP005                 N3PF.                               
      @2325   PRCCSR_HEP006                 N3PF.                               
      @2328   PRCCSR_HEP007                 N3PF.                               
      @2331   PRCCSR_HEP008                 N3PF.                               
      @2334   PRCCSR_HEP009                 N3PF.                               
      @2337   PRCCSR_HEP010                 N3PF.                               
      @2340   PRCCSR_HEP011                 N3PF.                               
      @2343   PRCCSR_HEP012                 N3PF.                               
      @2346   PRCCSR_HEP013                 N3PF.                               
      @2349   PRCCSR_IMG001                 N3PF.                               
      @2352   PRCCSR_IMG002                 N3PF.                               
      @2355   PRCCSR_IMG003                 N3PF.                               
      @2358   PRCCSR_IMG004                 N3PF.                               
      @2361   PRCCSR_IMG005                 N3PF.                               
      @2364   PRCCSR_IMG006                 N3PF.                               
      @2367   PRCCSR_IMG007                 N3PF.                               
      @2370   PRCCSR_IMG008                 N3PF.                               
      @2373   PRCCSR_IMG009                 N3PF.                               
      @2376   PRCCSR_IMG010                 N3PF.                               
      @2379   PRCCSR_LYM001                 N3PF.                               
      @2382   PRCCSR_LYM002                 N3PF.                               
      @2385   PRCCSR_LYM003                 N3PF.                               
      @2388   PRCCSR_LYM004                 N3PF.                               
      @2391   PRCCSR_LYM005                 N3PF.                               
      @2394   PRCCSR_LYM006                 N3PF.                               
      @2397   PRCCSR_LYM007                 N3PF.                               
      @2400   PRCCSR_LYM008                 N3PF.                               
      @2403   PRCCSR_LYM009                 N3PF.                               
      @2406   PRCCSR_LYM010                 N3PF.                               
      @2409   PRCCSR_LYM011                 N3PF.                               
      @2412   PRCCSR_MAM001                 N3PF.                               
      @2415   PRCCSR_MAM002                 N3PF.                               
      @2418   PRCCSR_MAM003                 N3PF.                               
      @2421   PRCCSR_MAM004                 N3PF.                               
      @2424   PRCCSR_MAM005                 N3PF.                               
      @2427   PRCCSR_MAM006                 N3PF.                               
      @2430   PRCCSR_MAM007                 N3PF.                               
      @2433   PRCCSR_MAM008                 N3PF.                               
      @2436   PRCCSR_MAM009                 N3PF.                               
      @2439   PRCCSR_MAM010                 N3PF.                               
      @2442   PRCCSR_MAM011                 N3PF.                               
      @2445   PRCCSR_MAM012                 N3PF.                               
      @2448   PRCCSR_MAM013                 N3PF.                               
      @2451   PRCCSR_MAM014                 N3PF.                               
      @2454   PRCCSR_MAM015                 N3PF.                               
      @2457   PRCCSR_MHT001                 N3PF.                               
      @2460   PRCCSR_MHT002                 N3PF.                               
      @2463   PRCCSR_MHT003                 N3PF.                               
      @2466   PRCCSR_MHT004                 N3PF.                               
      @2469   PRCCSR_MHT005                 N3PF.                               
      @2472   PRCCSR_MRS001                 N3PF.                               
      @2475   PRCCSR_MRS002                 N3PF.                               
      @2478   PRCCSR_MRS003                 N3PF.                               
      @2481   PRCCSR_MRS004                 N3PF.                               
      @2484   PRCCSR_MRS005                 N3PF.                               
      @2487   PRCCSR_MRS006                 N3PF.                               
      @2490   PRCCSR_MRS007                 N3PF.                               
      @2493   PRCCSR_MST001                 N3PF.                               
      @2496   PRCCSR_MST002                 N3PF.                               
      @2499   PRCCSR_MST003                 N3PF.                               
      @2502   PRCCSR_MST004                 N3PF.                               
      @2505   PRCCSR_MST005                 N3PF.                               
      @2508   PRCCSR_MST006                 N3PF.                               
      @2511   PRCCSR_MST007                 N3PF.                               
      @2514   PRCCSR_MST008                 N3PF.                               
      @2517   PRCCSR_MST009                 N3PF.                               
      @2520   PRCCSR_MST010                 N3PF.                               
      @2523   PRCCSR_MST011                 N3PF.                               
      @2526   PRCCSR_MST012                 N3PF.                               
      @2529   PRCCSR_MST013                 N3PF.                               
      @2532   PRCCSR_MST014                 N3PF.                               
      @2535   PRCCSR_MST015                 N3PF.                               
      @2538   PRCCSR_MST016                 N3PF.                               
      @2541   PRCCSR_MST017                 N3PF.                               
      @2544   PRCCSR_MST018                 N3PF.                               
      @2547   PRCCSR_MST019                 N3PF.                               
      @2550   PRCCSR_MST020                 N3PF.                               
      @2553   PRCCSR_MST021                 N3PF.                               
      @2556   PRCCSR_MST022                 N3PF.                               
      @2559   PRCCSR_MST023                 N3PF.                               
      @2562   PRCCSR_MST024                 N3PF.                               
      @2565   PRCCSR_MST025                 N3PF.                               
      @2568   PRCCSR_MST026                 N3PF.                               
      @2571   PRCCSR_MST027                 N3PF.                               
      @2574   PRCCSR_MST028                 N3PF.                               
      @2577   PRCCSR_MST029                 N3PF.                               
      @2580   PRCCSR_MST030                 N3PF.                               
      @2583   PRCCSR_NCM001                 N3PF.                               
      @2586   PRCCSR_NCM002                 N3PF.                               
      @2589   PRCCSR_NCM003                 N3PF.                               
      @2592   PRCCSR_NCM004                 N3PF.                               
      @2595   PRCCSR_OST001                 N3PF.                               
      @2598   PRCCSR_OTR001                 N3PF.                               
      @2601   PRCCSR_OTR002                 N3PF.                               
      @2604   PRCCSR_OTR003                 N3PF.                               
      @2607   PRCCSR_OTR004                 N3PF.                               
      @2610   PRCCSR_OTR005                 N3PF.                               
      @2613   PRCCSR_PGN001                 N3PF.                               
      @2616   PRCCSR_PGN002                 N3PF.                               
      @2619   PRCCSR_PGN003                 N3PF.                               
      @2622   PRCCSR_PGN004                 N3PF.                               
      @2625   PRCCSR_PGN005                 N3PF.                               
      @2628   PRCCSR_PGN006                 N3PF.                               
      @2631   PRCCSR_PGN007                 N3PF.                               
      @2634   PRCCSR_PGN008                 N3PF.                               
      @2637   PRCCSR_PGN009                 N3PF.                               
      @2640   PRCCSR_PLC001                 N3PF.                               
      @2643   PRCCSR_PLC002                 N3PF.                               
      @2646   PRCCSR_PNS001                 N3PF.                               
      @2649   PRCCSR_PNS002                 N3PF.                               
      @2652   PRCCSR_PNS003                 N3PF.                               
      @2655   PRCCSR_PNS004                 N3PF.                               
      @2658   PRCCSR_PNS005                 N3PF.                               
      @2661   PRCCSR_PNS006                 N3PF.                               
      @2664   PRCCSR_RAD001                 N3PF.                               
      @2667   PRCCSR_RAD002                 N3PF.                               
      @2670   PRCCSR_RAD003                 N3PF.                               
      @2673   PRCCSR_RAD004                 N3PF.                               
      @2676   PRCCSR_RES001                 N3PF.                               
      @2679   PRCCSR_RES002                 N3PF.                               
      @2682   PRCCSR_RES003                 N3PF.                               
      @2685   PRCCSR_RES004                 N3PF.                               
      @2688   PRCCSR_RES005                 N3PF.                               
      @2691   PRCCSR_RES006                 N3PF.                               
      @2694   PRCCSR_RES007                 N3PF.                               
      @2697   PRCCSR_RES008                 N3PF.                               
      @2700   PRCCSR_RES009                 N3PF.                               
      @2703   PRCCSR_RES010                 N3PF.                               
      @2706   PRCCSR_RES011                 N3PF.                               
      @2709   PRCCSR_RES012                 N3PF.                               
      @2712   PRCCSR_RES013                 N3PF.                               
      @2715   PRCCSR_RES014                 N3PF.                               
      @2718   PRCCSR_RHB001                 N3PF.                               
      @2721   PRCCSR_RHB002                 N3PF.                               
      @2724   PRCCSR_RHB003                 N3PF.                               
      @2727   PRCCSR_RHB004                 N3PF.                               
      @2730   PRCCSR_SKB001                 N3PF.                               
      @2733   PRCCSR_SKB002                 N3PF.                               
      @2736   PRCCSR_SKB003                 N3PF.                               
      @2739   PRCCSR_SKB004                 N3PF.                               
      @2742   PRCCSR_SKB005                 N3PF.                               
      @2745   PRCCSR_SKB006                 N3PF.                               
      @2748   PRCCSR_SKB007                 N3PF.                               
      @2751   PRCCSR_SKB008                 N3PF.                               
      @2754   PRCCSR_SKB009                 N3PF.                               
      @2757   PRCCSR_SKB010                 N3PF.                               
      @2760   PRCCSR_SUD001                 N3PF.                               
      @2763   PRCCSR_SUD002                 N3PF.                               
      @2766   PRCCSR_SUD003                 N3PF.                               
      @2769   PRCCSR_SUD004                 N3PF.                               
      @2772   PRCCSR_URN001                 N3PF.                               
      @2775   PRCCSR_URN002                 N3PF.                               
      @2778   PRCCSR_URN003                 N3PF.                               
      @2781   PRCCSR_URN004                 N3PF.                               
      @2784   PRCCSR_URN005                 N3PF.                               
      @2787   PRCCSR_URN006                 N3PF.                               
      @2790   PRCCSR_URN007                 N3PF.                               
      @2793   PRCCSR_URN008                 N3PF.                               
      @2796   PRCCSR_URN009                 N3PF.                               
      @2799   PRCCSR_URN010                 N3PF.                               
      @2802   PRCCSR_URN011                 N3PF.                               
      @2805   PRCCSR_URN012                 N3PF.                               
      @2808   PRCCSR_VERSION                $CHAR6.                             
      ;                                                                         
                                                                                
                                                                                
RUN;
