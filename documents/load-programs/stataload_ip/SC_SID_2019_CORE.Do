/*****************************************************************************
* Creation Date: 07/31/2022   
* SC_SID_2019_CORE.Do
* This program will load the 2019 SC ASCII CORE File into Stata.
* Because Stata loads the entire file into memory, it may not be possible
* to load every data element for large files.  If necessary, edit this
* program to change the memory size or to load only selected data elements.
*****************************************************************************/

***************************************************************;
* ----------------------------------------------------------- *;
* |  NOTICE: Use of HCUP data constitutes acceptance of the | *;
* |  terms and conditions of the HCUP Data Use Agreement.   | *;
* ----------------------------------------------------------- *;
***************************************************************;


*** Set available memory size ***
set mem 500m

*** Read data elements from the ASCII file ***
*** Skip the first two lines from the ASCII file i.e. infix 3 firstlineoffile ***
infix 3 firstlineoffile                            ///
      byte   AMONTH                       1-   2   ///
      byte   ATYPE                        3-   4   ///
      byte   AWEEKEND                     5-   6   ///
      byte   DIED                         7-   8   ///
      byte   DISPUB04                     9-  10   ///
      byte   DISPUNIFORM                 11-  12   ///
      str    DISP_X                      13-  14   ///
      byte   DMONTH                      15-  16   ///
      byte   DQTR                        17-  18   ///
      int    DRG                         19-  21   ///
      byte   DRGVER                      22-  23   ///
      int    DRG_NoPOA                   24-  26   ///
      str    DXPOA1                      27        ///
      str    DXPOA2                      28        ///
      str    DXPOA3                      29        ///
      str    DXPOA4                      30        ///
      str    DXPOA5                      31        ///
      str    DXPOA6                      32        ///
      str    DXPOA7                      33        ///
      str    DXPOA8                      34        ///
      str    DXPOA9                      35        ///
      str    DXPOA10                     36        ///
      str    DXPOA11                     37        ///
      str    DXPOA12                     38        ///
      str    DXPOA13                     39        ///
      str    DXPOA14                     40        ///
      str    DXPOA15                     41        ///
      str    DXPOA16                     42        ///
      int    DaysICU                     43-  45   ///
      byte   FEMALE                      46-  47   ///
      byte   HCUP_ED                     48-  49   ///
      byte   HCUP_OS                     50-  51   ///
      str    HOSPST                      52-  53   ///
      int    I10_BIRTH                   54-  56   ///
      int    I10_DELIVERY                57-  59   ///
      str    I10_DX1                     60-  66   ///
      str    I10_DX2                     67-  73   ///
      str    I10_DX3                     74-  80   ///
      str    I10_DX4                     81-  87   ///
      str    I10_DX5                     88-  94   ///
      str    I10_DX6                     95- 101   ///
      str    I10_DX7                    102- 108   ///
      str    I10_DX8                    109- 115   ///
      str    I10_DX9                    116- 122   ///
      str    I10_DX10                   123- 129   ///
      str    I10_DX11                   130- 136   ///
      str    I10_DX12                   137- 143   ///
      str    I10_DX13                   144- 150   ///
      str    I10_DX14                   151- 157   ///
      str    I10_DX15                   158- 164   ///
      str    I10_DX16                   165- 171   ///
      str    I10_DX17                   172- 178   ///
      str    I10_DX_Admitting           179- 185   ///
      int    I10_NDX                    186- 188   ///
      int    I10_NPR                    189- 191   ///
      byte   I10_ORPROC                 192- 193   ///
      str    I10_PR1                    194- 200   ///
      str    I10_PR2                    201- 207   ///
      str    I10_PR3                    208- 214   ///
      str    I10_PR4                    215- 221   ///
      str    I10_PR5                    222- 228   ///
      str    I10_PR6                    229- 235   ///
      str    I10_PR7                    236- 242   ///
      str    I10_PR8                    243- 249   ///
      str    I10_PR9                    250- 256   ///
      str    I10_PR10                   257- 263   ///
      str    I10_PR11                   264- 270   ///
      str    I10_PR12                   271- 277   ///
      str    I10_PR13                   278- 284   ///
      int    I10_PROCTYPE               285- 287   ///
      byte   I10_SERVICELINE            288- 289   ///
      double KEY                        290- 304   ///
      long   LOS                        305- 309   ///
      long   LOS_X                      310- 315   ///
      byte   MDC                        316- 317   ///
      byte   MDC_NoPOA                  318- 319   ///
      str    MDSPEC1                    320- 322   ///
      str    MDSPEC2                    323- 325   ///
      byte   MEDINCSTQ                  326- 327   ///
      double OS_TIME                    328- 338   ///
      byte   PAY1                       339- 340   ///
      str    PAY1_X                     341- 342   ///
      byte   PL_NCHS                    343- 344   ///
      byte   PL_UR_CAT4                 345- 346   ///
      byte   POA_Disch_Edit1            347- 348   ///
      byte   POA_Disch_Edit2            349- 350   ///
      byte   POA_Hosp_Edit1             351- 352   ///
      byte   POA_Hosp_Edit2             353- 354   ///
      byte   POA_Hosp_Edit3             355- 356   ///
      double POA_Hosp_Edit3_Value       357- 364   ///
      long   PRDAY1                     365- 369   ///
      long   PRDAY2                     370- 374   ///
      long   PRDAY3                     375- 379   ///
      long   PRDAY4                     380- 384   ///
      long   PRDAY5                     385- 389   ///
      long   PRDAY6                     390- 394   ///
      long   PRDAY7                     395- 399   ///
      long   PRDAY8                     400- 404   ///
      long   PRDAY9                     405- 409   ///
      long   PRDAY10                    410- 414   ///
      long   PRDAY11                    415- 419   ///
      long   PRDAY12                    420- 424   ///
      long   PRDAY13                    425- 429   ///
      str    PSTATE                     430- 431   ///
      str    PSTATE_GEO                 432- 433   ///
      long   PSTCO                      434- 438   ///
      str    PointOfOriginUB04          439        ///
      str    PointOfOrigin_X            440        ///
      byte   RACE                       441- 442   ///
      byte   RACE_EDIT                  443- 444   ///
      str    RACE_X                     445- 447   ///
      double TOTCHG                     448- 457   ///
      double TOTCHG_X                   458- 472   ///
      byte   TRAN_IN                    473- 474   ///
      byte   TRAN_OUT                   475- 476   ///
      int    YEAR                       477- 480   ///
      int    ZIPINC_QRTL                481- 483   ///
      int    AGEGROUP                   484- 486   ///
      int    AYEAR                      487- 490   ///
      using  "SC_SID_2019_CORE.ASC"

