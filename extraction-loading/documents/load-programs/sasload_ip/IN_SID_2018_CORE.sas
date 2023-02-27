/*******************************************************************            
* Creation Date: 05/18/2021                                                     
*   IN_SID_2018_CORE.SAS:                                                       
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
DATA IN_SIDC_2018_CORE;                                                         
INFILE 'IN_SID_2018_CORE.ASC' FIRSTOBS=3 LRECL = 1799;                          
                                                                                
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
                                                                                
  BWT                        LENGTH=4                                           
  LABEL="Birth weight in grams"                                                 
                                                                                
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
                                                                                
  DRG                        LENGTH=3                                           
  LABEL="DRG in effect on discharge date"                                       
                                                                                
  DRG_NoPOA                  LENGTH=3                                           
  LABEL="DRG in use on discharge date, calculated without POA"                  
                                                                                
  DRGVER                     LENGTH=3                                           
  LABEL="DRG grouper version used on discharge date"                            
                                                                                
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
                                                                                
  DXPOA51                    LENGTH=$1                                          
  LABEL="Diagnosis 51, present on admission indicator"                          
                                                                                
  DXPOA52                    LENGTH=$1                                          
  LABEL="Diagnosis 52, present on admission indicator"                          
                                                                                
  DXPOA53                    LENGTH=$1                                          
  LABEL="Diagnosis 53, present on admission indicator"                          
                                                                                
  DXPOA54                    LENGTH=$1                                          
  LABEL="Diagnosis 54, present on admission indicator"                          
                                                                                
  DXPOA55                    LENGTH=$1                                          
  LABEL="Diagnosis 55, present on admission indicator"                          
                                                                                
  DXPOA56                    LENGTH=$1                                          
  LABEL="Diagnosis 56, present on admission indicator"                          
                                                                                
  DXPOA57                    LENGTH=$1                                          
  LABEL="Diagnosis 57, present on admission indicator"                          
                                                                                
  DXPOA58                    LENGTH=$1                                          
  LABEL="Diagnosis 58, present on admission indicator"                          
                                                                                
  DXPOA59                    LENGTH=$1                                          
  LABEL="Diagnosis 59, present on admission indicator"                          
                                                                                
  DXPOA60                    LENGTH=$1                                          
  LABEL="Diagnosis 60, present on admission indicator"                          
                                                                                
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
                                                                                
  I10_DX51                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 51"                                                
                                                                                
  I10_DX52                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 52"                                                
                                                                                
  I10_DX53                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 53"                                                
                                                                                
  I10_DX54                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 54"                                                
                                                                                
  I10_DX55                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 55"                                                
                                                                                
  I10_DX56                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 56"                                                
                                                                                
  I10_DX57                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 57"                                                
                                                                                
  I10_DX58                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 58"                                                
                                                                                
  I10_DX59                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 59"                                                
                                                                                
  I10_DX60                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 60"                                                
                                                                                
  I10_NDX                    LENGTH=3                                           
  LABEL="ICD-10-CM Number of diagnoses on this record"                          
                                                                                
  I10_NPR                    LENGTH=3                                           
  LABEL="ICD-10-PCS Number of procedures on this record"                        
                                                                                
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
                                                                                
  I10_PR26                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 26"                                               
                                                                                
  I10_PR27                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 27"                                               
                                                                                
  I10_PR28                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 28"                                               
                                                                                
  I10_PR29                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 29"                                               
                                                                                
  I10_PR30                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 30"                                               
                                                                                
  I10_PR31                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 31"                                               
                                                                                
  I10_PR32                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 32"                                               
                                                                                
  I10_PR33                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 33"                                               
                                                                                
  I10_PR34                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 34"                                               
                                                                                
  I10_PR35                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 35"                                               
                                                                                
  I10_PR36                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 36"                                               
                                                                                
  I10_PR37                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 37"                                               
                                                                                
  I10_PR38                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 38"                                               
                                                                                
  I10_PR39                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 39"                                               
                                                                                
  I10_PR40                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 40"                                               
                                                                                
  I10_PR41                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 41"                                               
                                                                                
  I10_PR42                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 42"                                               
                                                                                
  I10_PR43                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 43"                                               
                                                                                
  I10_PR44                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 44"                                               
                                                                                
  I10_PR45                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 45"                                               
                                                                                
  I10_PR46                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 46"                                               
                                                                                
  I10_PR47                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 47"                                               
                                                                                
  I10_PR48                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 48"                                               
                                                                                
  I10_PR49                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 49"                                               
                                                                                
  I10_PR50                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 50"                                               
                                                                                
  I10_PR51                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 51"                                               
                                                                                
  I10_PR52                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 52"                                               
                                                                                
  I10_PR53                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 53"                                               
                                                                                
  I10_PR54                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 54"                                               
                                                                                
  I10_PR55                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 55"                                               
                                                                                
  I10_PR56                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 56"                                               
                                                                                
  I10_PR57                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 57"                                               
                                                                                
  I10_PR58                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 58"                                               
                                                                                
  I10_PR59                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 59"                                               
                                                                                
  I10_PR60                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 60"                                               
                                                                                
  I10_PROCTYPE               LENGTH=3                                           
  LABEL="ICD-10-PCS Procedure type indicator"                                   
                                                                                
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
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$1                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$1                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
  PL_NCHS                    LENGTH=3                                           
  LABEL="Patient Location: NCHS Urban-Rural Code"                               
                                                                                
  PL_RUCC                    LENGTH=3                                           
  LABEL="Patient location: Rural-Urban Continuum Codes (RUCC)"                  
                                                                                
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
                                                                                
  PRDAY26                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR26"                             
                                                                                
  PRDAY27                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR27"                             
                                                                                
  PRDAY28                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR28"                             
                                                                                
  PRDAY29                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR29"                             
                                                                                
  PRDAY30                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR30"                             
                                                                                
  PRDAY31                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR31"                             
                                                                                
  PRDAY32                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR32"                             
                                                                                
  PRDAY33                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR33"                             
                                                                                
  PRDAY34                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR34"                             
                                                                                
  PRDAY35                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR35"                             
                                                                                
  PRDAY36                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR36"                             
                                                                                
  PRDAY37                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR37"                             
                                                                                
  PRDAY38                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR38"                             
                                                                                
  PRDAY39                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR39"                             
                                                                                
  PRDAY40                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR40"                             
                                                                                
  PRDAY41                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR41"                             
                                                                                
  PRDAY42                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR42"                             
                                                                                
  PRDAY43                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR43"                             
                                                                                
  PRDAY44                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR44"                             
                                                                                
  PRDAY45                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR45"                             
                                                                                
  PRDAY46                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR46"                             
                                                                                
  PRDAY47                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR47"                             
                                                                                
  PRDAY48                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR48"                             
                                                                                
  PRDAY49                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR49"                             
                                                                                
  PRDAY50                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR50"                             
                                                                                
  PRDAY51                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR51"                             
                                                                                
  PRDAY52                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR52"                             
                                                                                
  PRDAY53                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR53"                             
                                                                                
  PRDAY54                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR54"                             
                                                                                
  PRDAY55                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR55"                             
                                                                                
  PRDAY56                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR56"                             
                                                                                
  PRDAY57                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR57"                             
                                                                                
  PRDAY58                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR58"                             
                                                                                
  PRDAY59                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR59"                             
                                                                                
  PRDAY60                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR60"                             
                                                                                
  PrimLang                   LENGTH=$3                                          
  LABEL="Primary language of patient"                                           
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO                      LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_EDIT                  LENGTH=3                                           
  LABEL="Race Edit Checks"                                                      
                                                                                
  RACE_X                     LENGTH=$5                                          
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
                                                                                
  PRMONTH41                  LENGTH=3                                           
  LABEL="Month of procedure 41"                                                 
                                                                                
  PRMONTH42                  LENGTH=3                                           
  LABEL="Month of procedure 42"                                                 
                                                                                
  PRMONTH43                  LENGTH=3                                           
  LABEL="Month of procedure 43"                                                 
                                                                                
  PRMONTH44                  LENGTH=3                                           
  LABEL="Month of procedure 44"                                                 
                                                                                
  PRMONTH45                  LENGTH=3                                           
  LABEL="Month of procedure 45"                                                 
                                                                                
  PRMONTH46                  LENGTH=3                                           
  LABEL="Month of procedure 46"                                                 
                                                                                
  PRMONTH47                  LENGTH=3                                           
  LABEL="Month of procedure 47"                                                 
                                                                                
  PRMONTH48                  LENGTH=3                                           
  LABEL="Month of procedure 48"                                                 
                                                                                
  PRMONTH49                  LENGTH=3                                           
  LABEL="Month of procedure 49"                                                 
                                                                                
  PRMONTH50                  LENGTH=3                                           
  LABEL="Month of procedure 50"                                                 
                                                                                
  PRMONTH51                  LENGTH=3                                           
  LABEL="Month of procedure 51"                                                 
                                                                                
  PRMONTH52                  LENGTH=3                                           
  LABEL="Month of procedure 52"                                                 
                                                                                
  PRMONTH53                  LENGTH=3                                           
  LABEL="Month of procedure 53"                                                 
                                                                                
  PRMONTH54                  LENGTH=3                                           
  LABEL="Month of procedure 54"                                                 
                                                                                
  PRMONTH55                  LENGTH=3                                           
  LABEL="Month of procedure 55"                                                 
                                                                                
  PRMONTH56                  LENGTH=3                                           
  LABEL="Month of procedure 56"                                                 
                                                                                
  PRMONTH57                  LENGTH=3                                           
  LABEL="Month of procedure 57"                                                 
                                                                                
  PRMONTH58                  LENGTH=3                                           
  LABEL="Month of procedure 58"                                                 
                                                                                
  PRMONTH59                  LENGTH=3                                           
  LABEL="Month of procedure 59"                                                 
                                                                                
  PRMONTH60                  LENGTH=3                                           
  LABEL="Month of procedure 60"                                                 
                                                                                
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
                                                                                
  PRYEAR41                   LENGTH=3                                           
  LABEL="Year of procedure 41"                                                  
                                                                                
  PRYEAR42                   LENGTH=3                                           
  LABEL="Year of procedure 42"                                                  
                                                                                
  PRYEAR43                   LENGTH=3                                           
  LABEL="Year of procedure 43"                                                  
                                                                                
  PRYEAR44                   LENGTH=3                                           
  LABEL="Year of procedure 44"                                                  
                                                                                
  PRYEAR45                   LENGTH=3                                           
  LABEL="Year of procedure 45"                                                  
                                                                                
  PRYEAR46                   LENGTH=3                                           
  LABEL="Year of procedure 46"                                                  
                                                                                
  PRYEAR47                   LENGTH=3                                           
  LABEL="Year of procedure 47"                                                  
                                                                                
  PRYEAR48                   LENGTH=3                                           
  LABEL="Year of procedure 48"                                                  
                                                                                
  PRYEAR49                   LENGTH=3                                           
  LABEL="Year of procedure 49"                                                  
                                                                                
  PRYEAR50                   LENGTH=3                                           
  LABEL="Year of procedure 50"                                                  
                                                                                
  PRYEAR51                   LENGTH=3                                           
  LABEL="Year of procedure 51"                                                  
                                                                                
  PRYEAR52                   LENGTH=3                                           
  LABEL="Year of procedure 52"                                                  
                                                                                
  PRYEAR53                   LENGTH=3                                           
  LABEL="Year of procedure 53"                                                  
                                                                                
  PRYEAR54                   LENGTH=3                                           
  LABEL="Year of procedure 54"                                                  
                                                                                
  PRYEAR55                   LENGTH=3                                           
  LABEL="Year of procedure 55"                                                  
                                                                                
  PRYEAR56                   LENGTH=3                                           
  LABEL="Year of procedure 56"                                                  
                                                                                
  PRYEAR57                   LENGTH=3                                           
  LABEL="Year of procedure 57"                                                  
                                                                                
  PRYEAR58                   LENGTH=3                                           
  LABEL="Year of procedure 58"                                                  
                                                                                
  PRYEAR59                   LENGTH=3                                           
  LABEL="Year of procedure 59"                                                  
                                                                                
  PRYEAR60                   LENGTH=3                                           
  LABEL="Year of procedure 60"                                                  
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
      @20     BWT                           N4PF.                               
      @24     DaysToEvent                   N6PF.                               
      @30     DIED                          N2PF.                               
      @32     DISP_X                        $CHAR2.                             
      @34     DISPUB04                      N2PF.                               
      @36     DISPUNIFORM                   N2PF.                               
      @38     DMONTH                        N2PF.                               
      @40     DQTR                          N2PF.                               
      @42     DRG                           N3PF.                               
      @45     DRG_NoPOA                     N3PF.                               
      @48     DRGVER                        N2PF.                               
      @50     DXPOA1                        $CHAR1.                             
      @51     DXPOA2                        $CHAR1.                             
      @52     DXPOA3                        $CHAR1.                             
      @53     DXPOA4                        $CHAR1.                             
      @54     DXPOA5                        $CHAR1.                             
      @55     DXPOA6                        $CHAR1.                             
      @56     DXPOA7                        $CHAR1.                             
      @57     DXPOA8                        $CHAR1.                             
      @58     DXPOA9                        $CHAR1.                             
      @59     DXPOA10                       $CHAR1.                             
      @60     DXPOA11                       $CHAR1.                             
      @61     DXPOA12                       $CHAR1.                             
      @62     DXPOA13                       $CHAR1.                             
      @63     DXPOA14                       $CHAR1.                             
      @64     DXPOA15                       $CHAR1.                             
      @65     DXPOA16                       $CHAR1.                             
      @66     DXPOA17                       $CHAR1.                             
      @67     DXPOA18                       $CHAR1.                             
      @68     DXPOA19                       $CHAR1.                             
      @69     DXPOA20                       $CHAR1.                             
      @70     DXPOA21                       $CHAR1.                             
      @71     DXPOA22                       $CHAR1.                             
      @72     DXPOA23                       $CHAR1.                             
      @73     DXPOA24                       $CHAR1.                             
      @74     DXPOA25                       $CHAR1.                             
      @75     DXPOA26                       $CHAR1.                             
      @76     DXPOA27                       $CHAR1.                             
      @77     DXPOA28                       $CHAR1.                             
      @78     DXPOA29                       $CHAR1.                             
      @79     DXPOA30                       $CHAR1.                             
      @80     DXPOA31                       $CHAR1.                             
      @81     DXPOA32                       $CHAR1.                             
      @82     DXPOA33                       $CHAR1.                             
      @83     DXPOA34                       $CHAR1.                             
      @84     DXPOA35                       $CHAR1.                             
      @85     DXPOA36                       $CHAR1.                             
      @86     DXPOA37                       $CHAR1.                             
      @87     DXPOA38                       $CHAR1.                             
      @88     DXPOA39                       $CHAR1.                             
      @89     DXPOA40                       $CHAR1.                             
      @90     DXPOA41                       $CHAR1.                             
      @91     DXPOA42                       $CHAR1.                             
      @92     DXPOA43                       $CHAR1.                             
      @93     DXPOA44                       $CHAR1.                             
      @94     DXPOA45                       $CHAR1.                             
      @95     DXPOA46                       $CHAR1.                             
      @96     DXPOA47                       $CHAR1.                             
      @97     DXPOA48                       $CHAR1.                             
      @98     DXPOA49                       $CHAR1.                             
      @99     DXPOA50                       $CHAR1.                             
      @100    DXPOA51                       $CHAR1.                             
      @101    DXPOA52                       $CHAR1.                             
      @102    DXPOA53                       $CHAR1.                             
      @103    DXPOA54                       $CHAR1.                             
      @104    DXPOA55                       $CHAR1.                             
      @105    DXPOA56                       $CHAR1.                             
      @106    DXPOA57                       $CHAR1.                             
      @107    DXPOA58                       $CHAR1.                             
      @108    DXPOA59                       $CHAR1.                             
      @109    DXPOA60                       $CHAR1.                             
      @110    FEMALE                        N2PF.                               
      @112    HCUP_ED                       N2PF.                               
      @114    HCUP_OS                       N2PF.                               
      @116    HISPANIC                      N2PF.                               
      @118    HISPANIC_X                    $CHAR1.                             
      @119    HospitalUnit                  N2PF.                               
      @121    HOSPST                        $CHAR2.                             
      @123    I10_DX_Admitting              $CHAR7.                             
      @130    I10_DX1                       $CHAR7.                             
      @137    I10_DX2                       $CHAR7.                             
      @144    I10_DX3                       $CHAR7.                             
      @151    I10_DX4                       $CHAR7.                             
      @158    I10_DX5                       $CHAR7.                             
      @165    I10_DX6                       $CHAR7.                             
      @172    I10_DX7                       $CHAR7.                             
      @179    I10_DX8                       $CHAR7.                             
      @186    I10_DX9                       $CHAR7.                             
      @193    I10_DX10                      $CHAR7.                             
      @200    I10_DX11                      $CHAR7.                             
      @207    I10_DX12                      $CHAR7.                             
      @214    I10_DX13                      $CHAR7.                             
      @221    I10_DX14                      $CHAR7.                             
      @228    I10_DX15                      $CHAR7.                             
      @235    I10_DX16                      $CHAR7.                             
      @242    I10_DX17                      $CHAR7.                             
      @249    I10_DX18                      $CHAR7.                             
      @256    I10_DX19                      $CHAR7.                             
      @263    I10_DX20                      $CHAR7.                             
      @270    I10_DX21                      $CHAR7.                             
      @277    I10_DX22                      $CHAR7.                             
      @284    I10_DX23                      $CHAR7.                             
      @291    I10_DX24                      $CHAR7.                             
      @298    I10_DX25                      $CHAR7.                             
      @305    I10_DX26                      $CHAR7.                             
      @312    I10_DX27                      $CHAR7.                             
      @319    I10_DX28                      $CHAR7.                             
      @326    I10_DX29                      $CHAR7.                             
      @333    I10_DX30                      $CHAR7.                             
      @340    I10_DX31                      $CHAR7.                             
      @347    I10_DX32                      $CHAR7.                             
      @354    I10_DX33                      $CHAR7.                             
      @361    I10_DX34                      $CHAR7.                             
      @368    I10_DX35                      $CHAR7.                             
      @375    I10_DX36                      $CHAR7.                             
      @382    I10_DX37                      $CHAR7.                             
      @389    I10_DX38                      $CHAR7.                             
      @396    I10_DX39                      $CHAR7.                             
      @403    I10_DX40                      $CHAR7.                             
      @410    I10_DX41                      $CHAR7.                             
      @417    I10_DX42                      $CHAR7.                             
      @424    I10_DX43                      $CHAR7.                             
      @431    I10_DX44                      $CHAR7.                             
      @438    I10_DX45                      $CHAR7.                             
      @445    I10_DX46                      $CHAR7.                             
      @452    I10_DX47                      $CHAR7.                             
      @459    I10_DX48                      $CHAR7.                             
      @466    I10_DX49                      $CHAR7.                             
      @473    I10_DX50                      $CHAR7.                             
      @480    I10_DX51                      $CHAR7.                             
      @487    I10_DX52                      $CHAR7.                             
      @494    I10_DX53                      $CHAR7.                             
      @501    I10_DX54                      $CHAR7.                             
      @508    I10_DX55                      $CHAR7.                             
      @515    I10_DX56                      $CHAR7.                             
      @522    I10_DX57                      $CHAR7.                             
      @529    I10_DX58                      $CHAR7.                             
      @536    I10_DX59                      $CHAR7.                             
      @543    I10_DX60                      $CHAR7.                             
      @550    I10_NDX                       N3PF.                               
      @553    I10_NPR                       N3PF.                               
      @556    I10_PR1                       $CHAR7.                             
      @563    I10_PR2                       $CHAR7.                             
      @570    I10_PR3                       $CHAR7.                             
      @577    I10_PR4                       $CHAR7.                             
      @584    I10_PR5                       $CHAR7.                             
      @591    I10_PR6                       $CHAR7.                             
      @598    I10_PR7                       $CHAR7.                             
      @605    I10_PR8                       $CHAR7.                             
      @612    I10_PR9                       $CHAR7.                             
      @619    I10_PR10                      $CHAR7.                             
      @626    I10_PR11                      $CHAR7.                             
      @633    I10_PR12                      $CHAR7.                             
      @640    I10_PR13                      $CHAR7.                             
      @647    I10_PR14                      $CHAR7.                             
      @654    I10_PR15                      $CHAR7.                             
      @661    I10_PR16                      $CHAR7.                             
      @668    I10_PR17                      $CHAR7.                             
      @675    I10_PR18                      $CHAR7.                             
      @682    I10_PR19                      $CHAR7.                             
      @689    I10_PR20                      $CHAR7.                             
      @696    I10_PR21                      $CHAR7.                             
      @703    I10_PR22                      $CHAR7.                             
      @710    I10_PR23                      $CHAR7.                             
      @717    I10_PR24                      $CHAR7.                             
      @724    I10_PR25                      $CHAR7.                             
      @731    I10_PR26                      $CHAR7.                             
      @738    I10_PR27                      $CHAR7.                             
      @745    I10_PR28                      $CHAR7.                             
      @752    I10_PR29                      $CHAR7.                             
      @759    I10_PR30                      $CHAR7.                             
      @766    I10_PR31                      $CHAR7.                             
      @773    I10_PR32                      $CHAR7.                             
      @780    I10_PR33                      $CHAR7.                             
      @787    I10_PR34                      $CHAR7.                             
      @794    I10_PR35                      $CHAR7.                             
      @801    I10_PR36                      $CHAR7.                             
      @808    I10_PR37                      $CHAR7.                             
      @815    I10_PR38                      $CHAR7.                             
      @822    I10_PR39                      $CHAR7.                             
      @829    I10_PR40                      $CHAR7.                             
      @836    I10_PR41                      $CHAR7.                             
      @843    I10_PR42                      $CHAR7.                             
      @850    I10_PR43                      $CHAR7.                             
      @857    I10_PR44                      $CHAR7.                             
      @864    I10_PR45                      $CHAR7.                             
      @871    I10_PR46                      $CHAR7.                             
      @878    I10_PR47                      $CHAR7.                             
      @885    I10_PR48                      $CHAR7.                             
      @892    I10_PR49                      $CHAR7.                             
      @899    I10_PR50                      $CHAR7.                             
      @906    I10_PR51                      $CHAR7.                             
      @913    I10_PR52                      $CHAR7.                             
      @920    I10_PR53                      $CHAR7.                             
      @927    I10_PR54                      $CHAR7.                             
      @934    I10_PR55                      $CHAR7.                             
      @941    I10_PR56                      $CHAR7.                             
      @948    I10_PR57                      $CHAR7.                             
      @955    I10_PR58                      $CHAR7.                             
      @962    I10_PR59                      $CHAR7.                             
      @969    I10_PR60                      $CHAR7.                             
      @976    I10_PROCTYPE                  N3PF.                               
      @979    KEY                           15.                                 
      @994    LOS                           N5PF.                               
      @999    LOS_X                         N6PF.                               
      @1005   MDC                           N2PF.                               
      @1007   MDC_NoPOA                     N2PF.                               
      @1009   MEDINCSTQ                     N2PF.                               
      @1011   PAY1                          N2PF.                               
      @1013   PAY1_X                        $CHAR1.                             
      @1014   PAY2                          N2PF.                               
      @1016   PAY2_X                        $CHAR1.                             
      @1017   PL_CBSA                       N3PF.                               
      @1020   PL_NCHS                       N2PF.                               
      @1022   PL_RUCC                       N2PF.                               
      @1024   PL_UIC                        N2PF.                               
      @1026   PL_UR_CAT4                    N2PF.                               
      @1028   POA_Disch_Edit1               N2PF.                               
      @1030   POA_Disch_Edit2               N2PF.                               
      @1032   POA_Hosp_Edit1                N2PF.                               
      @1034   POA_Hosp_Edit2                N2PF.                               
      @1036   POA_Hosp_Edit3                N2PF.                               
      @1038   POA_Hosp_Edit3_Value          N8P2F.                              
      @1046   PointOfOrigin_X               $CHAR1.                             
      @1047   PointOfOriginUB04             $CHAR1.                             
      @1048   PRDAY1                        N5PF.                               
      @1053   PRDAY2                        N5PF.                               
      @1058   PRDAY3                        N5PF.                               
      @1063   PRDAY4                        N5PF.                               
      @1068   PRDAY5                        N5PF.                               
      @1073   PRDAY6                        N5PF.                               
      @1078   PRDAY7                        N5PF.                               
      @1083   PRDAY8                        N5PF.                               
      @1088   PRDAY9                        N5PF.                               
      @1093   PRDAY10                       N5PF.                               
      @1098   PRDAY11                       N5PF.                               
      @1103   PRDAY12                       N5PF.                               
      @1108   PRDAY13                       N5PF.                               
      @1113   PRDAY14                       N5PF.                               
      @1118   PRDAY15                       N5PF.                               
      @1123   PRDAY16                       N5PF.                               
      @1128   PRDAY17                       N5PF.                               
      @1133   PRDAY18                       N5PF.                               
      @1138   PRDAY19                       N5PF.                               
      @1143   PRDAY20                       N5PF.                               
      @1148   PRDAY21                       N5PF.                               
      @1153   PRDAY22                       N5PF.                               
      @1158   PRDAY23                       N5PF.                               
      @1163   PRDAY24                       N5PF.                               
      @1168   PRDAY25                       N5PF.                               
      @1173   PRDAY26                       N5PF.                               
      @1178   PRDAY27                       N5PF.                               
      @1183   PRDAY28                       N5PF.                               
      @1188   PRDAY29                       N5PF.                               
      @1193   PRDAY30                       N5PF.                               
      @1198   PRDAY31                       N5PF.                               
      @1203   PRDAY32                       N5PF.                               
      @1208   PRDAY33                       N5PF.                               
      @1213   PRDAY34                       N5PF.                               
      @1218   PRDAY35                       N5PF.                               
      @1223   PRDAY36                       N5PF.                               
      @1228   PRDAY37                       N5PF.                               
      @1233   PRDAY38                       N5PF.                               
      @1238   PRDAY39                       N5PF.                               
      @1243   PRDAY40                       N5PF.                               
      @1248   PRDAY41                       N5PF.                               
      @1253   PRDAY42                       N5PF.                               
      @1258   PRDAY43                       N5PF.                               
      @1263   PRDAY44                       N5PF.                               
      @1268   PRDAY45                       N5PF.                               
      @1273   PRDAY46                       N5PF.                               
      @1278   PRDAY47                       N5PF.                               
      @1283   PRDAY48                       N5PF.                               
      @1288   PRDAY49                       N5PF.                               
      @1293   PRDAY50                       N5PF.                               
      @1298   PRDAY51                       N5PF.                               
      @1303   PRDAY52                       N5PF.                               
      @1308   PRDAY53                       N5PF.                               
      @1313   PRDAY54                       N5PF.                               
      @1318   PRDAY55                       N5PF.                               
      @1323   PRDAY56                       N5PF.                               
      @1328   PRDAY57                       N5PF.                               
      @1333   PRDAY58                       N5PF.                               
      @1338   PRDAY59                       N5PF.                               
      @1343   PRDAY60                       N5PF.                               
      @1348   PrimLang                      $CHAR3.                             
      @1351   PSTATE                        $CHAR2.                             
      @1353   PSTCO                         N5PF.                               
      @1358   PSTCO2                        N5PF.                               
      @1363   RACE                          N2PF.                               
      @1365   RACE_EDIT                     N2PF.                               
      @1367   RACE_X                        $CHAR5.                             
      @1372   TOTCHG                        N10PF.                              
      @1382   TOTCHG_X                      N15P2F.                             
      @1397   TRAN_IN                       N2PF.                               
      @1399   TRAN_OUT                      N2PF.                               
      @1401   VisitLink                     N9PF.                               
      @1410   YEAR                          N4PF.                               
      @1414   ZIP                           $CHAR5.                             
      @1419   ZIP3                          $CHAR3.                             
      @1422   ZIPINC_QRTL                   N3PF.                               
      @1425   HOSPID                        N5PF.                               
      @1430   AYEAR                         N4PF.                               
      @1434   BMONTH                        N2PF.                               
      @1436   BYEAR                         N4PF.                               
      @1440   PRMONTH1                      N2PF.                               
      @1442   PRMONTH2                      N2PF.                               
      @1444   PRMONTH3                      N2PF.                               
      @1446   PRMONTH4                      N2PF.                               
      @1448   PRMONTH5                      N2PF.                               
      @1450   PRMONTH6                      N2PF.                               
      @1452   PRMONTH7                      N2PF.                               
      @1454   PRMONTH8                      N2PF.                               
      @1456   PRMONTH9                      N2PF.                               
      @1458   PRMONTH10                     N2PF.                               
      @1460   PRMONTH11                     N2PF.                               
      @1462   PRMONTH12                     N2PF.                               
      @1464   PRMONTH13                     N2PF.                               
      @1466   PRMONTH14                     N2PF.                               
      @1468   PRMONTH15                     N2PF.                               
      @1470   PRMONTH16                     N2PF.                               
      @1472   PRMONTH17                     N2PF.                               
      @1474   PRMONTH18                     N2PF.                               
      @1476   PRMONTH19                     N2PF.                               
      @1478   PRMONTH20                     N2PF.                               
      @1480   PRMONTH21                     N2PF.                               
      @1482   PRMONTH22                     N2PF.                               
      @1484   PRMONTH23                     N2PF.                               
      @1486   PRMONTH24                     N2PF.                               
      @1488   PRMONTH25                     N2PF.                               
      @1490   PRMONTH26                     N2PF.                               
      @1492   PRMONTH27                     N2PF.                               
      @1494   PRMONTH28                     N2PF.                               
      @1496   PRMONTH29                     N2PF.                               
      @1498   PRMONTH30                     N2PF.                               
      @1500   PRMONTH31                     N2PF.                               
      @1502   PRMONTH32                     N2PF.                               
      @1504   PRMONTH33                     N2PF.                               
      @1506   PRMONTH34                     N2PF.                               
      @1508   PRMONTH35                     N2PF.                               
      @1510   PRMONTH36                     N2PF.                               
      @1512   PRMONTH37                     N2PF.                               
      @1514   PRMONTH38                     N2PF.                               
      @1516   PRMONTH39                     N2PF.                               
      @1518   PRMONTH40                     N2PF.                               
      @1520   PRMONTH41                     N2PF.                               
      @1522   PRMONTH42                     N2PF.                               
      @1524   PRMONTH43                     N2PF.                               
      @1526   PRMONTH44                     N2PF.                               
      @1528   PRMONTH45                     N2PF.                               
      @1530   PRMONTH46                     N2PF.                               
      @1532   PRMONTH47                     N2PF.                               
      @1534   PRMONTH48                     N2PF.                               
      @1536   PRMONTH49                     N2PF.                               
      @1538   PRMONTH50                     N2PF.                               
      @1540   PRMONTH51                     N2PF.                               
      @1542   PRMONTH52                     N2PF.                               
      @1544   PRMONTH53                     N2PF.                               
      @1546   PRMONTH54                     N2PF.                               
      @1548   PRMONTH55                     N2PF.                               
      @1550   PRMONTH56                     N2PF.                               
      @1552   PRMONTH57                     N2PF.                               
      @1554   PRMONTH58                     N2PF.                               
      @1556   PRMONTH59                     N2PF.                               
      @1558   PRMONTH60                     N2PF.                               
      @1560   PRYEAR1                       N4PF.                               
      @1564   PRYEAR2                       N4PF.                               
      @1568   PRYEAR3                       N4PF.                               
      @1572   PRYEAR4                       N4PF.                               
      @1576   PRYEAR5                       N4PF.                               
      @1580   PRYEAR6                       N4PF.                               
      @1584   PRYEAR7                       N4PF.                               
      @1588   PRYEAR8                       N4PF.                               
      @1592   PRYEAR9                       N4PF.                               
      @1596   PRYEAR10                      N4PF.                               
      @1600   PRYEAR11                      N4PF.                               
      @1604   PRYEAR12                      N4PF.                               
      @1608   PRYEAR13                      N4PF.                               
      @1612   PRYEAR14                      N4PF.                               
      @1616   PRYEAR15                      N4PF.                               
      @1620   PRYEAR16                      N4PF.                               
      @1624   PRYEAR17                      N4PF.                               
      @1628   PRYEAR18                      N4PF.                               
      @1632   PRYEAR19                      N4PF.                               
      @1636   PRYEAR20                      N4PF.                               
      @1640   PRYEAR21                      N4PF.                               
      @1644   PRYEAR22                      N4PF.                               
      @1648   PRYEAR23                      N4PF.                               
      @1652   PRYEAR24                      N4PF.                               
      @1656   PRYEAR25                      N4PF.                               
      @1660   PRYEAR26                      N4PF.                               
      @1664   PRYEAR27                      N4PF.                               
      @1668   PRYEAR28                      N4PF.                               
      @1672   PRYEAR29                      N4PF.                               
      @1676   PRYEAR30                      N4PF.                               
      @1680   PRYEAR31                      N4PF.                               
      @1684   PRYEAR32                      N4PF.                               
      @1688   PRYEAR33                      N4PF.                               
      @1692   PRYEAR34                      N4PF.                               
      @1696   PRYEAR35                      N4PF.                               
      @1700   PRYEAR36                      N4PF.                               
      @1704   PRYEAR37                      N4PF.                               
      @1708   PRYEAR38                      N4PF.                               
      @1712   PRYEAR39                      N4PF.                               
      @1716   PRYEAR40                      N4PF.                               
      @1720   PRYEAR41                      N4PF.                               
      @1724   PRYEAR42                      N4PF.                               
      @1728   PRYEAR43                      N4PF.                               
      @1732   PRYEAR44                      N4PF.                               
      @1736   PRYEAR45                      N4PF.                               
      @1740   PRYEAR46                      N4PF.                               
      @1744   PRYEAR47                      N4PF.                               
      @1748   PRYEAR48                      N4PF.                               
      @1752   PRYEAR49                      N4PF.                               
      @1756   PRYEAR50                      N4PF.                               
      @1760   PRYEAR51                      N4PF.                               
      @1764   PRYEAR52                      N4PF.                               
      @1768   PRYEAR53                      N4PF.                               
      @1772   PRYEAR54                      N4PF.                               
      @1776   PRYEAR55                      N4PF.                               
      @1780   PRYEAR56                      N4PF.                               
      @1784   PRYEAR57                      N4PF.                               
      @1788   PRYEAR58                      N4PF.                               
      @1792   PRYEAR59                      N4PF.                               
      @1796   PRYEAR60                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
