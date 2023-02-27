/*******************************************************************            
* Creation Date: 03/14/2022                                                     
*   NC_SID_2020_DX_PR_GRPS.SAS:                                                 
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
DATA NC_SIDC_2020_DX_PR_GRPS;                                                   
INFILE 'NC_SID_2020_DX_PR_GRPS.ASC' FIRSTOBS=3 LRECL = 2793;                    
                                                                                
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
      @178    DXCCSR_Default_DX1            $CHAR6.                             
      @184    DXCCSR_BLD001                 N3PF.                               
      @187    DXCCSR_BLD002                 N3PF.                               
      @190    DXCCSR_BLD003                 N3PF.                               
      @193    DXCCSR_BLD004                 N3PF.                               
      @196    DXCCSR_BLD005                 N3PF.                               
      @199    DXCCSR_BLD006                 N3PF.                               
      @202    DXCCSR_BLD007                 N3PF.                               
      @205    DXCCSR_BLD008                 N3PF.                               
      @208    DXCCSR_BLD009                 N3PF.                               
      @211    DXCCSR_BLD010                 N3PF.                               
      @214    DXCCSR_CIR001                 N3PF.                               
      @217    DXCCSR_CIR002                 N3PF.                               
      @220    DXCCSR_CIR003                 N3PF.                               
      @223    DXCCSR_CIR004                 N3PF.                               
      @226    DXCCSR_CIR005                 N3PF.                               
      @229    DXCCSR_CIR006                 N3PF.                               
      @232    DXCCSR_CIR007                 N3PF.                               
      @235    DXCCSR_CIR008                 N3PF.                               
      @238    DXCCSR_CIR009                 N3PF.                               
      @241    DXCCSR_CIR010                 N3PF.                               
      @244    DXCCSR_CIR011                 N3PF.                               
      @247    DXCCSR_CIR012                 N3PF.                               
      @250    DXCCSR_CIR013                 N3PF.                               
      @253    DXCCSR_CIR014                 N3PF.                               
      @256    DXCCSR_CIR015                 N3PF.                               
      @259    DXCCSR_CIR016                 N3PF.                               
      @262    DXCCSR_CIR017                 N3PF.                               
      @265    DXCCSR_CIR018                 N3PF.                               
      @268    DXCCSR_CIR019                 N3PF.                               
      @271    DXCCSR_CIR020                 N3PF.                               
      @274    DXCCSR_CIR021                 N3PF.                               
      @277    DXCCSR_CIR022                 N3PF.                               
      @280    DXCCSR_CIR023                 N3PF.                               
      @283    DXCCSR_CIR024                 N3PF.                               
      @286    DXCCSR_CIR025                 N3PF.                               
      @289    DXCCSR_CIR026                 N3PF.                               
      @292    DXCCSR_CIR027                 N3PF.                               
      @295    DXCCSR_CIR028                 N3PF.                               
      @298    DXCCSR_CIR029                 N3PF.                               
      @301    DXCCSR_CIR030                 N3PF.                               
      @304    DXCCSR_CIR031                 N3PF.                               
      @307    DXCCSR_CIR032                 N3PF.                               
      @310    DXCCSR_CIR033                 N3PF.                               
      @313    DXCCSR_CIR034                 N3PF.                               
      @316    DXCCSR_CIR035                 N3PF.                               
      @319    DXCCSR_CIR036                 N3PF.                               
      @322    DXCCSR_CIR037                 N3PF.                               
      @325    DXCCSR_CIR038                 N3PF.                               
      @328    DXCCSR_CIR039                 N3PF.                               
      @331    DXCCSR_DIG001                 N3PF.                               
      @334    DXCCSR_DIG002                 N3PF.                               
      @337    DXCCSR_DIG003                 N3PF.                               
      @340    DXCCSR_DIG004                 N3PF.                               
      @343    DXCCSR_DIG005                 N3PF.                               
      @346    DXCCSR_DIG006                 N3PF.                               
      @349    DXCCSR_DIG007                 N3PF.                               
      @352    DXCCSR_DIG008                 N3PF.                               
      @355    DXCCSR_DIG009                 N3PF.                               
      @358    DXCCSR_DIG010                 N3PF.                               
      @361    DXCCSR_DIG011                 N3PF.                               
      @364    DXCCSR_DIG012                 N3PF.                               
      @367    DXCCSR_DIG013                 N3PF.                               
      @370    DXCCSR_DIG014                 N3PF.                               
      @373    DXCCSR_DIG015                 N3PF.                               
      @376    DXCCSR_DIG016                 N3PF.                               
      @379    DXCCSR_DIG017                 N3PF.                               
      @382    DXCCSR_DIG018                 N3PF.                               
      @385    DXCCSR_DIG019                 N3PF.                               
      @388    DXCCSR_DIG020                 N3PF.                               
      @391    DXCCSR_DIG021                 N3PF.                               
      @394    DXCCSR_DIG022                 N3PF.                               
      @397    DXCCSR_DIG023                 N3PF.                               
      @400    DXCCSR_DIG024                 N3PF.                               
      @403    DXCCSR_DIG025                 N3PF.                               
      @406    DXCCSR_EAR001                 N3PF.                               
      @409    DXCCSR_EAR002                 N3PF.                               
      @412    DXCCSR_EAR003                 N3PF.                               
      @415    DXCCSR_EAR004                 N3PF.                               
      @418    DXCCSR_EAR005                 N3PF.                               
      @421    DXCCSR_EAR006                 N3PF.                               
      @424    DXCCSR_END001                 N3PF.                               
      @427    DXCCSR_END002                 N3PF.                               
      @430    DXCCSR_END003                 N3PF.                               
      @433    DXCCSR_END004                 N3PF.                               
      @436    DXCCSR_END005                 N3PF.                               
      @439    DXCCSR_END006                 N3PF.                               
      @442    DXCCSR_END007                 N3PF.                               
      @445    DXCCSR_END008                 N3PF.                               
      @448    DXCCSR_END009                 N3PF.                               
      @451    DXCCSR_END010                 N3PF.                               
      @454    DXCCSR_END011                 N3PF.                               
      @457    DXCCSR_END012                 N3PF.                               
      @460    DXCCSR_END013                 N3PF.                               
      @463    DXCCSR_END014                 N3PF.                               
      @466    DXCCSR_END015                 N3PF.                               
      @469    DXCCSR_END016                 N3PF.                               
      @472    DXCCSR_END017                 N3PF.                               
      @475    DXCCSR_EXT001                 N3PF.                               
      @478    DXCCSR_EXT002                 N3PF.                               
      @481    DXCCSR_EXT003                 N3PF.                               
      @484    DXCCSR_EXT004                 N3PF.                               
      @487    DXCCSR_EXT005                 N3PF.                               
      @490    DXCCSR_EXT006                 N3PF.                               
      @493    DXCCSR_EXT007                 N3PF.                               
      @496    DXCCSR_EXT008                 N3PF.                               
      @499    DXCCSR_EXT009                 N3PF.                               
      @502    DXCCSR_EXT010                 N3PF.                               
      @505    DXCCSR_EXT011                 N3PF.                               
      @508    DXCCSR_EXT012                 N3PF.                               
      @511    DXCCSR_EXT013                 N3PF.                               
      @514    DXCCSR_EXT014                 N3PF.                               
      @517    DXCCSR_EXT015                 N3PF.                               
      @520    DXCCSR_EXT016                 N3PF.                               
      @523    DXCCSR_EXT017                 N3PF.                               
      @526    DXCCSR_EXT018                 N3PF.                               
      @529    DXCCSR_EXT019                 N3PF.                               
      @532    DXCCSR_EXT020                 N3PF.                               
      @535    DXCCSR_EXT021                 N3PF.                               
      @538    DXCCSR_EXT022                 N3PF.                               
      @541    DXCCSR_EXT023                 N3PF.                               
      @544    DXCCSR_EXT024                 N3PF.                               
      @547    DXCCSR_EXT025                 N3PF.                               
      @550    DXCCSR_EXT026                 N3PF.                               
      @553    DXCCSR_EXT027                 N3PF.                               
      @556    DXCCSR_EXT028                 N3PF.                               
      @559    DXCCSR_EXT029                 N3PF.                               
      @562    DXCCSR_EXT030                 N3PF.                               
      @565    DXCCSR_EYE001                 N3PF.                               
      @568    DXCCSR_EYE002                 N3PF.                               
      @571    DXCCSR_EYE003                 N3PF.                               
      @574    DXCCSR_EYE004                 N3PF.                               
      @577    DXCCSR_EYE005                 N3PF.                               
      @580    DXCCSR_EYE006                 N3PF.                               
      @583    DXCCSR_EYE007                 N3PF.                               
      @586    DXCCSR_EYE008                 N3PF.                               
      @589    DXCCSR_EYE009                 N3PF.                               
      @592    DXCCSR_EYE010                 N3PF.                               
      @595    DXCCSR_EYE011                 N3PF.                               
      @598    DXCCSR_EYE012                 N3PF.                               
      @601    DXCCSR_FAC001                 N3PF.                               
      @604    DXCCSR_FAC002                 N3PF.                               
      @607    DXCCSR_FAC003                 N3PF.                               
      @610    DXCCSR_FAC004                 N3PF.                               
      @613    DXCCSR_FAC005                 N3PF.                               
      @616    DXCCSR_FAC006                 N3PF.                               
      @619    DXCCSR_FAC007                 N3PF.                               
      @622    DXCCSR_FAC008                 N3PF.                               
      @625    DXCCSR_FAC009                 N3PF.                               
      @628    DXCCSR_FAC010                 N3PF.                               
      @631    DXCCSR_FAC011                 N3PF.                               
      @634    DXCCSR_FAC012                 N3PF.                               
      @637    DXCCSR_FAC013                 N3PF.                               
      @640    DXCCSR_FAC014                 N3PF.                               
      @643    DXCCSR_FAC015                 N3PF.                               
      @646    DXCCSR_FAC016                 N3PF.                               
      @649    DXCCSR_FAC017                 N3PF.                               
      @652    DXCCSR_FAC018                 N3PF.                               
      @655    DXCCSR_FAC019                 N3PF.                               
      @658    DXCCSR_FAC020                 N3PF.                               
      @661    DXCCSR_FAC021                 N3PF.                               
      @664    DXCCSR_FAC022                 N3PF.                               
      @667    DXCCSR_FAC023                 N3PF.                               
      @670    DXCCSR_FAC024                 N3PF.                               
      @673    DXCCSR_FAC025                 N3PF.                               
      @676    DXCCSR_GEN001                 N3PF.                               
      @679    DXCCSR_GEN002                 N3PF.                               
      @682    DXCCSR_GEN003                 N3PF.                               
      @685    DXCCSR_GEN004                 N3PF.                               
      @688    DXCCSR_GEN005                 N3PF.                               
      @691    DXCCSR_GEN006                 N3PF.                               
      @694    DXCCSR_GEN007                 N3PF.                               
      @697    DXCCSR_GEN008                 N3PF.                               
      @700    DXCCSR_GEN009                 N3PF.                               
      @703    DXCCSR_GEN010                 N3PF.                               
      @706    DXCCSR_GEN011                 N3PF.                               
      @709    DXCCSR_GEN012                 N3PF.                               
      @712    DXCCSR_GEN013                 N3PF.                               
      @715    DXCCSR_GEN014                 N3PF.                               
      @718    DXCCSR_GEN015                 N3PF.                               
      @721    DXCCSR_GEN016                 N3PF.                               
      @724    DXCCSR_GEN017                 N3PF.                               
      @727    DXCCSR_GEN018                 N3PF.                               
      @730    DXCCSR_GEN019                 N3PF.                               
      @733    DXCCSR_GEN020                 N3PF.                               
      @736    DXCCSR_GEN021                 N3PF.                               
      @739    DXCCSR_GEN022                 N3PF.                               
      @742    DXCCSR_GEN023                 N3PF.                               
      @745    DXCCSR_GEN024                 N3PF.                               
      @748    DXCCSR_GEN025                 N3PF.                               
      @751    DXCCSR_GEN026                 N3PF.                               
      @754    DXCCSR_INF001                 N3PF.                               
      @757    DXCCSR_INF002                 N3PF.                               
      @760    DXCCSR_INF003                 N3PF.                               
      @763    DXCCSR_INF004                 N3PF.                               
      @766    DXCCSR_INF005                 N3PF.                               
      @769    DXCCSR_INF006                 N3PF.                               
      @772    DXCCSR_INF007                 N3PF.                               
      @775    DXCCSR_INF008                 N3PF.                               
      @778    DXCCSR_INF009                 N3PF.                               
      @781    DXCCSR_INF010                 N3PF.                               
      @784    DXCCSR_INF011                 N3PF.                               
      @787    DXCCSR_INF012                 N3PF.                               
      @790    DXCCSR_INJ001                 N3PF.                               
      @793    DXCCSR_INJ002                 N3PF.                               
      @796    DXCCSR_INJ003                 N3PF.                               
      @799    DXCCSR_INJ004                 N3PF.                               
      @802    DXCCSR_INJ005                 N3PF.                               
      @805    DXCCSR_INJ006                 N3PF.                               
      @808    DXCCSR_INJ007                 N3PF.                               
      @811    DXCCSR_INJ008                 N3PF.                               
      @814    DXCCSR_INJ009                 N3PF.                               
      @817    DXCCSR_INJ010                 N3PF.                               
      @820    DXCCSR_INJ011                 N3PF.                               
      @823    DXCCSR_INJ012                 N3PF.                               
      @826    DXCCSR_INJ013                 N3PF.                               
      @829    DXCCSR_INJ014                 N3PF.                               
      @832    DXCCSR_INJ015                 N3PF.                               
      @835    DXCCSR_INJ016                 N3PF.                               
      @838    DXCCSR_INJ017                 N3PF.                               
      @841    DXCCSR_INJ018                 N3PF.                               
      @844    DXCCSR_INJ019                 N3PF.                               
      @847    DXCCSR_INJ020                 N3PF.                               
      @850    DXCCSR_INJ021                 N3PF.                               
      @853    DXCCSR_INJ022                 N3PF.                               
      @856    DXCCSR_INJ023                 N3PF.                               
      @859    DXCCSR_INJ024                 N3PF.                               
      @862    DXCCSR_INJ025                 N3PF.                               
      @865    DXCCSR_INJ026                 N3PF.                               
      @868    DXCCSR_INJ027                 N3PF.                               
      @871    DXCCSR_INJ028                 N3PF.                               
      @874    DXCCSR_INJ029                 N3PF.                               
      @877    DXCCSR_INJ030                 N3PF.                               
      @880    DXCCSR_INJ031                 N3PF.                               
      @883    DXCCSR_INJ032                 N3PF.                               
      @886    DXCCSR_INJ033                 N3PF.                               
      @889    DXCCSR_INJ034                 N3PF.                               
      @892    DXCCSR_INJ035                 N3PF.                               
      @895    DXCCSR_INJ036                 N3PF.                               
      @898    DXCCSR_INJ037                 N3PF.                               
      @901    DXCCSR_INJ038                 N3PF.                               
      @904    DXCCSR_INJ039                 N3PF.                               
      @907    DXCCSR_INJ040                 N3PF.                               
      @910    DXCCSR_INJ041                 N3PF.                               
      @913    DXCCSR_INJ042                 N3PF.                               
      @916    DXCCSR_INJ043                 N3PF.                               
      @919    DXCCSR_INJ044                 N3PF.                               
      @922    DXCCSR_INJ045                 N3PF.                               
      @925    DXCCSR_INJ046                 N3PF.                               
      @928    DXCCSR_INJ047                 N3PF.                               
      @931    DXCCSR_INJ048                 N3PF.                               
      @934    DXCCSR_INJ049                 N3PF.                               
      @937    DXCCSR_INJ050                 N3PF.                               
      @940    DXCCSR_INJ051                 N3PF.                               
      @943    DXCCSR_INJ052                 N3PF.                               
      @946    DXCCSR_INJ053                 N3PF.                               
      @949    DXCCSR_INJ054                 N3PF.                               
      @952    DXCCSR_INJ055                 N3PF.                               
      @955    DXCCSR_INJ056                 N3PF.                               
      @958    DXCCSR_INJ057                 N3PF.                               
      @961    DXCCSR_INJ058                 N3PF.                               
      @964    DXCCSR_INJ059                 N3PF.                               
      @967    DXCCSR_INJ060                 N3PF.                               
      @970    DXCCSR_INJ061                 N3PF.                               
      @973    DXCCSR_INJ062                 N3PF.                               
      @976    DXCCSR_INJ063                 N3PF.                               
      @979    DXCCSR_INJ064                 N3PF.                               
      @982    DXCCSR_INJ065                 N3PF.                               
      @985    DXCCSR_INJ066                 N3PF.                               
      @988    DXCCSR_INJ067                 N3PF.                               
      @991    DXCCSR_INJ068                 N3PF.                               
      @994    DXCCSR_INJ069                 N3PF.                               
      @997    DXCCSR_INJ070                 N3PF.                               
      @1000   DXCCSR_INJ071                 N3PF.                               
      @1003   DXCCSR_INJ072                 N3PF.                               
      @1006   DXCCSR_INJ073                 N3PF.                               
      @1009   DXCCSR_INJ074                 N3PF.                               
      @1012   DXCCSR_INJ075                 N3PF.                               
      @1015   DXCCSR_INJ076                 N3PF.                               
      @1018   DXCCSR_MAL001                 N3PF.                               
      @1021   DXCCSR_MAL002                 N3PF.                               
      @1024   DXCCSR_MAL003                 N3PF.                               
      @1027   DXCCSR_MAL004                 N3PF.                               
      @1030   DXCCSR_MAL005                 N3PF.                               
      @1033   DXCCSR_MAL006                 N3PF.                               
      @1036   DXCCSR_MAL007                 N3PF.                               
      @1039   DXCCSR_MAL008                 N3PF.                               
      @1042   DXCCSR_MAL009                 N3PF.                               
      @1045   DXCCSR_MAL010                 N3PF.                               
      @1048   DXCCSR_MBD001                 N3PF.                               
      @1051   DXCCSR_MBD002                 N3PF.                               
      @1054   DXCCSR_MBD003                 N3PF.                               
      @1057   DXCCSR_MBD004                 N3PF.                               
      @1060   DXCCSR_MBD005                 N3PF.                               
      @1063   DXCCSR_MBD006                 N3PF.                               
      @1066   DXCCSR_MBD007                 N3PF.                               
      @1069   DXCCSR_MBD008                 N3PF.                               
      @1072   DXCCSR_MBD009                 N3PF.                               
      @1075   DXCCSR_MBD010                 N3PF.                               
      @1078   DXCCSR_MBD011                 N3PF.                               
      @1081   DXCCSR_MBD012                 N3PF.                               
      @1084   DXCCSR_MBD013                 N3PF.                               
      @1087   DXCCSR_MBD014                 N3PF.                               
      @1090   DXCCSR_MBD017                 N3PF.                               
      @1093   DXCCSR_MBD018                 N3PF.                               
      @1096   DXCCSR_MBD019                 N3PF.                               
      @1099   DXCCSR_MBD020                 N3PF.                               
      @1102   DXCCSR_MBD021                 N3PF.                               
      @1105   DXCCSR_MBD022                 N3PF.                               
      @1108   DXCCSR_MBD023                 N3PF.                               
      @1111   DXCCSR_MBD024                 N3PF.                               
      @1114   DXCCSR_MBD025                 N3PF.                               
      @1117   DXCCSR_MBD026                 N3PF.                               
      @1120   DXCCSR_MBD027                 N3PF.                               
      @1123   DXCCSR_MBD028                 N3PF.                               
      @1126   DXCCSR_MBD029                 N3PF.                               
      @1129   DXCCSR_MBD030                 N3PF.                               
      @1132   DXCCSR_MBD031                 N3PF.                               
      @1135   DXCCSR_MBD032                 N3PF.                               
      @1138   DXCCSR_MBD033                 N3PF.                               
      @1141   DXCCSR_MBD034                 N3PF.                               
      @1144   DXCCSR_MUS001                 N3PF.                               
      @1147   DXCCSR_MUS002                 N3PF.                               
      @1150   DXCCSR_MUS003                 N3PF.                               
      @1153   DXCCSR_MUS004                 N3PF.                               
      @1156   DXCCSR_MUS005                 N3PF.                               
      @1159   DXCCSR_MUS006                 N3PF.                               
      @1162   DXCCSR_MUS007                 N3PF.                               
      @1165   DXCCSR_MUS008                 N3PF.                               
      @1168   DXCCSR_MUS009                 N3PF.                               
      @1171   DXCCSR_MUS010                 N3PF.                               
      @1174   DXCCSR_MUS011                 N3PF.                               
      @1177   DXCCSR_MUS012                 N3PF.                               
      @1180   DXCCSR_MUS013                 N3PF.                               
      @1183   DXCCSR_MUS014                 N3PF.                               
      @1186   DXCCSR_MUS015                 N3PF.                               
      @1189   DXCCSR_MUS016                 N3PF.                               
      @1192   DXCCSR_MUS017                 N3PF.                               
      @1195   DXCCSR_MUS018                 N3PF.                               
      @1198   DXCCSR_MUS019                 N3PF.                               
      @1201   DXCCSR_MUS020                 N3PF.                               
      @1204   DXCCSR_MUS021                 N3PF.                               
      @1207   DXCCSR_MUS022                 N3PF.                               
      @1210   DXCCSR_MUS023                 N3PF.                               
      @1213   DXCCSR_MUS024                 N3PF.                               
      @1216   DXCCSR_MUS025                 N3PF.                               
      @1219   DXCCSR_MUS026                 N3PF.                               
      @1222   DXCCSR_MUS027                 N3PF.                               
      @1225   DXCCSR_MUS028                 N3PF.                               
      @1228   DXCCSR_MUS029                 N3PF.                               
      @1231   DXCCSR_MUS030                 N3PF.                               
      @1234   DXCCSR_MUS031                 N3PF.                               
      @1237   DXCCSR_MUS032                 N3PF.                               
      @1240   DXCCSR_MUS033                 N3PF.                               
      @1243   DXCCSR_MUS034                 N3PF.                               
      @1246   DXCCSR_MUS035                 N3PF.                               
      @1249   DXCCSR_MUS036                 N3PF.                               
      @1252   DXCCSR_MUS037                 N3PF.                               
      @1255   DXCCSR_MUS038                 N3PF.                               
      @1258   DXCCSR_NEO001                 N3PF.                               
      @1261   DXCCSR_NEO002                 N3PF.                               
      @1264   DXCCSR_NEO003                 N3PF.                               
      @1267   DXCCSR_NEO004                 N3PF.                               
      @1270   DXCCSR_NEO005                 N3PF.                               
      @1273   DXCCSR_NEO006                 N3PF.                               
      @1276   DXCCSR_NEO007                 N3PF.                               
      @1279   DXCCSR_NEO008                 N3PF.                               
      @1282   DXCCSR_NEO009                 N3PF.                               
      @1285   DXCCSR_NEO010                 N3PF.                               
      @1288   DXCCSR_NEO011                 N3PF.                               
      @1291   DXCCSR_NEO012                 N3PF.                               
      @1294   DXCCSR_NEO013                 N3PF.                               
      @1297   DXCCSR_NEO014                 N3PF.                               
      @1300   DXCCSR_NEO015                 N3PF.                               
      @1303   DXCCSR_NEO016                 N3PF.                               
      @1306   DXCCSR_NEO017                 N3PF.                               
      @1309   DXCCSR_NEO018                 N3PF.                               
      @1312   DXCCSR_NEO019                 N3PF.                               
      @1315   DXCCSR_NEO020                 N3PF.                               
      @1318   DXCCSR_NEO021                 N3PF.                               
      @1321   DXCCSR_NEO022                 N3PF.                               
      @1324   DXCCSR_NEO023                 N3PF.                               
      @1327   DXCCSR_NEO024                 N3PF.                               
      @1330   DXCCSR_NEO025                 N3PF.                               
      @1333   DXCCSR_NEO026                 N3PF.                               
      @1336   DXCCSR_NEO027                 N3PF.                               
      @1339   DXCCSR_NEO028                 N3PF.                               
      @1342   DXCCSR_NEO029                 N3PF.                               
      @1345   DXCCSR_NEO030                 N3PF.                               
      @1348   DXCCSR_NEO031                 N3PF.                               
      @1351   DXCCSR_NEO032                 N3PF.                               
      @1354   DXCCSR_NEO033                 N3PF.                               
      @1357   DXCCSR_NEO034                 N3PF.                               
      @1360   DXCCSR_NEO035                 N3PF.                               
      @1363   DXCCSR_NEO036                 N3PF.                               
      @1366   DXCCSR_NEO037                 N3PF.                               
      @1369   DXCCSR_NEO038                 N3PF.                               
      @1372   DXCCSR_NEO039                 N3PF.                               
      @1375   DXCCSR_NEO040                 N3PF.                               
      @1378   DXCCSR_NEO041                 N3PF.                               
      @1381   DXCCSR_NEO042                 N3PF.                               
      @1384   DXCCSR_NEO043                 N3PF.                               
      @1387   DXCCSR_NEO044                 N3PF.                               
      @1390   DXCCSR_NEO045                 N3PF.                               
      @1393   DXCCSR_NEO046                 N3PF.                               
      @1396   DXCCSR_NEO047                 N3PF.                               
      @1399   DXCCSR_NEO048                 N3PF.                               
      @1402   DXCCSR_NEO049                 N3PF.                               
      @1405   DXCCSR_NEO050                 N3PF.                               
      @1408   DXCCSR_NEO051                 N3PF.                               
      @1411   DXCCSR_NEO052                 N3PF.                               
      @1414   DXCCSR_NEO053                 N3PF.                               
      @1417   DXCCSR_NEO054                 N3PF.                               
      @1420   DXCCSR_NEO055                 N3PF.                               
      @1423   DXCCSR_NEO056                 N3PF.                               
      @1426   DXCCSR_NEO057                 N3PF.                               
      @1429   DXCCSR_NEO058                 N3PF.                               
      @1432   DXCCSR_NEO059                 N3PF.                               
      @1435   DXCCSR_NEO060                 N3PF.                               
      @1438   DXCCSR_NEO061                 N3PF.                               
      @1441   DXCCSR_NEO062                 N3PF.                               
      @1444   DXCCSR_NEO063                 N3PF.                               
      @1447   DXCCSR_NEO064                 N3PF.                               
      @1450   DXCCSR_NEO065                 N3PF.                               
      @1453   DXCCSR_NEO066                 N3PF.                               
      @1456   DXCCSR_NEO067                 N3PF.                               
      @1459   DXCCSR_NEO068                 N3PF.                               
      @1462   DXCCSR_NEO069                 N3PF.                               
      @1465   DXCCSR_NEO070                 N3PF.                               
      @1468   DXCCSR_NEO071                 N3PF.                               
      @1471   DXCCSR_NEO072                 N3PF.                               
      @1474   DXCCSR_NEO073                 N3PF.                               
      @1477   DXCCSR_NEO074                 N3PF.                               
      @1480   DXCCSR_NVS001                 N3PF.                               
      @1483   DXCCSR_NVS002                 N3PF.                               
      @1486   DXCCSR_NVS003                 N3PF.                               
      @1489   DXCCSR_NVS004                 N3PF.                               
      @1492   DXCCSR_NVS005                 N3PF.                               
      @1495   DXCCSR_NVS006                 N3PF.                               
      @1498   DXCCSR_NVS007                 N3PF.                               
      @1501   DXCCSR_NVS008                 N3PF.                               
      @1504   DXCCSR_NVS009                 N3PF.                               
      @1507   DXCCSR_NVS010                 N3PF.                               
      @1510   DXCCSR_NVS011                 N3PF.                               
      @1513   DXCCSR_NVS012                 N3PF.                               
      @1516   DXCCSR_NVS013                 N3PF.                               
      @1519   DXCCSR_NVS014                 N3PF.                               
      @1522   DXCCSR_NVS015                 N3PF.                               
      @1525   DXCCSR_NVS016                 N3PF.                               
      @1528   DXCCSR_NVS017                 N3PF.                               
      @1531   DXCCSR_NVS018                 N3PF.                               
      @1534   DXCCSR_NVS019                 N3PF.                               
      @1537   DXCCSR_NVS020                 N3PF.                               
      @1540   DXCCSR_NVS021                 N3PF.                               
      @1543   DXCCSR_NVS022                 N3PF.                               
      @1546   DXCCSR_PNL001                 N3PF.                               
      @1549   DXCCSR_PNL002                 N3PF.                               
      @1552   DXCCSR_PNL003                 N3PF.                               
      @1555   DXCCSR_PNL004                 N3PF.                               
      @1558   DXCCSR_PNL005                 N3PF.                               
      @1561   DXCCSR_PNL006                 N3PF.                               
      @1564   DXCCSR_PNL007                 N3PF.                               
      @1567   DXCCSR_PNL008                 N3PF.                               
      @1570   DXCCSR_PNL009                 N3PF.                               
      @1573   DXCCSR_PNL010                 N3PF.                               
      @1576   DXCCSR_PNL011                 N3PF.                               
      @1579   DXCCSR_PNL012                 N3PF.                               
      @1582   DXCCSR_PNL013                 N3PF.                               
      @1585   DXCCSR_PNL014                 N3PF.                               
      @1588   DXCCSR_PNL015                 N3PF.                               
      @1591   DXCCSR_PRG001                 N3PF.                               
      @1594   DXCCSR_PRG002                 N3PF.                               
      @1597   DXCCSR_PRG003                 N3PF.                               
      @1600   DXCCSR_PRG004                 N3PF.                               
      @1603   DXCCSR_PRG005                 N3PF.                               
      @1606   DXCCSR_PRG006                 N3PF.                               
      @1609   DXCCSR_PRG007                 N3PF.                               
      @1612   DXCCSR_PRG008                 N3PF.                               
      @1615   DXCCSR_PRG009                 N3PF.                               
      @1618   DXCCSR_PRG010                 N3PF.                               
      @1621   DXCCSR_PRG011                 N3PF.                               
      @1624   DXCCSR_PRG012                 N3PF.                               
      @1627   DXCCSR_PRG013                 N3PF.                               
      @1630   DXCCSR_PRG014                 N3PF.                               
      @1633   DXCCSR_PRG015                 N3PF.                               
      @1636   DXCCSR_PRG016                 N3PF.                               
      @1639   DXCCSR_PRG017                 N3PF.                               
      @1642   DXCCSR_PRG018                 N3PF.                               
      @1645   DXCCSR_PRG019                 N3PF.                               
      @1648   DXCCSR_PRG020                 N3PF.                               
      @1651   DXCCSR_PRG021                 N3PF.                               
      @1654   DXCCSR_PRG022                 N3PF.                               
      @1657   DXCCSR_PRG023                 N3PF.                               
      @1660   DXCCSR_PRG024                 N3PF.                               
      @1663   DXCCSR_PRG025                 N3PF.                               
      @1666   DXCCSR_PRG026                 N3PF.                               
      @1669   DXCCSR_PRG027                 N3PF.                               
      @1672   DXCCSR_PRG028                 N3PF.                               
      @1675   DXCCSR_PRG029                 N3PF.                               
      @1678   DXCCSR_PRG030                 N3PF.                               
      @1681   DXCCSR_RSP001                 N3PF.                               
      @1684   DXCCSR_RSP002                 N3PF.                               
      @1687   DXCCSR_RSP003                 N3PF.                               
      @1690   DXCCSR_RSP004                 N3PF.                               
      @1693   DXCCSR_RSP005                 N3PF.                               
      @1696   DXCCSR_RSP006                 N3PF.                               
      @1699   DXCCSR_RSP007                 N3PF.                               
      @1702   DXCCSR_RSP008                 N3PF.                               
      @1705   DXCCSR_RSP009                 N3PF.                               
      @1708   DXCCSR_RSP010                 N3PF.                               
      @1711   DXCCSR_RSP011                 N3PF.                               
      @1714   DXCCSR_RSP012                 N3PF.                               
      @1717   DXCCSR_RSP013                 N3PF.                               
      @1720   DXCCSR_RSP014                 N3PF.                               
      @1723   DXCCSR_RSP015                 N3PF.                               
      @1726   DXCCSR_RSP016                 N3PF.                               
      @1729   DXCCSR_RSP017                 N3PF.                               
      @1732   DXCCSR_SKN001                 N3PF.                               
      @1735   DXCCSR_SKN002                 N3PF.                               
      @1738   DXCCSR_SKN003                 N3PF.                               
      @1741   DXCCSR_SKN004                 N3PF.                               
      @1744   DXCCSR_SKN005                 N3PF.                               
      @1747   DXCCSR_SKN006                 N3PF.                               
      @1750   DXCCSR_SKN007                 N3PF.                               
      @1753   DXCCSR_SYM001                 N3PF.                               
      @1756   DXCCSR_SYM002                 N3PF.                               
      @1759   DXCCSR_SYM003                 N3PF.                               
      @1762   DXCCSR_SYM004                 N3PF.                               
      @1765   DXCCSR_SYM005                 N3PF.                               
      @1768   DXCCSR_SYM006                 N3PF.                               
      @1771   DXCCSR_SYM007                 N3PF.                               
      @1774   DXCCSR_SYM008                 N3PF.                               
      @1777   DXCCSR_SYM009                 N3PF.                               
      @1780   DXCCSR_SYM010                 N3PF.                               
      @1783   DXCCSR_SYM011                 N3PF.                               
      @1786   DXCCSR_SYM012                 N3PF.                               
      @1789   DXCCSR_SYM013                 N3PF.                               
      @1792   DXCCSR_SYM014                 N3PF.                               
      @1795   DXCCSR_SYM015                 N3PF.                               
      @1798   DXCCSR_SYM016                 N3PF.                               
      @1801   DXCCSR_SYM017                 N3PF.                               
      @1804   DXCCSR_VERSION                $CHAR6.                             
      @1810   PRCCSR_ADM001                 N3PF.                               
      @1813   PRCCSR_ADM002                 N3PF.                               
      @1816   PRCCSR_ADM003                 N3PF.                               
      @1819   PRCCSR_ADM004                 N3PF.                               
      @1822   PRCCSR_ADM005                 N3PF.                               
      @1825   PRCCSR_ADM006                 N3PF.                               
      @1828   PRCCSR_ADM007                 N3PF.                               
      @1831   PRCCSR_ADM008                 N3PF.                               
      @1834   PRCCSR_ADM009                 N3PF.                               
      @1837   PRCCSR_ADM010                 N3PF.                               
      @1840   PRCCSR_ADM011                 N3PF.                               
      @1843   PRCCSR_ADM012                 N3PF.                               
      @1846   PRCCSR_ADM013                 N3PF.                               
      @1849   PRCCSR_ADM014                 N3PF.                               
      @1852   PRCCSR_ADM015                 N3PF.                               
      @1855   PRCCSR_ADM016                 N3PF.                               
      @1858   PRCCSR_ADM017                 N3PF.                               
      @1861   PRCCSR_ADM018                 N3PF.                               
      @1864   PRCCSR_ADM019                 N3PF.                               
      @1867   PRCCSR_ADM020                 N3PF.                               
      @1870   PRCCSR_ADM021                 N3PF.                               
      @1873   PRCCSR_CAR001                 N3PF.                               
      @1876   PRCCSR_CAR002                 N3PF.                               
      @1879   PRCCSR_CAR003                 N3PF.                               
      @1882   PRCCSR_CAR004                 N3PF.                               
      @1885   PRCCSR_CAR005                 N3PF.                               
      @1888   PRCCSR_CAR006                 N3PF.                               
      @1891   PRCCSR_CAR007                 N3PF.                               
      @1894   PRCCSR_CAR008                 N3PF.                               
      @1897   PRCCSR_CAR009                 N3PF.                               
      @1900   PRCCSR_CAR010                 N3PF.                               
      @1903   PRCCSR_CAR011                 N3PF.                               
      @1906   PRCCSR_CAR012                 N3PF.                               
      @1909   PRCCSR_CAR013                 N3PF.                               
      @1912   PRCCSR_CAR014                 N3PF.                               
      @1915   PRCCSR_CAR015                 N3PF.                               
      @1918   PRCCSR_CAR016                 N3PF.                               
      @1921   PRCCSR_CAR017                 N3PF.                               
      @1924   PRCCSR_CAR018                 N3PF.                               
      @1927   PRCCSR_CAR019                 N3PF.                               
      @1930   PRCCSR_CAR020                 N3PF.                               
      @1933   PRCCSR_CAR021                 N3PF.                               
      @1936   PRCCSR_CAR022                 N3PF.                               
      @1939   PRCCSR_CAR023                 N3PF.                               
      @1942   PRCCSR_CAR024                 N3PF.                               
      @1945   PRCCSR_CAR025                 N3PF.                               
      @1948   PRCCSR_CAR026                 N3PF.                               
      @1951   PRCCSR_CAR027                 N3PF.                               
      @1954   PRCCSR_CAR028                 N3PF.                               
      @1957   PRCCSR_CAR029                 N3PF.                               
      @1960   PRCCSR_CHP001                 N3PF.                               
      @1963   PRCCSR_CNS001                 N3PF.                               
      @1966   PRCCSR_CNS002                 N3PF.                               
      @1969   PRCCSR_CNS003                 N3PF.                               
      @1972   PRCCSR_CNS004                 N3PF.                               
      @1975   PRCCSR_CNS005                 N3PF.                               
      @1978   PRCCSR_CNS006                 N3PF.                               
      @1981   PRCCSR_CNS007                 N3PF.                               
      @1984   PRCCSR_CNS008                 N3PF.                               
      @1987   PRCCSR_CNS009                 N3PF.                               
      @1990   PRCCSR_CNS010                 N3PF.                               
      @1993   PRCCSR_CNS011                 N3PF.                               
      @1996   PRCCSR_CNS012                 N3PF.                               
      @1999   PRCCSR_CNS013                 N3PF.                               
      @2002   PRCCSR_CNS014                 N3PF.                               
      @2005   PRCCSR_ENP001                 N3PF.                               
      @2008   PRCCSR_ENP002                 N3PF.                               
      @2011   PRCCSR_ENP003                 N3PF.                               
      @2014   PRCCSR_ENP004                 N3PF.                               
      @2017   PRCCSR_ENP005                 N3PF.                               
      @2020   PRCCSR_ENP006                 N3PF.                               
      @2023   PRCCSR_ENT001                 N3PF.                               
      @2026   PRCCSR_ENT002                 N3PF.                               
      @2029   PRCCSR_ENT003                 N3PF.                               
      @2032   PRCCSR_ENT004                 N3PF.                               
      @2035   PRCCSR_ENT005                 N3PF.                               
      @2038   PRCCSR_ENT006                 N3PF.                               
      @2041   PRCCSR_ENT007                 N3PF.                               
      @2044   PRCCSR_ENT008                 N3PF.                               
      @2047   PRCCSR_ENT009                 N3PF.                               
      @2050   PRCCSR_ENT010                 N3PF.                               
      @2053   PRCCSR_ENT011                 N3PF.                               
      @2056   PRCCSR_ENT012                 N3PF.                               
      @2059   PRCCSR_ENT013                 N3PF.                               
      @2062   PRCCSR_ENT014                 N3PF.                               
      @2065   PRCCSR_ENT015                 N3PF.                               
      @2068   PRCCSR_ENT016                 N3PF.                               
      @2071   PRCCSR_ENT017                 N3PF.                               
      @2074   PRCCSR_ESA001                 N3PF.                               
      @2077   PRCCSR_ESA002                 N3PF.                               
      @2080   PRCCSR_ESA003                 N3PF.                               
      @2083   PRCCSR_ESA004                 N3PF.                               
      @2086   PRCCSR_ESA005                 N3PF.                               
      @2089   PRCCSR_ESA006                 N3PF.                               
      @2092   PRCCSR_ESA007                 N3PF.                               
      @2095   PRCCSR_ESA008                 N3PF.                               
      @2098   PRCCSR_ESA009                 N3PF.                               
      @2101   PRCCSR_ESA010                 N3PF.                               
      @2104   PRCCSR_ESA011                 N3PF.                               
      @2107   PRCCSR_EST001                 N3PF.                               
      @2110   PRCCSR_EST002                 N3PF.                               
      @2113   PRCCSR_EST003                 N3PF.                               
      @2116   PRCCSR_EST004                 N3PF.                               
      @2119   PRCCSR_EST005                 N3PF.                               
      @2122   PRCCSR_EYP001                 N3PF.                               
      @2125   PRCCSR_EYP002                 N3PF.                               
      @2128   PRCCSR_FRS001                 N3PF.                               
      @2131   PRCCSR_FRS002                 N3PF.                               
      @2134   PRCCSR_FRS003                 N3PF.                               
      @2137   PRCCSR_FRS004                 N3PF.                               
      @2140   PRCCSR_FRS005                 N3PF.                               
      @2143   PRCCSR_FRS006                 N3PF.                               
      @2146   PRCCSR_FRS007                 N3PF.                               
      @2149   PRCCSR_FRS008                 N3PF.                               
      @2152   PRCCSR_FRS009                 N3PF.                               
      @2155   PRCCSR_FRS010                 N3PF.                               
      @2158   PRCCSR_FRS011                 N3PF.                               
      @2161   PRCCSR_FRS012                 N3PF.                               
      @2164   PRCCSR_FRS013                 N3PF.                               
      @2167   PRCCSR_FRS014                 N3PF.                               
      @2170   PRCCSR_FRS015                 N3PF.                               
      @2173   PRCCSR_GIS001                 N3PF.                               
      @2176   PRCCSR_GIS002                 N3PF.                               
      @2179   PRCCSR_GIS003                 N3PF.                               
      @2182   PRCCSR_GIS004                 N3PF.                               
      @2185   PRCCSR_GIS005                 N3PF.                               
      @2188   PRCCSR_GIS006                 N3PF.                               
      @2191   PRCCSR_GIS007                 N3PF.                               
      @2194   PRCCSR_GIS008                 N3PF.                               
      @2197   PRCCSR_GIS009                 N3PF.                               
      @2200   PRCCSR_GIS010                 N3PF.                               
      @2203   PRCCSR_GIS011                 N3PF.                               
      @2206   PRCCSR_GIS012                 N3PF.                               
      @2209   PRCCSR_GIS013                 N3PF.                               
      @2212   PRCCSR_GIS014                 N3PF.                               
      @2215   PRCCSR_GIS015                 N3PF.                               
      @2218   PRCCSR_GIS016                 N3PF.                               
      @2221   PRCCSR_GIS017                 N3PF.                               
      @2224   PRCCSR_GIS018                 N3PF.                               
      @2227   PRCCSR_GIS019                 N3PF.                               
      @2230   PRCCSR_GIS020                 N3PF.                               
      @2233   PRCCSR_GIS021                 N3PF.                               
      @2236   PRCCSR_GIS022                 N3PF.                               
      @2239   PRCCSR_GIS023                 N3PF.                               
      @2242   PRCCSR_GIS024                 N3PF.                               
      @2245   PRCCSR_GIS025                 N3PF.                               
      @2248   PRCCSR_GIS026                 N3PF.                               
      @2251   PRCCSR_GIS027                 N3PF.                               
      @2254   PRCCSR_GIS028                 N3PF.                               
      @2257   PRCCSR_GIS029                 N3PF.                               
      @2260   PRCCSR_GNR001                 N3PF.                               
      @2263   PRCCSR_GNR002                 N3PF.                               
      @2266   PRCCSR_GNR003                 N3PF.                               
      @2269   PRCCSR_GNR004                 N3PF.                               
      @2272   PRCCSR_GNR005                 N3PF.                               
      @2275   PRCCSR_GNR006                 N3PF.                               
      @2278   PRCCSR_GNR007                 N3PF.                               
      @2281   PRCCSR_GNR008                 N3PF.                               
      @2284   PRCCSR_GNR009                 N3PF.                               
      @2287   PRCCSR_GNR010                 N3PF.                               
      @2290   PRCCSR_HEP001                 N3PF.                               
      @2293   PRCCSR_HEP002                 N3PF.                               
      @2296   PRCCSR_HEP003                 N3PF.                               
      @2299   PRCCSR_HEP004                 N3PF.                               
      @2302   PRCCSR_HEP005                 N3PF.                               
      @2305   PRCCSR_HEP006                 N3PF.                               
      @2308   PRCCSR_HEP007                 N3PF.                               
      @2311   PRCCSR_HEP008                 N3PF.                               
      @2314   PRCCSR_HEP009                 N3PF.                               
      @2317   PRCCSR_HEP010                 N3PF.                               
      @2320   PRCCSR_HEP011                 N3PF.                               
      @2323   PRCCSR_HEP012                 N3PF.                               
      @2326   PRCCSR_HEP013                 N3PF.                               
      @2329   PRCCSR_IMG001                 N3PF.                               
      @2332   PRCCSR_IMG002                 N3PF.                               
      @2335   PRCCSR_IMG003                 N3PF.                               
      @2338   PRCCSR_IMG004                 N3PF.                               
      @2341   PRCCSR_IMG005                 N3PF.                               
      @2344   PRCCSR_IMG006                 N3PF.                               
      @2347   PRCCSR_IMG007                 N3PF.                               
      @2350   PRCCSR_IMG008                 N3PF.                               
      @2353   PRCCSR_IMG009                 N3PF.                               
      @2356   PRCCSR_IMG010                 N3PF.                               
      @2359   PRCCSR_LYM001                 N3PF.                               
      @2362   PRCCSR_LYM002                 N3PF.                               
      @2365   PRCCSR_LYM003                 N3PF.                               
      @2368   PRCCSR_LYM004                 N3PF.                               
      @2371   PRCCSR_LYM005                 N3PF.                               
      @2374   PRCCSR_LYM006                 N3PF.                               
      @2377   PRCCSR_LYM007                 N3PF.                               
      @2380   PRCCSR_LYM008                 N3PF.                               
      @2383   PRCCSR_LYM009                 N3PF.                               
      @2386   PRCCSR_LYM010                 N3PF.                               
      @2389   PRCCSR_LYM011                 N3PF.                               
      @2392   PRCCSR_MAM001                 N3PF.                               
      @2395   PRCCSR_MAM002                 N3PF.                               
      @2398   PRCCSR_MAM003                 N3PF.                               
      @2401   PRCCSR_MAM004                 N3PF.                               
      @2404   PRCCSR_MAM005                 N3PF.                               
      @2407   PRCCSR_MAM006                 N3PF.                               
      @2410   PRCCSR_MAM007                 N3PF.                               
      @2413   PRCCSR_MAM008                 N3PF.                               
      @2416   PRCCSR_MAM009                 N3PF.                               
      @2419   PRCCSR_MAM010                 N3PF.                               
      @2422   PRCCSR_MAM011                 N3PF.                               
      @2425   PRCCSR_MAM012                 N3PF.                               
      @2428   PRCCSR_MAM013                 N3PF.                               
      @2431   PRCCSR_MAM014                 N3PF.                               
      @2434   PRCCSR_MAM015                 N3PF.                               
      @2437   PRCCSR_MHT001                 N3PF.                               
      @2440   PRCCSR_MHT002                 N3PF.                               
      @2443   PRCCSR_MHT003                 N3PF.                               
      @2446   PRCCSR_MHT004                 N3PF.                               
      @2449   PRCCSR_MHT005                 N3PF.                               
      @2452   PRCCSR_MRS001                 N3PF.                               
      @2455   PRCCSR_MRS002                 N3PF.                               
      @2458   PRCCSR_MRS003                 N3PF.                               
      @2461   PRCCSR_MRS004                 N3PF.                               
      @2464   PRCCSR_MRS005                 N3PF.                               
      @2467   PRCCSR_MRS006                 N3PF.                               
      @2470   PRCCSR_MRS007                 N3PF.                               
      @2473   PRCCSR_MST001                 N3PF.                               
      @2476   PRCCSR_MST002                 N3PF.                               
      @2479   PRCCSR_MST003                 N3PF.                               
      @2482   PRCCSR_MST004                 N3PF.                               
      @2485   PRCCSR_MST005                 N3PF.                               
      @2488   PRCCSR_MST006                 N3PF.                               
      @2491   PRCCSR_MST007                 N3PF.                               
      @2494   PRCCSR_MST008                 N3PF.                               
      @2497   PRCCSR_MST009                 N3PF.                               
      @2500   PRCCSR_MST010                 N3PF.                               
      @2503   PRCCSR_MST011                 N3PF.                               
      @2506   PRCCSR_MST012                 N3PF.                               
      @2509   PRCCSR_MST013                 N3PF.                               
      @2512   PRCCSR_MST014                 N3PF.                               
      @2515   PRCCSR_MST015                 N3PF.                               
      @2518   PRCCSR_MST016                 N3PF.                               
      @2521   PRCCSR_MST017                 N3PF.                               
      @2524   PRCCSR_MST018                 N3PF.                               
      @2527   PRCCSR_MST019                 N3PF.                               
      @2530   PRCCSR_MST020                 N3PF.                               
      @2533   PRCCSR_MST021                 N3PF.                               
      @2536   PRCCSR_MST022                 N3PF.                               
      @2539   PRCCSR_MST023                 N3PF.                               
      @2542   PRCCSR_MST024                 N3PF.                               
      @2545   PRCCSR_MST025                 N3PF.                               
      @2548   PRCCSR_MST026                 N3PF.                               
      @2551   PRCCSR_MST027                 N3PF.                               
      @2554   PRCCSR_MST028                 N3PF.                               
      @2557   PRCCSR_MST029                 N3PF.                               
      @2560   PRCCSR_MST030                 N3PF.                               
      @2563   PRCCSR_NCM001                 N3PF.                               
      @2566   PRCCSR_NCM002                 N3PF.                               
      @2569   PRCCSR_NCM003                 N3PF.                               
      @2572   PRCCSR_NCM004                 N3PF.                               
      @2575   PRCCSR_OST001                 N3PF.                               
      @2578   PRCCSR_OTR001                 N3PF.                               
      @2581   PRCCSR_OTR002                 N3PF.                               
      @2584   PRCCSR_OTR003                 N3PF.                               
      @2587   PRCCSR_OTR004                 N3PF.                               
      @2590   PRCCSR_OTR005                 N3PF.                               
      @2593   PRCCSR_PGN001                 N3PF.                               
      @2596   PRCCSR_PGN002                 N3PF.                               
      @2599   PRCCSR_PGN003                 N3PF.                               
      @2602   PRCCSR_PGN004                 N3PF.                               
      @2605   PRCCSR_PGN005                 N3PF.                               
      @2608   PRCCSR_PGN006                 N3PF.                               
      @2611   PRCCSR_PGN007                 N3PF.                               
      @2614   PRCCSR_PGN008                 N3PF.                               
      @2617   PRCCSR_PGN009                 N3PF.                               
      @2620   PRCCSR_PLC001                 N3PF.                               
      @2623   PRCCSR_PLC002                 N3PF.                               
      @2626   PRCCSR_PNS001                 N3PF.                               
      @2629   PRCCSR_PNS002                 N3PF.                               
      @2632   PRCCSR_PNS003                 N3PF.                               
      @2635   PRCCSR_PNS004                 N3PF.                               
      @2638   PRCCSR_PNS005                 N3PF.                               
      @2641   PRCCSR_PNS006                 N3PF.                               
      @2644   PRCCSR_RAD001                 N3PF.                               
      @2647   PRCCSR_RAD002                 N3PF.                               
      @2650   PRCCSR_RAD003                 N3PF.                               
      @2653   PRCCSR_RAD004                 N3PF.                               
      @2656   PRCCSR_RES001                 N3PF.                               
      @2659   PRCCSR_RES002                 N3PF.                               
      @2662   PRCCSR_RES003                 N3PF.                               
      @2665   PRCCSR_RES004                 N3PF.                               
      @2668   PRCCSR_RES005                 N3PF.                               
      @2671   PRCCSR_RES006                 N3PF.                               
      @2674   PRCCSR_RES007                 N3PF.                               
      @2677   PRCCSR_RES008                 N3PF.                               
      @2680   PRCCSR_RES009                 N3PF.                               
      @2683   PRCCSR_RES010                 N3PF.                               
      @2686   PRCCSR_RES011                 N3PF.                               
      @2689   PRCCSR_RES012                 N3PF.                               
      @2692   PRCCSR_RES013                 N3PF.                               
      @2695   PRCCSR_RES014                 N3PF.                               
      @2698   PRCCSR_RHB001                 N3PF.                               
      @2701   PRCCSR_RHB002                 N3PF.                               
      @2704   PRCCSR_RHB003                 N3PF.                               
      @2707   PRCCSR_RHB004                 N3PF.                               
      @2710   PRCCSR_SKB001                 N3PF.                               
      @2713   PRCCSR_SKB002                 N3PF.                               
      @2716   PRCCSR_SKB003                 N3PF.                               
      @2719   PRCCSR_SKB004                 N3PF.                               
      @2722   PRCCSR_SKB005                 N3PF.                               
      @2725   PRCCSR_SKB006                 N3PF.                               
      @2728   PRCCSR_SKB007                 N3PF.                               
      @2731   PRCCSR_SKB008                 N3PF.                               
      @2734   PRCCSR_SKB009                 N3PF.                               
      @2737   PRCCSR_SKB010                 N3PF.                               
      @2740   PRCCSR_SUD001                 N3PF.                               
      @2743   PRCCSR_SUD002                 N3PF.                               
      @2746   PRCCSR_SUD003                 N3PF.                               
      @2749   PRCCSR_SUD004                 N3PF.                               
      @2752   PRCCSR_URN001                 N3PF.                               
      @2755   PRCCSR_URN002                 N3PF.                               
      @2758   PRCCSR_URN003                 N3PF.                               
      @2761   PRCCSR_URN004                 N3PF.                               
      @2764   PRCCSR_URN005                 N3PF.                               
      @2767   PRCCSR_URN006                 N3PF.                               
      @2770   PRCCSR_URN007                 N3PF.                               
      @2773   PRCCSR_URN008                 N3PF.                               
      @2776   PRCCSR_URN009                 N3PF.                               
      @2779   PRCCSR_URN010                 N3PF.                               
      @2782   PRCCSR_URN011                 N3PF.                               
      @2785   PRCCSR_URN012                 N3PF.                               
      @2788   PRCCSR_VERSION                $CHAR6.                             
      ;                                                                         
                                                                                
                                                                                
RUN;
