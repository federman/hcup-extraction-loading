/*******************************************************************            
* Creation Date: 09/19/2022                                                     
*   MD_SID_2021_CORE.SAS:                                                       
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
DATA MD_SIDC_2021_CORE;                                                         
INFILE 'MD_SID_2021_CORE.ASC' FIRSTOBS=3 LRECL = 1883;                          
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
  AGE                        LENGTH=3                                           
  LABEL="Age in years at admission"                                             
                                                                                
  AGEDAY                     LENGTH=3                                           
  LABEL="Age in days (when age < 1 year)"                                       
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  BWT                        LENGTH=4                                           
  LABEL="Birth weight in grams"                                                 
                                                                                
  DaysBurnUnit               LENGTH=3                                           
  LABEL="Days in burn care unit (as received from source)"                      
                                                                                
  DaysCCU                    LENGTH=3                                           
  LABEL="Days in coronary care unit (as received from source)"                  
                                                                                
  DaysICU                    LENGTH=3                                           
  LABEL="Days in medical/surgical intensive care unit (as received from source)"
                                                                                
  DaysNICU                   LENGTH=3                                           
  LABEL="Days in neonetal care unit (as received from source)"                  
                                                                                
  DaysPICU                   LENGTH=3                                           
  LABEL="Days in pediatric care unit (as received from source)"                 
                                                                                
  DaysShockUnit              LENGTH=3                                           
  LABEL="Days in shock trauma unit (as received from source"                    
                                                                                
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
                                                                                
  DQTR                       LENGTH=3                                           
  LABEL="Discharge quarter"                                                     
                                                                                
  DRG                        LENGTH=3                                           
  LABEL="DRG in effect on discharge date"                                       
                                                                                
  DRG_NoPOA                  LENGTH=3                                           
  LABEL="DRG in use on discharge date, calculated without POA"                  
                                                                                
  DRGVER                     LENGTH=3                                           
  LABEL="DRG grouper version used on discharge date"                            
                                                                                
  DSHOSPID                   LENGTH=$17                                         
  LABEL="Data source hospital identifier"                                       
                                                                                
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
                                                                                
  DXPOA61                    LENGTH=$1                                          
  LABEL="Diagnosis 61, present on admission indicator"                          
                                                                                
  DXPOA62                    LENGTH=$1                                          
  LABEL="Diagnosis 62, present on admission indicator"                          
                                                                                
  DXPOA63                    LENGTH=$1                                          
  LABEL="Diagnosis 63, present on admission indicator"                          
                                                                                
  DXPOA64                    LENGTH=$1                                          
  LABEL="Diagnosis 64, present on admission indicator"                          
                                                                                
  DXPOA65                    LENGTH=$1                                          
  LABEL="Diagnosis 65, present on admission indicator"                          
                                                                                
  DXPOA66                    LENGTH=$1                                          
  LABEL="Diagnosis 66, present on admission indicator"                          
                                                                                
  DXPOA67                    LENGTH=$1                                          
  LABEL="Diagnosis 67, present on admission indicator"                          
                                                                                
  DXPOA68                    LENGTH=$1                                          
  LABEL="Diagnosis 68, present on admission indicator"                          
                                                                                
  DXPOA69                    LENGTH=$1                                          
  LABEL="Diagnosis 69, present on admission indicator"                          
                                                                                
  DXPOA70                    LENGTH=$1                                          
  LABEL="Diagnosis 70, present on admission indicator"                          
                                                                                
  DXPOA71                    LENGTH=$1                                          
  LABEL="Diagnosis 71, present on admission indicator"                          
                                                                                
  DXPOA72                    LENGTH=$1                                          
  LABEL="Diagnosis 72, present on admission indicator"                          
                                                                                
  DXPOA73                    LENGTH=$1                                          
  LABEL="Diagnosis 73, present on admission indicator"                          
                                                                                
  DXPOA74                    LENGTH=$1                                          
  LABEL="Diagnosis 74, present on admission indicator"                          
                                                                                
  DXPOA75                    LENGTH=$1                                          
  LABEL="Diagnosis 75, present on admission indicator"                          
                                                                                
  DXPOA76                    LENGTH=$1                                          
  LABEL="Diagnosis 76, present on admission indicator"                          
                                                                                
  DXPOA77                    LENGTH=$1                                          
  LABEL="Diagnosis 77, present on admission indicator"                          
                                                                                
  DXPOA78                    LENGTH=$1                                          
  LABEL="Diagnosis 78, present on admission indicator"                          
                                                                                
  DXPOA79                    LENGTH=$1                                          
  LABEL="Diagnosis 79, present on admission indicator"                          
                                                                                
  DXPOA80                    LENGTH=$1                                          
  LABEL="Diagnosis 80, present on admission indicator"                          
                                                                                
  DXPOA81                    LENGTH=$1                                          
  LABEL="Diagnosis 81, present on admission indicator"                          
                                                                                
  DXPOA82                    LENGTH=$1                                          
  LABEL="Diagnosis 82, present on admission indicator"                          
                                                                                
  DXPOA83                    LENGTH=$1                                          
  LABEL="Diagnosis 83, present on admission indicator"                          
                                                                                
  DXPOA84                    LENGTH=$1                                          
  LABEL="Diagnosis 84, present on admission indicator"                          
                                                                                
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
                                                                                
  Homeless                   LENGTH=3                                           
  LABEL="Indicator that patient is homeless"                                    
                                                                                
  HospitalUnit               LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Patient was discharged from a special unit within an acute care hospital (repor
ted by source)"                                                                 
                                                                                
  HOSPST                     LENGTH=$2                                          
  LABEL="Hospital state postal code"                                            
                                                                                
  I10_BIRTH                  LENGTH=3                                           
  LABEL="ICD-10-CM Birth Indicator"                                             
                                                                                
  I10_DELIVERY               LENGTH=3                                           
  LABEL="ICD-10-CM Delivery Indicator"                                          
                                                                                
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
                                                                                
  I10_DX61                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 61"                                                
                                                                                
  I10_DX62                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 62"                                                
                                                                                
  I10_DX63                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 63"                                                
                                                                                
  I10_DX64                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 64"                                                
                                                                                
  I10_DX65                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 65"                                                
                                                                                
  I10_DX66                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 66"                                                
                                                                                
  I10_DX67                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 67"                                                
                                                                                
  I10_DX68                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 68"                                                
                                                                                
  I10_DX69                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 69"                                                
                                                                                
  I10_DX70                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 70"                                                
                                                                                
  I10_DX71                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 71"                                                
                                                                                
  I10_DX72                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 72"                                                
                                                                                
  I10_DX73                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 73"                                                
                                                                                
  I10_DX74                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 74"                                                
                                                                                
  I10_DX75                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 75"                                                
                                                                                
  I10_DX76                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 76"                                                
                                                                                
  I10_DX77                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 77"                                                
                                                                                
  I10_DX78                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 78"                                                
                                                                                
  I10_DX79                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 79"                                                
                                                                                
  I10_DX80                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 80"                                                
                                                                                
  I10_DX81                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 81"                                                
                                                                                
  I10_DX82                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 82"                                                
                                                                                
  I10_DX83                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 83"                                                
                                                                                
  I10_DX84                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 84"                                                
                                                                                
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
                                                                                
  I10_PR61                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 61"                                               
                                                                                
  I10_PR62                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 62"                                               
                                                                                
  I10_PR63                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 63"                                               
                                                                                
  I10_PR64                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 64"                                               
                                                                                
  I10_PR65                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 65"                                               
                                                                                
  I10_PR66                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 66"                                               
                                                                                
  I10_PR67                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 67"                                               
                                                                                
  I10_PR68                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 68"                                               
                                                                                
  I10_PR69                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 69"                                               
                                                                                
  I10_PR70                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 70"                                               
                                                                                
  I10_PR71                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 71"                                               
                                                                                
  I10_PR72                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 72"                                               
                                                                                
  I10_PR73                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 73"                                               
                                                                                
  I10_PR74                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 74"                                               
                                                                                
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
                                                                                
  MARITALSTATUS_X            LENGTH=$1                                          
  LABEL="Patient's marital status (as received from source)"                    
                                                                                
  MARITALSTATUSUB04          LENGTH=$1                                          
  LABEL="Patient's marital status, UB-04 standard coding"                       
                                                                                
  MDC                        LENGTH=3                                           
  LABEL="MDC in effect on discharge date"                                       
                                                                                
  MDC_NoPOA                  LENGTH=3                                           
  LABEL="MDC in use on discharge date, calculated without POA"                  
                                                                                
  MDNUM1_R                   LENGTH=5                                           
  LABEL="Physician 1 number (re-identified)"                                    
                                                                                
  MDNUM2_R                   LENGTH=5                                           
  LABEL="Physician 2 number (re-identified)"                                    
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  P7EDSRC_X                  LENGTH=$2                                          
  LABEL="Condition Code P7, Direct Inpatient Admission from Emergency Room"     
                                                                                
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
                                                                                
  PAYER1_X                   LENGTH=$3                                          
  LABEL="Primary expected payer plan identifier (as received from source)"      
                                                                                
  PAYER2_X                   LENGTH=$3                                          
  LABEL="Secondary expected payer plan identifier (as received from source)"    
                                                                                
  PAYER3_X                   LENGTH=$3                                          
  LABEL="Tertiary expected payer plan identifier (as received from source)"     
                                                                                
  PCLASS_ORPROC              LENGTH=3                                           
  LABEL=                                                                        
                                                                                
"Indicates operating room (major diagnostic or therapeutic) procedure on the rec
ord"                                                                            
                                                                                
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
                                                                                
  PointOfOrigin_X            LENGTH=$2                                          
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
                                                                                
  PRDAY61                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR61"                             
                                                                                
  PRDAY62                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR62"                             
                                                                                
  PRDAY63                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR63"                             
                                                                                
  PRDAY64                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR64"                             
                                                                                
  PRDAY65                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR65"                             
                                                                                
  PRDAY66                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR66"                             
                                                                                
  PRDAY67                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR67"                             
                                                                                
  PRDAY68                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR68"                             
                                                                                
  PRDAY69                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR69"                             
                                                                                
  PRDAY70                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR70"                             
                                                                                
  PRDAY71                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR71"                             
                                                                                
  PRDAY72                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR72"                             
                                                                                
  PRDAY73                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR73"                             
                                                                                
  PRDAY74                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR74"                             
                                                                                
  PrimLang                   LENGTH=$3                                          
  LABEL="Primary language of patient"                                           
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTATE_GEO                 LENGTH=$2                                          
  LABEL="Patient State postal code assigned from ZIP Code"                      
                                                                                
  PSTCO                      LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code"                                        
                                                                                
  PSTCO_GEO                  LENGTH=4                      FORMAT=Z5.           
  LABEL="Counties assigned based on ZIP Code geographic centroids"              
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_PCT_MISS_HOSP         LENGTH=4                      FORMAT=6.2           
  LABEL="Hospital percentage of missing or invalid race values"                 
                                                                                
  RACE_X                     LENGTH=$1                                          
  LABEL="Race (as received from source)"                                        
                                                                                
  READMIT                    LENGTH=3                                           
  LABEL="Readmission"                                                           
                                                                                
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
                                                                                
  AYEAR                      LENGTH=3                                           
  LABEL="Admission year"                                                        
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                           N3PF.                               
      @4      AGEDAY                        N3PF.                               
      @7      AGEMONTH                      N3PF.                               
      @10     ATYPE                         N2PF.                               
      @12     AWEEKEND                      N2PF.                               
      @14     BWT                           N4PF.                               
      @18     DaysBurnUnit                  N3PF.                               
      @21     DaysCCU                       N3PF.                               
      @24     DaysICU                       N3PF.                               
      @27     DaysNICU                      N3PF.                               
      @30     DaysPICU                      N3PF.                               
      @33     DaysShockUnit                 N3PF.                               
      @36     DaysToEvent                   N6PF.                               
      @42     DIED                          N2PF.                               
      @44     DISP_X                        $CHAR2.                             
      @46     DISPUB04                      N2PF.                               
      @48     DISPUNIFORM                   N2PF.                               
      @50     DQTR                          N2PF.                               
      @52     DRG                           N3PF.                               
      @55     DRG_NoPOA                     N3PF.                               
      @58     DRGVER                        N2PF.                               
      @60     DSHOSPID                      $CHAR17.                            
      @77     DXPOA1                        $CHAR1.                             
      @78     DXPOA2                        $CHAR1.                             
      @79     DXPOA3                        $CHAR1.                             
      @80     DXPOA4                        $CHAR1.                             
      @81     DXPOA5                        $CHAR1.                             
      @82     DXPOA6                        $CHAR1.                             
      @83     DXPOA7                        $CHAR1.                             
      @84     DXPOA8                        $CHAR1.                             
      @85     DXPOA9                        $CHAR1.                             
      @86     DXPOA10                       $CHAR1.                             
      @87     DXPOA11                       $CHAR1.                             
      @88     DXPOA12                       $CHAR1.                             
      @89     DXPOA13                       $CHAR1.                             
      @90     DXPOA14                       $CHAR1.                             
      @91     DXPOA15                       $CHAR1.                             
      @92     DXPOA16                       $CHAR1.                             
      @93     DXPOA17                       $CHAR1.                             
      @94     DXPOA18                       $CHAR1.                             
      @95     DXPOA19                       $CHAR1.                             
      @96     DXPOA20                       $CHAR1.                             
      @97     DXPOA21                       $CHAR1.                             
      @98     DXPOA22                       $CHAR1.                             
      @99     DXPOA23                       $CHAR1.                             
      @100    DXPOA24                       $CHAR1.                             
      @101    DXPOA25                       $CHAR1.                             
      @102    DXPOA26                       $CHAR1.                             
      @103    DXPOA27                       $CHAR1.                             
      @104    DXPOA28                       $CHAR1.                             
      @105    DXPOA29                       $CHAR1.                             
      @106    DXPOA30                       $CHAR1.                             
      @107    DXPOA31                       $CHAR1.                             
      @108    DXPOA32                       $CHAR1.                             
      @109    DXPOA33                       $CHAR1.                             
      @110    DXPOA34                       $CHAR1.                             
      @111    DXPOA35                       $CHAR1.                             
      @112    DXPOA36                       $CHAR1.                             
      @113    DXPOA37                       $CHAR1.                             
      @114    DXPOA38                       $CHAR1.                             
      @115    DXPOA39                       $CHAR1.                             
      @116    DXPOA40                       $CHAR1.                             
      @117    DXPOA41                       $CHAR1.                             
      @118    DXPOA42                       $CHAR1.                             
      @119    DXPOA43                       $CHAR1.                             
      @120    DXPOA44                       $CHAR1.                             
      @121    DXPOA45                       $CHAR1.                             
      @122    DXPOA46                       $CHAR1.                             
      @123    DXPOA47                       $CHAR1.                             
      @124    DXPOA48                       $CHAR1.                             
      @125    DXPOA49                       $CHAR1.                             
      @126    DXPOA50                       $CHAR1.                             
      @127    DXPOA51                       $CHAR1.                             
      @128    DXPOA52                       $CHAR1.                             
      @129    DXPOA53                       $CHAR1.                             
      @130    DXPOA54                       $CHAR1.                             
      @131    DXPOA55                       $CHAR1.                             
      @132    DXPOA56                       $CHAR1.                             
      @133    DXPOA57                       $CHAR1.                             
      @134    DXPOA58                       $CHAR1.                             
      @135    DXPOA59                       $CHAR1.                             
      @136    DXPOA60                       $CHAR1.                             
      @137    DXPOA61                       $CHAR1.                             
      @138    DXPOA62                       $CHAR1.                             
      @139    DXPOA63                       $CHAR1.                             
      @140    DXPOA64                       $CHAR1.                             
      @141    DXPOA65                       $CHAR1.                             
      @142    DXPOA66                       $CHAR1.                             
      @143    DXPOA67                       $CHAR1.                             
      @144    DXPOA68                       $CHAR1.                             
      @145    DXPOA69                       $CHAR1.                             
      @146    DXPOA70                       $CHAR1.                             
      @147    DXPOA71                       $CHAR1.                             
      @148    DXPOA72                       $CHAR1.                             
      @149    DXPOA73                       $CHAR1.                             
      @150    DXPOA74                       $CHAR1.                             
      @151    DXPOA75                       $CHAR1.                             
      @152    DXPOA76                       $CHAR1.                             
      @153    DXPOA77                       $CHAR1.                             
      @154    DXPOA78                       $CHAR1.                             
      @155    DXPOA79                       $CHAR1.                             
      @156    DXPOA80                       $CHAR1.                             
      @157    DXPOA81                       $CHAR1.                             
      @158    DXPOA82                       $CHAR1.                             
      @159    DXPOA83                       $CHAR1.                             
      @160    DXPOA84                       $CHAR1.                             
      @161    FEMALE                        N2PF.                               
      @163    HCUP_ED                       N2PF.                               
      @165    HCUP_OS                       N2PF.                               
      @167    HISPANIC                      N2PF.                               
      @169    HISPANIC_X                    $CHAR1.                             
      @170    Homeless                      N2PF.                               
      @172    HospitalUnit                  N2PF.                               
      @174    HOSPST                        $CHAR2.                             
      @176    I10_BIRTH                     N3PF.                               
      @179    I10_DELIVERY                  N3PF.                               
      @182    I10_DX1                       $CHAR7.                             
      @189    I10_DX2                       $CHAR7.                             
      @196    I10_DX3                       $CHAR7.                             
      @203    I10_DX4                       $CHAR7.                             
      @210    I10_DX5                       $CHAR7.                             
      @217    I10_DX6                       $CHAR7.                             
      @224    I10_DX7                       $CHAR7.                             
      @231    I10_DX8                       $CHAR7.                             
      @238    I10_DX9                       $CHAR7.                             
      @245    I10_DX10                      $CHAR7.                             
      @252    I10_DX11                      $CHAR7.                             
      @259    I10_DX12                      $CHAR7.                             
      @266    I10_DX13                      $CHAR7.                             
      @273    I10_DX14                      $CHAR7.                             
      @280    I10_DX15                      $CHAR7.                             
      @287    I10_DX16                      $CHAR7.                             
      @294    I10_DX17                      $CHAR7.                             
      @301    I10_DX18                      $CHAR7.                             
      @308    I10_DX19                      $CHAR7.                             
      @315    I10_DX20                      $CHAR7.                             
      @322    I10_DX21                      $CHAR7.                             
      @329    I10_DX22                      $CHAR7.                             
      @336    I10_DX23                      $CHAR7.                             
      @343    I10_DX24                      $CHAR7.                             
      @350    I10_DX25                      $CHAR7.                             
      @357    I10_DX26                      $CHAR7.                             
      @364    I10_DX27                      $CHAR7.                             
      @371    I10_DX28                      $CHAR7.                             
      @378    I10_DX29                      $CHAR7.                             
      @385    I10_DX30                      $CHAR7.                             
      @392    I10_DX31                      $CHAR7.                             
      @399    I10_DX32                      $CHAR7.                             
      @406    I10_DX33                      $CHAR7.                             
      @413    I10_DX34                      $CHAR7.                             
      @420    I10_DX35                      $CHAR7.                             
      @427    I10_DX36                      $CHAR7.                             
      @434    I10_DX37                      $CHAR7.                             
      @441    I10_DX38                      $CHAR7.                             
      @448    I10_DX39                      $CHAR7.                             
      @455    I10_DX40                      $CHAR7.                             
      @462    I10_DX41                      $CHAR7.                             
      @469    I10_DX42                      $CHAR7.                             
      @476    I10_DX43                      $CHAR7.                             
      @483    I10_DX44                      $CHAR7.                             
      @490    I10_DX45                      $CHAR7.                             
      @497    I10_DX46                      $CHAR7.                             
      @504    I10_DX47                      $CHAR7.                             
      @511    I10_DX48                      $CHAR7.                             
      @518    I10_DX49                      $CHAR7.                             
      @525    I10_DX50                      $CHAR7.                             
      @532    I10_DX51                      $CHAR7.                             
      @539    I10_DX52                      $CHAR7.                             
      @546    I10_DX53                      $CHAR7.                             
      @553    I10_DX54                      $CHAR7.                             
      @560    I10_DX55                      $CHAR7.                             
      @567    I10_DX56                      $CHAR7.                             
      @574    I10_DX57                      $CHAR7.                             
      @581    I10_DX58                      $CHAR7.                             
      @588    I10_DX59                      $CHAR7.                             
      @595    I10_DX60                      $CHAR7.                             
      @602    I10_DX61                      $CHAR7.                             
      @609    I10_DX62                      $CHAR7.                             
      @616    I10_DX63                      $CHAR7.                             
      @623    I10_DX64                      $CHAR7.                             
      @630    I10_DX65                      $CHAR7.                             
      @637    I10_DX66                      $CHAR7.                             
      @644    I10_DX67                      $CHAR7.                             
      @651    I10_DX68                      $CHAR7.                             
      @658    I10_DX69                      $CHAR7.                             
      @665    I10_DX70                      $CHAR7.                             
      @672    I10_DX71                      $CHAR7.                             
      @679    I10_DX72                      $CHAR7.                             
      @686    I10_DX73                      $CHAR7.                             
      @693    I10_DX74                      $CHAR7.                             
      @700    I10_DX75                      $CHAR7.                             
      @707    I10_DX76                      $CHAR7.                             
      @714    I10_DX77                      $CHAR7.                             
      @721    I10_DX78                      $CHAR7.                             
      @728    I10_DX79                      $CHAR7.                             
      @735    I10_DX80                      $CHAR7.                             
      @742    I10_DX81                      $CHAR7.                             
      @749    I10_DX82                      $CHAR7.                             
      @756    I10_DX83                      $CHAR7.                             
      @763    I10_DX84                      $CHAR7.                             
      @770    I10_NDX                       N3PF.                               
      @773    I10_NPR                       N3PF.                               
      @776    I10_PR1                       $CHAR7.                             
      @783    I10_PR2                       $CHAR7.                             
      @790    I10_PR3                       $CHAR7.                             
      @797    I10_PR4                       $CHAR7.                             
      @804    I10_PR5                       $CHAR7.                             
      @811    I10_PR6                       $CHAR7.                             
      @818    I10_PR7                       $CHAR7.                             
      @825    I10_PR8                       $CHAR7.                             
      @832    I10_PR9                       $CHAR7.                             
      @839    I10_PR10                      $CHAR7.                             
      @846    I10_PR11                      $CHAR7.                             
      @853    I10_PR12                      $CHAR7.                             
      @860    I10_PR13                      $CHAR7.                             
      @867    I10_PR14                      $CHAR7.                             
      @874    I10_PR15                      $CHAR7.                             
      @881    I10_PR16                      $CHAR7.                             
      @888    I10_PR17                      $CHAR7.                             
      @895    I10_PR18                      $CHAR7.                             
      @902    I10_PR19                      $CHAR7.                             
      @909    I10_PR20                      $CHAR7.                             
      @916    I10_PR21                      $CHAR7.                             
      @923    I10_PR22                      $CHAR7.                             
      @930    I10_PR23                      $CHAR7.                             
      @937    I10_PR24                      $CHAR7.                             
      @944    I10_PR25                      $CHAR7.                             
      @951    I10_PR26                      $CHAR7.                             
      @958    I10_PR27                      $CHAR7.                             
      @965    I10_PR28                      $CHAR7.                             
      @972    I10_PR29                      $CHAR7.                             
      @979    I10_PR30                      $CHAR7.                             
      @986    I10_PR31                      $CHAR7.                             
      @993    I10_PR32                      $CHAR7.                             
      @1000   I10_PR33                      $CHAR7.                             
      @1007   I10_PR34                      $CHAR7.                             
      @1014   I10_PR35                      $CHAR7.                             
      @1021   I10_PR36                      $CHAR7.                             
      @1028   I10_PR37                      $CHAR7.                             
      @1035   I10_PR38                      $CHAR7.                             
      @1042   I10_PR39                      $CHAR7.                             
      @1049   I10_PR40                      $CHAR7.                             
      @1056   I10_PR41                      $CHAR7.                             
      @1063   I10_PR42                      $CHAR7.                             
      @1070   I10_PR43                      $CHAR7.                             
      @1077   I10_PR44                      $CHAR7.                             
      @1084   I10_PR45                      $CHAR7.                             
      @1091   I10_PR46                      $CHAR7.                             
      @1098   I10_PR47                      $CHAR7.                             
      @1105   I10_PR48                      $CHAR7.                             
      @1112   I10_PR49                      $CHAR7.                             
      @1119   I10_PR50                      $CHAR7.                             
      @1126   I10_PR51                      $CHAR7.                             
      @1133   I10_PR52                      $CHAR7.                             
      @1140   I10_PR53                      $CHAR7.                             
      @1147   I10_PR54                      $CHAR7.                             
      @1154   I10_PR55                      $CHAR7.                             
      @1161   I10_PR56                      $CHAR7.                             
      @1168   I10_PR57                      $CHAR7.                             
      @1175   I10_PR58                      $CHAR7.                             
      @1182   I10_PR59                      $CHAR7.                             
      @1189   I10_PR60                      $CHAR7.                             
      @1196   I10_PR61                      $CHAR7.                             
      @1203   I10_PR62                      $CHAR7.                             
      @1210   I10_PR63                      $CHAR7.                             
      @1217   I10_PR64                      $CHAR7.                             
      @1224   I10_PR65                      $CHAR7.                             
      @1231   I10_PR66                      $CHAR7.                             
      @1238   I10_PR67                      $CHAR7.                             
      @1245   I10_PR68                      $CHAR7.                             
      @1252   I10_PR69                      $CHAR7.                             
      @1259   I10_PR70                      $CHAR7.                             
      @1266   I10_PR71                      $CHAR7.                             
      @1273   I10_PR72                      $CHAR7.                             
      @1280   I10_PR73                      $CHAR7.                             
      @1287   I10_PR74                      $CHAR7.                             
      @1294   I10_PROCTYPE                  N3PF.                               
      @1297   I10_SERVICELINE               N2PF.                               
      @1299   KEY                           15.                                 
      @1314   LOS                           N5PF.                               
      @1319   LOS_X                         N6PF.                               
      @1325   MARITALSTATUS_X               $CHAR1.                             
      @1326   MARITALSTATUSUB04             $CHAR1.                             
      @1327   MDC                           N2PF.                               
      @1329   MDC_NoPOA                     N2PF.                               
      @1331   MDNUM1_R                      N9PF.                               
      @1340   MDNUM2_R                      N9PF.                               
      @1349   MEDINCSTQ                     N2PF.                               
      @1351   MRN_R                         N9PF.                               
      @1360   OS_TIME                       N11P2F.                             
      @1371   P7EDSRC_X                     $CHAR2.                             
      @1373   PAY1                          N2PF.                               
      @1375   PAY1_X                        $CHAR2.                             
      @1377   PAY2                          N2PF.                               
      @1379   PAY2_X                        $CHAR2.                             
      @1381   PAY3                          N2PF.                               
      @1383   PAY3_X                        $CHAR2.                             
      @1385   PAYER1_X                      $CHAR3.                             
      @1388   PAYER2_X                      $CHAR3.                             
      @1391   PAYER3_X                      $CHAR3.                             
      @1394   PCLASS_ORPROC                 N2PF.                               
      @1396   PL_CBSA                       N3PF.                               
      @1399   PL_NCHS                       N2PF.                               
      @1401   PL_RUCC                       N2PF.                               
      @1403   PL_UIC                        N2PF.                               
      @1405   PL_UR_CAT4                    N2PF.                               
      @1407   POA_Disch_Edit1               N2PF.                               
      @1409   POA_Disch_Edit2               N2PF.                               
      @1411   POA_Hosp_Edit1                N2PF.                               
      @1413   POA_Hosp_Edit2                N2PF.                               
      @1415   POA_Hosp_Edit3                N2PF.                               
      @1417   POA_Hosp_Edit3_Value          N8P2F.                              
      @1425   PointOfOrigin_X               $CHAR2.                             
      @1427   PointOfOriginUB04             $CHAR1.                             
      @1428   PRDAY1                        N5PF.                               
      @1433   PRDAY2                        N5PF.                               
      @1438   PRDAY3                        N5PF.                               
      @1443   PRDAY4                        N5PF.                               
      @1448   PRDAY5                        N5PF.                               
      @1453   PRDAY6                        N5PF.                               
      @1458   PRDAY7                        N5PF.                               
      @1463   PRDAY8                        N5PF.                               
      @1468   PRDAY9                        N5PF.                               
      @1473   PRDAY10                       N5PF.                               
      @1478   PRDAY11                       N5PF.                               
      @1483   PRDAY12                       N5PF.                               
      @1488   PRDAY13                       N5PF.                               
      @1493   PRDAY14                       N5PF.                               
      @1498   PRDAY15                       N5PF.                               
      @1503   PRDAY16                       N5PF.                               
      @1508   PRDAY17                       N5PF.                               
      @1513   PRDAY18                       N5PF.                               
      @1518   PRDAY19                       N5PF.                               
      @1523   PRDAY20                       N5PF.                               
      @1528   PRDAY21                       N5PF.                               
      @1533   PRDAY22                       N5PF.                               
      @1538   PRDAY23                       N5PF.                               
      @1543   PRDAY24                       N5PF.                               
      @1548   PRDAY25                       N5PF.                               
      @1553   PRDAY26                       N5PF.                               
      @1558   PRDAY27                       N5PF.                               
      @1563   PRDAY28                       N5PF.                               
      @1568   PRDAY29                       N5PF.                               
      @1573   PRDAY30                       N5PF.                               
      @1578   PRDAY31                       N5PF.                               
      @1583   PRDAY32                       N5PF.                               
      @1588   PRDAY33                       N5PF.                               
      @1593   PRDAY34                       N5PF.                               
      @1598   PRDAY35                       N5PF.                               
      @1603   PRDAY36                       N5PF.                               
      @1608   PRDAY37                       N5PF.                               
      @1613   PRDAY38                       N5PF.                               
      @1618   PRDAY39                       N5PF.                               
      @1623   PRDAY40                       N5PF.                               
      @1628   PRDAY41                       N5PF.                               
      @1633   PRDAY42                       N5PF.                               
      @1638   PRDAY43                       N5PF.                               
      @1643   PRDAY44                       N5PF.                               
      @1648   PRDAY45                       N5PF.                               
      @1653   PRDAY46                       N5PF.                               
      @1658   PRDAY47                       N5PF.                               
      @1663   PRDAY48                       N5PF.                               
      @1668   PRDAY49                       N5PF.                               
      @1673   PRDAY50                       N5PF.                               
      @1678   PRDAY51                       N5PF.                               
      @1683   PRDAY52                       N5PF.                               
      @1688   PRDAY53                       N5PF.                               
      @1693   PRDAY54                       N5PF.                               
      @1698   PRDAY55                       N5PF.                               
      @1703   PRDAY56                       N5PF.                               
      @1708   PRDAY57                       N5PF.                               
      @1713   PRDAY58                       N5PF.                               
      @1718   PRDAY59                       N5PF.                               
      @1723   PRDAY60                       N5PF.                               
      @1728   PRDAY61                       N5PF.                               
      @1733   PRDAY62                       N5PF.                               
      @1738   PRDAY63                       N5PF.                               
      @1743   PRDAY64                       N5PF.                               
      @1748   PRDAY65                       N5PF.                               
      @1753   PRDAY66                       N5PF.                               
      @1758   PRDAY67                       N5PF.                               
      @1763   PRDAY68                       N5PF.                               
      @1768   PRDAY69                       N5PF.                               
      @1773   PRDAY70                       N5PF.                               
      @1778   PRDAY71                       N5PF.                               
      @1783   PRDAY72                       N5PF.                               
      @1788   PRDAY73                       N5PF.                               
      @1793   PRDAY74                       N5PF.                               
      @1798   PrimLang                      $CHAR3.                             
      @1801   PSTATE                        $CHAR2.                             
      @1803   PSTATE_GEO                    $CHAR2.                             
      @1805   PSTCO                         N5PF.                               
      @1810   PSTCO_GEO                     N5PF.                               
      @1815   RACE                          N2PF.                               
      @1817   RACE_PCT_MISS_HOSP            N7P2F.                              
      @1824   RACE_X                        $CHAR1.                             
      @1825   READMIT                       N2PF.                               
      @1827   TOTCHG                        N10PF.                              
      @1837   TOTCHG_X                      N15P2F.                             
      @1852   TRAN_IN                       N2PF.                               
      @1854   TRAN_OUT                      N2PF.                               
      @1856   VisitLink                     N9PF.                               
      @1865   YEAR                          N4PF.                               
      @1869   ZIP                           $CHAR5.                             
      @1874   ZIP3                          $CHAR3.                             
      @1877   ZIPINC_QRTL                   N3PF.                               
      @1880   AYEAR                         N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
