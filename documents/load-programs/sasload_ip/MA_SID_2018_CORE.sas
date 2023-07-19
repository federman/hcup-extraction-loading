/*******************************************************************            
* Creation Date: 10/07/2020                                                     
*   MA_SID_2018_CORE.SAS:                                                       
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
DATA MA_SIDC_2018_CORE;                                                         
INFILE 'MA_SID_2018_CORE.ASC' FIRSTOBS=3 LRECL = 3281;                          
                                                                                
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
                                                                                
  AGEMONTH                   LENGTH=3                                           
  LABEL="Age in months (when age < 11 years)"                                   
                                                                                
  AMDC                       LENGTH=3                                           
  LABEL="All Patient Refined MDC"                                               
                                                                                
  AMONTH                     LENGTH=3                                           
  LABEL="Admission month"                                                       
                                                                                
  ASOURCE                    LENGTH=3                                           
  LABEL="Admission source (uniform)"                                            
                                                                                
  ASOURCE_X                  LENGTH=$1                                          
  LABEL="Admission source (as received from source)"                            
                                                                                
  ASOURCEUB92                LENGTH=$1                                          
  LABEL="Admission source (UB-92 standard coding)"                              
                                                                                
  ATYPE                      LENGTH=3                                           
  LABEL="Admission type"                                                        
                                                                                
  AWEEKEND                   LENGTH=3                                           
  LABEL="Admission day is a weekend"                                            
                                                                                
  BWT                        LENGTH=4                                           
  LABEL="Birth weight in grams"                                                 
                                                                                
  DaysBetweenVisits          LENGTH=3                                           
  LABEL="Number of days between visits"                                         
                                                                                
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
                                                                                
  DNR                        LENGTH=3                                           
  LABEL="Do not resuscitate indicator"                                          
                                                                                
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
                                                                                
  FEMALE                     LENGTH=3                                           
  LABEL="Indicator of sex"                                                      
                                                                                
  HCUP_ED                    LENGTH=3                                           
  LABEL="HCUP Emergency Department service indicator"                           
                                                                                
  HCUP_OS                    LENGTH=3                                           
  LABEL="HCUP Observation Stay service indicator"                               
                                                                                
  HISPANIC                   LENGTH=3                                           
  LABEL="Hispanic ethnicity (uniform)"                                          
                                                                                
  HISPANIC_X                 LENGTH=$15                                         
  LABEL="Hispanic ethnicity (as received from source)"                          
                                                                                
  Homeless                   LENGTH=3                                           
  LABEL="Indicator that patient is homeless"                                    
                                                                                
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
                                                                                
  I10_PR75                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 75"                                               
                                                                                
  I10_PR76                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 76"                                               
                                                                                
  I10_PR77                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 77"                                               
                                                                                
  I10_PR78                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 78"                                               
                                                                                
  I10_PR79                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 79"                                               
                                                                                
  I10_PR80                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 80"                                               
                                                                                
  I10_PR81                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 81"                                               
                                                                                
  I10_PR82                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 82"                                               
                                                                                
  I10_PR83                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 83"                                               
                                                                                
  I10_PR84                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 84"                                               
                                                                                
  I10_PR85                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 85"                                               
                                                                                
  I10_PR86                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 86"                                               
                                                                                
  I10_PR87                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 87"                                               
                                                                                
  I10_PR88                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 88"                                               
                                                                                
  I10_PR89                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 89"                                               
                                                                                
  I10_PR90                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 90"                                               
                                                                                
  I10_PR91                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 91"                                               
                                                                                
  I10_PR92                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 92"                                               
                                                                                
  I10_PR93                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 93"                                               
                                                                                
  I10_PR94                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 94"                                               
                                                                                
  I10_PR95                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 95"                                               
                                                                                
  I10_PR96                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 96"                                               
                                                                                
  I10_PR97                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 97"                                               
                                                                                
  I10_PR98                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 98"                                               
                                                                                
  I10_PR99                   LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 99"                                               
                                                                                
  I10_PR100                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 100"                                              
                                                                                
  I10_PR101                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 101"                                              
                                                                                
  I10_PR102                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 102"                                              
                                                                                
  I10_PR103                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 103"                                              
                                                                                
  I10_PR104                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 104"                                              
                                                                                
  I10_PR105                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 105"                                              
                                                                                
  I10_PR106                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 106"                                              
                                                                                
  I10_PR107                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 107"                                              
                                                                                
  I10_PR108                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 108"                                              
                                                                                
  I10_PR109                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 109"                                              
                                                                                
  I10_PR110                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 110"                                              
                                                                                
  I10_PR111                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 111"                                              
                                                                                
  I10_PR112                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 112"                                              
                                                                                
  I10_PR113                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 113"                                              
                                                                                
  I10_PR114                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 114"                                              
                                                                                
  I10_PR115                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 115"                                              
                                                                                
  I10_PR116                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 116"                                              
                                                                                
  I10_PR117                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 117"                                              
                                                                                
  I10_PR118                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 118"                                              
                                                                                
  I10_PR119                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 119"                                              
                                                                                
  I10_PR120                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 120"                                              
                                                                                
  I10_PR121                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 121"                                              
                                                                                
  I10_PR122                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 122"                                              
                                                                                
  I10_PR123                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 123"                                              
                                                                                
  I10_PR124                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 124"                                              
                                                                                
  I10_PR125                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 125"                                              
                                                                                
  I10_PR126                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 126"                                              
                                                                                
  I10_PR127                  LENGTH=$7                                          
  LABEL="ICD-10-PCS Procedure 127"                                              
                                                                                
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
                                                                                
  OS_TIME                    LENGTH=6                                           
  LABEL="Observation stay time summed from UNITS"                               
                                                                                
  PAY1                       LENGTH=3                                           
  LABEL="Primary expected payer (uniform)"                                      
                                                                                
  PAY1_X                     LENGTH=$1                                          
  LABEL="Primary expected payer (as received from source)"                      
                                                                                
  PAY2                       LENGTH=3                                           
  LABEL="Secondary expected payer (uniform)"                                    
                                                                                
  PAY2_X                     LENGTH=$1                                          
  LABEL="Secondary expected payer (as received from source)"                    
                                                                                
  PAYER1_X                   LENGTH=$3                                          
  LABEL="Primary expected payer plan identifier (as received from source)"      
                                                                                
  PAYER2_X                   LENGTH=$3                                          
  LABEL="Secondary expected payer plan identifier (as received from source)"    
                                                                                
  PL_CBSA                    LENGTH=3                                           
  LABEL="Patient location: Core Based Statistical Area (CBSA)"                  
                                                                                
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
                                                                                
  PRDAY75                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR75"                             
                                                                                
  PRDAY76                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR76"                             
                                                                                
  PRDAY77                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR77"                             
                                                                                
  PRDAY78                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR78"                             
                                                                                
  PRDAY79                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR79"                             
                                                                                
  PRDAY80                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR80"                             
                                                                                
  PRDAY81                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR81"                             
                                                                                
  PRDAY82                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR82"                             
                                                                                
  PRDAY83                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR83"                             
                                                                                
  PRDAY84                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR84"                             
                                                                                
  PRDAY85                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR85"                             
                                                                                
  PRDAY86                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR86"                             
                                                                                
  PRDAY87                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR87"                             
                                                                                
  PRDAY88                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR88"                             
                                                                                
  PRDAY89                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR89"                             
                                                                                
  PRDAY90                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR90"                             
                                                                                
  PRDAY91                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR91"                             
                                                                                
  PRDAY92                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR92"                             
                                                                                
  PRDAY93                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR93"                             
                                                                                
  PRDAY94                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR94"                             
                                                                                
  PRDAY95                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR95"                             
                                                                                
  PRDAY96                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR96"                             
                                                                                
  PRDAY97                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR97"                             
                                                                                
  PRDAY98                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR98"                             
                                                                                
  PRDAY99                    LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR99"                             
                                                                                
  PRDAY100                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR100"                            
                                                                                
  PRDAY101                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR101"                            
                                                                                
  PRDAY102                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR102"                            
                                                                                
  PRDAY103                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR103"                            
                                                                                
  PRDAY104                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR104"                            
                                                                                
  PRDAY105                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR105"                            
                                                                                
  PRDAY106                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR106"                            
                                                                                
  PRDAY107                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR107"                            
                                                                                
  PRDAY108                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR108"                            
                                                                                
  PRDAY109                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR109"                            
                                                                                
  PRDAY110                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR110"                            
                                                                                
  PRDAY111                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR111"                            
                                                                                
  PRDAY112                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR112"                            
                                                                                
  PRDAY113                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR113"                            
                                                                                
  PRDAY114                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR114"                            
                                                                                
  PRDAY115                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR115"                            
                                                                                
  PRDAY116                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR116"                            
                                                                                
  PRDAY117                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR117"                            
                                                                                
  PRDAY118                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR118"                            
                                                                                
  PRDAY119                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR119"                            
                                                                                
  PRDAY120                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR120"                            
                                                                                
  PRDAY121                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR121"                            
                                                                                
  PRDAY122                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR122"                            
                                                                                
  PRDAY123                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR123"                            
                                                                                
  PRDAY124                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR124"                            
                                                                                
  PRDAY125                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR125"                            
                                                                                
  PRDAY126                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR126"                            
                                                                                
  PRDAY127                   LENGTH=4                                           
  LABEL="Number of days from admission to I10_PR127"                            
                                                                                
  PSTATE                     LENGTH=$2                                          
  LABEL="Patient State postal code"                                             
                                                                                
  PSTCO2                     LENGTH=4                      FORMAT=Z5.           
  LABEL="Patient state/county FIPS code, possibly derived from ZIP Code"        
                                                                                
  RACE                       LENGTH=3                                           
  LABEL="Race (uniform)"                                                        
                                                                                
  RACE_EDIT                  LENGTH=3                                           
  LABEL="Race Edit Checks"                                                      
                                                                                
  RACE_X                     LENGTH=$13                                         
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
                                                                                
  ZIP3                       LENGTH=$3                                          
  LABEL="Patient ZIP Code, first 3 digits"                                      
                                                                                
  ZIPINC_QRTL                LENGTH=3                                           
  LABEL="Median household income national quartile for patient ZIP Code"        
                                                                                
  AYEAR                      LENGTH=3                                           
  LABEL="Admission year"                                                        
                                                                                
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
                                                                                
  PRMONTH61                  LENGTH=3                                           
  LABEL="Month of procedure 61"                                                 
                                                                                
  PRMONTH62                  LENGTH=3                                           
  LABEL="Month of procedure 62"                                                 
                                                                                
  PRMONTH63                  LENGTH=3                                           
  LABEL="Month of procedure 63"                                                 
                                                                                
  PRMONTH64                  LENGTH=3                                           
  LABEL="Month of procedure 64"                                                 
                                                                                
  PRMONTH65                  LENGTH=3                                           
  LABEL="Month of procedure 65"                                                 
                                                                                
  PRMONTH66                  LENGTH=3                                           
  LABEL="Month of procedure 66"                                                 
                                                                                
  PRMONTH67                  LENGTH=3                                           
  LABEL="Month of procedure 67"                                                 
                                                                                
  PRMONTH68                  LENGTH=3                                           
  LABEL="Month of procedure 68"                                                 
                                                                                
  PRMONTH69                  LENGTH=3                                           
  LABEL="Month of procedure 69"                                                 
                                                                                
  PRMONTH70                  LENGTH=3                                           
  LABEL="Month of procedure 70"                                                 
                                                                                
  PRMONTH71                  LENGTH=3                                           
  LABEL="Month of procedure 71"                                                 
                                                                                
  PRMONTH72                  LENGTH=3                                           
  LABEL="Month of procedure 72"                                                 
                                                                                
  PRMONTH73                  LENGTH=3                                           
  LABEL="Month of procedure 73"                                                 
                                                                                
  PRMONTH74                  LENGTH=3                                           
  LABEL="Month of procedure 74"                                                 
                                                                                
  PRMONTH75                  LENGTH=3                                           
  LABEL="Month of procedure 75"                                                 
                                                                                
  PRMONTH76                  LENGTH=3                                           
  LABEL="Month of procedure 76"                                                 
                                                                                
  PRMONTH77                  LENGTH=3                                           
  LABEL="Month of procedure 77"                                                 
                                                                                
  PRMONTH78                  LENGTH=3                                           
  LABEL="Month of procedure 78"                                                 
                                                                                
  PRMONTH79                  LENGTH=3                                           
  LABEL="Month of procedure 79"                                                 
                                                                                
  PRMONTH80                  LENGTH=3                                           
  LABEL="Month of procedure 80"                                                 
                                                                                
  PRMONTH81                  LENGTH=3                                           
  LABEL="Month of procedure 81"                                                 
                                                                                
  PRMONTH82                  LENGTH=3                                           
  LABEL="Month of procedure 82"                                                 
                                                                                
  PRMONTH83                  LENGTH=3                                           
  LABEL="Month of procedure 83"                                                 
                                                                                
  PRMONTH84                  LENGTH=3                                           
  LABEL="Month of procedure 84"                                                 
                                                                                
  PRMONTH85                  LENGTH=3                                           
  LABEL="Month of procedure 85"                                                 
                                                                                
  PRMONTH86                  LENGTH=3                                           
  LABEL="Month of procedure 86"                                                 
                                                                                
  PRMONTH87                  LENGTH=3                                           
  LABEL="Month of procedure 87"                                                 
                                                                                
  PRMONTH88                  LENGTH=3                                           
  LABEL="Month of procedure 88"                                                 
                                                                                
  PRMONTH89                  LENGTH=3                                           
  LABEL="Month of procedure 89"                                                 
                                                                                
  PRMONTH90                  LENGTH=3                                           
  LABEL="Month of procedure 90"                                                 
                                                                                
  PRMONTH91                  LENGTH=3                                           
  LABEL="Month of procedure 91"                                                 
                                                                                
  PRMONTH92                  LENGTH=3                                           
  LABEL="Month of procedure 92"                                                 
                                                                                
  PRMONTH93                  LENGTH=3                                           
  LABEL="Month of procedure 93"                                                 
                                                                                
  PRMONTH94                  LENGTH=3                                           
  LABEL="Month of procedure 94"                                                 
                                                                                
  PRMONTH95                  LENGTH=3                                           
  LABEL="Month of procedure 95"                                                 
                                                                                
  PRMONTH96                  LENGTH=3                                           
  LABEL="Month of procedure 96"                                                 
                                                                                
  PRMONTH97                  LENGTH=3                                           
  LABEL="Month of procedure 97"                                                 
                                                                                
  PRMONTH98                  LENGTH=3                                           
  LABEL="Month of procedure 98"                                                 
                                                                                
  PRMONTH99                  LENGTH=3                                           
  LABEL="Month of procedure 99"                                                 
                                                                                
  PRMONTH100                 LENGTH=3                                           
  LABEL="Month of procedure 100"                                                
                                                                                
  PRMONTH101                 LENGTH=3                                           
  LABEL="Month of procedure 101"                                                
                                                                                
  PRMONTH102                 LENGTH=3                                           
  LABEL="Month of procedure 102"                                                
                                                                                
  PRMONTH103                 LENGTH=3                                           
  LABEL="Month of procedure 103"                                                
                                                                                
  PRMONTH104                 LENGTH=3                                           
  LABEL="Month of procedure 104"                                                
                                                                                
  PRMONTH105                 LENGTH=3                                           
  LABEL="Month of procedure 105"                                                
                                                                                
  PRMONTH106                 LENGTH=3                                           
  LABEL="Month of procedure 106"                                                
                                                                                
  PRMONTH107                 LENGTH=3                                           
  LABEL="Month of procedure 107"                                                
                                                                                
  PRMONTH108                 LENGTH=3                                           
  LABEL="Month of procedure 108"                                                
                                                                                
  PRMONTH109                 LENGTH=3                                           
  LABEL="Month of procedure 109"                                                
                                                                                
  PRMONTH110                 LENGTH=3                                           
  LABEL="Month of procedure 110"                                                
                                                                                
  PRMONTH111                 LENGTH=3                                           
  LABEL="Month of procedure 111"                                                
                                                                                
  PRMONTH112                 LENGTH=3                                           
  LABEL="Month of procedure 112"                                                
                                                                                
  PRMONTH113                 LENGTH=3                                           
  LABEL="Month of procedure 113"                                                
                                                                                
  PRMONTH114                 LENGTH=3                                           
  LABEL="Month of procedure 114"                                                
                                                                                
  PRMONTH115                 LENGTH=3                                           
  LABEL="Month of procedure 115"                                                
                                                                                
  PRMONTH116                 LENGTH=3                                           
  LABEL="Month of procedure 116"                                                
                                                                                
  PRMONTH117                 LENGTH=3                                           
  LABEL="Month of procedure 117"                                                
                                                                                
  PRMONTH118                 LENGTH=3                                           
  LABEL="Month of procedure 118"                                                
                                                                                
  PRMONTH119                 LENGTH=3                                           
  LABEL="Month of procedure 119"                                                
                                                                                
  PRMONTH120                 LENGTH=3                                           
  LABEL="Month of procedure 120"                                                
                                                                                
  PRMONTH121                 LENGTH=3                                           
  LABEL="Month of procedure 121"                                                
                                                                                
  PRMONTH122                 LENGTH=3                                           
  LABEL="Month of procedure 122"                                                
                                                                                
  PRMONTH123                 LENGTH=3                                           
  LABEL="Month of procedure 123"                                                
                                                                                
  PRMONTH124                 LENGTH=3                                           
  LABEL="Month of procedure 124"                                                
                                                                                
  PRMONTH125                 LENGTH=3                                           
  LABEL="Month of procedure 125"                                                
                                                                                
  PRMONTH126                 LENGTH=3                                           
  LABEL="Month of procedure 126"                                                
                                                                                
  PRMONTH127                 LENGTH=3                                           
  LABEL="Month of procedure 127"                                                
                                                                                
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
                                                                                
  PRYEAR61                   LENGTH=3                                           
  LABEL="Year of procedure 61"                                                  
                                                                                
  PRYEAR62                   LENGTH=3                                           
  LABEL="Year of procedure 62"                                                  
                                                                                
  PRYEAR63                   LENGTH=3                                           
  LABEL="Year of procedure 63"                                                  
                                                                                
  PRYEAR64                   LENGTH=3                                           
  LABEL="Year of procedure 64"                                                  
                                                                                
  PRYEAR65                   LENGTH=3                                           
  LABEL="Year of procedure 65"                                                  
                                                                                
  PRYEAR66                   LENGTH=3                                           
  LABEL="Year of procedure 66"                                                  
                                                                                
  PRYEAR67                   LENGTH=3                                           
  LABEL="Year of procedure 67"                                                  
                                                                                
  PRYEAR68                   LENGTH=3                                           
  LABEL="Year of procedure 68"                                                  
                                                                                
  PRYEAR69                   LENGTH=3                                           
  LABEL="Year of procedure 69"                                                  
                                                                                
  PRYEAR70                   LENGTH=3                                           
  LABEL="Year of procedure 70"                                                  
                                                                                
  PRYEAR71                   LENGTH=3                                           
  LABEL="Year of procedure 71"                                                  
                                                                                
  PRYEAR72                   LENGTH=3                                           
  LABEL="Year of procedure 72"                                                  
                                                                                
  PRYEAR73                   LENGTH=3                                           
  LABEL="Year of procedure 73"                                                  
                                                                                
  PRYEAR74                   LENGTH=3                                           
  LABEL="Year of procedure 74"                                                  
                                                                                
  PRYEAR75                   LENGTH=3                                           
  LABEL="Year of procedure 75"                                                  
                                                                                
  PRYEAR76                   LENGTH=3                                           
  LABEL="Year of procedure 76"                                                  
                                                                                
  PRYEAR77                   LENGTH=3                                           
  LABEL="Year of procedure 77"                                                  
                                                                                
  PRYEAR78                   LENGTH=3                                           
  LABEL="Year of procedure 78"                                                  
                                                                                
  PRYEAR79                   LENGTH=3                                           
  LABEL="Year of procedure 79"                                                  
                                                                                
  PRYEAR80                   LENGTH=3                                           
  LABEL="Year of procedure 80"                                                  
                                                                                
  PRYEAR81                   LENGTH=3                                           
  LABEL="Year of procedure 81"                                                  
                                                                                
  PRYEAR82                   LENGTH=3                                           
  LABEL="Year of procedure 82"                                                  
                                                                                
  PRYEAR83                   LENGTH=3                                           
  LABEL="Year of procedure 83"                                                  
                                                                                
  PRYEAR84                   LENGTH=3                                           
  LABEL="Year of procedure 84"                                                  
                                                                                
  PRYEAR85                   LENGTH=3                                           
  LABEL="Year of procedure 85"                                                  
                                                                                
  PRYEAR86                   LENGTH=3                                           
  LABEL="Year of procedure 86"                                                  
                                                                                
  PRYEAR87                   LENGTH=3                                           
  LABEL="Year of procedure 87"                                                  
                                                                                
  PRYEAR88                   LENGTH=3                                           
  LABEL="Year of procedure 88"                                                  
                                                                                
  PRYEAR89                   LENGTH=3                                           
  LABEL="Year of procedure 89"                                                  
                                                                                
  PRYEAR90                   LENGTH=3                                           
  LABEL="Year of procedure 90"                                                  
                                                                                
  PRYEAR91                   LENGTH=3                                           
  LABEL="Year of procedure 91"                                                  
                                                                                
  PRYEAR92                   LENGTH=3                                           
  LABEL="Year of procedure 92"                                                  
                                                                                
  PRYEAR93                   LENGTH=3                                           
  LABEL="Year of procedure 93"                                                  
                                                                                
  PRYEAR94                   LENGTH=3                                           
  LABEL="Year of procedure 94"                                                  
                                                                                
  PRYEAR95                   LENGTH=3                                           
  LABEL="Year of procedure 95"                                                  
                                                                                
  PRYEAR96                   LENGTH=3                                           
  LABEL="Year of procedure 96"                                                  
                                                                                
  PRYEAR97                   LENGTH=3                                           
  LABEL="Year of procedure 97"                                                  
                                                                                
  PRYEAR98                   LENGTH=3                                           
  LABEL="Year of procedure 98"                                                  
                                                                                
  PRYEAR99                   LENGTH=3                                           
  LABEL="Year of procedure 99"                                                  
                                                                                
  PRYEAR100                  LENGTH=3                                           
  LABEL="Year of procedure 100"                                                 
                                                                                
  PRYEAR101                  LENGTH=3                                           
  LABEL="Year of procedure 101"                                                 
                                                                                
  PRYEAR102                  LENGTH=3                                           
  LABEL="Year of procedure 102"                                                 
                                                                                
  PRYEAR103                  LENGTH=3                                           
  LABEL="Year of procedure 103"                                                 
                                                                                
  PRYEAR104                  LENGTH=3                                           
  LABEL="Year of procedure 104"                                                 
                                                                                
  PRYEAR105                  LENGTH=3                                           
  LABEL="Year of procedure 105"                                                 
                                                                                
  PRYEAR106                  LENGTH=3                                           
  LABEL="Year of procedure 106"                                                 
                                                                                
  PRYEAR107                  LENGTH=3                                           
  LABEL="Year of procedure 107"                                                 
                                                                                
  PRYEAR108                  LENGTH=3                                           
  LABEL="Year of procedure 108"                                                 
                                                                                
  PRYEAR109                  LENGTH=3                                           
  LABEL="Year of procedure 109"                                                 
                                                                                
  PRYEAR110                  LENGTH=3                                           
  LABEL="Year of procedure 110"                                                 
                                                                                
  PRYEAR111                  LENGTH=3                                           
  LABEL="Year of procedure 111"                                                 
                                                                                
  PRYEAR112                  LENGTH=3                                           
  LABEL="Year of procedure 112"                                                 
                                                                                
  PRYEAR113                  LENGTH=3                                           
  LABEL="Year of procedure 113"                                                 
                                                                                
  PRYEAR114                  LENGTH=3                                           
  LABEL="Year of procedure 114"                                                 
                                                                                
  PRYEAR115                  LENGTH=3                                           
  LABEL="Year of procedure 115"                                                 
                                                                                
  PRYEAR116                  LENGTH=3                                           
  LABEL="Year of procedure 116"                                                 
                                                                                
  PRYEAR117                  LENGTH=3                                           
  LABEL="Year of procedure 117"                                                 
                                                                                
  PRYEAR118                  LENGTH=3                                           
  LABEL="Year of procedure 118"                                                 
                                                                                
  PRYEAR119                  LENGTH=3                                           
  LABEL="Year of procedure 119"                                                 
                                                                                
  PRYEAR120                  LENGTH=3                                           
  LABEL="Year of procedure 120"                                                 
                                                                                
  PRYEAR121                  LENGTH=3                                           
  LABEL="Year of procedure 121"                                                 
                                                                                
  PRYEAR122                  LENGTH=3                                           
  LABEL="Year of procedure 122"                                                 
                                                                                
  PRYEAR123                  LENGTH=3                                           
  LABEL="Year of procedure 123"                                                 
                                                                                
  PRYEAR124                  LENGTH=3                                           
  LABEL="Year of procedure 124"                                                 
                                                                                
  PRYEAR125                  LENGTH=3                                           
  LABEL="Year of procedure 125"                                                 
                                                                                
  PRYEAR126                  LENGTH=3                                           
  LABEL="Year of procedure 126"                                                 
                                                                                
  PRYEAR127                  LENGTH=3                                           
  LABEL="Year of procedure 127"                                                 
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      ADRG                          N3PF.                               
      @4      ADRGRISKMORTALITY             N2PF.                               
      @6      ADRGSEV                       N2PF.                               
      @8      AGE                           N3PF.                               
      @11     AGEMONTH                      N3PF.                               
      @14     AMDC                          N2PF.                               
      @16     AMONTH                        N2PF.                               
      @18     ASOURCE                       N2PF.                               
      @20     ASOURCE_X                     $CHAR1.                             
      @21     ASOURCEUB92                   $CHAR1.                             
      @22     ATYPE                         N2PF.                               
      @24     AWEEKEND                      N2PF.                               
      @26     BWT                           N4PF.                               
      @30     DaysBetweenVisits             N4PF.                               
      @34     DaysToEvent                   N6PF.                               
      @40     DIED                          N2PF.                               
      @42     DISP_X                        $CHAR2.                             
      @44     DISPUB04                      N2PF.                               
      @46     DISPUNIFORM                   N2PF.                               
      @48     DMONTH                        N2PF.                               
      @50     DNR                           N2PF.                               
      @52     DQTR                          N2PF.                               
      @54     DRG                           N3PF.                               
      @57     DRG_NoPOA                     N3PF.                               
      @60     DRGVER                        N2PF.                               
      @62     DSHOSPID                      $CHAR17.                            
      @79     DXPOA1                        $CHAR1.                             
      @80     DXPOA2                        $CHAR1.                             
      @81     DXPOA3                        $CHAR1.                             
      @82     DXPOA4                        $CHAR1.                             
      @83     DXPOA5                        $CHAR1.                             
      @84     DXPOA6                        $CHAR1.                             
      @85     DXPOA7                        $CHAR1.                             
      @86     DXPOA8                        $CHAR1.                             
      @87     DXPOA9                        $CHAR1.                             
      @88     DXPOA10                       $CHAR1.                             
      @89     DXPOA11                       $CHAR1.                             
      @90     DXPOA12                       $CHAR1.                             
      @91     DXPOA13                       $CHAR1.                             
      @92     DXPOA14                       $CHAR1.                             
      @93     DXPOA15                       $CHAR1.                             
      @94     DXPOA16                       $CHAR1.                             
      @95     DXPOA17                       $CHAR1.                             
      @96     DXPOA18                       $CHAR1.                             
      @97     DXPOA19                       $CHAR1.                             
      @98     DXPOA20                       $CHAR1.                             
      @99     DXPOA21                       $CHAR1.                             
      @100    DXPOA22                       $CHAR1.                             
      @101    DXPOA23                       $CHAR1.                             
      @102    DXPOA24                       $CHAR1.                             
      @103    DXPOA25                       $CHAR1.                             
      @104    DXPOA26                       $CHAR1.                             
      @105    DXPOA27                       $CHAR1.                             
      @106    DXPOA28                       $CHAR1.                             
      @107    DXPOA29                       $CHAR1.                             
      @108    DXPOA30                       $CHAR1.                             
      @109    DXPOA31                       $CHAR1.                             
      @110    DXPOA32                       $CHAR1.                             
      @111    DXPOA33                       $CHAR1.                             
      @112    DXPOA34                       $CHAR1.                             
      @113    DXPOA35                       $CHAR1.                             
      @114    DXPOA36                       $CHAR1.                             
      @115    DXPOA37                       $CHAR1.                             
      @116    DXPOA38                       $CHAR1.                             
      @117    DXPOA39                       $CHAR1.                             
      @118    DXPOA40                       $CHAR1.                             
      @119    DXPOA41                       $CHAR1.                             
      @120    DXPOA42                       $CHAR1.                             
      @121    DXPOA43                       $CHAR1.                             
      @122    DXPOA44                       $CHAR1.                             
      @123    DXPOA45                       $CHAR1.                             
      @124    DXPOA46                       $CHAR1.                             
      @125    DXPOA47                       $CHAR1.                             
      @126    DXPOA48                       $CHAR1.                             
      @127    DXPOA49                       $CHAR1.                             
      @128    DXPOA50                       $CHAR1.                             
      @129    DXPOA51                       $CHAR1.                             
      @130    DXPOA52                       $CHAR1.                             
      @131    DXPOA53                       $CHAR1.                             
      @132    DXPOA54                       $CHAR1.                             
      @133    DXPOA55                       $CHAR1.                             
      @134    DXPOA56                       $CHAR1.                             
      @135    DXPOA57                       $CHAR1.                             
      @136    DXPOA58                       $CHAR1.                             
      @137    DXPOA59                       $CHAR1.                             
      @138    DXPOA60                       $CHAR1.                             
      @139    DXPOA61                       $CHAR1.                             
      @140    DXPOA62                       $CHAR1.                             
      @141    DXPOA63                       $CHAR1.                             
      @142    DXPOA64                       $CHAR1.                             
      @143    DXPOA65                       $CHAR1.                             
      @144    DXPOA66                       $CHAR1.                             
      @145    DXPOA67                       $CHAR1.                             
      @146    DXPOA68                       $CHAR1.                             
      @147    DXPOA69                       $CHAR1.                             
      @148    DXPOA70                       $CHAR1.                             
      @149    DXPOA71                       $CHAR1.                             
      @150    DXPOA72                       $CHAR1.                             
      @151    DXPOA73                       $CHAR1.                             
      @152    DXPOA74                       $CHAR1.                             
      @153    DXPOA75                       $CHAR1.                             
      @154    DXPOA76                       $CHAR1.                             
      @155    DXPOA77                       $CHAR1.                             
      @156    DXPOA78                       $CHAR1.                             
      @157    DXPOA79                       $CHAR1.                             
      @158    DXPOA80                       $CHAR1.                             
      @159    DXPOA81                       $CHAR1.                             
      @160    DXPOA82                       $CHAR1.                             
      @161    DXPOA83                       $CHAR1.                             
      @162    DXPOA84                       $CHAR1.                             
      @163    DXPOA85                       $CHAR1.                             
      @164    DXPOA86                       $CHAR1.                             
      @165    DXPOA87                       $CHAR1.                             
      @166    DXPOA88                       $CHAR1.                             
      @167    DXPOA89                       $CHAR1.                             
      @168    DXPOA90                       $CHAR1.                             
      @169    FEMALE                        N2PF.                               
      @171    HCUP_ED                       N2PF.                               
      @173    HCUP_OS                       N2PF.                               
      @175    HISPANIC                      N2PF.                               
      @177    HISPANIC_X                    $CHAR15.                            
      @192    Homeless                      N2PF.                               
      @194    HOSPST                        $CHAR2.                             
      @196    I10_DX_Admitting              $CHAR7.                             
      @203    I10_DX1                       $CHAR7.                             
      @210    I10_DX2                       $CHAR7.                             
      @217    I10_DX3                       $CHAR7.                             
      @224    I10_DX4                       $CHAR7.                             
      @231    I10_DX5                       $CHAR7.                             
      @238    I10_DX6                       $CHAR7.                             
      @245    I10_DX7                       $CHAR7.                             
      @252    I10_DX8                       $CHAR7.                             
      @259    I10_DX9                       $CHAR7.                             
      @266    I10_DX10                      $CHAR7.                             
      @273    I10_DX11                      $CHAR7.                             
      @280    I10_DX12                      $CHAR7.                             
      @287    I10_DX13                      $CHAR7.                             
      @294    I10_DX14                      $CHAR7.                             
      @301    I10_DX15                      $CHAR7.                             
      @308    I10_DX16                      $CHAR7.                             
      @315    I10_DX17                      $CHAR7.                             
      @322    I10_DX18                      $CHAR7.                             
      @329    I10_DX19                      $CHAR7.                             
      @336    I10_DX20                      $CHAR7.                             
      @343    I10_DX21                      $CHAR7.                             
      @350    I10_DX22                      $CHAR7.                             
      @357    I10_DX23                      $CHAR7.                             
      @364    I10_DX24                      $CHAR7.                             
      @371    I10_DX25                      $CHAR7.                             
      @378    I10_DX26                      $CHAR7.                             
      @385    I10_DX27                      $CHAR7.                             
      @392    I10_DX28                      $CHAR7.                             
      @399    I10_DX29                      $CHAR7.                             
      @406    I10_DX30                      $CHAR7.                             
      @413    I10_DX31                      $CHAR7.                             
      @420    I10_DX32                      $CHAR7.                             
      @427    I10_DX33                      $CHAR7.                             
      @434    I10_DX34                      $CHAR7.                             
      @441    I10_DX35                      $CHAR7.                             
      @448    I10_DX36                      $CHAR7.                             
      @455    I10_DX37                      $CHAR7.                             
      @462    I10_DX38                      $CHAR7.                             
      @469    I10_DX39                      $CHAR7.                             
      @476    I10_DX40                      $CHAR7.                             
      @483    I10_DX41                      $CHAR7.                             
      @490    I10_DX42                      $CHAR7.                             
      @497    I10_DX43                      $CHAR7.                             
      @504    I10_DX44                      $CHAR7.                             
      @511    I10_DX45                      $CHAR7.                             
      @518    I10_DX46                      $CHAR7.                             
      @525    I10_DX47                      $CHAR7.                             
      @532    I10_DX48                      $CHAR7.                             
      @539    I10_DX49                      $CHAR7.                             
      @546    I10_DX50                      $CHAR7.                             
      @553    I10_DX51                      $CHAR7.                             
      @560    I10_DX52                      $CHAR7.                             
      @567    I10_DX53                      $CHAR7.                             
      @574    I10_DX54                      $CHAR7.                             
      @581    I10_DX55                      $CHAR7.                             
      @588    I10_DX56                      $CHAR7.                             
      @595    I10_DX57                      $CHAR7.                             
      @602    I10_DX58                      $CHAR7.                             
      @609    I10_DX59                      $CHAR7.                             
      @616    I10_DX60                      $CHAR7.                             
      @623    I10_DX61                      $CHAR7.                             
      @630    I10_DX62                      $CHAR7.                             
      @637    I10_DX63                      $CHAR7.                             
      @644    I10_DX64                      $CHAR7.                             
      @651    I10_DX65                      $CHAR7.                             
      @658    I10_DX66                      $CHAR7.                             
      @665    I10_DX67                      $CHAR7.                             
      @672    I10_DX68                      $CHAR7.                             
      @679    I10_DX69                      $CHAR7.                             
      @686    I10_DX70                      $CHAR7.                             
      @693    I10_DX71                      $CHAR7.                             
      @700    I10_DX72                      $CHAR7.                             
      @707    I10_DX73                      $CHAR7.                             
      @714    I10_DX74                      $CHAR7.                             
      @721    I10_DX75                      $CHAR7.                             
      @728    I10_DX76                      $CHAR7.                             
      @735    I10_DX77                      $CHAR7.                             
      @742    I10_DX78                      $CHAR7.                             
      @749    I10_DX79                      $CHAR7.                             
      @756    I10_DX80                      $CHAR7.                             
      @763    I10_DX81                      $CHAR7.                             
      @770    I10_DX82                      $CHAR7.                             
      @777    I10_DX83                      $CHAR7.                             
      @784    I10_DX84                      $CHAR7.                             
      @791    I10_DX85                      $CHAR7.                             
      @798    I10_DX86                      $CHAR7.                             
      @805    I10_DX87                      $CHAR7.                             
      @812    I10_DX88                      $CHAR7.                             
      @819    I10_DX89                      $CHAR7.                             
      @826    I10_DX90                      $CHAR7.                             
      @833    I10_NDX                       N3PF.                               
      @836    I10_NPR                       N3PF.                               
      @839    I10_PR1                       $CHAR7.                             
      @846    I10_PR2                       $CHAR7.                             
      @853    I10_PR3                       $CHAR7.                             
      @860    I10_PR4                       $CHAR7.                             
      @867    I10_PR5                       $CHAR7.                             
      @874    I10_PR6                       $CHAR7.                             
      @881    I10_PR7                       $CHAR7.                             
      @888    I10_PR8                       $CHAR7.                             
      @895    I10_PR9                       $CHAR7.                             
      @902    I10_PR10                      $CHAR7.                             
      @909    I10_PR11                      $CHAR7.                             
      @916    I10_PR12                      $CHAR7.                             
      @923    I10_PR13                      $CHAR7.                             
      @930    I10_PR14                      $CHAR7.                             
      @937    I10_PR15                      $CHAR7.                             
      @944    I10_PR16                      $CHAR7.                             
      @951    I10_PR17                      $CHAR7.                             
      @958    I10_PR18                      $CHAR7.                             
      @965    I10_PR19                      $CHAR7.                             
      @972    I10_PR20                      $CHAR7.                             
      @979    I10_PR21                      $CHAR7.                             
      @986    I10_PR22                      $CHAR7.                             
      @993    I10_PR23                      $CHAR7.                             
      @1000   I10_PR24                      $CHAR7.                             
      @1007   I10_PR25                      $CHAR7.                             
      @1014   I10_PR26                      $CHAR7.                             
      @1021   I10_PR27                      $CHAR7.                             
      @1028   I10_PR28                      $CHAR7.                             
      @1035   I10_PR29                      $CHAR7.                             
      @1042   I10_PR30                      $CHAR7.                             
      @1049   I10_PR31                      $CHAR7.                             
      @1056   I10_PR32                      $CHAR7.                             
      @1063   I10_PR33                      $CHAR7.                             
      @1070   I10_PR34                      $CHAR7.                             
      @1077   I10_PR35                      $CHAR7.                             
      @1084   I10_PR36                      $CHAR7.                             
      @1091   I10_PR37                      $CHAR7.                             
      @1098   I10_PR38                      $CHAR7.                             
      @1105   I10_PR39                      $CHAR7.                             
      @1112   I10_PR40                      $CHAR7.                             
      @1119   I10_PR41                      $CHAR7.                             
      @1126   I10_PR42                      $CHAR7.                             
      @1133   I10_PR43                      $CHAR7.                             
      @1140   I10_PR44                      $CHAR7.                             
      @1147   I10_PR45                      $CHAR7.                             
      @1154   I10_PR46                      $CHAR7.                             
      @1161   I10_PR47                      $CHAR7.                             
      @1168   I10_PR48                      $CHAR7.                             
      @1175   I10_PR49                      $CHAR7.                             
      @1182   I10_PR50                      $CHAR7.                             
      @1189   I10_PR51                      $CHAR7.                             
      @1196   I10_PR52                      $CHAR7.                             
      @1203   I10_PR53                      $CHAR7.                             
      @1210   I10_PR54                      $CHAR7.                             
      @1217   I10_PR55                      $CHAR7.                             
      @1224   I10_PR56                      $CHAR7.                             
      @1231   I10_PR57                      $CHAR7.                             
      @1238   I10_PR58                      $CHAR7.                             
      @1245   I10_PR59                      $CHAR7.                             
      @1252   I10_PR60                      $CHAR7.                             
      @1259   I10_PR61                      $CHAR7.                             
      @1266   I10_PR62                      $CHAR7.                             
      @1273   I10_PR63                      $CHAR7.                             
      @1280   I10_PR64                      $CHAR7.                             
      @1287   I10_PR65                      $CHAR7.                             
      @1294   I10_PR66                      $CHAR7.                             
      @1301   I10_PR67                      $CHAR7.                             
      @1308   I10_PR68                      $CHAR7.                             
      @1315   I10_PR69                      $CHAR7.                             
      @1322   I10_PR70                      $CHAR7.                             
      @1329   I10_PR71                      $CHAR7.                             
      @1336   I10_PR72                      $CHAR7.                             
      @1343   I10_PR73                      $CHAR7.                             
      @1350   I10_PR74                      $CHAR7.                             
      @1357   I10_PR75                      $CHAR7.                             
      @1364   I10_PR76                      $CHAR7.                             
      @1371   I10_PR77                      $CHAR7.                             
      @1378   I10_PR78                      $CHAR7.                             
      @1385   I10_PR79                      $CHAR7.                             
      @1392   I10_PR80                      $CHAR7.                             
      @1399   I10_PR81                      $CHAR7.                             
      @1406   I10_PR82                      $CHAR7.                             
      @1413   I10_PR83                      $CHAR7.                             
      @1420   I10_PR84                      $CHAR7.                             
      @1427   I10_PR85                      $CHAR7.                             
      @1434   I10_PR86                      $CHAR7.                             
      @1441   I10_PR87                      $CHAR7.                             
      @1448   I10_PR88                      $CHAR7.                             
      @1455   I10_PR89                      $CHAR7.                             
      @1462   I10_PR90                      $CHAR7.                             
      @1469   I10_PR91                      $CHAR7.                             
      @1476   I10_PR92                      $CHAR7.                             
      @1483   I10_PR93                      $CHAR7.                             
      @1490   I10_PR94                      $CHAR7.                             
      @1497   I10_PR95                      $CHAR7.                             
      @1504   I10_PR96                      $CHAR7.                             
      @1511   I10_PR97                      $CHAR7.                             
      @1518   I10_PR98                      $CHAR7.                             
      @1525   I10_PR99                      $CHAR7.                             
      @1532   I10_PR100                     $CHAR7.                             
      @1539   I10_PR101                     $CHAR7.                             
      @1546   I10_PR102                     $CHAR7.                             
      @1553   I10_PR103                     $CHAR7.                             
      @1560   I10_PR104                     $CHAR7.                             
      @1567   I10_PR105                     $CHAR7.                             
      @1574   I10_PR106                     $CHAR7.                             
      @1581   I10_PR107                     $CHAR7.                             
      @1588   I10_PR108                     $CHAR7.                             
      @1595   I10_PR109                     $CHAR7.                             
      @1602   I10_PR110                     $CHAR7.                             
      @1609   I10_PR111                     $CHAR7.                             
      @1616   I10_PR112                     $CHAR7.                             
      @1623   I10_PR113                     $CHAR7.                             
      @1630   I10_PR114                     $CHAR7.                             
      @1637   I10_PR115                     $CHAR7.                             
      @1644   I10_PR116                     $CHAR7.                             
      @1651   I10_PR117                     $CHAR7.                             
      @1658   I10_PR118                     $CHAR7.                             
      @1665   I10_PR119                     $CHAR7.                             
      @1672   I10_PR120                     $CHAR7.                             
      @1679   I10_PR121                     $CHAR7.                             
      @1686   I10_PR122                     $CHAR7.                             
      @1693   I10_PR123                     $CHAR7.                             
      @1700   I10_PR124                     $CHAR7.                             
      @1707   I10_PR125                     $CHAR7.                             
      @1714   I10_PR126                     $CHAR7.                             
      @1721   I10_PR127                     $CHAR7.                             
      @1728   I10_PROCTYPE                  N3PF.                               
      @1731   KEY                           15.                                 
      @1746   LOS                           N5PF.                               
      @1751   LOS_X                         N6PF.                               
      @1757   MDC                           N2PF.                               
      @1759   MDC_NoPOA                     N2PF.                               
      @1761   MEDINCSTQ                     N2PF.                               
      @1763   OS_TIME                       N11P2F.                             
      @1774   PAY1                          N2PF.                               
      @1776   PAY1_X                        $CHAR1.                             
      @1777   PAY2                          N2PF.                               
      @1779   PAY2_X                        $CHAR1.                             
      @1780   PAYER1_X                      $CHAR3.                             
      @1783   PAYER2_X                      $CHAR3.                             
      @1786   PL_CBSA                       N3PF.                               
      @1789   PL_UR_CAT4                    N2PF.                               
      @1791   POA_Disch_Edit1               N2PF.                               
      @1793   POA_Disch_Edit2               N2PF.                               
      @1795   POA_Hosp_Edit1                N2PF.                               
      @1797   POA_Hosp_Edit2                N2PF.                               
      @1799   POA_Hosp_Edit3                N2PF.                               
      @1801   POA_Hosp_Edit3_Value          N8P2F.                              
      @1809   PRDAY1                        N5PF.                               
      @1814   PRDAY2                        N5PF.                               
      @1819   PRDAY3                        N5PF.                               
      @1824   PRDAY4                        N5PF.                               
      @1829   PRDAY5                        N5PF.                               
      @1834   PRDAY6                        N5PF.                               
      @1839   PRDAY7                        N5PF.                               
      @1844   PRDAY8                        N5PF.                               
      @1849   PRDAY9                        N5PF.                               
      @1854   PRDAY10                       N5PF.                               
      @1859   PRDAY11                       N5PF.                               
      @1864   PRDAY12                       N5PF.                               
      @1869   PRDAY13                       N5PF.                               
      @1874   PRDAY14                       N5PF.                               
      @1879   PRDAY15                       N5PF.                               
      @1884   PRDAY16                       N5PF.                               
      @1889   PRDAY17                       N5PF.                               
      @1894   PRDAY18                       N5PF.                               
      @1899   PRDAY19                       N5PF.                               
      @1904   PRDAY20                       N5PF.                               
      @1909   PRDAY21                       N5PF.                               
      @1914   PRDAY22                       N5PF.                               
      @1919   PRDAY23                       N5PF.                               
      @1924   PRDAY24                       N5PF.                               
      @1929   PRDAY25                       N5PF.                               
      @1934   PRDAY26                       N5PF.                               
      @1939   PRDAY27                       N5PF.                               
      @1944   PRDAY28                       N5PF.                               
      @1949   PRDAY29                       N5PF.                               
      @1954   PRDAY30                       N5PF.                               
      @1959   PRDAY31                       N5PF.                               
      @1964   PRDAY32                       N5PF.                               
      @1969   PRDAY33                       N5PF.                               
      @1974   PRDAY34                       N5PF.                               
      @1979   PRDAY35                       N5PF.                               
      @1984   PRDAY36                       N5PF.                               
      @1989   PRDAY37                       N5PF.                               
      @1994   PRDAY38                       N5PF.                               
      @1999   PRDAY39                       N5PF.                               
      @2004   PRDAY40                       N5PF.                               
      @2009   PRDAY41                       N5PF.                               
      @2014   PRDAY42                       N5PF.                               
      @2019   PRDAY43                       N5PF.                               
      @2024   PRDAY44                       N5PF.                               
      @2029   PRDAY45                       N5PF.                               
      @2034   PRDAY46                       N5PF.                               
      @2039   PRDAY47                       N5PF.                               
      @2044   PRDAY48                       N5PF.                               
      @2049   PRDAY49                       N5PF.                               
      @2054   PRDAY50                       N5PF.                               
      @2059   PRDAY51                       N5PF.                               
      @2064   PRDAY52                       N5PF.                               
      @2069   PRDAY53                       N5PF.                               
      @2074   PRDAY54                       N5PF.                               
      @2079   PRDAY55                       N5PF.                               
      @2084   PRDAY56                       N5PF.                               
      @2089   PRDAY57                       N5PF.                               
      @2094   PRDAY58                       N5PF.                               
      @2099   PRDAY59                       N5PF.                               
      @2104   PRDAY60                       N5PF.                               
      @2109   PRDAY61                       N5PF.                               
      @2114   PRDAY62                       N5PF.                               
      @2119   PRDAY63                       N5PF.                               
      @2124   PRDAY64                       N5PF.                               
      @2129   PRDAY65                       N5PF.                               
      @2134   PRDAY66                       N5PF.                               
      @2139   PRDAY67                       N5PF.                               
      @2144   PRDAY68                       N5PF.                               
      @2149   PRDAY69                       N5PF.                               
      @2154   PRDAY70                       N5PF.                               
      @2159   PRDAY71                       N5PF.                               
      @2164   PRDAY72                       N5PF.                               
      @2169   PRDAY73                       N5PF.                               
      @2174   PRDAY74                       N5PF.                               
      @2179   PRDAY75                       N5PF.                               
      @2184   PRDAY76                       N5PF.                               
      @2189   PRDAY77                       N5PF.                               
      @2194   PRDAY78                       N5PF.                               
      @2199   PRDAY79                       N5PF.                               
      @2204   PRDAY80                       N5PF.                               
      @2209   PRDAY81                       N5PF.                               
      @2214   PRDAY82                       N5PF.                               
      @2219   PRDAY83                       N5PF.                               
      @2224   PRDAY84                       N5PF.                               
      @2229   PRDAY85                       N5PF.                               
      @2234   PRDAY86                       N5PF.                               
      @2239   PRDAY87                       N5PF.                               
      @2244   PRDAY88                       N5PF.                               
      @2249   PRDAY89                       N5PF.                               
      @2254   PRDAY90                       N5PF.                               
      @2259   PRDAY91                       N5PF.                               
      @2264   PRDAY92                       N5PF.                               
      @2269   PRDAY93                       N5PF.                               
      @2274   PRDAY94                       N5PF.                               
      @2279   PRDAY95                       N5PF.                               
      @2284   PRDAY96                       N5PF.                               
      @2289   PRDAY97                       N5PF.                               
      @2294   PRDAY98                       N5PF.                               
      @2299   PRDAY99                       N5PF.                               
      @2304   PRDAY100                      N5PF.                               
      @2309   PRDAY101                      N5PF.                               
      @2314   PRDAY102                      N5PF.                               
      @2319   PRDAY103                      N5PF.                               
      @2324   PRDAY104                      N5PF.                               
      @2329   PRDAY105                      N5PF.                               
      @2334   PRDAY106                      N5PF.                               
      @2339   PRDAY107                      N5PF.                               
      @2344   PRDAY108                      N5PF.                               
      @2349   PRDAY109                      N5PF.                               
      @2354   PRDAY110                      N5PF.                               
      @2359   PRDAY111                      N5PF.                               
      @2364   PRDAY112                      N5PF.                               
      @2369   PRDAY113                      N5PF.                               
      @2374   PRDAY114                      N5PF.                               
      @2379   PRDAY115                      N5PF.                               
      @2384   PRDAY116                      N5PF.                               
      @2389   PRDAY117                      N5PF.                               
      @2394   PRDAY118                      N5PF.                               
      @2399   PRDAY119                      N5PF.                               
      @2404   PRDAY120                      N5PF.                               
      @2409   PRDAY121                      N5PF.                               
      @2414   PRDAY122                      N5PF.                               
      @2419   PRDAY123                      N5PF.                               
      @2424   PRDAY124                      N5PF.                               
      @2429   PRDAY125                      N5PF.                               
      @2434   PRDAY126                      N5PF.                               
      @2439   PRDAY127                      N5PF.                               
      @2444   PSTATE                        $CHAR2.                             
      @2446   PSTCO2                        N5PF.                               
      @2451   RACE                          N2PF.                               
      @2453   RACE_EDIT                     N2PF.                               
      @2455   RACE_X                        $CHAR13.                            
      @2468   TOTCHG                        N10PF.                              
      @2478   TOTCHG_X                      N15P2F.                             
      @2493   TRAN_IN                       N2PF.                               
      @2495   TRAN_OUT                      N2PF.                               
      @2497   VisitLink                     N9PF.                               
      @2506   YEAR                          N4PF.                               
      @2510   ZIP3                          $CHAR3.                             
      @2513   ZIPINC_QRTL                   N3PF.                               
      @2516   AYEAR                         N4PF.                               
      @2520   PRMONTH1                      N2PF.                               
      @2522   PRMONTH2                      N2PF.                               
      @2524   PRMONTH3                      N2PF.                               
      @2526   PRMONTH4                      N2PF.                               
      @2528   PRMONTH5                      N2PF.                               
      @2530   PRMONTH6                      N2PF.                               
      @2532   PRMONTH7                      N2PF.                               
      @2534   PRMONTH8                      N2PF.                               
      @2536   PRMONTH9                      N2PF.                               
      @2538   PRMONTH10                     N2PF.                               
      @2540   PRMONTH11                     N2PF.                               
      @2542   PRMONTH12                     N2PF.                               
      @2544   PRMONTH13                     N2PF.                               
      @2546   PRMONTH14                     N2PF.                               
      @2548   PRMONTH15                     N2PF.                               
      @2550   PRMONTH16                     N2PF.                               
      @2552   PRMONTH17                     N2PF.                               
      @2554   PRMONTH18                     N2PF.                               
      @2556   PRMONTH19                     N2PF.                               
      @2558   PRMONTH20                     N2PF.                               
      @2560   PRMONTH21                     N2PF.                               
      @2562   PRMONTH22                     N2PF.                               
      @2564   PRMONTH23                     N2PF.                               
      @2566   PRMONTH24                     N2PF.                               
      @2568   PRMONTH25                     N2PF.                               
      @2570   PRMONTH26                     N2PF.                               
      @2572   PRMONTH27                     N2PF.                               
      @2574   PRMONTH28                     N2PF.                               
      @2576   PRMONTH29                     N2PF.                               
      @2578   PRMONTH30                     N2PF.                               
      @2580   PRMONTH31                     N2PF.                               
      @2582   PRMONTH32                     N2PF.                               
      @2584   PRMONTH33                     N2PF.                               
      @2586   PRMONTH34                     N2PF.                               
      @2588   PRMONTH35                     N2PF.                               
      @2590   PRMONTH36                     N2PF.                               
      @2592   PRMONTH37                     N2PF.                               
      @2594   PRMONTH38                     N2PF.                               
      @2596   PRMONTH39                     N2PF.                               
      @2598   PRMONTH40                     N2PF.                               
      @2600   PRMONTH41                     N2PF.                               
      @2602   PRMONTH42                     N2PF.                               
      @2604   PRMONTH43                     N2PF.                               
      @2606   PRMONTH44                     N2PF.                               
      @2608   PRMONTH45                     N2PF.                               
      @2610   PRMONTH46                     N2PF.                               
      @2612   PRMONTH47                     N2PF.                               
      @2614   PRMONTH48                     N2PF.                               
      @2616   PRMONTH49                     N2PF.                               
      @2618   PRMONTH50                     N2PF.                               
      @2620   PRMONTH51                     N2PF.                               
      @2622   PRMONTH52                     N2PF.                               
      @2624   PRMONTH53                     N2PF.                               
      @2626   PRMONTH54                     N2PF.                               
      @2628   PRMONTH55                     N2PF.                               
      @2630   PRMONTH56                     N2PF.                               
      @2632   PRMONTH57                     N2PF.                               
      @2634   PRMONTH58                     N2PF.                               
      @2636   PRMONTH59                     N2PF.                               
      @2638   PRMONTH60                     N2PF.                               
      @2640   PRMONTH61                     N2PF.                               
      @2642   PRMONTH62                     N2PF.                               
      @2644   PRMONTH63                     N2PF.                               
      @2646   PRMONTH64                     N2PF.                               
      @2648   PRMONTH65                     N2PF.                               
      @2650   PRMONTH66                     N2PF.                               
      @2652   PRMONTH67                     N2PF.                               
      @2654   PRMONTH68                     N2PF.                               
      @2656   PRMONTH69                     N2PF.                               
      @2658   PRMONTH70                     N2PF.                               
      @2660   PRMONTH71                     N2PF.                               
      @2662   PRMONTH72                     N2PF.                               
      @2664   PRMONTH73                     N2PF.                               
      @2666   PRMONTH74                     N2PF.                               
      @2668   PRMONTH75                     N2PF.                               
      @2670   PRMONTH76                     N2PF.                               
      @2672   PRMONTH77                     N2PF.                               
      @2674   PRMONTH78                     N2PF.                               
      @2676   PRMONTH79                     N2PF.                               
      @2678   PRMONTH80                     N2PF.                               
      @2680   PRMONTH81                     N2PF.                               
      @2682   PRMONTH82                     N2PF.                               
      @2684   PRMONTH83                     N2PF.                               
      @2686   PRMONTH84                     N2PF.                               
      @2688   PRMONTH85                     N2PF.                               
      @2690   PRMONTH86                     N2PF.                               
      @2692   PRMONTH87                     N2PF.                               
      @2694   PRMONTH88                     N2PF.                               
      @2696   PRMONTH89                     N2PF.                               
      @2698   PRMONTH90                     N2PF.                               
      @2700   PRMONTH91                     N2PF.                               
      @2702   PRMONTH92                     N2PF.                               
      @2704   PRMONTH93                     N2PF.                               
      @2706   PRMONTH94                     N2PF.                               
      @2708   PRMONTH95                     N2PF.                               
      @2710   PRMONTH96                     N2PF.                               
      @2712   PRMONTH97                     N2PF.                               
      @2714   PRMONTH98                     N2PF.                               
      @2716   PRMONTH99                     N2PF.                               
      @2718   PRMONTH100                    N2PF.                               
      @2720   PRMONTH101                    N2PF.                               
      @2722   PRMONTH102                    N2PF.                               
      @2724   PRMONTH103                    N2PF.                               
      @2726   PRMONTH104                    N2PF.                               
      @2728   PRMONTH105                    N2PF.                               
      @2730   PRMONTH106                    N2PF.                               
      @2732   PRMONTH107                    N2PF.                               
      @2734   PRMONTH108                    N2PF.                               
      @2736   PRMONTH109                    N2PF.                               
      @2738   PRMONTH110                    N2PF.                               
      @2740   PRMONTH111                    N2PF.                               
      @2742   PRMONTH112                    N2PF.                               
      @2744   PRMONTH113                    N2PF.                               
      @2746   PRMONTH114                    N2PF.                               
      @2748   PRMONTH115                    N2PF.                               
      @2750   PRMONTH116                    N2PF.                               
      @2752   PRMONTH117                    N2PF.                               
      @2754   PRMONTH118                    N2PF.                               
      @2756   PRMONTH119                    N2PF.                               
      @2758   PRMONTH120                    N2PF.                               
      @2760   PRMONTH121                    N2PF.                               
      @2762   PRMONTH122                    N2PF.                               
      @2764   PRMONTH123                    N2PF.                               
      @2766   PRMONTH124                    N2PF.                               
      @2768   PRMONTH125                    N2PF.                               
      @2770   PRMONTH126                    N2PF.                               
      @2772   PRMONTH127                    N2PF.                               
      @2774   PRYEAR1                       N4PF.                               
      @2778   PRYEAR2                       N4PF.                               
      @2782   PRYEAR3                       N4PF.                               
      @2786   PRYEAR4                       N4PF.                               
      @2790   PRYEAR5                       N4PF.                               
      @2794   PRYEAR6                       N4PF.                               
      @2798   PRYEAR7                       N4PF.                               
      @2802   PRYEAR8                       N4PF.                               
      @2806   PRYEAR9                       N4PF.                               
      @2810   PRYEAR10                      N4PF.                               
      @2814   PRYEAR11                      N4PF.                               
      @2818   PRYEAR12                      N4PF.                               
      @2822   PRYEAR13                      N4PF.                               
      @2826   PRYEAR14                      N4PF.                               
      @2830   PRYEAR15                      N4PF.                               
      @2834   PRYEAR16                      N4PF.                               
      @2838   PRYEAR17                      N4PF.                               
      @2842   PRYEAR18                      N4PF.                               
      @2846   PRYEAR19                      N4PF.                               
      @2850   PRYEAR20                      N4PF.                               
      @2854   PRYEAR21                      N4PF.                               
      @2858   PRYEAR22                      N4PF.                               
      @2862   PRYEAR23                      N4PF.                               
      @2866   PRYEAR24                      N4PF.                               
      @2870   PRYEAR25                      N4PF.                               
      @2874   PRYEAR26                      N4PF.                               
      @2878   PRYEAR27                      N4PF.                               
      @2882   PRYEAR28                      N4PF.                               
      @2886   PRYEAR29                      N4PF.                               
      @2890   PRYEAR30                      N4PF.                               
      @2894   PRYEAR31                      N4PF.                               
      @2898   PRYEAR32                      N4PF.                               
      @2902   PRYEAR33                      N4PF.                               
      @2906   PRYEAR34                      N4PF.                               
      @2910   PRYEAR35                      N4PF.                               
      @2914   PRYEAR36                      N4PF.                               
      @2918   PRYEAR37                      N4PF.                               
      @2922   PRYEAR38                      N4PF.                               
      @2926   PRYEAR39                      N4PF.                               
      @2930   PRYEAR40                      N4PF.                               
      @2934   PRYEAR41                      N4PF.                               
      @2938   PRYEAR42                      N4PF.                               
      @2942   PRYEAR43                      N4PF.                               
      @2946   PRYEAR44                      N4PF.                               
      @2950   PRYEAR45                      N4PF.                               
      @2954   PRYEAR46                      N4PF.                               
      @2958   PRYEAR47                      N4PF.                               
      @2962   PRYEAR48                      N4PF.                               
      @2966   PRYEAR49                      N4PF.                               
      @2970   PRYEAR50                      N4PF.                               
      @2974   PRYEAR51                      N4PF.                               
      @2978   PRYEAR52                      N4PF.                               
      @2982   PRYEAR53                      N4PF.                               
      @2986   PRYEAR54                      N4PF.                               
      @2990   PRYEAR55                      N4PF.                               
      @2994   PRYEAR56                      N4PF.                               
      @2998   PRYEAR57                      N4PF.                               
      @3002   PRYEAR58                      N4PF.                               
      @3006   PRYEAR59                      N4PF.                               
      @3010   PRYEAR60                      N4PF.                               
      @3014   PRYEAR61                      N4PF.                               
      @3018   PRYEAR62                      N4PF.                               
      @3022   PRYEAR63                      N4PF.                               
      @3026   PRYEAR64                      N4PF.                               
      @3030   PRYEAR65                      N4PF.                               
      @3034   PRYEAR66                      N4PF.                               
      @3038   PRYEAR67                      N4PF.                               
      @3042   PRYEAR68                      N4PF.                               
      @3046   PRYEAR69                      N4PF.                               
      @3050   PRYEAR70                      N4PF.                               
      @3054   PRYEAR71                      N4PF.                               
      @3058   PRYEAR72                      N4PF.                               
      @3062   PRYEAR73                      N4PF.                               
      @3066   PRYEAR74                      N4PF.                               
      @3070   PRYEAR75                      N4PF.                               
      @3074   PRYEAR76                      N4PF.                               
      @3078   PRYEAR77                      N4PF.                               
      @3082   PRYEAR78                      N4PF.                               
      @3086   PRYEAR79                      N4PF.                               
      @3090   PRYEAR80                      N4PF.                               
      @3094   PRYEAR81                      N4PF.                               
      @3098   PRYEAR82                      N4PF.                               
      @3102   PRYEAR83                      N4PF.                               
      @3106   PRYEAR84                      N4PF.                               
      @3110   PRYEAR85                      N4PF.                               
      @3114   PRYEAR86                      N4PF.                               
      @3118   PRYEAR87                      N4PF.                               
      @3122   PRYEAR88                      N4PF.                               
      @3126   PRYEAR89                      N4PF.                               
      @3130   PRYEAR90                      N4PF.                               
      @3134   PRYEAR91                      N4PF.                               
      @3138   PRYEAR92                      N4PF.                               
      @3142   PRYEAR93                      N4PF.                               
      @3146   PRYEAR94                      N4PF.                               
      @3150   PRYEAR95                      N4PF.                               
      @3154   PRYEAR96                      N4PF.                               
      @3158   PRYEAR97                      N4PF.                               
      @3162   PRYEAR98                      N4PF.                               
      @3166   PRYEAR99                      N4PF.                               
      @3170   PRYEAR100                     N4PF.                               
      @3174   PRYEAR101                     N4PF.                               
      @3178   PRYEAR102                     N4PF.                               
      @3182   PRYEAR103                     N4PF.                               
      @3186   PRYEAR104                     N4PF.                               
      @3190   PRYEAR105                     N4PF.                               
      @3194   PRYEAR106                     N4PF.                               
      @3198   PRYEAR107                     N4PF.                               
      @3202   PRYEAR108                     N4PF.                               
      @3206   PRYEAR109                     N4PF.                               
      @3210   PRYEAR110                     N4PF.                               
      @3214   PRYEAR111                     N4PF.                               
      @3218   PRYEAR112                     N4PF.                               
      @3222   PRYEAR113                     N4PF.                               
      @3226   PRYEAR114                     N4PF.                               
      @3230   PRYEAR115                     N4PF.                               
      @3234   PRYEAR116                     N4PF.                               
      @3238   PRYEAR117                     N4PF.                               
      @3242   PRYEAR118                     N4PF.                               
      @3246   PRYEAR119                     N4PF.                               
      @3250   PRYEAR120                     N4PF.                               
      @3254   PRYEAR121                     N4PF.                               
      @3258   PRYEAR122                     N4PF.                               
      @3262   PRYEAR123                     N4PF.                               
      @3266   PRYEAR124                     N4PF.                               
      @3270   PRYEAR125                     N4PF.                               
      @3274   PRYEAR126                     N4PF.                               
      @3278   PRYEAR127                     N4PF.                               
      ;                                                                         
                                                                                
                                                                                
RUN;
