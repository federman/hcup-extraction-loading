/*******************************************************************            
* Creation Date: 06/25/2021                                                     
*   IA_SID_2020_CORE.SAS:                                                       
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
DATA IA_SIDC_2020_CORE;                                                         
INFILE 'IA_SID_2020_CORE.ASC' FIRSTOBS=3 LRECL = 1876;                          
                                                                                
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
                                                                                
  DXPOA85                    LENGTH=$1                                          
  LABEL="Diagnosis 85, present on admission indicator"                          
                                                                                
  DXPOA86                    LENGTH=$1                                          
  LABEL="Diagnosis 86, present on admission indicator"                          
                                                                                
  DXPOA87                    LENGTH=$1                                          
  LABEL="Diagnosis 87, present on admission indicator"                          
                                                                                
  DXPOA88                    LENGTH=$1                                          
  LABEL="Diagnosis 88, present on admission indicator"                          
                                                                                
  DXPOA89                    LENGTH=$1                                          
  LABEL="Diagnosis 89, present on admission indicator"                          
                                                                                
  DXPOA90                    LENGTH=$1                                          
  LABEL="Diagnosis 90, present on admission indicator"                          
                                                                                
  DXPOA91                    LENGTH=$1                                          
  LABEL="Diagnosis 91, present on admission indicator"                          
                                                                                
  DXPOA92                    LENGTH=$1                                          
  LABEL="Diagnosis 92, present on admission indicator"                          
                                                                                
  DXPOA93                    LENGTH=$1                                          
  LABEL="Diagnosis 93, present on admission indicator"                          
                                                                                
  DXPOA94                    LENGTH=$1                                          
  LABEL="Diagnosis 94, present on admission indicator"                          
                                                                                
  DXPOA95                    LENGTH=$1                                          
  LABEL="Diagnosis 95, present on admission indicator"                          
                                                                                
  DXPOA96                    LENGTH=$1                                          
  LABEL="Diagnosis 96, present on admission indicator"                          
                                                                                
  DXPOA97                    LENGTH=$1                                          
  LABEL="Diagnosis 97, present on admission indicator"                          
                                                                                
  DXPOA98                    LENGTH=$1                                          
  LABEL="Diagnosis 98, present on admission indicator"                          
                                                                                
  DXPOA99                    LENGTH=$1                                          
  LABEL="Diagnosis 99, present on admission indicator"                          
                                                                                
  DXPOA100                   LENGTH=$1                                          
  LABEL="Diagnosis 100, present on admission indicator"                         
                                                                                
  DXPOA101                   LENGTH=$1                                          
  LABEL="Diagnosis 101, present on admission indicator"                         
                                                                                
  DXPOA102                   LENGTH=$1                                          
  LABEL="Diagnosis 102, present on admission indicator"                         
                                                                                
  DXPOA103                   LENGTH=$1                                          
  LABEL="Diagnosis 103, present on admission indicator"                         
                                                                                
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
                                                                                
  I10_BIRTH                  LENGTH=3                                           
  LABEL="ICD-10-CM Birth Indicator"                                             
                                                                                
  I10_DELIVERY               LENGTH=3                                           
  LABEL="ICD-10-CM Delivery Indicator"                                          
                                                                                
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
                                                                                
  I10_DX85                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 85"                                                
                                                                                
  I10_DX86                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 86"                                                
                                                                                
  I10_DX87                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 87"                                                
                                                                                
  I10_DX88                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 88"                                                
                                                                                
  I10_DX89                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 89"                                                
                                                                                
  I10_DX90                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 90"                                                
                                                                                
  I10_DX91                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 91"                                                
                                                                                
  I10_DX92                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 92"                                                
                                                                                
  I10_DX93                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 93"                                                
                                                                                
  I10_DX94                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 94"                                                
                                                                                
  I10_DX95                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 95"                                                
                                                                                
  I10_DX96                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 96"                                                
                                                                                
  I10_DX97                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 97"                                                
                                                                                
  I10_DX98                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 98"                                                
                                                                                
  I10_DX99                   LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 99"                                                
                                                                                
  I10_DX100                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 100"                                               
                                                                                
  I10_DX101                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 101"                                               
                                                                                
  I10_DX102                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 102"                                               
                                                                                
  I10_DX103                  LENGTH=$7                                          
  LABEL="ICD-10-CM Diagnosis 103"                                               
                                                                                
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
                                                                                
  MDC                        LENGTH=3                                           
  LABEL="MDC in effect on discharge date"                                       
                                                                                
  MDC_NoPOA                  LENGTH=3                                           
  LABEL="MDC in use on discharge date, calculated without POA"                  
                                                                                
  MDNUM1_R                   LENGTH=5                                           
  LABEL="Physician 1 number (re-identified)"                                    
                                                                                
  MDNUM2_R                   LENGTH=5                                           
  LABEL="Physician 2 number (re-identified)"                                    
                                                                                
  MDNUM3_R                   LENGTH=5                                           
  LABEL="Physician 3 number (re-identified)"                                    
                                                                                
  MEDINCSTQ                  LENGTH=3                                           
  LABEL="Median household income state quartile for patient ZIP Code"           
                                                                                
  MRN_R                      LENGTH=5                                           
  LABEL="Medical record number (re-identified)"                                 
                                                                                
  P7EDSRC_X                  LENGTH=$2                                          
  LABEL="Condition Code P7, Direct Inpatient Admission from Emergency Room"     
                                                                                
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
                                                                                
  RACE_X                     LENGTH=$4                                          
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      AGE                           N3PF.                               
      @4      AGEDAY                        N3PF.                               
      @7      AGEMONTH                      N3PF.                               
      @10     AMONTH                        N2PF.                               
      @12     ATYPE                         N2PF.                               
      @14     AWEEKEND                      N2PF.                               
      @16     BWT                           N4PF.                               
      @20     DaysToEvent                   N6PF.                               
      @26     DIED                          N2PF.                               
      @28     DISP_X                        $CHAR2.                             
      @30     DISPUB04                      N2PF.                               
      @32     DISPUNIFORM                   N2PF.                               
      @34     DMONTH                        N2PF.                               
      @36     DQTR                          N2PF.                               
      @38     DRG                           N3PF.                               
      @41     DRG_NoPOA                     N3PF.                               
      @44     DRGVER                        N2PF.                               
      @46     DXPOA1                        $CHAR1.                             
      @47     DXPOA2                        $CHAR1.                             
      @48     DXPOA3                        $CHAR1.                             
      @49     DXPOA4                        $CHAR1.                             
      @50     DXPOA5                        $CHAR1.                             
      @51     DXPOA6                        $CHAR1.                             
      @52     DXPOA7                        $CHAR1.                             
      @53     DXPOA8                        $CHAR1.                             
      @54     DXPOA9                        $CHAR1.                             
      @55     DXPOA10                       $CHAR1.                             
      @56     DXPOA11                       $CHAR1.                             
      @57     DXPOA12                       $CHAR1.                             
      @58     DXPOA13                       $CHAR1.                             
      @59     DXPOA14                       $CHAR1.                             
      @60     DXPOA15                       $CHAR1.                             
      @61     DXPOA16                       $CHAR1.                             
      @62     DXPOA17                       $CHAR1.                             
      @63     DXPOA18                       $CHAR1.                             
      @64     DXPOA19                       $CHAR1.                             
      @65     DXPOA20                       $CHAR1.                             
      @66     DXPOA21                       $CHAR1.                             
      @67     DXPOA22                       $CHAR1.                             
      @68     DXPOA23                       $CHAR1.                             
      @69     DXPOA24                       $CHAR1.                             
      @70     DXPOA25                       $CHAR1.                             
      @71     DXPOA26                       $CHAR1.                             
      @72     DXPOA27                       $CHAR1.                             
      @73     DXPOA28                       $CHAR1.                             
      @74     DXPOA29                       $CHAR1.                             
      @75     DXPOA30                       $CHAR1.                             
      @76     DXPOA31                       $CHAR1.                             
      @77     DXPOA32                       $CHAR1.                             
      @78     DXPOA33                       $CHAR1.                             
      @79     DXPOA34                       $CHAR1.                             
      @80     DXPOA35                       $CHAR1.                             
      @81     DXPOA36                       $CHAR1.                             
      @82     DXPOA37                       $CHAR1.                             
      @83     DXPOA38                       $CHAR1.                             
      @84     DXPOA39                       $CHAR1.                             
      @85     DXPOA40                       $CHAR1.                             
      @86     DXPOA41                       $CHAR1.                             
      @87     DXPOA42                       $CHAR1.                             
      @88     DXPOA43                       $CHAR1.                             
      @89     DXPOA44                       $CHAR1.                             
      @90     DXPOA45                       $CHAR1.                             
      @91     DXPOA46                       $CHAR1.                             
      @92     DXPOA47                       $CHAR1.                             
      @93     DXPOA48                       $CHAR1.                             
      @94     DXPOA49                       $CHAR1.                             
      @95     DXPOA50                       $CHAR1.                             
      @96     DXPOA51                       $CHAR1.                             
      @97     DXPOA52                       $CHAR1.                             
      @98     DXPOA53                       $CHAR1.                             
      @99     DXPOA54                       $CHAR1.                             
      @100    DXPOA55                       $CHAR1.                             
      @101    DXPOA56                       $CHAR1.                             
      @102    DXPOA57                       $CHAR1.                             
      @103    DXPOA58                       $CHAR1.                             
      @104    DXPOA59                       $CHAR1.                             
      @105    DXPOA60                       $CHAR1.                             
      @106    DXPOA61                       $CHAR1.                             
      @107    DXPOA62                       $CHAR1.                             
      @108    DXPOA63                       $CHAR1.                             
      @109    DXPOA64                       $CHAR1.                             
      @110    DXPOA65                       $CHAR1.                             
      @111    DXPOA66                       $CHAR1.                             
      @112    DXPOA67                       $CHAR1.                             
      @113    DXPOA68                       $CHAR1.                             
      @114    DXPOA69                       $CHAR1.                             
      @115    DXPOA70                       $CHAR1.                             
      @116    DXPOA71                       $CHAR1.                             
      @117    DXPOA72                       $CHAR1.                             
      @118    DXPOA73                       $CHAR1.                             
      @119    DXPOA74                       $CHAR1.                             
      @120    DXPOA75                       $CHAR1.                             
      @121    DXPOA76                       $CHAR1.                             
      @122    DXPOA77                       $CHAR1.                             
      @123    DXPOA78                       $CHAR1.                             
      @124    DXPOA79                       $CHAR1.                             
      @125    DXPOA80                       $CHAR1.                             
      @126    DXPOA81                       $CHAR1.                             
      @127    DXPOA82                       $CHAR1.                             
      @128    DXPOA83                       $CHAR1.                             
      @129    DXPOA84                       $CHAR1.                             
      @130    DXPOA85                       $CHAR1.                             
      @131    DXPOA86                       $CHAR1.                             
      @132    DXPOA87                       $CHAR1.                             
      @133    DXPOA88                       $CHAR1.                             
      @134    DXPOA89                       $CHAR1.                             
      @135    DXPOA90                       $CHAR1.                             
      @136    DXPOA91                       $CHAR1.                             
      @137    DXPOA92                       $CHAR1.                             
      @138    DXPOA93                       $CHAR1.                             
      @139    DXPOA94                       $CHAR1.                             
      @140    DXPOA95                       $CHAR1.                             
      @141    DXPOA96                       $CHAR1.                             
      @142    DXPOA97                       $CHAR1.                             
      @143    DXPOA98                       $CHAR1.                             
      @144    DXPOA99                       $CHAR1.                             
      @145    DXPOA100                      $CHAR1.                             
      @146    DXPOA101                      $CHAR1.                             
      @147    DXPOA102                      $CHAR1.                             
      @148    DXPOA103                      $CHAR1.                             
      @149    FEMALE                        N2PF.                               
      @151    HCUP_ED                       N2PF.                               
      @153    HCUP_OS                       N2PF.                               
      @155    HISPANIC                      N2PF.                               
      @157    HISPANIC_X                    $CHAR1.                             
      @158    HospitalUnit                  N2PF.                               
      @160    HOSPST                        $CHAR2.                             
      @162    I10_BIRTH                     N3PF.                               
      @165    I10_DELIVERY                  N3PF.                               
      @168    I10_DX_Admitting              $CHAR7.                             
      @175    I10_DX1                       $CHAR7.                             
      @182    I10_DX2                       $CHAR7.                             
      @189    I10_DX3                       $CHAR7.                             
      @196    I10_DX4                       $CHAR7.                             
      @203    I10_DX5                       $CHAR7.                             
      @210    I10_DX6                       $CHAR7.                             
      @217    I10_DX7                       $CHAR7.                             
      @224    I10_DX8                       $CHAR7.                             
      @231    I10_DX9                       $CHAR7.                             
      @238    I10_DX10                      $CHAR7.                             
      @245    I10_DX11                      $CHAR7.                             
      @252    I10_DX12                      $CHAR7.                             
      @259    I10_DX13                      $CHAR7.                             
      @266    I10_DX14                      $CHAR7.                             
      @273    I10_DX15                      $CHAR7.                             
      @280    I10_DX16                      $CHAR7.                             
      @287    I10_DX17                      $CHAR7.                             
      @294    I10_DX18                      $CHAR7.                             
      @301    I10_DX19                      $CHAR7.                             
      @308    I10_DX20                      $CHAR7.                             
      @315    I10_DX21                      $CHAR7.                             
      @322    I10_DX22                      $CHAR7.                             
      @329    I10_DX23                      $CHAR7.                             
      @336    I10_DX24                      $CHAR7.                             
      @343    I10_DX25                      $CHAR7.                             
      @350    I10_DX26                      $CHAR7.                             
      @357    I10_DX27                      $CHAR7.                             
      @364    I10_DX28                      $CHAR7.                             
      @371    I10_DX29                      $CHAR7.                             
      @378    I10_DX30                      $CHAR7.                             
      @385    I10_DX31                      $CHAR7.                             
      @392    I10_DX32                      $CHAR7.                             
      @399    I10_DX33                      $CHAR7.                             
      @406    I10_DX34                      $CHAR7.                             
      @413    I10_DX35                      $CHAR7.                             
      @420    I10_DX36                      $CHAR7.                             
      @427    I10_DX37                      $CHAR7.                             
      @434    I10_DX38                      $CHAR7.                             
      @441    I10_DX39                      $CHAR7.                             
      @448    I10_DX40                      $CHAR7.                             
      @455    I10_DX41                      $CHAR7.                             
      @462    I10_DX42                      $CHAR7.                             
      @469    I10_DX43                      $CHAR7.                             
      @476    I10_DX44                      $CHAR7.                             
      @483    I10_DX45                      $CHAR7.                             
      @490    I10_DX46                      $CHAR7.                             
      @497    I10_DX47                      $CHAR7.                             
      @504    I10_DX48                      $CHAR7.                             
      @511    I10_DX49                      $CHAR7.                             
      @518    I10_DX50                      $CHAR7.                             
      @525    I10_DX51                      $CHAR7.                             
      @532    I10_DX52                      $CHAR7.                             
      @539    I10_DX53                      $CHAR7.                             
      @546    I10_DX54                      $CHAR7.                             
      @553    I10_DX55                      $CHAR7.                             
      @560    I10_DX56                      $CHAR7.                             
      @567    I10_DX57                      $CHAR7.                             
      @574    I10_DX58                      $CHAR7.                             
      @581    I10_DX59                      $CHAR7.                             
      @588    I10_DX60                      $CHAR7.                             
      @595    I10_DX61                      $CHAR7.                             
      @602    I10_DX62                      $CHAR7.                             
      @609    I10_DX63                      $CHAR7.                             
      @616    I10_DX64                      $CHAR7.                             
      @623    I10_DX65                      $CHAR7.                             
      @630    I10_DX66                      $CHAR7.                             
      @637    I10_DX67                      $CHAR7.                             
      @644    I10_DX68                      $CHAR7.                             
      @651    I10_DX69                      $CHAR7.                             
      @658    I10_DX70                      $CHAR7.                             
      @665    I10_DX71                      $CHAR7.                             
      @672    I10_DX72                      $CHAR7.                             
      @679    I10_DX73                      $CHAR7.                             
      @686    I10_DX74                      $CHAR7.                             
      @693    I10_DX75                      $CHAR7.                             
      @700    I10_DX76                      $CHAR7.                             
      @707    I10_DX77                      $CHAR7.                             
      @714    I10_DX78                      $CHAR7.                             
      @721    I10_DX79                      $CHAR7.                             
      @728    I10_DX80                      $CHAR7.                             
      @735    I10_DX81                      $CHAR7.                             
      @742    I10_DX82                      $CHAR7.                             
      @749    I10_DX83                      $CHAR7.                             
      @756    I10_DX84                      $CHAR7.                             
      @763    I10_DX85                      $CHAR7.                             
      @770    I10_DX86                      $CHAR7.                             
      @777    I10_DX87                      $CHAR7.                             
      @784    I10_DX88                      $CHAR7.                             
      @791    I10_DX89                      $CHAR7.                             
      @798    I10_DX90                      $CHAR7.                             
      @805    I10_DX91                      $CHAR7.                             
      @812    I10_DX92                      $CHAR7.                             
      @819    I10_DX93                      $CHAR7.                             
      @826    I10_DX94                      $CHAR7.                             
      @833    I10_DX95                      $CHAR7.                             
      @840    I10_DX96                      $CHAR7.                             
      @847    I10_DX97                      $CHAR7.                             
      @854    I10_DX98                      $CHAR7.                             
      @861    I10_DX99                      $CHAR7.                             
      @868    I10_DX100                     $CHAR7.                             
      @875    I10_DX101                     $CHAR7.                             
      @882    I10_DX102                     $CHAR7.                             
      @889    I10_DX103                     $CHAR7.                             
      @896    I10_NDX                       N3PF.                               
      @899    I10_NPR                       N3PF.                               
      @902    I10_PR1                       $CHAR7.                             
      @909    I10_PR2                       $CHAR7.                             
      @916    I10_PR3                       $CHAR7.                             
      @923    I10_PR4                       $CHAR7.                             
      @930    I10_PR5                       $CHAR7.                             
      @937    I10_PR6                       $CHAR7.                             
      @944    I10_PR7                       $CHAR7.                             
      @951    I10_PR8                       $CHAR7.                             
      @958    I10_PR9                       $CHAR7.                             
      @965    I10_PR10                      $CHAR7.                             
      @972    I10_PR11                      $CHAR7.                             
      @979    I10_PR12                      $CHAR7.                             
      @986    I10_PR13                      $CHAR7.                             
      @993    I10_PR14                      $CHAR7.                             
      @1000   I10_PR15                      $CHAR7.                             
      @1007   I10_PR16                      $CHAR7.                             
      @1014   I10_PR17                      $CHAR7.                             
      @1021   I10_PR18                      $CHAR7.                             
      @1028   I10_PR19                      $CHAR7.                             
      @1035   I10_PR20                      $CHAR7.                             
      @1042   I10_PR21                      $CHAR7.                             
      @1049   I10_PR22                      $CHAR7.                             
      @1056   I10_PR23                      $CHAR7.                             
      @1063   I10_PR24                      $CHAR7.                             
      @1070   I10_PR25                      $CHAR7.                             
      @1077   I10_PR26                      $CHAR7.                             
      @1084   I10_PR27                      $CHAR7.                             
      @1091   I10_PR28                      $CHAR7.                             
      @1098   I10_PR29                      $CHAR7.                             
      @1105   I10_PR30                      $CHAR7.                             
      @1112   I10_PR31                      $CHAR7.                             
      @1119   I10_PR32                      $CHAR7.                             
      @1126   I10_PR33                      $CHAR7.                             
      @1133   I10_PR34                      $CHAR7.                             
      @1140   I10_PR35                      $CHAR7.                             
      @1147   I10_PR36                      $CHAR7.                             
      @1154   I10_PR37                      $CHAR7.                             
      @1161   I10_PR38                      $CHAR7.                             
      @1168   I10_PR39                      $CHAR7.                             
      @1175   I10_PR40                      $CHAR7.                             
      @1182   I10_PR41                      $CHAR7.                             
      @1189   I10_PR42                      $CHAR7.                             
      @1196   I10_PROCTYPE                  N3PF.                               
      @1199   I10_SERVICELINE               N2PF.                               
      @1201   KEY                           15.                                 
      @1216   LOS                           N5PF.                               
      @1221   LOS_X                         N6PF.                               
      @1227   MDC                           N2PF.                               
      @1229   MDC_NoPOA                     N2PF.                               
      @1231   MDNUM1_R                      N9PF.                               
      @1240   MDNUM2_R                      N9PF.                               
      @1249   MDNUM3_R                      N9PF.                               
      @1258   MEDINCSTQ                     N2PF.                               
      @1260   MRN_R                         N9PF.                               
      @1269   P7EDSRC_X                     $CHAR2.                             
      @1271   PAY1                          N2PF.                               
      @1273   PAY1_X                        $CHAR4.                             
      @1277   PAY2                          N2PF.                               
      @1279   PAY2_X                        $CHAR4.                             
      @1283   PAY3                          N2PF.                               
      @1285   PAY3_X                        $CHAR4.                             
      @1289   PCLASS_ORPROC                 N2PF.                               
      @1291   PL_CBSA                       N3PF.                               
      @1294   PL_NCHS                       N2PF.                               
      @1296   PL_RUCC                       N2PF.                               
      @1298   PL_UIC                        N2PF.                               
      @1300   PL_UR_CAT4                    N2PF.                               
      @1302   POA_Disch_Edit1               N2PF.                               
      @1304   POA_Disch_Edit2               N2PF.                               
      @1306   POA_Hosp_Edit1                N2PF.                               
      @1308   POA_Hosp_Edit2                N2PF.                               
      @1310   POA_Hosp_Edit3                N2PF.                               
      @1312   POA_Hosp_Edit3_Value          N8P2F.                              
      @1320   PointOfOrigin_X               $CHAR1.                             
      @1321   PointOfOriginUB04             $CHAR1.                             
      @1322   PRDAY1                        N5PF.                               
      @1327   PRDAY2                        N5PF.                               
      @1332   PRDAY3                        N5PF.                               
      @1337   PRDAY4                        N5PF.                               
      @1342   PRDAY5                        N5PF.                               
      @1347   PRDAY6                        N5PF.                               
      @1352   PRDAY7                        N5PF.                               
      @1357   PRDAY8                        N5PF.                               
      @1362   PRDAY9                        N5PF.                               
      @1367   PRDAY10                       N5PF.                               
      @1372   PRDAY11                       N5PF.                               
      @1377   PRDAY12                       N5PF.                               
      @1382   PRDAY13                       N5PF.                               
      @1387   PRDAY14                       N5PF.                               
      @1392   PRDAY15                       N5PF.                               
      @1397   PRDAY16                       N5PF.                               
      @1402   PRDAY17                       N5PF.                               
      @1407   PRDAY18                       N5PF.                               
      @1412   PRDAY19                       N5PF.                               
      @1417   PRDAY20                       N5PF.                               
      @1422   PRDAY21                       N5PF.                               
      @1427   PRDAY22                       N5PF.                               
      @1432   PRDAY23                       N5PF.                               
      @1437   PRDAY24                       N5PF.                               
      @1442   PRDAY25                       N5PF.                               
      @1447   PRDAY26                       N5PF.                               
      @1452   PRDAY27                       N5PF.                               
      @1457   PRDAY28                       N5PF.                               
      @1462   PRDAY29                       N5PF.                               
      @1467   PRDAY30                       N5PF.                               
      @1472   PRDAY31                       N5PF.                               
      @1477   PRDAY32                       N5PF.                               
      @1482   PRDAY33                       N5PF.                               
      @1487   PRDAY34                       N5PF.                               
      @1492   PRDAY35                       N5PF.                               
      @1497   PRDAY36                       N5PF.                               
      @1502   PRDAY37                       N5PF.                               
      @1507   PRDAY38                       N5PF.                               
      @1512   PRDAY39                       N5PF.                               
      @1517   PRDAY40                       N5PF.                               
      @1522   PRDAY41                       N5PF.                               
      @1527   PRDAY42                       N5PF.                               
      @1532   PrimLang                      $CHAR3.                             
      @1535   PSTATE                        $CHAR2.                             
      @1537   PSTATE_GEO                    $CHAR2.                             
      @1539   PSTCO                         N5PF.                               
      @1544   PSTCO_GEO                     N5PF.                               
      @1549   RACE                          N2PF.                               
      @1551   RACE_PCT_MISS_HOSP            N7P2F.                              
      @1558   RACE_X                        $CHAR4.                             
      @1562   TOTCHG                        N10PF.                              
      @1572   TOTCHG_X                      N15P2F.                             
      @1587   TRAN_IN                       N2PF.                               
      @1589   TRAN_OUT                      N2PF.                               
      @1591   VisitLink                     N9PF.                               
      @1600   YEAR                          N4PF.                               
      @1604   ZIP                           $CHAR5.                             
      @1609   ZIP3                          $CHAR3.                             
      @1612   ZIPINC_QRTL                   N3PF.                               
      @1615   AYEAR                         N4PF.                               
      @1619   BMONTH                        N2PF.                               
      @1621   BYEAR                         N4PF.                               
      @1625   PRMONTH1                      N2PF.                               
      @1627   PRMONTH2                      N2PF.                               
      @1629   PRMONTH3                      N2PF.                               
      @1631   PRMONTH4                      N2PF.                               
      @1633   PRMONTH5                      N2PF.                               
      @1635   PRMONTH6                      N2PF.                               
      @1637   PRMONTH7                      N2PF.                               
      @1639   PRMONTH8                      N2PF.                               
      @1641   PRMONTH9                      N2PF.                               
      @1643   PRMONTH10                     N2PF.                               
      @1645   PRMONTH11                     N2PF.                               
      @1647   PRMONTH12                     N2PF.                               
      @1649   PRMONTH13                     N2PF.                               
      @1651   PRMONTH14                     N2PF.                               
      @1653   PRMONTH15                     N2PF.                               
      @1655   PRMONTH16                     N2PF.                               
      @1657   PRMONTH17                     N2PF.                               
      @1659   PRMONTH18                     N2PF.                               
      @1661   PRMONTH19                     N2PF.                               
      @1663   PRMONTH20                     N2PF.                               
      @1665   PRMONTH21                     N2PF.                               
      @1667   PRMONTH22                     N2PF.                               
      @1669   PRMONTH23                     N2PF.                               
      @1671   PRMONTH24                     N2PF.                               
      @1673   PRMONTH25                     N2PF.                               
      @1675   PRMONTH26                     N2PF.                               
      @1677   PRMONTH27                     N2PF.                               
      @1679   PRMONTH28                     N2PF.                               
      @1681   PRMONTH29                     N2PF.                               
      @1683   PRMONTH30                     N2PF.                               
      @1685   PRMONTH31                     N2PF.                               
      @1687   PRMONTH32                     N2PF.                               
      @1689   PRMONTH33                     N2PF.                               
      @1691   PRMONTH34                     N2PF.                               
      @1693   PRMONTH35                     N2PF.                               
      @1695   PRMONTH36                     N2PF.                               
      @1697   PRMONTH37                     N2PF.                               
      @1699   PRMONTH38                     N2PF.                               
      @1701   PRMONTH39                     N2PF.                               
      @1703   PRMONTH40                     N2PF.                               
      @1705   PRMONTH41                     N2PF.                               
      @1707   PRMONTH42                     N2PF.                               
      @1709   PRYEAR1                       N4PF.                               
      @1713   PRYEAR2                       N4PF.                               
      @1717   PRYEAR3                       N4PF.                               
      @1721   PRYEAR4                       N4PF.                               
      @1725   PRYEAR5                       N4PF.                               
      @1729   PRYEAR6                       N4PF.                               
      @1733   PRYEAR7                       N4PF.                               
      @1737   PRYEAR8                       N4PF.                               
      @1741   PRYEAR9                       N4PF.                               
      @1745   PRYEAR10                      N4PF.                               
      @1749   PRYEAR11                      N4PF.                               
      @1753   PRYEAR12                      N4PF.                               
      @1757   PRYEAR13                      N4PF.                               
      @1761   PRYEAR14                      N4PF.                               
      @1765   PRYEAR15                      N4PF.                               
      @1769   PRYEAR16                      N4PF.                               
      @1773   PRYEAR17                      N4PF.                               
      @1777   PRYEAR18                      N4PF.                               
      @1781   PRYEAR19                      N4PF.                               
      @1785   PRYEAR20                      N4PF.                               
      @1789   PRYEAR21                      N4PF.                               
      @1793   PRYEAR22                      N4PF.                               
      @1797   PRYEAR23                      N4PF.                               
      @1801   PRYEAR24                      N4PF.                               
      @1805   PRYEAR25                      N4PF.                               
      @1809   PRYEAR26                      N4PF.                               
      @1813   PRYEAR27                      N4PF.                               
      @1817   PRYEAR28                      N4PF.                               
      @1821   PRYEAR29                      N4PF.                               
      @1825   PRYEAR30                      N4PF.                               
      @1829   PRYEAR31                      N4PF.                               
      @1833   PRYEAR32                      N4PF.                               
      @1837   PRYEAR33                      N4PF.                               
      @1841   PRYEAR34                      N4PF.                               
      @1845   PRYEAR35                      N4PF.                               
      @1849   PRYEAR36                      N4PF.                               
      @1853   PRYEAR37                      N4PF.                               
      @1857   PRYEAR38                      N4PF.                               
      @1861   PRYEAR39                      N4PF.                               
      @1865   PRYEAR40                      N4PF.                               
      @1869   PRYEAR41                      N4PF.                               
      @1873   PRYEAR42                      N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