***  Assign labels to the data elements ***
label var AMONTH                   "Admission month"
label var ATYPE                    "Admission type"
label var AWEEKEND                 "Admission day is a weekend"
label var DIED                     "Died during hospitalization"
label var DISPUB04                 "Disposition of patient (UB-04 standard coding)"
label var DISPUNIFORM              "Disposition of patient (uniform)"
label var DISP_X                   "Disposition of patient (as received from source)"
label var DMONTH                   "Discharge month"
label var DQTR                     "Discharge quarter"
label var DRG                      "DRG in effect on discharge date"
label var DRGVER                   "DRG grouper version used on discharge date"
label var DRG_NoPOA                "DRG in use on discharge date, calculated without POA"
label var DXPOA1                   "Diagnosis 1, present on admission indicator"
label var DXPOA2                   "Diagnosis 2, present on admission indicator"
label var DXPOA3                   "Diagnosis 3, present on admission indicator"
label var DXPOA4                   "Diagnosis 4, present on admission indicator"
label var DXPOA5                   "Diagnosis 5, present on admission indicator"
label var DXPOA6                   "Diagnosis 6, present on admission indicator"
label var DXPOA7                   "Diagnosis 7, present on admission indicator"
label var DXPOA8                   "Diagnosis 8, present on admission indicator"
label var DXPOA9                   "Diagnosis 9, present on admission indicator"
label var DXPOA10                  "Diagnosis 10, present on admission indicator"
label var DXPOA11                  "Diagnosis 11, present on admission indicator"
label var DXPOA12                  "Diagnosis 12, present on admission indicator"
label var DXPOA13                  "Diagnosis 13, present on admission indicator"
label var DXPOA14                  "Diagnosis 14, present on admission indicator"
label var DXPOA15                  "Diagnosis 15, present on admission indicator"
label var DXPOA16                  "Diagnosis 16, present on admission indicator"
label var DaysICU                  "Days in medical/surgical intensive care unit (as received from source)"
label var FEMALE                   "Indicator of sex"
label var HCUP_ED                  "HCUP Emergency Department service indicator"
label var HCUP_OS                  "HCUP Observation Stay service indicator"
label var HOSPST                   "Hospital state postal code"
label var I10_BIRTH                "ICD-10-CM Birth Indicator"
label var I10_DELIVERY             "ICD-10-CM Delivery Indicator"
label var I10_DX1                  "ICD-10-CM Diagnosis 1"
label var I10_DX2                  "ICD-10-CM Diagnosis 2"
label var I10_DX3                  "ICD-10-CM Diagnosis 3"
label var I10_DX4                  "ICD-10-CM Diagnosis 4"
label var I10_DX5                  "ICD-10-CM Diagnosis 5"
label var I10_DX6                  "ICD-10-CM Diagnosis 6"
label var I10_DX7                  "ICD-10-CM Diagnosis 7"
label var I10_DX8                  "ICD-10-CM Diagnosis 8"
label var I10_DX9                  "ICD-10-CM Diagnosis 9"
label var I10_DX10                 "ICD-10-CM Diagnosis 10"
label var I10_DX11                 "ICD-10-CM Diagnosis 11"
label var I10_DX12                 "ICD-10-CM Diagnosis 12"
label var I10_DX13                 "ICD-10-CM Diagnosis 13"
label var I10_DX14                 "ICD-10-CM Diagnosis 14"
label var I10_DX15                 "ICD-10-CM Diagnosis 15"
label var I10_DX16                 "ICD-10-CM Diagnosis 16"
label var I10_DX17                 "ICD-10-CM Diagnosis 17"
label var I10_DX_Admitting         "ICD-10-CM Admitting Diagnosis Code"
label var I10_NDX                  "ICD-10-CM Number of diagnoses on this record"
label var I10_NPR                  "ICD-10-PCS Number of procedures on this record"
label var I10_ORPROC               "ICD-10-PCS Major operating room procedure indicator"
label var I10_PR1                  "ICD-10-PCS Procedure 1"
label var I10_PR2                  "ICD-10-PCS Procedure 2"
label var I10_PR3                  "ICD-10-PCS Procedure 3"
label var I10_PR4                  "ICD-10-PCS Procedure 4"
label var I10_PR5                  "ICD-10-PCS Procedure 5"
label var I10_PR6                  "ICD-10-PCS Procedure 6"
label var I10_PR7                  "ICD-10-PCS Procedure 7"
label var I10_PR8                  "ICD-10-PCS Procedure 8"
label var I10_PR9                  "ICD-10-PCS Procedure 9"
label var I10_PR10                 "ICD-10-PCS Procedure 10"
label var I10_PR11                 "ICD-10-PCS Procedure 11"
label var I10_PR12                 "ICD-10-PCS Procedure 12"
label var I10_PR13                 "ICD-10-PCS Procedure 13"
label var I10_PROCTYPE             "ICD-10-PCS Procedure type indicator"
label var I10_SERVICELINE          "ICD-10-CM/PCS Hospital Service Line"
label var KEY                      "HCUP record identifier"
label var LOS                      "Length of stay (cleaned)"
label var LOS_X                    "Length of stay (as received from source)"
label var MDC                      "MDC in effect on discharge date"
label var MDC_NoPOA                "MDC in use on discharge date, calculated without POA"
label var MDSPEC1                  "Physician 1 specialty (as received from source)"
label var MDSPEC2                  "Physician 2 specialty (as received from source)"
label var MEDINCSTQ                "Median household income state quartile for patient ZIP Code"
label var OS_TIME                  "Observation stay time summed from UNITS"
label var PAY1                     "Primary expected payer (uniform)"
label var PAY1_X                   "Primary expected payer (as received from source)"
label var PL_NCHS                  "Patient Location: NCHS Urban-Rural Code"
label var PL_UR_CAT4               "Patient Location: Urban-Rural 4 Categories"
label var POA_Disch_Edit1          "Discharge has POA missing on all nonexempt diagnoses"
label var POA_Disch_Edit2          "Discharge has POA missing on all nonexempt secondary diagnoses"
label var POA_Hosp_Edit1           "Hospital reported POA as Y on all diagnoses on all discharges"
label var POA_Hosp_Edit2           "Hospital reported POA as missing on all non-Medicare discharges"
label var POA_Hosp_Edit3           "Hospital reported POA as missing on all nonexempt diagnoses for 15% or more of discharges"
label var POA_Hosp_Edit3_Value     "Percentage of discharges with all nonexempt diagnoses missing POA indicators"
label var PRDAY1                   "Number of days from admission to I10_PR1"
label var PRDAY2                   "Number of days from admission to I10_PR2"
label var PRDAY3                   "Number of days from admission to I10_PR3"
label var PRDAY4                   "Number of days from admission to I10_PR4"
label var PRDAY5                   "Number of days from admission to I10_PR5"
label var PRDAY6                   "Number of days from admission to I10_PR6"
label var PRDAY7                   "Number of days from admission to I10_PR7"
label var PRDAY8                   "Number of days from admission to I10_PR8"
label var PRDAY9                   "Number of days from admission to I10_PR9"
label var PRDAY10                  "Number of days from admission to I10_PR10"
label var PRDAY11                  "Number of days from admission to I10_PR11"
label var PRDAY12                  "Number of days from admission to I10_PR12"
label var PRDAY13                  "Number of days from admission to I10_PR13"
label var PSTATE                   "Patient State postal code"
label var PSTATE_GEO               "Patient State postal code assigned from ZIP Code"
label var PSTCO                    "Patient state/county FIPS code"
label var PointOfOriginUB04        "Point of origin for admission or visit, UB-04 standard coding"
label var PointOfOrigin_X          "Point of origin for admission or visit, as received from source"
label var RACE                     "Race (uniform)"
label var RACE_EDIT                "Race Edit Checks"
label var RACE_X                   "Race (as received from source)"
label var TOTCHG                   "Total charges (cleaned)"
label var TOTCHG_X                 "Total charges (as received from source)"
label var TRAN_IN                  "Transfer in indicator"
label var TRAN_OUT                 "Transfer out indicator"
label var YEAR                     "Calendar year"
label var ZIPINC_QRTL              "Median household income national quartile for patient ZIP Code"
label var AGEGROUP                 "Age Group"
label var AYEAR                    "Admission year"

