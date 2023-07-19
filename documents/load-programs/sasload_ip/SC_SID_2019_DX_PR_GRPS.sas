/*******************************************************************            
* Creation Date: 07/31/2022                                                     
*   SC_SID_2019_DX_PR_GRPS.SAS:                                                 
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
DATA SC_SIDC_2019_DX_PR_GRPS;                                                   
INFILE 'SC_SID_2019_DX_PR_GRPS.ASC' FIRSTOBS=3 LRECL = 80;                      
                                                                                
*** Variable attribute ***;                                                     
ATTRIB                                                                          
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
  ;                                                                             
                                                                                
                                                                                
*** Input the variables from the ASCII file ***;                                
INPUT                                                                           
      @1      I10_INJURY                    N2PF.                               
      @3      I10_INJURY_CUT                N2PF.                               
      @5      I10_INJURY_DROWN              N2PF.                               
      @7      I10_INJURY_FALL               N2PF.                               
      @9      I10_INJURY_FIRE               N2PF.                               
      @11     I10_INJURY_FIREARM            N2PF.                               
      @13     I10_INJURY_MACHINERY          N2PF.                               
      @15     I10_INJURY_MVT                N2PF.                               
      @17     I10_INJURY_NATURE             N2PF.                               
      @19     I10_INJURY_OVEREXERTION       N2PF.                               
      @21     I10_INJURY_POISON             N2PF.                               
      @23     I10_INJURY_STRUCK             N2PF.                               
      @25     I10_INJURY_SUFFOCATION        N2PF.                               
      @27     I10_INTENT_ASSAULT            N2PF.                               
      @29     I10_INTENT_SELF_HARM          N2PF.                               
      @31     I10_INTENT_UNINTENTIONAL      N2PF.                               
      @33     I10_MULTINJURY                N2PF.                               
      @35     KEY                           15.                                 
      ;                                                                         
                                                                                
                                                                                
RUN;
