/*******************************************************************            
* Creation Date: 11/28/2017                                                     
*   RI_SEDD_2015q4_DX_PR_GRPS.SAS:                                              
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
DATA RI_SEDDC_2015q4_DX_PR_GRPS;                                                
INFILE 'RI_SEDD_2015q4_DX_PR_GRPS.ASC' FIRSTOBS=3 LRECL = 294;                  
                                                                                
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
                                                                                
  KEY                        LENGTH=8                      FORMAT=Z15.          
  LABEL="HCUP record identifier"                                                
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
      @23     I10_CHRON1                    N2PF.                               
      @25     I10_CHRON2                    N2PF.                               
      @27     I10_CHRON3                    N2PF.                               
      @29     I10_CHRON4                    N2PF.                               
      @31     I10_CHRON5                    N2PF.                               
      @33     I10_CHRON6                    N2PF.                               
      @35     I10_CHRON7                    N2PF.                               
      @37     I10_CHRON8                    N2PF.                               
      @39     I10_CHRON9                    N2PF.                               
      @41     I10_CHRON10                   N2PF.                               
      @43     I10_CHRON11                   N2PF.                               
      @45     I10_DXMCCS1                   $CHAR11.                            
      @56     I10_DXMCCS2                   $CHAR11.                            
      @67     I10_DXMCCS3                   $CHAR11.                            
      @78     I10_DXMCCS4                   $CHAR11.                            
      @89     I10_DXMCCS5                   $CHAR11.                            
      @100    I10_DXMCCS6                   $CHAR11.                            
      @111    I10_DXMCCS7                   $CHAR11.                            
      @122    I10_DXMCCS8                   $CHAR11.                            
      @133    I10_DXMCCS9                   $CHAR11.                            
      @144    I10_DXMCCS10                  $CHAR11.                            
      @155    I10_DXMCCS11                  $CHAR11.                            
      @166    I10_ECauseMCCS1               $CHAR11.                            
      @177    I10_ECauseMCCS2               $CHAR11.                            
      @188    I10_ECauseMCCS3               $CHAR11.                            
      @199    I10_ECauseMCCS4               $CHAR11.                            
      @210    I10_ECauseMCCS5               $CHAR11.                            
      @221    I10_ECauseMCCS6               $CHAR11.                            
      @232    I10_ECauseMCCS7               $CHAR11.                            
      @243    I10_ECauseMCCS8               $CHAR11.                            
      @254    I10_ECauseMCCS9               $CHAR11.                            
      @265    I10_ECauseMCCS10              $CHAR11.                            
      @276    I10_INJURY                    N2PF.                               
      @278    I10_MULTINJURY                N2PF.                               
      @280    KEY                           15.                                 
      ;                                                                         
                                                                                
                                                                                
RUN;