*** Convert special values to missing values ***
recode AMONTH                    (-9 -8 -6 -5=.)
recode ATYPE                     (-9 -8 -6 -5=.)
recode AWEEKEND                  (-9 -8 -6 -5=.)
recode DIED                      (-9 -8 -6 -5=.)
recode DISPUB04                  (-9 -8 -6 -5=.)
recode DISPUNIFORM               (-9 -8 -6 -5=.)
recode DMONTH                    (-9 -8 -6 -5=.)
recode DQTR                      (-9 -8 -6 -5=.)
recode DRG                       (-99 -88 -66=.)
recode DRGVER                    (-9 -8 -6 -5=.)
recode DRG_NoPOA                 (-99 -88 -66=.)
recode DaysICU                   (-99 -88 -66=.)
recode FEMALE                    (-9 -8 -6 -5=.)
recode HCUP_ED                   (-9 -8 -6 -5=.)
recode HCUP_OS                   (-9 -8 -6 -5=.)
recode I10_BIRTH                 (-99 -88 -66=.)
recode I10_DELIVERY              (-99 -88 -66=.)
recode I10_NDX                   (-99 -88 -66=.)
recode I10_NPR                   (-99 -88 -66=.)
recode I10_ORPROC                (-9 -8 -6 -5=.)
recode I10_PROCTYPE              (-99 -88 -66=.)
recode I10_SERVICELINE           (-9 -8 -6 -5=.)
recode LOS                       (-9999 -8888 -6666=.)
recode LOS_X                     (-99999 -88888 -66666=.)
recode MDC                       (-9 -8 -6 -5=.)
recode MDC_NoPOA                 (-9 -8 -6 -5=.)
recode MEDINCSTQ                 (-9 -8 -6 -5=.)
recode OS_TIME                   (-9999999.99 -8888888.88 -6666666.66=.)
recode PAY1                      (-9 -8 -6 -5=.)
recode PL_NCHS                   (-9 -8 -6 -5=.)
recode PL_UR_CAT4                (-9 -8 -6 -5=.)
recode POA_Disch_Edit1           (-9 -8 -6 -5=.)
recode POA_Disch_Edit2           (-9 -8 -6 -5=.)
recode POA_Hosp_Edit1            (-9 -8 -6 -5=.)
recode POA_Hosp_Edit2            (-9 -8 -6 -5=.)
recode POA_Hosp_Edit3            (-9 -8 -6 -5=.)
recode POA_Hosp_Edit3_Value      (-9999.99 -8888.88 -6666.66=.)
recode PRDAY1                    (-9999 -8888 -6666=.)
recode PRDAY2                    (-9999 -8888 -6666=.)
recode PRDAY3                    (-9999 -8888 -6666=.)
recode PRDAY4                    (-9999 -8888 -6666=.)
recode PRDAY5                    (-9999 -8888 -6666=.)
recode PRDAY6                    (-9999 -8888 -6666=.)
recode PRDAY7                    (-9999 -8888 -6666=.)
recode PRDAY8                    (-9999 -8888 -6666=.)
recode PRDAY9                    (-9999 -8888 -6666=.)
recode PRDAY10                   (-9999 -8888 -6666=.)
recode PRDAY11                   (-9999 -8888 -6666=.)
recode PRDAY12                   (-9999 -8888 -6666=.)
recode PRDAY13                   (-9999 -8888 -6666=.)
recode PSTCO                     (-9999 -8888 -6666=.)
recode RACE                      (-9 -8 -6 -5=.)
recode RACE_EDIT                 (-9 -8 -6 -5=.)
recode TOTCHG                    (-999999999 -888888888 -666666666=.)
recode TOTCHG_X                  (-99999999999.99 -88888888888.88 -66666666666.66=.)
recode TRAN_IN                   (-9 -8 -6 -5=.)
recode TRAN_OUT                  (-9 -8 -6 -5=.)
recode YEAR                      (-999 -888 -666=.)
recode ZIPINC_QRTL               (-99 -88 -66=.)
recode AGEGROUP                  (-99 -88 -66=.)
recode AYEAR                     (-999 -888 -666=.)

save "SC_SID_2019_CORE.dta", replace
