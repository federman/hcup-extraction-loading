/*****************************************************************************
* Creation Date: 10/11/2022   
* MA_SID_2020_CORE.Do
* This program will load the 2020 MA ASCII CORE File into Stata.
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
      int    ADRG                         1-   3   ///
      byte   ADRGRISKMORTALITY            4-   5   ///
      byte   ADRGSEV                      6-   7   ///
      int    AGE                          8-  10   ///
      int    AGEMONTH                    11-  13   ///
      byte   AMDC                        14-  15   ///
      byte   AMONTH                      16-  17   ///
      byte   ASOURCE                     18-  19   ///
      str    ASOURCE_X                   20        ///
      str    ASOURCEUB92                 21        ///
      byte   ATYPE                       22-  23   ///
      byte   AWEEKEND                    24-  25   ///
      int    BWT                         26-  29   ///
      int    DaysBetweenVisits           30-  33   ///
      long   DaysToEvent                 34-  39   ///
      byte   DIED                        40-  41   ///
      str    DISP_X                      42-  43   ///
      byte   DISPUB04                    44-  45   ///
      byte   DISPUNIFORM                 46-  47   ///
      byte   DMONTH                      48-  49   ///
      byte   DNR                         50-  51   ///
      byte   DQTR                        52-  53   ///
      int    DRG                         54-  56   ///
      int    DRG_NoPOA                   57-  59   ///
      byte   DRGVER                      60-  61   ///
      str    DSHOSPID                    62-  78   ///
      str    DXPOA1                      79        ///
      str    DXPOA2                      80        ///
      str    DXPOA3                      81        ///
      str    DXPOA4                      82        ///
      str    DXPOA5                      83        ///
      str    DXPOA6                      84        ///
      str    DXPOA7                      85        ///
      str    DXPOA8                      86        ///
      str    DXPOA9                      87        ///
      str    DXPOA10                     88        ///
      str    DXPOA11                     89        ///
      str    DXPOA12                     90        ///
      str    DXPOA13                     91        ///
      str    DXPOA14                     92        ///
      str    DXPOA15                     93        ///
      str    DXPOA16                     94        ///
      str    DXPOA17                     95        ///
      str    DXPOA18                     96        ///
      str    DXPOA19                     97        ///
      str    DXPOA20                     98        ///
      str    DXPOA21                     99        ///
      str    DXPOA22                    100        ///
      str    DXPOA23                    101        ///
      str    DXPOA24                    102        ///
      str    DXPOA25                    103        ///
      str    DXPOA26                    104        ///
      str    DXPOA27                    105        ///
      str    DXPOA28                    106        ///
      str    DXPOA29                    107        ///
      str    DXPOA30                    108        ///
      str    DXPOA31                    109        ///
      str    DXPOA32                    110        ///
      str    DXPOA33                    111        ///
      str    DXPOA34                    112        ///
      str    DXPOA35                    113        ///
      str    DXPOA36                    114        ///
      str    DXPOA37                    115        ///
      str    DXPOA38                    116        ///
      str    DXPOA39                    117        ///
      str    DXPOA40                    118        ///
      str    DXPOA41                    119        ///
      str    DXPOA42                    120        ///
      str    DXPOA43                    121        ///
      str    DXPOA44                    122        ///
      str    DXPOA45                    123        ///
      str    DXPOA46                    124        ///
      str    DXPOA47                    125        ///
      str    DXPOA48                    126        ///
      str    DXPOA49                    127        ///
      str    DXPOA50                    128        ///
      str    DXPOA51                    129        ///
      str    DXPOA52                    130        ///
      str    DXPOA53                    131        ///
      str    DXPOA54                    132        ///
      str    DXPOA55                    133        ///
      str    DXPOA56                    134        ///
      str    DXPOA57                    135        ///
      str    DXPOA58                    136        ///
      str    DXPOA59                    137        ///
      str    DXPOA60                    138        ///
      str    DXPOA61                    139        ///
      str    DXPOA62                    140        ///
      str    DXPOA63                    141        ///
      str    DXPOA64                    142        ///
      str    DXPOA65                    143        ///
      str    DXPOA66                    144        ///
      str    DXPOA67                    145        ///
      str    DXPOA68                    146        ///
      str    DXPOA69                    147        ///
      str    DXPOA70                    148        ///
      str    DXPOA71                    149        ///
      str    DXPOA72                    150        ///
      str    DXPOA73                    151        ///
      str    DXPOA74                    152        ///
      str    DXPOA75                    153        ///
      str    DXPOA76                    154        ///
      str    DXPOA77                    155        ///
      str    DXPOA78                    156        ///
      str    DXPOA79                    157        ///
      str    DXPOA80                    158        ///
      str    DXPOA81                    159        ///
      str    DXPOA82                    160        ///
      str    DXPOA83                    161        ///
      str    DXPOA84                    162        ///
      str    DXPOA85                    163        ///
      str    DXPOA86                    164        ///
      str    DXPOA87                    165        ///
      str    DXPOA88                    166        ///
      str    DXPOA89                    167        ///
      str    DXPOA90                    168        ///
      str    DXPOA91                    169        ///
      str    DXPOA92                    170        ///
      str    DXPOA93                    171        ///
      str    DXPOA94                    172        ///
      str    DXPOA95                    173        ///
      str    DXPOA96                    174        ///
      byte   FEMALE                     175- 176   ///
      byte   HCUP_ED                    177- 178   ///
      byte   HCUP_OS                    179- 180   ///
      byte   HISPANIC                   181- 182   ///
      str    HISPANIC_X                 183- 197   ///
      byte   Homeless                   198- 199   ///
      str    HOSPST                     200- 201   ///
      int    I10_BIRTH                  202- 204   ///
      int    I10_DELIVERY               205- 207   ///
      str    I10_DX_Admitting           208- 214   ///
      str    I10_DX1                    215- 221   ///
      str    I10_DX2                    222- 228   ///
      str    I10_DX3                    229- 235   ///
      str    I10_DX4                    236- 242   ///
      str    I10_DX5                    243- 249   ///
      str    I10_DX6                    250- 256   ///
      str    I10_DX7                    257- 263   ///
      str    I10_DX8                    264- 270   ///
      str    I10_DX9                    271- 277   ///
      str    I10_DX10                   278- 284   ///
      str    I10_DX11                   285- 291   ///
      str    I10_DX12                   292- 298   ///
      str    I10_DX13                   299- 305   ///
      str    I10_DX14                   306- 312   ///
      str    I10_DX15                   313- 319   ///
      str    I10_DX16                   320- 326   ///
      str    I10_DX17                   327- 333   ///
      str    I10_DX18                   334- 340   ///
      str    I10_DX19                   341- 347   ///
      str    I10_DX20                   348- 354   ///
      str    I10_DX21                   355- 361   ///
      str    I10_DX22                   362- 368   ///
      str    I10_DX23                   369- 375   ///
      str    I10_DX24                   376- 382   ///
      str    I10_DX25                   383- 389   ///
      str    I10_DX26                   390- 396   ///
      str    I10_DX27                   397- 403   ///
      str    I10_DX28                   404- 410   ///
      str    I10_DX29                   411- 417   ///
      str    I10_DX30                   418- 424   ///
      str    I10_DX31                   425- 431   ///
      str    I10_DX32                   432- 438   ///
      str    I10_DX33                   439- 445   ///
      str    I10_DX34                   446- 452   ///
      str    I10_DX35                   453- 459   ///
      str    I10_DX36                   460- 466   ///
      str    I10_DX37                   467- 473   ///
      str    I10_DX38                   474- 480   ///
      str    I10_DX39                   481- 487   ///
      str    I10_DX40                   488- 494   ///
      str    I10_DX41                   495- 501   ///
      str    I10_DX42                   502- 508   ///
      str    I10_DX43                   509- 515   ///
      str    I10_DX44                   516- 522   ///
      str    I10_DX45                   523- 529   ///
      str    I10_DX46                   530- 536   ///
      str    I10_DX47                   537- 543   ///
      str    I10_DX48                   544- 550   ///
      str    I10_DX49                   551- 557   ///
      str    I10_DX50                   558- 564   ///
      str    I10_DX51                   565- 571   ///
      str    I10_DX52                   572- 578   ///
      str    I10_DX53                   579- 585   ///
      str    I10_DX54                   586- 592   ///
      str    I10_DX55                   593- 599   ///
      str    I10_DX56                   600- 606   ///
      str    I10_DX57                   607- 613   ///
      str    I10_DX58                   614- 620   ///
      str    I10_DX59                   621- 627   ///
      str    I10_DX60                   628- 634   ///
      str    I10_DX61                   635- 641   ///
      str    I10_DX62                   642- 648   ///
      str    I10_DX63                   649- 655   ///
      str    I10_DX64                   656- 662   ///
      str    I10_DX65                   663- 669   ///
      str    I10_DX66                   670- 676   ///
      str    I10_DX67                   677- 683   ///
      str    I10_DX68                   684- 690   ///
      str    I10_DX69                   691- 697   ///
      str    I10_DX70                   698- 704   ///
      str    I10_DX71                   705- 711   ///
      str    I10_DX72                   712- 718   ///
      str    I10_DX73                   719- 725   ///
      str    I10_DX74                   726- 732   ///
      str    I10_DX75                   733- 739   ///
      str    I10_DX76                   740- 746   ///
      str    I10_DX77                   747- 753   ///
      str    I10_DX78                   754- 760   ///
      str    I10_DX79                   761- 767   ///
      str    I10_DX80                   768- 774   ///
      str    I10_DX81                   775- 781   ///
      str    I10_DX82                   782- 788   ///
      str    I10_DX83                   789- 795   ///
      str    I10_DX84                   796- 802   ///
      str    I10_DX85                   803- 809   ///
      str    I10_DX86                   810- 816   ///
      str    I10_DX87                   817- 823   ///
      str    I10_DX88                   824- 830   ///
      str    I10_DX89                   831- 837   ///
      str    I10_DX90                   838- 844   ///
      str    I10_DX91                   845- 851   ///
      str    I10_DX92                   852- 858   ///
      str    I10_DX93                   859- 865   ///
      str    I10_DX94                   866- 872   ///
      str    I10_DX95                   873- 879   ///
      str    I10_DX96                   880- 886   ///
      int    I10_NDX                    887- 889   ///
      int    I10_NPR                    890- 892   ///
      str    I10_PR1                    893- 899   ///
      str    I10_PR2                    900- 906   ///
      str    I10_PR3                    907- 913   ///
      str    I10_PR4                    914- 920   ///
      str    I10_PR5                    921- 927   ///
      str    I10_PR6                    928- 934   ///
      str    I10_PR7                    935- 941   ///
      str    I10_PR8                    942- 948   ///
      str    I10_PR9                    949- 955   ///
      str    I10_PR10                   956- 962   ///
      str    I10_PR11                   963- 969   ///
      str    I10_PR12                   970- 976   ///
      str    I10_PR13                   977- 983   ///
      str    I10_PR14                   984- 990   ///
      str    I10_PR15                   991- 997   ///
      str    I10_PR16                   998-1004   ///
      str    I10_PR17                  1005-1011   ///
      str    I10_PR18                  1012-1018   ///
      str    I10_PR19                  1019-1025   ///
      str    I10_PR20                  1026-1032   ///
      str    I10_PR21                  1033-1039   ///
      str    I10_PR22                  1040-1046   ///
      str    I10_PR23                  1047-1053   ///
      str    I10_PR24                  1054-1060   ///
      str    I10_PR25                  1061-1067   ///
      str    I10_PR26                  1068-1074   ///
      str    I10_PR27                  1075-1081   ///
      str    I10_PR28                  1082-1088   ///
      str    I10_PR29                  1089-1095   ///
      str    I10_PR30                  1096-1102   ///
      str    I10_PR31                  1103-1109   ///
      str    I10_PR32                  1110-1116   ///
      str    I10_PR33                  1117-1123   ///
      str    I10_PR34                  1124-1130   ///
      str    I10_PR35                  1131-1137   ///
      str    I10_PR36                  1138-1144   ///
      str    I10_PR37                  1145-1151   ///
      str    I10_PR38                  1152-1158   ///
      str    I10_PR39                  1159-1165   ///
      str    I10_PR40                  1166-1172   ///
      str    I10_PR41                  1173-1179   ///
      str    I10_PR42                  1180-1186   ///
      str    I10_PR43                  1187-1193   ///
      str    I10_PR44                  1194-1200   ///
      str    I10_PR45                  1201-1207   ///
      str    I10_PR46                  1208-1214   ///
      str    I10_PR47                  1215-1221   ///
      str    I10_PR48                  1222-1228   ///
      str    I10_PR49                  1229-1235   ///
      str    I10_PR50                  1236-1242   ///
      str    I10_PR51                  1243-1249   ///
      str    I10_PR52                  1250-1256   ///
      str    I10_PR53                  1257-1263   ///
      str    I10_PR54                  1264-1270   ///
      str    I10_PR55                  1271-1277   ///
      str    I10_PR56                  1278-1284   ///
      str    I10_PR57                  1285-1291   ///
      str    I10_PR58                  1292-1298   ///
      str    I10_PR59                  1299-1305   ///
      str    I10_PR60                  1306-1312   ///
      str    I10_PR61                  1313-1319   ///
      str    I10_PR62                  1320-1326   ///
      str    I10_PR63                  1327-1333   ///
      str    I10_PR64                  1334-1340   ///
      str    I10_PR65                  1341-1347   ///
      str    I10_PR66                  1348-1354   ///
      str    I10_PR67                  1355-1361   ///
      str    I10_PR68                  1362-1368   ///
      str    I10_PR69                  1369-1375   ///
      str    I10_PR70                  1376-1382   ///
      str    I10_PR71                  1383-1389   ///
      str    I10_PR72                  1390-1396   ///
      str    I10_PR73                  1397-1403   ///
      str    I10_PR74                  1404-1410   ///
      str    I10_PR75                  1411-1417   ///
      str    I10_PR76                  1418-1424   ///
      str    I10_PR77                  1425-1431   ///
      str    I10_PR78                  1432-1438   ///
      str    I10_PR79                  1439-1445   ///
      str    I10_PR80                  1446-1452   ///
      str    I10_PR81                  1453-1459   ///
      str    I10_PR82                  1460-1466   ///
      str    I10_PR83                  1467-1473   ///
      str    I10_PR84                  1474-1480   ///
      str    I10_PR85                  1481-1487   ///
      str    I10_PR86                  1488-1494   ///
      str    I10_PR87                  1495-1501   ///
      str    I10_PR88                  1502-1508   ///
      str    I10_PR89                  1509-1515   ///
      str    I10_PR90                  1516-1522   ///
      str    I10_PR91                  1523-1529   ///
      str    I10_PR92                  1530-1536   ///
      str    I10_PR93                  1537-1543   ///
      str    I10_PR94                  1544-1550   ///
      str    I10_PR95                  1551-1557   ///
      str    I10_PR96                  1558-1564   ///
      str    I10_PR97                  1565-1571   ///
      str    I10_PR98                  1572-1578   ///
      str    I10_PR99                  1579-1585   ///
      str    I10_PR100                 1586-1592   ///
      str    I10_PR101                 1593-1599   ///
      str    I10_PR102                 1600-1606   ///
      str    I10_PR103                 1607-1613   ///
      str    I10_PR104                 1614-1620   ///
      str    I10_PR105                 1621-1627   ///
      str    I10_PR106                 1628-1634   ///
      str    I10_PR107                 1635-1641   ///
      str    I10_PR108                 1642-1648   ///
      str    I10_PR109                 1649-1655   ///
      str    I10_PR110                 1656-1662   ///
      str    I10_PR111                 1663-1669   ///
      str    I10_PR112                 1670-1676   ///
      str    I10_PR113                 1677-1683   ///
      str    I10_PR114                 1684-1690   ///
      str    I10_PR115                 1691-1697   ///
      str    I10_PR116                 1698-1704   ///
      str    I10_PR117                 1705-1711   ///
      str    I10_PR118                 1712-1718   ///
      str    I10_PR119                 1719-1725   ///
      str    I10_PR120                 1726-1732   ///
      str    I10_PR121                 1733-1739   ///
      str    I10_PR122                 1740-1746   ///
      str    I10_PR123                 1747-1753   ///
      str    I10_PR124                 1754-1760   ///
      str    I10_PR125                 1761-1767   ///
      str    I10_PR126                 1768-1774   ///
      str    I10_PR127                 1775-1781   ///
      str    I10_PR128                 1782-1788   ///
      str    I10_PR129                 1789-1795   ///
      str    I10_PR130                 1796-1802   ///
      str    I10_PR131                 1803-1809   ///
      str    I10_PR132                 1810-1816   ///
      str    I10_PR133                 1817-1823   ///
      str    I10_PR134                 1824-1830   ///
      str    I10_PR135                 1831-1837   ///
      str    I10_PR136                 1838-1844   ///
      str    I10_PR137                 1845-1851   ///
      str    I10_PR138                 1852-1858   ///
      str    I10_PR139                 1859-1865   ///
      str    I10_PR140                 1866-1872   ///
      str    I10_PR141                 1873-1879   ///
      str    I10_PR142                 1880-1886   ///
      str    I10_PR143                 1887-1893   ///
      str    I10_PR144                 1894-1900   ///
      str    I10_PR145                 1901-1907   ///
      str    I10_PR146                 1908-1914   ///
      str    I10_PR147                 1915-1921   ///
      str    I10_PR148                 1922-1928   ///
      str    I10_PR149                 1929-1935   ///
      str    I10_PR150                 1936-1942   ///
      str    I10_PR151                 1943-1949   ///
      str    I10_PR152                 1950-1956   ///
      str    I10_PR153                 1957-1963   ///
      str    I10_PR154                 1964-1970   ///
      str    I10_PR155                 1971-1977   ///
      str    I10_PR156                 1978-1984   ///
      str    I10_PR157                 1985-1991   ///
      str    I10_PR158                 1992-1998   ///
      str    I10_PR159                 1999-2005   ///
      str    I10_PR160                 2006-2012   ///
      str    I10_PR161                 2013-2019   ///
      str    I10_PR162                 2020-2026   ///
      str    I10_PR163                 2027-2033   ///
      str    I10_PR164                 2034-2040   ///
      str    I10_PR165                 2041-2047   ///
      str    I10_PR166                 2048-2054   ///
      str    I10_PR167                 2055-2061   ///
      str    I10_PR168                 2062-2068   ///
      int    I10_PROCTYPE              2069-2071   ///
      byte   I10_SERVICELINE           2072-2073   ///
      double KEY                       2074-2088   ///
      long   LOS                       2089-2093   ///
      long   LOS_X                     2094-2099   ///
      byte   MDC                       2100-2101   ///
      byte   MDC_NoPOA                 2102-2103   ///
      byte   MEDINCSTQ                 2104-2105   ///
      double OS_TIME                   2106-2116   ///
      byte   PAY1                      2117-2118   ///
      str    PAY1_X                    2119        ///
      byte   PAY2                      2120-2121   ///
      str    PAY2_X                    2122        ///
      str    PAYER1_X                  2123-2125   ///
      str    PAYER2_X                  2126-2128   ///
      byte   PCLASS_ORPROC             2129-2130   ///
      int    PL_CBSA                   2131-2133   ///
      byte   PL_UR_CAT4                2134-2135   ///
      byte   POA_Disch_Edit1           2136-2137   ///
      byte   POA_Disch_Edit2           2138-2139   ///
      byte   POA_Hosp_Edit1            2140-2141   ///
      byte   POA_Hosp_Edit2            2142-2143   ///
      byte   POA_Hosp_Edit3            2144-2145   ///
      double POA_Hosp_Edit3_Value      2146-2153   ///
      long   PRDAY1                    2154-2158   ///
      long   PRDAY2                    2159-2163   ///
      long   PRDAY3                    2164-2168   ///
      long   PRDAY4                    2169-2173   ///
      long   PRDAY5                    2174-2178   ///
      long   PRDAY6                    2179-2183   ///
      long   PRDAY7                    2184-2188   ///
      long   PRDAY8                    2189-2193   ///
      long   PRDAY9                    2194-2198   ///
      long   PRDAY10                   2199-2203   ///
      long   PRDAY11                   2204-2208   ///
      long   PRDAY12                   2209-2213   ///
      long   PRDAY13                   2214-2218   ///
      long   PRDAY14                   2219-2223   ///
      long   PRDAY15                   2224-2228   ///
      long   PRDAY16                   2229-2233   ///
      long   PRDAY17                   2234-2238   ///
      long   PRDAY18                   2239-2243   ///
      long   PRDAY19                   2244-2248   ///
      long   PRDAY20                   2249-2253   ///
      long   PRDAY21                   2254-2258   ///
      long   PRDAY22                   2259-2263   ///
      long   PRDAY23                   2264-2268   ///
      long   PRDAY24                   2269-2273   ///
      long   PRDAY25                   2274-2278   ///
      long   PRDAY26                   2279-2283   ///
      long   PRDAY27                   2284-2288   ///
      long   PRDAY28                   2289-2293   ///
      long   PRDAY29                   2294-2298   ///
      long   PRDAY30                   2299-2303   ///
      long   PRDAY31                   2304-2308   ///
      long   PRDAY32                   2309-2313   ///
      long   PRDAY33                   2314-2318   ///
      long   PRDAY34                   2319-2323   ///
      long   PRDAY35                   2324-2328   ///
      long   PRDAY36                   2329-2333   ///
      long   PRDAY37                   2334-2338   ///
      long   PRDAY38                   2339-2343   ///
      long   PRDAY39                   2344-2348   ///
      long   PRDAY40                   2349-2353   ///
      long   PRDAY41                   2354-2358   ///
      long   PRDAY42                   2359-2363   ///
      long   PRDAY43                   2364-2368   ///
      long   PRDAY44                   2369-2373   ///
      long   PRDAY45                   2374-2378   ///
      long   PRDAY46                   2379-2383   ///
      long   PRDAY47                   2384-2388   ///
      long   PRDAY48                   2389-2393   ///
      long   PRDAY49                   2394-2398   ///
      long   PRDAY50                   2399-2403   ///
      long   PRDAY51                   2404-2408   ///
      long   PRDAY52                   2409-2413   ///
      long   PRDAY53                   2414-2418   ///
      long   PRDAY54                   2419-2423   ///
      long   PRDAY55                   2424-2428   ///
      long   PRDAY56                   2429-2433   ///
      long   PRDAY57                   2434-2438   ///
      long   PRDAY58                   2439-2443   ///
      long   PRDAY59                   2444-2448   ///
      long   PRDAY60                   2449-2453   ///
      long   PRDAY61                   2454-2458   ///
      long   PRDAY62                   2459-2463   ///
      long   PRDAY63                   2464-2468   ///
      long   PRDAY64                   2469-2473   ///
      long   PRDAY65                   2474-2478   ///
      long   PRDAY66                   2479-2483   ///
      long   PRDAY67                   2484-2488   ///
      long   PRDAY68                   2489-2493   ///
      long   PRDAY69                   2494-2498   ///
      long   PRDAY70                   2499-2503   ///
      long   PRDAY71                   2504-2508   ///
      long   PRDAY72                   2509-2513   ///
      long   PRDAY73                   2514-2518   ///
      long   PRDAY74                   2519-2523   ///
      long   PRDAY75                   2524-2528   ///
      long   PRDAY76                   2529-2533   ///
      long   PRDAY77                   2534-2538   ///
      long   PRDAY78                   2539-2543   ///
      long   PRDAY79                   2544-2548   ///
      long   PRDAY80                   2549-2553   ///
      long   PRDAY81                   2554-2558   ///
      long   PRDAY82                   2559-2563   ///
      long   PRDAY83                   2564-2568   ///
      long   PRDAY84                   2569-2573   ///
      long   PRDAY85                   2574-2578   ///
      long   PRDAY86                   2579-2583   ///
      long   PRDAY87                   2584-2588   ///
      long   PRDAY88                   2589-2593   ///
      long   PRDAY89                   2594-2598   ///
      long   PRDAY90                   2599-2603   ///
      long   PRDAY91                   2604-2608   ///
      long   PRDAY92                   2609-2613   ///
      long   PRDAY93                   2614-2618   ///
      long   PRDAY94                   2619-2623   ///
      long   PRDAY95                   2624-2628   ///
      long   PRDAY96                   2629-2633   ///
      long   PRDAY97                   2634-2638   ///
      long   PRDAY98                   2639-2643   ///
      long   PRDAY99                   2644-2648   ///
      long   PRDAY100                  2649-2653   ///
      long   PRDAY101                  2654-2658   ///
      long   PRDAY102                  2659-2663   ///
      long   PRDAY103                  2664-2668   ///
      long   PRDAY104                  2669-2673   ///
      long   PRDAY105                  2674-2678   ///
      long   PRDAY106                  2679-2683   ///
      long   PRDAY107                  2684-2688   ///
      long   PRDAY108                  2689-2693   ///
      long   PRDAY109                  2694-2698   ///
      long   PRDAY110                  2699-2703   ///
      long   PRDAY111                  2704-2708   ///
      long   PRDAY112                  2709-2713   ///
      long   PRDAY113                  2714-2718   ///
      long   PRDAY114                  2719-2723   ///
      long   PRDAY115                  2724-2728   ///
      long   PRDAY116                  2729-2733   ///
      long   PRDAY117                  2734-2738   ///
      long   PRDAY118                  2739-2743   ///
      long   PRDAY119                  2744-2748   ///
      long   PRDAY120                  2749-2753   ///
      long   PRDAY121                  2754-2758   ///
      long   PRDAY122                  2759-2763   ///
      long   PRDAY123                  2764-2768   ///
      long   PRDAY124                  2769-2773   ///
      long   PRDAY125                  2774-2778   ///
      long   PRDAY126                  2779-2783   ///
      long   PRDAY127                  2784-2788   ///
      long   PRDAY128                  2789-2793   ///
      long   PRDAY129                  2794-2798   ///
      long   PRDAY130                  2799-2803   ///
      long   PRDAY131                  2804-2808   ///
      long   PRDAY132                  2809-2813   ///
      long   PRDAY133                  2814-2818   ///
      long   PRDAY134                  2819-2823   ///
      long   PRDAY135                  2824-2828   ///
      long   PRDAY136                  2829-2833   ///
      long   PRDAY137                  2834-2838   ///
      long   PRDAY138                  2839-2843   ///
      long   PRDAY139                  2844-2848   ///
      long   PRDAY140                  2849-2853   ///
      long   PRDAY141                  2854-2858   ///
      long   PRDAY142                  2859-2863   ///
      long   PRDAY143                  2864-2868   ///
      long   PRDAY144                  2869-2873   ///
      long   PRDAY145                  2874-2878   ///
      long   PRDAY146                  2879-2883   ///
      long   PRDAY147                  2884-2888   ///
      long   PRDAY148                  2889-2893   ///
      long   PRDAY149                  2894-2898   ///
      long   PRDAY150                  2899-2903   ///
      long   PRDAY151                  2904-2908   ///
      long   PRDAY152                  2909-2913   ///
      long   PRDAY153                  2914-2918   ///
      long   PRDAY154                  2919-2923   ///
      long   PRDAY155                  2924-2928   ///
      long   PRDAY156                  2929-2933   ///
      long   PRDAY157                  2934-2938   ///
      long   PRDAY158                  2939-2943   ///
      long   PRDAY159                  2944-2948   ///
      long   PRDAY160                  2949-2953   ///
      long   PRDAY161                  2954-2958   ///
      long   PRDAY162                  2959-2963   ///
      long   PRDAY163                  2964-2968   ///
      long   PRDAY164                  2969-2973   ///
      long   PRDAY165                  2974-2978   ///
      long   PRDAY166                  2979-2983   ///
      long   PRDAY167                  2984-2988   ///
      long   PRDAY168                  2989-2993   ///
      str    PSTATE                    2994-2995   ///
      str    PSTATE_GEO                2996-2997   ///
      long   PSTCO_GEO                 2998-3002   ///
      byte   RACE                      3003-3004   ///
      float  RACE_PCT_MISS_HOSP        3005-3011   ///
      str    RACE_X                    3012-3024   ///
      double TOTCHG                    3025-3034   ///
      double TOTCHG_X                  3035-3049   ///
      byte   TRAN_IN                   3050-3051   ///
      byte   TRAN_OUT                  3052-3053   ///
      long   VisitLink                 3054-3062   ///
      int    YEAR                      3063-3066   ///
      str    ZIP3                      3067-3069   ///
      int    ZIPINC_QRTL               3070-3072   ///
      int    AYEAR                     3073-3076   ///
      byte   PRMONTH1                  3077-3078   ///
      byte   PRMONTH2                  3079-3080   ///
      byte   PRMONTH3                  3081-3082   ///
      byte   PRMONTH4                  3083-3084   ///
      byte   PRMONTH5                  3085-3086   ///
      byte   PRMONTH6                  3087-3088   ///
      byte   PRMONTH7                  3089-3090   ///
      byte   PRMONTH8                  3091-3092   ///
      byte   PRMONTH9                  3093-3094   ///
      byte   PRMONTH10                 3095-3096   ///
      byte   PRMONTH11                 3097-3098   ///
      byte   PRMONTH12                 3099-3100   ///
      byte   PRMONTH13                 3101-3102   ///
      byte   PRMONTH14                 3103-3104   ///
      byte   PRMONTH15                 3105-3106   ///
      byte   PRMONTH16                 3107-3108   ///
      byte   PRMONTH17                 3109-3110   ///
      byte   PRMONTH18                 3111-3112   ///
      byte   PRMONTH19                 3113-3114   ///
      byte   PRMONTH20                 3115-3116   ///
      byte   PRMONTH21                 3117-3118   ///
      byte   PRMONTH22                 3119-3120   ///
      byte   PRMONTH23                 3121-3122   ///
      byte   PRMONTH24                 3123-3124   ///
      byte   PRMONTH25                 3125-3126   ///
      byte   PRMONTH26                 3127-3128   ///
      byte   PRMONTH27                 3129-3130   ///
      byte   PRMONTH28                 3131-3132   ///
      byte   PRMONTH29                 3133-3134   ///
      byte   PRMONTH30                 3135-3136   ///
      byte   PRMONTH31                 3137-3138   ///
      byte   PRMONTH32                 3139-3140   ///
      byte   PRMONTH33                 3141-3142   ///
      byte   PRMONTH34                 3143-3144   ///
      byte   PRMONTH35                 3145-3146   ///
      byte   PRMONTH36                 3147-3148   ///
      byte   PRMONTH37                 3149-3150   ///
      byte   PRMONTH38                 3151-3152   ///
      byte   PRMONTH39                 3153-3154   ///
      byte   PRMONTH40                 3155-3156   ///
      byte   PRMONTH41                 3157-3158   ///
      byte   PRMONTH42                 3159-3160   ///
      byte   PRMONTH43                 3161-3162   ///
      byte   PRMONTH44                 3163-3164   ///
      byte   PRMONTH45                 3165-3166   ///
      byte   PRMONTH46                 3167-3168   ///
      byte   PRMONTH47                 3169-3170   ///
      byte   PRMONTH48                 3171-3172   ///
      byte   PRMONTH49                 3173-3174   ///
      byte   PRMONTH50                 3175-3176   ///
      byte   PRMONTH51                 3177-3178   ///
      byte   PRMONTH52                 3179-3180   ///
      byte   PRMONTH53                 3181-3182   ///
      byte   PRMONTH54                 3183-3184   ///
      byte   PRMONTH55                 3185-3186   ///
      byte   PRMONTH56                 3187-3188   ///
      byte   PRMONTH57                 3189-3190   ///
      byte   PRMONTH58                 3191-3192   ///
      byte   PRMONTH59                 3193-3194   ///
      byte   PRMONTH60                 3195-3196   ///
      byte   PRMONTH61                 3197-3198   ///
      byte   PRMONTH62                 3199-3200   ///
      byte   PRMONTH63                 3201-3202   ///
      byte   PRMONTH64                 3203-3204   ///
      byte   PRMONTH65                 3205-3206   ///
      byte   PRMONTH66                 3207-3208   ///
      byte   PRMONTH67                 3209-3210   ///
      byte   PRMONTH68                 3211-3212   ///
      byte   PRMONTH69                 3213-3214   ///
      byte   PRMONTH70                 3215-3216   ///
      byte   PRMONTH71                 3217-3218   ///
      byte   PRMONTH72                 3219-3220   ///
      byte   PRMONTH73                 3221-3222   ///
      byte   PRMONTH74                 3223-3224   ///
      byte   PRMONTH75                 3225-3226   ///
      byte   PRMONTH76                 3227-3228   ///
      byte   PRMONTH77                 3229-3230   ///
      byte   PRMONTH78                 3231-3232   ///
      byte   PRMONTH79                 3233-3234   ///
      byte   PRMONTH80                 3235-3236   ///
      byte   PRMONTH81                 3237-3238   ///
      byte   PRMONTH82                 3239-3240   ///
      byte   PRMONTH83                 3241-3242   ///
      byte   PRMONTH84                 3243-3244   ///
      byte   PRMONTH85                 3245-3246   ///
      byte   PRMONTH86                 3247-3248   ///
      byte   PRMONTH87                 3249-3250   ///
      byte   PRMONTH88                 3251-3252   ///
      byte   PRMONTH89                 3253-3254   ///
      byte   PRMONTH90                 3255-3256   ///
      byte   PRMONTH91                 3257-3258   ///
      byte   PRMONTH92                 3259-3260   ///
      byte   PRMONTH93                 3261-3262   ///
      byte   PRMONTH94                 3263-3264   ///
      byte   PRMONTH95                 3265-3266   ///
      byte   PRMONTH96                 3267-3268   ///
      byte   PRMONTH97                 3269-3270   ///
      byte   PRMONTH98                 3271-3272   ///
      byte   PRMONTH99                 3273-3274   ///
      byte   PRMONTH100                3275-3276   ///
      byte   PRMONTH101                3277-3278   ///
      byte   PRMONTH102                3279-3280   ///
      byte   PRMONTH103                3281-3282   ///
      byte   PRMONTH104                3283-3284   ///
      byte   PRMONTH105                3285-3286   ///
      byte   PRMONTH106                3287-3288   ///
      byte   PRMONTH107                3289-3290   ///
      byte   PRMONTH108                3291-3292   ///
      byte   PRMONTH109                3293-3294   ///
      byte   PRMONTH110                3295-3296   ///
      byte   PRMONTH111                3297-3298   ///
      byte   PRMONTH112                3299-3300   ///
      byte   PRMONTH113                3301-3302   ///
      byte   PRMONTH114                3303-3304   ///
      byte   PRMONTH115                3305-3306   ///
      byte   PRMONTH116                3307-3308   ///
      byte   PRMONTH117                3309-3310   ///
      byte   PRMONTH118                3311-3312   ///
      byte   PRMONTH119                3313-3314   ///
      byte   PRMONTH120                3315-3316   ///
      byte   PRMONTH121                3317-3318   ///
      byte   PRMONTH122                3319-3320   ///
      byte   PRMONTH123                3321-3322   ///
      byte   PRMONTH124                3323-3324   ///
      byte   PRMONTH125                3325-3326   ///
      byte   PRMONTH126                3327-3328   ///
      byte   PRMONTH127                3329-3330   ///
      byte   PRMONTH128                3331-3332   ///
      byte   PRMONTH129                3333-3334   ///
      byte   PRMONTH130                3335-3336   ///
      byte   PRMONTH131                3337-3338   ///
      byte   PRMONTH132                3339-3340   ///
      byte   PRMONTH133                3341-3342   ///
      byte   PRMONTH134                3343-3344   ///
      byte   PRMONTH135                3345-3346   ///
      byte   PRMONTH136                3347-3348   ///
      byte   PRMONTH137                3349-3350   ///
      byte   PRMONTH138                3351-3352   ///
      byte   PRMONTH139                3353-3354   ///
      byte   PRMONTH140                3355-3356   ///
      byte   PRMONTH141                3357-3358   ///
      byte   PRMONTH142                3359-3360   ///
      byte   PRMONTH143                3361-3362   ///
      byte   PRMONTH144                3363-3364   ///
      byte   PRMONTH145                3365-3366   ///
      byte   PRMONTH146                3367-3368   ///
      byte   PRMONTH147                3369-3370   ///
      byte   PRMONTH148                3371-3372   ///
      byte   PRMONTH149                3373-3374   ///
      byte   PRMONTH150                3375-3376   ///
      byte   PRMONTH151                3377-3378   ///
      byte   PRMONTH152                3379-3380   ///
      byte   PRMONTH153                3381-3382   ///
      byte   PRMONTH154                3383-3384   ///
      byte   PRMONTH155                3385-3386   ///
      byte   PRMONTH156                3387-3388   ///
      byte   PRMONTH157                3389-3390   ///
      byte   PRMONTH158                3391-3392   ///
      byte   PRMONTH159                3393-3394   ///
      byte   PRMONTH160                3395-3396   ///
      byte   PRMONTH161                3397-3398   ///
      byte   PRMONTH162                3399-3400   ///
      byte   PRMONTH163                3401-3402   ///
      byte   PRMONTH164                3403-3404   ///
      byte   PRMONTH165                3405-3406   ///
      byte   PRMONTH166                3407-3408   ///
      byte   PRMONTH167                3409-3410   ///
      byte   PRMONTH168                3411-3412   ///
      int    PRYEAR1                   3413-3416   ///
      int    PRYEAR2                   3417-3420   ///
      int    PRYEAR3                   3421-3424   ///
      int    PRYEAR4                   3425-3428   ///
      int    PRYEAR5                   3429-3432   ///
      int    PRYEAR6                   3433-3436   ///
      int    PRYEAR7                   3437-3440   ///
      int    PRYEAR8                   3441-3444   ///
      int    PRYEAR9                   3445-3448   ///
      int    PRYEAR10                  3449-3452   ///
      int    PRYEAR11                  3453-3456   ///
      int    PRYEAR12                  3457-3460   ///
      int    PRYEAR13                  3461-3464   ///
      int    PRYEAR14                  3465-3468   ///
      int    PRYEAR15                  3469-3472   ///
      int    PRYEAR16                  3473-3476   ///
      int    PRYEAR17                  3477-3480   ///
      int    PRYEAR18                  3481-3484   ///
      int    PRYEAR19                  3485-3488   ///
      int    PRYEAR20                  3489-3492   ///
      int    PRYEAR21                  3493-3496   ///
      int    PRYEAR22                  3497-3500   ///
      int    PRYEAR23                  3501-3504   ///
      int    PRYEAR24                  3505-3508   ///
      int    PRYEAR25                  3509-3512   ///
      int    PRYEAR26                  3513-3516   ///
      int    PRYEAR27                  3517-3520   ///
      int    PRYEAR28                  3521-3524   ///
      int    PRYEAR29                  3525-3528   ///
      int    PRYEAR30                  3529-3532   ///
      int    PRYEAR31                  3533-3536   ///
      int    PRYEAR32                  3537-3540   ///
      int    PRYEAR33                  3541-3544   ///
      int    PRYEAR34                  3545-3548   ///
      int    PRYEAR35                  3549-3552   ///
      int    PRYEAR36                  3553-3556   ///
      int    PRYEAR37                  3557-3560   ///
      int    PRYEAR38                  3561-3564   ///
      int    PRYEAR39                  3565-3568   ///
      int    PRYEAR40                  3569-3572   ///
      int    PRYEAR41                  3573-3576   ///
      int    PRYEAR42                  3577-3580   ///
      int    PRYEAR43                  3581-3584   ///
      int    PRYEAR44                  3585-3588   ///
      int    PRYEAR45                  3589-3592   ///
      int    PRYEAR46                  3593-3596   ///
      int    PRYEAR47                  3597-3600   ///
      int    PRYEAR48                  3601-3604   ///
      int    PRYEAR49                  3605-3608   ///
      int    PRYEAR50                  3609-3612   ///
      int    PRYEAR51                  3613-3616   ///
      int    PRYEAR52                  3617-3620   ///
      int    PRYEAR53                  3621-3624   ///
      int    PRYEAR54                  3625-3628   ///
      int    PRYEAR55                  3629-3632   ///
      int    PRYEAR56                  3633-3636   ///
      int    PRYEAR57                  3637-3640   ///
      int    PRYEAR58                  3641-3644   ///
      int    PRYEAR59                  3645-3648   ///
      int    PRYEAR60                  3649-3652   ///
      int    PRYEAR61                  3653-3656   ///
      int    PRYEAR62                  3657-3660   ///
      int    PRYEAR63                  3661-3664   ///
      int    PRYEAR64                  3665-3668   ///
      int    PRYEAR65                  3669-3672   ///
      int    PRYEAR66                  3673-3676   ///
      int    PRYEAR67                  3677-3680   ///
      int    PRYEAR68                  3681-3684   ///
      int    PRYEAR69                  3685-3688   ///
      int    PRYEAR70                  3689-3692   ///
      int    PRYEAR71                  3693-3696   ///
      int    PRYEAR72                  3697-3700   ///
      int    PRYEAR73                  3701-3704   ///
      int    PRYEAR74                  3705-3708   ///
      int    PRYEAR75                  3709-3712   ///
      int    PRYEAR76                  3713-3716   ///
      int    PRYEAR77                  3717-3720   ///
      int    PRYEAR78                  3721-3724   ///
      int    PRYEAR79                  3725-3728   ///
      int    PRYEAR80                  3729-3732   ///
      int    PRYEAR81                  3733-3736   ///
      int    PRYEAR82                  3737-3740   ///
      int    PRYEAR83                  3741-3744   ///
      int    PRYEAR84                  3745-3748   ///
      int    PRYEAR85                  3749-3752   ///
      int    PRYEAR86                  3753-3756   ///
      int    PRYEAR87                  3757-3760   ///
      int    PRYEAR88                  3761-3764   ///
      int    PRYEAR89                  3765-3768   ///
      int    PRYEAR90                  3769-3772   ///
      int    PRYEAR91                  3773-3776   ///
      int    PRYEAR92                  3777-3780   ///
      int    PRYEAR93                  3781-3784   ///
      int    PRYEAR94                  3785-3788   ///
      int    PRYEAR95                  3789-3792   ///
      int    PRYEAR96                  3793-3796   ///
      int    PRYEAR97                  3797-3800   ///
      int    PRYEAR98                  3801-3804   ///
      int    PRYEAR99                  3805-3808   ///
      int    PRYEAR100                 3809-3812   ///
      int    PRYEAR101                 3813-3816   ///
      int    PRYEAR102                 3817-3820   ///
      int    PRYEAR103                 3821-3824   ///
      int    PRYEAR104                 3825-3828   ///
      int    PRYEAR105                 3829-3832   ///
      int    PRYEAR106                 3833-3836   ///
      int    PRYEAR107                 3837-3840   ///
      int    PRYEAR108                 3841-3844   ///
      int    PRYEAR109                 3845-3848   ///
      int    PRYEAR110                 3849-3852   ///
      int    PRYEAR111                 3853-3856   ///
      int    PRYEAR112                 3857-3860   ///
      int    PRYEAR113                 3861-3864   ///
      int    PRYEAR114                 3865-3868   ///
      int    PRYEAR115                 3869-3872   ///
      int    PRYEAR116                 3873-3876   ///
      int    PRYEAR117                 3877-3880   ///
      int    PRYEAR118                 3881-3884   ///
      int    PRYEAR119                 3885-3888   ///
      int    PRYEAR120                 3889-3892   ///
      int    PRYEAR121                 3893-3896   ///
      int    PRYEAR122                 3897-3900   ///
      int    PRYEAR123                 3901-3904   ///
      int    PRYEAR124                 3905-3908   ///
      int    PRYEAR125                 3909-3912   ///
      int    PRYEAR126                 3913-3916   ///
      int    PRYEAR127                 3917-3920   ///
      int    PRYEAR128                 3921-3924   ///
      int    PRYEAR129                 3925-3928   ///
      int    PRYEAR130                 3929-3932   ///
      int    PRYEAR131                 3933-3936   ///
      int    PRYEAR132                 3937-3940   ///
      int    PRYEAR133                 3941-3944   ///
      int    PRYEAR134                 3945-3948   ///
      int    PRYEAR135                 3949-3952   ///
      int    PRYEAR136                 3953-3956   ///
      int    PRYEAR137                 3957-3960   ///
      int    PRYEAR138                 3961-3964   ///
      int    PRYEAR139                 3965-3968   ///
      int    PRYEAR140                 3969-3972   ///
      int    PRYEAR141                 3973-3976   ///
      int    PRYEAR142                 3977-3980   ///
      int    PRYEAR143                 3981-3984   ///
      int    PRYEAR144                 3985-3988   ///
      int    PRYEAR145                 3989-3992   ///
      int    PRYEAR146                 3993-3996   ///
      int    PRYEAR147                 3997-4000   ///
      int    PRYEAR148                 4001-4004   ///
      int    PRYEAR149                 4005-4008   ///
      int    PRYEAR150                 4009-4012   ///
      int    PRYEAR151                 4013-4016   ///
      int    PRYEAR152                 4017-4020   ///
      int    PRYEAR153                 4021-4024   ///
      int    PRYEAR154                 4025-4028   ///
      int    PRYEAR155                 4029-4032   ///
      int    PRYEAR156                 4033-4036   ///
      int    PRYEAR157                 4037-4040   ///
      int    PRYEAR158                 4041-4044   ///
      int    PRYEAR159                 4045-4048   ///
      int    PRYEAR160                 4049-4052   ///
      int    PRYEAR161                 4053-4056   ///
      int    PRYEAR162                 4057-4060   ///
      int    PRYEAR163                 4061-4064   ///
      int    PRYEAR164                 4065-4068   ///
      int    PRYEAR165                 4069-4072   ///
      int    PRYEAR166                 4073-4076   ///
      int    PRYEAR167                 4077-4080   ///
      int    PRYEAR168                 4081-4084   ///
      using  "MA_SID_2020_CORE.ASC"

***  Assign labels to the data elements ***
label var ADRG                     "All Patient Refined DRG"
label var ADRGRISKMORTALITY        "All Patient Refined DRG mortality risk"
label var ADRGSEV                  "All Patient Refined DRG severity level"
label var AGE                      "Age in years at admission"
label var AGEMONTH                 "Age in months (when age < 11 years)"
label var AMDC                     "All Patient Refined MDC"
label var AMONTH                   "Admission month"
label var ASOURCE                  "Admission source (uniform)"
label var ASOURCE_X                "Admission source (as received from source)"
label var ASOURCEUB92              "Admission source (UB-92 standard coding)"
label var ATYPE                    "Admission type"
label var AWEEKEND                 "Admission day is a weekend"
label var BWT                      "Birth weight in grams"
label var DaysBetweenVisits        "Number of days between visits"
label var DaysToEvent              "Days from 'start date' to admission"
label var DIED                     "Died during hospitalization"
label var DISP_X                   "Disposition of patient (as received from source)"
label var DISPUB04                 "Disposition of patient (UB-04 standard coding)"
label var DISPUNIFORM              "Disposition of patient (uniform)"
label var DMONTH                   "Discharge month"
label var DNR                      "Do not resuscitate indicator"
label var DQTR                     "Discharge quarter"
label var DRG                      "DRG in effect on discharge date"
label var DRG_NoPOA                "DRG in use on discharge date, calculated without POA"
label var DRGVER                   "DRG grouper version used on discharge date"
label var DSHOSPID                 "Data source hospital identifier"
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
label var DXPOA17                  "Diagnosis 17, present on admission indicator"
label var DXPOA18                  "Diagnosis 18, present on admission indicator"
label var DXPOA19                  "Diagnosis 19, present on admission indicator"
label var DXPOA20                  "Diagnosis 20, present on admission indicator"
label var DXPOA21                  "Diagnosis 21, present on admission indicator"
label var DXPOA22                  "Diagnosis 22, present on admission indicator"
label var DXPOA23                  "Diagnosis 23, present on admission indicator"
label var DXPOA24                  "Diagnosis 24, present on admission indicator"
label var DXPOA25                  "Diagnosis 25, present on admission indicator"
label var DXPOA26                  "Diagnosis 26, present on admission indicator"
label var DXPOA27                  "Diagnosis 27, present on admission indicator"
label var DXPOA28                  "Diagnosis 28, present on admission indicator"
label var DXPOA29                  "Diagnosis 29, present on admission indicator"
label var DXPOA30                  "Diagnosis 30, present on admission indicator"
label var DXPOA31                  "Diagnosis 31, present on admission indicator"
label var DXPOA32                  "Diagnosis 32, present on admission indicator"
label var DXPOA33                  "Diagnosis 33, present on admission indicator"
label var DXPOA34                  "Diagnosis 34, present on admission indicator"
label var DXPOA35                  "Diagnosis 35, present on admission indicator"
label var DXPOA36                  "Diagnosis 36, present on admission indicator"
label var DXPOA37                  "Diagnosis 37, present on admission indicator"
label var DXPOA38                  "Diagnosis 38, present on admission indicator"
label var DXPOA39                  "Diagnosis 39, present on admission indicator"
label var DXPOA40                  "Diagnosis 40, present on admission indicator"
label var DXPOA41                  "Diagnosis 41, present on admission indicator"
label var DXPOA42                  "Diagnosis 42, present on admission indicator"
label var DXPOA43                  "Diagnosis 43, present on admission indicator"
label var DXPOA44                  "Diagnosis 44, present on admission indicator"
label var DXPOA45                  "Diagnosis 45, present on admission indicator"
label var DXPOA46                  "Diagnosis 46, present on admission indicator"
label var DXPOA47                  "Diagnosis 47, present on admission indicator"
label var DXPOA48                  "Diagnosis 48, present on admission indicator"
label var DXPOA49                  "Diagnosis 49, present on admission indicator"
label var DXPOA50                  "Diagnosis 50, present on admission indicator"
label var DXPOA51                  "Diagnosis 51, present on admission indicator"
label var DXPOA52                  "Diagnosis 52, present on admission indicator"
label var DXPOA53                  "Diagnosis 53, present on admission indicator"
label var DXPOA54                  "Diagnosis 54, present on admission indicator"
label var DXPOA55                  "Diagnosis 55, present on admission indicator"
label var DXPOA56                  "Diagnosis 56, present on admission indicator"
label var DXPOA57                  "Diagnosis 57, present on admission indicator"
label var DXPOA58                  "Diagnosis 58, present on admission indicator"
label var DXPOA59                  "Diagnosis 59, present on admission indicator"
label var DXPOA60                  "Diagnosis 60, present on admission indicator"
label var DXPOA61                  "Diagnosis 61, present on admission indicator"
label var DXPOA62                  "Diagnosis 62, present on admission indicator"
label var DXPOA63                  "Diagnosis 63, present on admission indicator"
label var DXPOA64                  "Diagnosis 64, present on admission indicator"
label var DXPOA65                  "Diagnosis 65, present on admission indicator"
label var DXPOA66                  "Diagnosis 66, present on admission indicator"
label var DXPOA67                  "Diagnosis 67, present on admission indicator"
label var DXPOA68                  "Diagnosis 68, present on admission indicator"
label var DXPOA69                  "Diagnosis 69, present on admission indicator"
label var DXPOA70                  "Diagnosis 70, present on admission indicator"
label var DXPOA71                  "Diagnosis 71, present on admission indicator"
label var DXPOA72                  "Diagnosis 72, present on admission indicator"
label var DXPOA73                  "Diagnosis 73, present on admission indicator"
label var DXPOA74                  "Diagnosis 74, present on admission indicator"
label var DXPOA75                  "Diagnosis 75, present on admission indicator"
label var DXPOA76                  "Diagnosis 76, present on admission indicator"
label var DXPOA77                  "Diagnosis 77, present on admission indicator"
label var DXPOA78                  "Diagnosis 78, present on admission indicator"
label var DXPOA79                  "Diagnosis 79, present on admission indicator"
label var DXPOA80                  "Diagnosis 80, present on admission indicator"
label var DXPOA81                  "Diagnosis 81, present on admission indicator"
label var DXPOA82                  "Diagnosis 82, present on admission indicator"
label var DXPOA83                  "Diagnosis 83, present on admission indicator"
label var DXPOA84                  "Diagnosis 84, present on admission indicator"
label var DXPOA85                  "Diagnosis 85, present on admission indicator"
label var DXPOA86                  "Diagnosis 86, present on admission indicator"
label var DXPOA87                  "Diagnosis 87, present on admission indicator"
label var DXPOA88                  "Diagnosis 88, present on admission indicator"
label var DXPOA89                  "Diagnosis 89, present on admission indicator"
label var DXPOA90                  "Diagnosis 90, present on admission indicator"
label var DXPOA91                  "Diagnosis 91, present on admission indicator"
label var DXPOA92                  "Diagnosis 92, present on admission indicator"
label var DXPOA93                  "Diagnosis 93, present on admission indicator"
label var DXPOA94                  "Diagnosis 94, present on admission indicator"
label var DXPOA95                  "Diagnosis 95, present on admission indicator"
label var DXPOA96                  "Diagnosis 96, present on admission indicator"
label var FEMALE                   "Indicator of sex"
label var HCUP_ED                  "HCUP Emergency Department service indicator"
label var HCUP_OS                  "HCUP Observation Stay service indicator"
label var HISPANIC                 "Hispanic ethnicity (uniform)"
label var HISPANIC_X               "Hispanic ethnicity (as received from source)"
label var Homeless                 "Indicator that patient is homeless"
label var HOSPST                   "Hospital state postal code"
label var I10_BIRTH                "ICD-10-CM Birth Indicator"
label var I10_DELIVERY             "ICD-10-CM Delivery Indicator"
label var I10_DX_Admitting         "ICD-10-CM Admitting Diagnosis Code"
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
label var I10_DX18                 "ICD-10-CM Diagnosis 18"
label var I10_DX19                 "ICD-10-CM Diagnosis 19"
label var I10_DX20                 "ICD-10-CM Diagnosis 20"
label var I10_DX21                 "ICD-10-CM Diagnosis 21"
label var I10_DX22                 "ICD-10-CM Diagnosis 22"
label var I10_DX23                 "ICD-10-CM Diagnosis 23"
label var I10_DX24                 "ICD-10-CM Diagnosis 24"
label var I10_DX25                 "ICD-10-CM Diagnosis 25"
label var I10_DX26                 "ICD-10-CM Diagnosis 26"
label var I10_DX27                 "ICD-10-CM Diagnosis 27"
label var I10_DX28                 "ICD-10-CM Diagnosis 28"
label var I10_DX29                 "ICD-10-CM Diagnosis 29"
label var I10_DX30                 "ICD-10-CM Diagnosis 30"
label var I10_DX31                 "ICD-10-CM Diagnosis 31"
label var I10_DX32                 "ICD-10-CM Diagnosis 32"
label var I10_DX33                 "ICD-10-CM Diagnosis 33"
label var I10_DX34                 "ICD-10-CM Diagnosis 34"
label var I10_DX35                 "ICD-10-CM Diagnosis 35"
label var I10_DX36                 "ICD-10-CM Diagnosis 36"
label var I10_DX37                 "ICD-10-CM Diagnosis 37"
label var I10_DX38                 "ICD-10-CM Diagnosis 38"
label var I10_DX39                 "ICD-10-CM Diagnosis 39"
label var I10_DX40                 "ICD-10-CM Diagnosis 40"
label var I10_DX41                 "ICD-10-CM Diagnosis 41"
label var I10_DX42                 "ICD-10-CM Diagnosis 42"
label var I10_DX43                 "ICD-10-CM Diagnosis 43"
label var I10_DX44                 "ICD-10-CM Diagnosis 44"
label var I10_DX45                 "ICD-10-CM Diagnosis 45"
label var I10_DX46                 "ICD-10-CM Diagnosis 46"
label var I10_DX47                 "ICD-10-CM Diagnosis 47"
label var I10_DX48                 "ICD-10-CM Diagnosis 48"
label var I10_DX49                 "ICD-10-CM Diagnosis 49"
label var I10_DX50                 "ICD-10-CM Diagnosis 50"
label var I10_DX51                 "ICD-10-CM Diagnosis 51"
label var I10_DX52                 "ICD-10-CM Diagnosis 52"
label var I10_DX53                 "ICD-10-CM Diagnosis 53"
label var I10_DX54                 "ICD-10-CM Diagnosis 54"
label var I10_DX55                 "ICD-10-CM Diagnosis 55"
label var I10_DX56                 "ICD-10-CM Diagnosis 56"
label var I10_DX57                 "ICD-10-CM Diagnosis 57"
label var I10_DX58                 "ICD-10-CM Diagnosis 58"
label var I10_DX59                 "ICD-10-CM Diagnosis 59"
label var I10_DX60                 "ICD-10-CM Diagnosis 60"
label var I10_DX61                 "ICD-10-CM Diagnosis 61"
label var I10_DX62                 "ICD-10-CM Diagnosis 62"
label var I10_DX63                 "ICD-10-CM Diagnosis 63"
label var I10_DX64                 "ICD-10-CM Diagnosis 64"
label var I10_DX65                 "ICD-10-CM Diagnosis 65"
label var I10_DX66                 "ICD-10-CM Diagnosis 66"
label var I10_DX67                 "ICD-10-CM Diagnosis 67"
label var I10_DX68                 "ICD-10-CM Diagnosis 68"
label var I10_DX69                 "ICD-10-CM Diagnosis 69"
label var I10_DX70                 "ICD-10-CM Diagnosis 70"
label var I10_DX71                 "ICD-10-CM Diagnosis 71"
label var I10_DX72                 "ICD-10-CM Diagnosis 72"
label var I10_DX73                 "ICD-10-CM Diagnosis 73"
label var I10_DX74                 "ICD-10-CM Diagnosis 74"
label var I10_DX75                 "ICD-10-CM Diagnosis 75"
label var I10_DX76                 "ICD-10-CM Diagnosis 76"
label var I10_DX77                 "ICD-10-CM Diagnosis 77"
label var I10_DX78                 "ICD-10-CM Diagnosis 78"
label var I10_DX79                 "ICD-10-CM Diagnosis 79"
label var I10_DX80                 "ICD-10-CM Diagnosis 80"
label var I10_DX81                 "ICD-10-CM Diagnosis 81"
label var I10_DX82                 "ICD-10-CM Diagnosis 82"
label var I10_DX83                 "ICD-10-CM Diagnosis 83"
label var I10_DX84                 "ICD-10-CM Diagnosis 84"
label var I10_DX85                 "ICD-10-CM Diagnosis 85"
label var I10_DX86                 "ICD-10-CM Diagnosis 86"
label var I10_DX87                 "ICD-10-CM Diagnosis 87"
label var I10_DX88                 "ICD-10-CM Diagnosis 88"
label var I10_DX89                 "ICD-10-CM Diagnosis 89"
label var I10_DX90                 "ICD-10-CM Diagnosis 90"
label var I10_DX91                 "ICD-10-CM Diagnosis 91"
label var I10_DX92                 "ICD-10-CM Diagnosis 92"
label var I10_DX93                 "ICD-10-CM Diagnosis 93"
label var I10_DX94                 "ICD-10-CM Diagnosis 94"
label var I10_DX95                 "ICD-10-CM Diagnosis 95"
label var I10_DX96                 "ICD-10-CM Diagnosis 96"
label var I10_NDX                  "ICD-10-CM Number of diagnoses on this record"
label var I10_NPR                  "ICD-10-PCS Number of procedures on this record"
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
label var I10_PR14                 "ICD-10-PCS Procedure 14"
label var I10_PR15                 "ICD-10-PCS Procedure 15"
label var I10_PR16                 "ICD-10-PCS Procedure 16"
label var I10_PR17                 "ICD-10-PCS Procedure 17"
label var I10_PR18                 "ICD-10-PCS Procedure 18"
label var I10_PR19                 "ICD-10-PCS Procedure 19"
label var I10_PR20                 "ICD-10-PCS Procedure 20"
label var I10_PR21                 "ICD-10-PCS Procedure 21"
label var I10_PR22                 "ICD-10-PCS Procedure 22"
label var I10_PR23                 "ICD-10-PCS Procedure 23"
label var I10_PR24                 "ICD-10-PCS Procedure 24"
label var I10_PR25                 "ICD-10-PCS Procedure 25"
label var I10_PR26                 "ICD-10-PCS Procedure 26"
label var I10_PR27                 "ICD-10-PCS Procedure 27"
label var I10_PR28                 "ICD-10-PCS Procedure 28"
label var I10_PR29                 "ICD-10-PCS Procedure 29"
label var I10_PR30                 "ICD-10-PCS Procedure 30"
label var I10_PR31                 "ICD-10-PCS Procedure 31"
label var I10_PR32                 "ICD-10-PCS Procedure 32"
label var I10_PR33                 "ICD-10-PCS Procedure 33"
label var I10_PR34                 "ICD-10-PCS Procedure 34"
label var I10_PR35                 "ICD-10-PCS Procedure 35"
label var I10_PR36                 "ICD-10-PCS Procedure 36"
label var I10_PR37                 "ICD-10-PCS Procedure 37"
label var I10_PR38                 "ICD-10-PCS Procedure 38"
label var I10_PR39                 "ICD-10-PCS Procedure 39"
label var I10_PR40                 "ICD-10-PCS Procedure 40"
label var I10_PR41                 "ICD-10-PCS Procedure 41"
label var I10_PR42                 "ICD-10-PCS Procedure 42"
label var I10_PR43                 "ICD-10-PCS Procedure 43"
label var I10_PR44                 "ICD-10-PCS Procedure 44"
label var I10_PR45                 "ICD-10-PCS Procedure 45"
label var I10_PR46                 "ICD-10-PCS Procedure 46"
label var I10_PR47                 "ICD-10-PCS Procedure 47"
label var I10_PR48                 "ICD-10-PCS Procedure 48"
label var I10_PR49                 "ICD-10-PCS Procedure 49"
label var I10_PR50                 "ICD-10-PCS Procedure 50"
label var I10_PR51                 "ICD-10-PCS Procedure 51"
label var I10_PR52                 "ICD-10-PCS Procedure 52"
label var I10_PR53                 "ICD-10-PCS Procedure 53"
label var I10_PR54                 "ICD-10-PCS Procedure 54"
label var I10_PR55                 "ICD-10-PCS Procedure 55"
label var I10_PR56                 "ICD-10-PCS Procedure 56"
label var I10_PR57                 "ICD-10-PCS Procedure 57"
label var I10_PR58                 "ICD-10-PCS Procedure 58"
label var I10_PR59                 "ICD-10-PCS Procedure 59"
label var I10_PR60                 "ICD-10-PCS Procedure 60"
label var I10_PR61                 "ICD-10-PCS Procedure 61"
label var I10_PR62                 "ICD-10-PCS Procedure 62"
label var I10_PR63                 "ICD-10-PCS Procedure 63"
label var I10_PR64                 "ICD-10-PCS Procedure 64"
label var I10_PR65                 "ICD-10-PCS Procedure 65"
label var I10_PR66                 "ICD-10-PCS Procedure 66"
label var I10_PR67                 "ICD-10-PCS Procedure 67"
label var I10_PR68                 "ICD-10-PCS Procedure 68"
label var I10_PR69                 "ICD-10-PCS Procedure 69"
label var I10_PR70                 "ICD-10-PCS Procedure 70"
label var I10_PR71                 "ICD-10-PCS Procedure 71"
label var I10_PR72                 "ICD-10-PCS Procedure 72"
label var I10_PR73                 "ICD-10-PCS Procedure 73"
label var I10_PR74                 "ICD-10-PCS Procedure 74"
label var I10_PR75                 "ICD-10-PCS Procedure 75"
label var I10_PR76                 "ICD-10-PCS Procedure 76"
label var I10_PR77                 "ICD-10-PCS Procedure 77"
label var I10_PR78                 "ICD-10-PCS Procedure 78"
label var I10_PR79                 "ICD-10-PCS Procedure 79"
label var I10_PR80                 "ICD-10-PCS Procedure 80"
label var I10_PR81                 "ICD-10-PCS Procedure 81"
label var I10_PR82                 "ICD-10-PCS Procedure 82"
label var I10_PR83                 "ICD-10-PCS Procedure 83"
label var I10_PR84                 "ICD-10-PCS Procedure 84"
label var I10_PR85                 "ICD-10-PCS Procedure 85"
label var I10_PR86                 "ICD-10-PCS Procedure 86"
label var I10_PR87                 "ICD-10-PCS Procedure 87"
label var I10_PR88                 "ICD-10-PCS Procedure 88"
label var I10_PR89                 "ICD-10-PCS Procedure 89"
label var I10_PR90                 "ICD-10-PCS Procedure 90"
label var I10_PR91                 "ICD-10-PCS Procedure 91"
label var I10_PR92                 "ICD-10-PCS Procedure 92"
label var I10_PR93                 "ICD-10-PCS Procedure 93"
label var I10_PR94                 "ICD-10-PCS Procedure 94"
label var I10_PR95                 "ICD-10-PCS Procedure 95"
label var I10_PR96                 "ICD-10-PCS Procedure 96"
label var I10_PR97                 "ICD-10-PCS Procedure 97"
label var I10_PR98                 "ICD-10-PCS Procedure 98"
label var I10_PR99                 "ICD-10-PCS Procedure 99"
label var I10_PR100                "ICD-10-PCS Procedure 100"
label var I10_PR101                "ICD-10-PCS Procedure 101"
label var I10_PR102                "ICD-10-PCS Procedure 102"
label var I10_PR103                "ICD-10-PCS Procedure 103"
label var I10_PR104                "ICD-10-PCS Procedure 104"
label var I10_PR105                "ICD-10-PCS Procedure 105"
label var I10_PR106                "ICD-10-PCS Procedure 106"
label var I10_PR107                "ICD-10-PCS Procedure 107"
label var I10_PR108                "ICD-10-PCS Procedure 108"
label var I10_PR109                "ICD-10-PCS Procedure 109"
label var I10_PR110                "ICD-10-PCS Procedure 110"
label var I10_PR111                "ICD-10-PCS Procedure 111"
label var I10_PR112                "ICD-10-PCS Procedure 112"
label var I10_PR113                "ICD-10-PCS Procedure 113"
label var I10_PR114                "ICD-10-PCS Procedure 114"
label var I10_PR115                "ICD-10-PCS Procedure 115"
label var I10_PR116                "ICD-10-PCS Procedure 116"
label var I10_PR117                "ICD-10-PCS Procedure 117"
label var I10_PR118                "ICD-10-PCS Procedure 118"
label var I10_PR119                "ICD-10-PCS Procedure 119"
label var I10_PR120                "ICD-10-PCS Procedure 120"
label var I10_PR121                "ICD-10-PCS Procedure 121"
label var I10_PR122                "ICD-10-PCS Procedure 122"
label var I10_PR123                "ICD-10-PCS Procedure 123"
label var I10_PR124                "ICD-10-PCS Procedure 124"
label var I10_PR125                "ICD-10-PCS Procedure 125"
label var I10_PR126                "ICD-10-PCS Procedure 126"
label var I10_PR127                "ICD-10-PCS Procedure 127"
label var I10_PR128                "ICD-10-PCS Procedure 128"
label var I10_PR129                "ICD-10-PCS Procedure 129"
label var I10_PR130                "ICD-10-PCS Procedure 130"
label var I10_PR131                "ICD-10-PCS Procedure 131"
label var I10_PR132                "ICD-10-PCS Procedure 132"
label var I10_PR133                "ICD-10-PCS Procedure 133"
label var I10_PR134                "ICD-10-PCS Procedure 134"
label var I10_PR135                "ICD-10-PCS Procedure 135"
label var I10_PR136                "ICD-10-PCS Procedure 136"
label var I10_PR137                "ICD-10-PCS Procedure 137"
label var I10_PR138                "ICD-10-PCS Procedure 138"
label var I10_PR139                "ICD-10-PCS Procedure 139"
label var I10_PR140                "ICD-10-PCS Procedure 140"
label var I10_PR141                "ICD-10-PCS Procedure 141"
label var I10_PR142                "ICD-10-PCS Procedure 142"
label var I10_PR143                "ICD-10-PCS Procedure 143"
label var I10_PR144                "ICD-10-PCS Procedure 144"
label var I10_PR145                "ICD-10-PCS Procedure 145"
label var I10_PR146                "ICD-10-PCS Procedure 146"
label var I10_PR147                "ICD-10-PCS Procedure 147"
label var I10_PR148                "ICD-10-PCS Procedure 148"
label var I10_PR149                "ICD-10-PCS Procedure 149"
label var I10_PR150                "ICD-10-PCS Procedure 150"
label var I10_PR151                "ICD-10-PCS Procedure 151"
label var I10_PR152                "ICD-10-PCS Procedure 152"
label var I10_PR153                "ICD-10-PCS Procedure 153"
label var I10_PR154                "ICD-10-PCS Procedure 154"
label var I10_PR155                "ICD-10-PCS Procedure 155"
label var I10_PR156                "ICD-10-PCS Procedure 156"
label var I10_PR157                "ICD-10-PCS Procedure 157"
label var I10_PR158                "ICD-10-PCS Procedure 158"
label var I10_PR159                "ICD-10-PCS Procedure 159"
label var I10_PR160                "ICD-10-PCS Procedure 160"
label var I10_PR161                "ICD-10-PCS Procedure 161"
label var I10_PR162                "ICD-10-PCS Procedure 162"
label var I10_PR163                "ICD-10-PCS Procedure 163"
label var I10_PR164                "ICD-10-PCS Procedure 164"
label var I10_PR165                "ICD-10-PCS Procedure 165"
label var I10_PR166                "ICD-10-PCS Procedure 166"
label var I10_PR167                "ICD-10-PCS Procedure 167"
label var I10_PR168                "ICD-10-PCS Procedure 168"
label var I10_PROCTYPE             "ICD-10-PCS Procedure type indicator"
label var I10_SERVICELINE          "ICD-10-CM/PCS Hospital Service Line"
label var KEY                      "HCUP record identifier"
label var LOS                      "Length of stay (cleaned)"
label var LOS_X                    "Length of stay (as received from source)"
label var MDC                      "MDC in effect on discharge date"
label var MDC_NoPOA                "MDC in use on discharge date, calculated without POA"
label var MEDINCSTQ                "Median household income state quartile for patient ZIP Code"
label var OS_TIME                  "Observation stay time summed from UNITS"
label var PAY1                     "Primary expected payer (uniform)"
label var PAY1_X                   "Primary expected payer (as received from source)"
label var PAY2                     "Secondary expected payer (uniform)"
label var PAY2_X                   "Secondary expected payer (as received from source)"
label var PAYER1_X                 "Primary expected payer plan identifier (as received from source)"
label var PAYER2_X                 "Secondary expected payer plan identifier (as received from source)"
label var PCLASS_ORPROC            "Indicates operating room (major diagnostic or therapeutic) procedure on the record"
label var PL_CBSA                  "Patient location: Core Based Statistical Area (CBSA)"
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
label var PRDAY14                  "Number of days from admission to I10_PR14"
label var PRDAY15                  "Number of days from admission to I10_PR15"
label var PRDAY16                  "Number of days from admission to I10_PR16"
label var PRDAY17                  "Number of days from admission to I10_PR17"
label var PRDAY18                  "Number of days from admission to I10_PR18"
label var PRDAY19                  "Number of days from admission to I10_PR19"
label var PRDAY20                  "Number of days from admission to I10_PR20"
label var PRDAY21                  "Number of days from admission to I10_PR21"
label var PRDAY22                  "Number of days from admission to I10_PR22"
label var PRDAY23                  "Number of days from admission to I10_PR23"
label var PRDAY24                  "Number of days from admission to I10_PR24"
label var PRDAY25                  "Number of days from admission to I10_PR25"
label var PRDAY26                  "Number of days from admission to I10_PR26"
label var PRDAY27                  "Number of days from admission to I10_PR27"
label var PRDAY28                  "Number of days from admission to I10_PR28"
label var PRDAY29                  "Number of days from admission to I10_PR29"
label var PRDAY30                  "Number of days from admission to I10_PR30"
label var PRDAY31                  "Number of days from admission to I10_PR31"
label var PRDAY32                  "Number of days from admission to I10_PR32"
label var PRDAY33                  "Number of days from admission to I10_PR33"
label var PRDAY34                  "Number of days from admission to I10_PR34"
label var PRDAY35                  "Number of days from admission to I10_PR35"
label var PRDAY36                  "Number of days from admission to I10_PR36"
label var PRDAY37                  "Number of days from admission to I10_PR37"
label var PRDAY38                  "Number of days from admission to I10_PR38"
label var PRDAY39                  "Number of days from admission to I10_PR39"
label var PRDAY40                  "Number of days from admission to I10_PR40"
label var PRDAY41                  "Number of days from admission to I10_PR41"
label var PRDAY42                  "Number of days from admission to I10_PR42"
label var PRDAY43                  "Number of days from admission to I10_PR43"
label var PRDAY44                  "Number of days from admission to I10_PR44"
label var PRDAY45                  "Number of days from admission to I10_PR45"
label var PRDAY46                  "Number of days from admission to I10_PR46"
label var PRDAY47                  "Number of days from admission to I10_PR47"
label var PRDAY48                  "Number of days from admission to I10_PR48"
label var PRDAY49                  "Number of days from admission to I10_PR49"
label var PRDAY50                  "Number of days from admission to I10_PR50"
label var PRDAY51                  "Number of days from admission to I10_PR51"
label var PRDAY52                  "Number of days from admission to I10_PR52"
label var PRDAY53                  "Number of days from admission to I10_PR53"
label var PRDAY54                  "Number of days from admission to I10_PR54"
label var PRDAY55                  "Number of days from admission to I10_PR55"
label var PRDAY56                  "Number of days from admission to I10_PR56"
label var PRDAY57                  "Number of days from admission to I10_PR57"
label var PRDAY58                  "Number of days from admission to I10_PR58"
label var PRDAY59                  "Number of days from admission to I10_PR59"
label var PRDAY60                  "Number of days from admission to I10_PR60"
label var PRDAY61                  "Number of days from admission to I10_PR61"
label var PRDAY62                  "Number of days from admission to I10_PR62"
label var PRDAY63                  "Number of days from admission to I10_PR63"
label var PRDAY64                  "Number of days from admission to I10_PR64"
label var PRDAY65                  "Number of days from admission to I10_PR65"
label var PRDAY66                  "Number of days from admission to I10_PR66"
label var PRDAY67                  "Number of days from admission to I10_PR67"
label var PRDAY68                  "Number of days from admission to I10_PR68"
label var PRDAY69                  "Number of days from admission to I10_PR69"
label var PRDAY70                  "Number of days from admission to I10_PR70"
label var PRDAY71                  "Number of days from admission to I10_PR71"
label var PRDAY72                  "Number of days from admission to I10_PR72"
label var PRDAY73                  "Number of days from admission to I10_PR73"
label var PRDAY74                  "Number of days from admission to I10_PR74"
label var PRDAY75                  "Number of days from admission to I10_PR75"
label var PRDAY76                  "Number of days from admission to I10_PR76"
label var PRDAY77                  "Number of days from admission to I10_PR77"
label var PRDAY78                  "Number of days from admission to I10_PR78"
label var PRDAY79                  "Number of days from admission to I10_PR79"
label var PRDAY80                  "Number of days from admission to I10_PR80"
label var PRDAY81                  "Number of days from admission to I10_PR81"
label var PRDAY82                  "Number of days from admission to I10_PR82"
label var PRDAY83                  "Number of days from admission to I10_PR83"
label var PRDAY84                  "Number of days from admission to I10_PR84"
label var PRDAY85                  "Number of days from admission to I10_PR85"
label var PRDAY86                  "Number of days from admission to I10_PR86"
label var PRDAY87                  "Number of days from admission to I10_PR87"
label var PRDAY88                  "Number of days from admission to I10_PR88"
label var PRDAY89                  "Number of days from admission to I10_PR89"
label var PRDAY90                  "Number of days from admission to I10_PR90"
label var PRDAY91                  "Number of days from admission to I10_PR91"
label var PRDAY92                  "Number of days from admission to I10_PR92"
label var PRDAY93                  "Number of days from admission to I10_PR93"
label var PRDAY94                  "Number of days from admission to I10_PR94"
label var PRDAY95                  "Number of days from admission to I10_PR95"
label var PRDAY96                  "Number of days from admission to I10_PR96"
label var PRDAY97                  "Number of days from admission to I10_PR97"
label var PRDAY98                  "Number of days from admission to I10_PR98"
label var PRDAY99                  "Number of days from admission to I10_PR99"
label var PRDAY100                 "Number of days from admission to I10_PR100"
label var PRDAY101                 "Number of days from admission to I10_PR101"
label var PRDAY102                 "Number of days from admission to I10_PR102"
label var PRDAY103                 "Number of days from admission to I10_PR103"
label var PRDAY104                 "Number of days from admission to I10_PR104"
label var PRDAY105                 "Number of days from admission to I10_PR105"
label var PRDAY106                 "Number of days from admission to I10_PR106"
label var PRDAY107                 "Number of days from admission to I10_PR107"
label var PRDAY108                 "Number of days from admission to I10_PR108"
label var PRDAY109                 "Number of days from admission to I10_PR109"
label var PRDAY110                 "Number of days from admission to I10_PR110"
label var PRDAY111                 "Number of days from admission to I10_PR111"
label var PRDAY112                 "Number of days from admission to I10_PR112"
label var PRDAY113                 "Number of days from admission to I10_PR113"
label var PRDAY114                 "Number of days from admission to I10_PR114"
label var PRDAY115                 "Number of days from admission to I10_PR115"
label var PRDAY116                 "Number of days from admission to I10_PR116"
label var PRDAY117                 "Number of days from admission to I10_PR117"
label var PRDAY118                 "Number of days from admission to I10_PR118"
label var PRDAY119                 "Number of days from admission to I10_PR119"
label var PRDAY120                 "Number of days from admission to I10_PR120"
label var PRDAY121                 "Number of days from admission to I10_PR121"
label var PRDAY122                 "Number of days from admission to I10_PR122"
label var PRDAY123                 "Number of days from admission to I10_PR123"
label var PRDAY124                 "Number of days from admission to I10_PR124"
label var PRDAY125                 "Number of days from admission to I10_PR125"
label var PRDAY126                 "Number of days from admission to I10_PR126"
label var PRDAY127                 "Number of days from admission to I10_PR127"
label var PRDAY128                 "Number of days from admission to I10_PR128"
label var PRDAY129                 "Number of days from admission to I10_PR129"
label var PRDAY130                 "Number of days from admission to I10_PR130"
label var PRDAY131                 "Number of days from admission to I10_PR131"
label var PRDAY132                 "Number of days from admission to I10_PR132"
label var PRDAY133                 "Number of days from admission to I10_PR133"
label var PRDAY134                 "Number of days from admission to I10_PR134"
label var PRDAY135                 "Number of days from admission to I10_PR135"
label var PRDAY136                 "Number of days from admission to I10_PR136"
label var PRDAY137                 "Number of days from admission to I10_PR137"
label var PRDAY138                 "Number of days from admission to I10_PR138"
label var PRDAY139                 "Number of days from admission to I10_PR139"
label var PRDAY140                 "Number of days from admission to I10_PR140"
label var PRDAY141                 "Number of days from admission to I10_PR141"
label var PRDAY142                 "Number of days from admission to I10_PR142"
label var PRDAY143                 "Number of days from admission to I10_PR143"
label var PRDAY144                 "Number of days from admission to I10_PR144"
label var PRDAY145                 "Number of days from admission to I10_PR145"
label var PRDAY146                 "Number of days from admission to I10_PR146"
label var PRDAY147                 "Number of days from admission to I10_PR147"
label var PRDAY148                 "Number of days from admission to I10_PR148"
label var PRDAY149                 "Number of days from admission to I10_PR149"
label var PRDAY150                 "Number of days from admission to I10_PR150"
label var PRDAY151                 "Number of days from admission to I10_PR151"
label var PRDAY152                 "Number of days from admission to I10_PR152"
label var PRDAY153                 "Number of days from admission to I10_PR153"
label var PRDAY154                 "Number of days from admission to I10_PR154"
label var PRDAY155                 "Number of days from admission to I10_PR155"
label var PRDAY156                 "Number of days from admission to I10_PR156"
label var PRDAY157                 "Number of days from admission to I10_PR157"
label var PRDAY158                 "Number of days from admission to I10_PR158"
label var PRDAY159                 "Number of days from admission to I10_PR159"
label var PRDAY160                 "Number of days from admission to I10_PR160"
label var PRDAY161                 "Number of days from admission to I10_PR161"
label var PRDAY162                 "Number of days from admission to I10_PR162"
label var PRDAY163                 "Number of days from admission to I10_PR163"
label var PRDAY164                 "Number of days from admission to I10_PR164"
label var PRDAY165                 "Number of days from admission to I10_PR165"
label var PRDAY166                 "Number of days from admission to I10_PR166"
label var PRDAY167                 "Number of days from admission to I10_PR167"
label var PRDAY168                 "Number of days from admission to I10_PR168"
label var PSTATE                   "Patient State postal code"
label var PSTATE_GEO               "Patient State postal code assigned from ZIP Code"
label var PSTCO_GEO                "Counties assigned based on ZIP Code geographic centroids"
label var RACE                     "Race (uniform)"
label var RACE_PCT_MISS_HOSP       "Hospital percentage of missing or invalid race values"
label var RACE_X                   "Race (as received from source)"
label var TOTCHG                   "Total charges (cleaned)"
label var TOTCHG_X                 "Total charges (as received from source)"
label var TRAN_IN                  "Transfer in indicator"
label var TRAN_OUT                 "Transfer out indicator"
label var VisitLink                "Visit linkage variable"
label var YEAR                     "Calendar year"
label var ZIP3                     "Patient ZIP Code, first 3 digits"
label var ZIPINC_QRTL              "Median household income national quartile for patient ZIP Code"
label var AYEAR                    "Admission year"
label var PRMONTH1                 "Month of procedure 1"
label var PRMONTH2                 "Month of procedure 2"
label var PRMONTH3                 "Month of procedure 3"
label var PRMONTH4                 "Month of procedure 4"
label var PRMONTH5                 "Month of procedure 5"
label var PRMONTH6                 "Month of procedure 6"
label var PRMONTH7                 "Month of procedure 7"
label var PRMONTH8                 "Month of procedure 8"
label var PRMONTH9                 "Month of procedure 9"
label var PRMONTH10                "Month of procedure 10"
label var PRMONTH11                "Month of procedure 11"
label var PRMONTH12                "Month of procedure 12"
label var PRMONTH13                "Month of procedure 13"
label var PRMONTH14                "Month of procedure 14"
label var PRMONTH15                "Month of procedure 15"
label var PRMONTH16                "Month of procedure 16"
label var PRMONTH17                "Month of procedure 17"
label var PRMONTH18                "Month of procedure 18"
label var PRMONTH19                "Month of procedure 19"
label var PRMONTH20                "Month of procedure 20"
label var PRMONTH21                "Month of procedure 21"
label var PRMONTH22                "Month of procedure 22"
label var PRMONTH23                "Month of procedure 23"
label var PRMONTH24                "Month of procedure 24"
label var PRMONTH25                "Month of procedure 25"
label var PRMONTH26                "Month of procedure 26"
label var PRMONTH27                "Month of procedure 27"
label var PRMONTH28                "Month of procedure 28"
label var PRMONTH29                "Month of procedure 29"
label var PRMONTH30                "Month of procedure 30"
label var PRMONTH31                "Month of procedure 31"
label var PRMONTH32                "Month of procedure 32"
label var PRMONTH33                "Month of procedure 33"
label var PRMONTH34                "Month of procedure 34"
label var PRMONTH35                "Month of procedure 35"
label var PRMONTH36                "Month of procedure 36"
label var PRMONTH37                "Month of procedure 37"
label var PRMONTH38                "Month of procedure 38"
label var PRMONTH39                "Month of procedure 39"
label var PRMONTH40                "Month of procedure 40"
label var PRMONTH41                "Month of procedure 41"
label var PRMONTH42                "Month of procedure 42"
label var PRMONTH43                "Month of procedure 43"
label var PRMONTH44                "Month of procedure 44"
label var PRMONTH45                "Month of procedure 45"
label var PRMONTH46                "Month of procedure 46"
label var PRMONTH47                "Month of procedure 47"
label var PRMONTH48                "Month of procedure 48"
label var PRMONTH49                "Month of procedure 49"
label var PRMONTH50                "Month of procedure 50"
label var PRMONTH51                "Month of procedure 51"
label var PRMONTH52                "Month of procedure 52"
label var PRMONTH53                "Month of procedure 53"
label var PRMONTH54                "Month of procedure 54"
label var PRMONTH55                "Month of procedure 55"
label var PRMONTH56                "Month of procedure 56"
label var PRMONTH57                "Month of procedure 57"
label var PRMONTH58                "Month of procedure 58"
label var PRMONTH59                "Month of procedure 59"
label var PRMONTH60                "Month of procedure 60"
label var PRMONTH61                "Month of procedure 61"
label var PRMONTH62                "Month of procedure 62"
label var PRMONTH63                "Month of procedure 63"
label var PRMONTH64                "Month of procedure 64"
label var PRMONTH65                "Month of procedure 65"
label var PRMONTH66                "Month of procedure 66"
label var PRMONTH67                "Month of procedure 67"
label var PRMONTH68                "Month of procedure 68"
label var PRMONTH69                "Month of procedure 69"
label var PRMONTH70                "Month of procedure 70"
label var PRMONTH71                "Month of procedure 71"
label var PRMONTH72                "Month of procedure 72"
label var PRMONTH73                "Month of procedure 73"
label var PRMONTH74                "Month of procedure 74"
label var PRMONTH75                "Month of procedure 75"
label var PRMONTH76                "Month of procedure 76"
label var PRMONTH77                "Month of procedure 77"
label var PRMONTH78                "Month of procedure 78"
label var PRMONTH79                "Month of procedure 79"
label var PRMONTH80                "Month of procedure 80"
label var PRMONTH81                "Month of procedure 81"
label var PRMONTH82                "Month of procedure 82"
label var PRMONTH83                "Month of procedure 83"
label var PRMONTH84                "Month of procedure 84"
label var PRMONTH85                "Month of procedure 85"
label var PRMONTH86                "Month of procedure 86"
label var PRMONTH87                "Month of procedure 87"
label var PRMONTH88                "Month of procedure 88"
label var PRMONTH89                "Month of procedure 89"
label var PRMONTH90                "Month of procedure 90"
label var PRMONTH91                "Month of procedure 91"
label var PRMONTH92                "Month of procedure 92"
label var PRMONTH93                "Month of procedure 93"
label var PRMONTH94                "Month of procedure 94"
label var PRMONTH95                "Month of procedure 95"
label var PRMONTH96                "Month of procedure 96"
label var PRMONTH97                "Month of procedure 97"
label var PRMONTH98                "Month of procedure 98"
label var PRMONTH99                "Month of procedure 99"
label var PRMONTH100               "Month of procedure 100"
label var PRMONTH101               "Month of procedure 101"
label var PRMONTH102               "Month of procedure 102"
label var PRMONTH103               "Month of procedure 103"
label var PRMONTH104               "Month of procedure 104"
label var PRMONTH105               "Month of procedure 105"
label var PRMONTH106               "Month of procedure 106"
label var PRMONTH107               "Month of procedure 107"
label var PRMONTH108               "Month of procedure 108"
label var PRMONTH109               "Month of procedure 109"
label var PRMONTH110               "Month of procedure 110"
label var PRMONTH111               "Month of procedure 111"
label var PRMONTH112               "Month of procedure 112"
label var PRMONTH113               "Month of procedure 113"
label var PRMONTH114               "Month of procedure 114"
label var PRMONTH115               "Month of procedure 115"
label var PRMONTH116               "Month of procedure 116"
label var PRMONTH117               "Month of procedure 117"
label var PRMONTH118               "Month of procedure 118"
label var PRMONTH119               "Month of procedure 119"
label var PRMONTH120               "Month of procedure 120"
label var PRMONTH121               "Month of procedure 121"
label var PRMONTH122               "Month of procedure 122"
label var PRMONTH123               "Month of procedure 123"
label var PRMONTH124               "Month of procedure 124"
label var PRMONTH125               "Month of procedure 125"
label var PRMONTH126               "Month of procedure 126"
label var PRMONTH127               "Month of procedure 127"
label var PRMONTH128               "Month of procedure 128"
label var PRMONTH129               "Month of procedure 129"
label var PRMONTH130               "Month of procedure 130"
label var PRMONTH131               "Month of procedure 131"
label var PRMONTH132               "Month of procedure 132"
label var PRMONTH133               "Month of procedure 133"
label var PRMONTH134               "Month of procedure 134"
label var PRMONTH135               "Month of procedure 135"
label var PRMONTH136               "Month of procedure 136"
label var PRMONTH137               "Month of procedure 137"
label var PRMONTH138               "Month of procedure 138"
label var PRMONTH139               "Month of procedure 139"
label var PRMONTH140               "Month of procedure 140"
label var PRMONTH141               "Month of procedure 141"
label var PRMONTH142               "Month of procedure 142"
label var PRMONTH143               "Month of procedure 143"
label var PRMONTH144               "Month of procedure 144"
label var PRMONTH145               "Month of procedure 145"
label var PRMONTH146               "Month of procedure 146"
label var PRMONTH147               "Month of procedure 147"
label var PRMONTH148               "Month of procedure 148"
label var PRMONTH149               "Month of procedure 149"
label var PRMONTH150               "Month of procedure 150"
label var PRMONTH151               "Month of procedure 151"
label var PRMONTH152               "Month of procedure 152"
label var PRMONTH153               "Month of procedure 153"
label var PRMONTH154               "Month of procedure 154"
label var PRMONTH155               "Month of procedure 155"
label var PRMONTH156               "Month of procedure 156"
label var PRMONTH157               "Month of procedure 157"
label var PRMONTH158               "Month of procedure 158"
label var PRMONTH159               "Month of procedure 159"
label var PRMONTH160               "Month of procedure 160"
label var PRMONTH161               "Month of procedure 161"
label var PRMONTH162               "Month of procedure 162"
label var PRMONTH163               "Month of procedure 163"
label var PRMONTH164               "Month of procedure 164"
label var PRMONTH165               "Month of procedure 165"
label var PRMONTH166               "Month of procedure 166"
label var PRMONTH167               "Month of procedure 167"
label var PRMONTH168               "Month of procedure 168"
label var PRYEAR1                  "Year of procedure 1"
label var PRYEAR2                  "Year of procedure 2"
label var PRYEAR3                  "Year of procedure 3"
label var PRYEAR4                  "Year of procedure 4"
label var PRYEAR5                  "Year of procedure 5"
label var PRYEAR6                  "Year of procedure 6"
label var PRYEAR7                  "Year of procedure 7"
label var PRYEAR8                  "Year of procedure 8"
label var PRYEAR9                  "Year of procedure 9"
label var PRYEAR10                 "Year of procedure 10"
label var PRYEAR11                 "Year of procedure 11"
label var PRYEAR12                 "Year of procedure 12"
label var PRYEAR13                 "Year of procedure 13"
label var PRYEAR14                 "Year of procedure 14"
label var PRYEAR15                 "Year of procedure 15"
label var PRYEAR16                 "Year of procedure 16"
label var PRYEAR17                 "Year of procedure 17"
label var PRYEAR18                 "Year of procedure 18"
label var PRYEAR19                 "Year of procedure 19"
label var PRYEAR20                 "Year of procedure 20"
label var PRYEAR21                 "Year of procedure 21"
label var PRYEAR22                 "Year of procedure 22"
label var PRYEAR23                 "Year of procedure 23"
label var PRYEAR24                 "Year of procedure 24"
label var PRYEAR25                 "Year of procedure 25"
label var PRYEAR26                 "Year of procedure 26"
label var PRYEAR27                 "Year of procedure 27"
label var PRYEAR28                 "Year of procedure 28"
label var PRYEAR29                 "Year of procedure 29"
label var PRYEAR30                 "Year of procedure 30"
label var PRYEAR31                 "Year of procedure 31"
label var PRYEAR32                 "Year of procedure 32"
label var PRYEAR33                 "Year of procedure 33"
label var PRYEAR34                 "Year of procedure 34"
label var PRYEAR35                 "Year of procedure 35"
label var PRYEAR36                 "Year of procedure 36"
label var PRYEAR37                 "Year of procedure 37"
label var PRYEAR38                 "Year of procedure 38"
label var PRYEAR39                 "Year of procedure 39"
label var PRYEAR40                 "Year of procedure 40"
label var PRYEAR41                 "Year of procedure 41"
label var PRYEAR42                 "Year of procedure 42"
label var PRYEAR43                 "Year of procedure 43"
label var PRYEAR44                 "Year of procedure 44"
label var PRYEAR45                 "Year of procedure 45"
label var PRYEAR46                 "Year of procedure 46"
label var PRYEAR47                 "Year of procedure 47"
label var PRYEAR48                 "Year of procedure 48"
label var PRYEAR49                 "Year of procedure 49"
label var PRYEAR50                 "Year of procedure 50"
label var PRYEAR51                 "Year of procedure 51"
label var PRYEAR52                 "Year of procedure 52"
label var PRYEAR53                 "Year of procedure 53"
label var PRYEAR54                 "Year of procedure 54"
label var PRYEAR55                 "Year of procedure 55"
label var PRYEAR56                 "Year of procedure 56"
label var PRYEAR57                 "Year of procedure 57"
label var PRYEAR58                 "Year of procedure 58"
label var PRYEAR59                 "Year of procedure 59"
label var PRYEAR60                 "Year of procedure 60"
label var PRYEAR61                 "Year of procedure 61"
label var PRYEAR62                 "Year of procedure 62"
label var PRYEAR63                 "Year of procedure 63"
label var PRYEAR64                 "Year of procedure 64"
label var PRYEAR65                 "Year of procedure 65"
label var PRYEAR66                 "Year of procedure 66"
label var PRYEAR67                 "Year of procedure 67"
label var PRYEAR68                 "Year of procedure 68"
label var PRYEAR69                 "Year of procedure 69"
label var PRYEAR70                 "Year of procedure 70"
label var PRYEAR71                 "Year of procedure 71"
label var PRYEAR72                 "Year of procedure 72"
label var PRYEAR73                 "Year of procedure 73"
label var PRYEAR74                 "Year of procedure 74"
label var PRYEAR75                 "Year of procedure 75"
label var PRYEAR76                 "Year of procedure 76"
label var PRYEAR77                 "Year of procedure 77"
label var PRYEAR78                 "Year of procedure 78"
label var PRYEAR79                 "Year of procedure 79"
label var PRYEAR80                 "Year of procedure 80"
label var PRYEAR81                 "Year of procedure 81"
label var PRYEAR82                 "Year of procedure 82"
label var PRYEAR83                 "Year of procedure 83"
label var PRYEAR84                 "Year of procedure 84"
label var PRYEAR85                 "Year of procedure 85"
label var PRYEAR86                 "Year of procedure 86"
label var PRYEAR87                 "Year of procedure 87"
label var PRYEAR88                 "Year of procedure 88"
label var PRYEAR89                 "Year of procedure 89"
label var PRYEAR90                 "Year of procedure 90"
label var PRYEAR91                 "Year of procedure 91"
label var PRYEAR92                 "Year of procedure 92"
label var PRYEAR93                 "Year of procedure 93"
label var PRYEAR94                 "Year of procedure 94"
label var PRYEAR95                 "Year of procedure 95"
label var PRYEAR96                 "Year of procedure 96"
label var PRYEAR97                 "Year of procedure 97"
label var PRYEAR98                 "Year of procedure 98"
label var PRYEAR99                 "Year of procedure 99"
label var PRYEAR100                "Year of procedure 100"
label var PRYEAR101                "Year of procedure 101"
label var PRYEAR102                "Year of procedure 102"
label var PRYEAR103                "Year of procedure 103"
label var PRYEAR104                "Year of procedure 104"
label var PRYEAR105                "Year of procedure 105"
label var PRYEAR106                "Year of procedure 106"
label var PRYEAR107                "Year of procedure 107"
label var PRYEAR108                "Year of procedure 108"
label var PRYEAR109                "Year of procedure 109"
label var PRYEAR110                "Year of procedure 110"
label var PRYEAR111                "Year of procedure 111"
label var PRYEAR112                "Year of procedure 112"
label var PRYEAR113                "Year of procedure 113"
label var PRYEAR114                "Year of procedure 114"
label var PRYEAR115                "Year of procedure 115"
label var PRYEAR116                "Year of procedure 116"
label var PRYEAR117                "Year of procedure 117"
label var PRYEAR118                "Year of procedure 118"
label var PRYEAR119                "Year of procedure 119"
label var PRYEAR120                "Year of procedure 120"
label var PRYEAR121                "Year of procedure 121"
label var PRYEAR122                "Year of procedure 122"
label var PRYEAR123                "Year of procedure 123"
label var PRYEAR124                "Year of procedure 124"
label var PRYEAR125                "Year of procedure 125"
label var PRYEAR126                "Year of procedure 126"
label var PRYEAR127                "Year of procedure 127"
label var PRYEAR128                "Year of procedure 128"
label var PRYEAR129                "Year of procedure 129"
label var PRYEAR130                "Year of procedure 130"
label var PRYEAR131                "Year of procedure 131"
label var PRYEAR132                "Year of procedure 132"
label var PRYEAR133                "Year of procedure 133"
label var PRYEAR134                "Year of procedure 134"
label var PRYEAR135                "Year of procedure 135"
label var PRYEAR136                "Year of procedure 136"
label var PRYEAR137                "Year of procedure 137"
label var PRYEAR138                "Year of procedure 138"
label var PRYEAR139                "Year of procedure 139"
label var PRYEAR140                "Year of procedure 140"
label var PRYEAR141                "Year of procedure 141"
label var PRYEAR142                "Year of procedure 142"
label var PRYEAR143                "Year of procedure 143"
label var PRYEAR144                "Year of procedure 144"
label var PRYEAR145                "Year of procedure 145"
label var PRYEAR146                "Year of procedure 146"
label var PRYEAR147                "Year of procedure 147"
label var PRYEAR148                "Year of procedure 148"
label var PRYEAR149                "Year of procedure 149"
label var PRYEAR150                "Year of procedure 150"
label var PRYEAR151                "Year of procedure 151"
label var PRYEAR152                "Year of procedure 152"
label var PRYEAR153                "Year of procedure 153"
label var PRYEAR154                "Year of procedure 154"
label var PRYEAR155                "Year of procedure 155"
label var PRYEAR156                "Year of procedure 156"
label var PRYEAR157                "Year of procedure 157"
label var PRYEAR158                "Year of procedure 158"
label var PRYEAR159                "Year of procedure 159"
label var PRYEAR160                "Year of procedure 160"
label var PRYEAR161                "Year of procedure 161"
label var PRYEAR162                "Year of procedure 162"
label var PRYEAR163                "Year of procedure 163"
label var PRYEAR164                "Year of procedure 164"
label var PRYEAR165                "Year of procedure 165"
label var PRYEAR166                "Year of procedure 166"
label var PRYEAR167                "Year of procedure 167"
label var PRYEAR168                "Year of procedure 168"

*** Convert special values to missing values ***
recode ADRG                      (-99 -88 -66=.)
recode ADRGRISKMORTALITY         (-9 -8 -6 -5=.)
recode ADRGSEV                   (-9 -8 -6 -5=.)
recode AGE                       (-99 -88 -66=.)
recode AGEMONTH                  (-99 -88 -66=.)
recode AMDC                      (-9 -8 -6 -5=.)
recode AMONTH                    (-9 -8 -6 -5=.)
recode ASOURCE                   (-9 -8 -6 -5=.)
recode ATYPE                     (-9 -8 -6 -5=.)
recode AWEEKEND                  (-9 -8 -6 -5=.)
recode BWT                       (-999 -888 -666=.)
recode DaysBetweenVisits         (-999 -888 -666=.)
recode DaysToEvent               (-99999 -88888 -66666=.)
recode DIED                      (-9 -8 -6 -5=.)
recode DISPUB04                  (-9 -8 -6 -5=.)
recode DISPUNIFORM               (-9 -8 -6 -5=.)
recode DMONTH                    (-9 -8 -6 -5=.)
recode DNR                       (-9 -8 -6 -5=.)
recode DQTR                      (-9 -8 -6 -5=.)
recode DRG                       (-99 -88 -66=.)
recode DRG_NoPOA                 (-99 -88 -66=.)
recode DRGVER                    (-9 -8 -6 -5=.)
recode FEMALE                    (-9 -8 -6 -5=.)
recode HCUP_ED                   (-9 -8 -6 -5=.)
recode HCUP_OS                   (-9 -8 -6 -5=.)
recode HISPANIC                  (-9 -8 -6 -5=.)
recode Homeless                  (-9 -8 -6 -5=.)
recode I10_BIRTH                 (-99 -88 -66=.)
recode I10_DELIVERY              (-99 -88 -66=.)
recode I10_NDX                   (-99 -88 -66=.)
recode I10_NPR                   (-99 -88 -66=.)
recode I10_PROCTYPE              (-99 -88 -66=.)
recode I10_SERVICELINE           (-9 -8 -6 -5=.)
recode LOS                       (-9999 -8888 -6666=.)
recode LOS_X                     (-99999 -88888 -66666=.)
recode MDC                       (-9 -8 -6 -5=.)
recode MDC_NoPOA                 (-9 -8 -6 -5=.)
recode MEDINCSTQ                 (-9 -8 -6 -5=.)
recode OS_TIME                   (-9999999.99 -8888888.88 -6666666.66=.)
recode PAY1                      (-9 -8 -6 -5=.)
recode PAY2                      (-9 -8 -6 -5=.)
recode PCLASS_ORPROC             (-9 -8 -6 -5=.)
recode PL_CBSA                   (-99 -88 -66=.)
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
recode PRDAY14                   (-9999 -8888 -6666=.)
recode PRDAY15                   (-9999 -8888 -6666=.)
recode PRDAY16                   (-9999 -8888 -6666=.)
recode PRDAY17                   (-9999 -8888 -6666=.)
recode PRDAY18                   (-9999 -8888 -6666=.)
recode PRDAY19                   (-9999 -8888 -6666=.)
recode PRDAY20                   (-9999 -8888 -6666=.)
recode PRDAY21                   (-9999 -8888 -6666=.)
recode PRDAY22                   (-9999 -8888 -6666=.)
recode PRDAY23                   (-9999 -8888 -6666=.)
recode PRDAY24                   (-9999 -8888 -6666=.)
recode PRDAY25                   (-9999 -8888 -6666=.)
recode PRDAY26                   (-9999 -8888 -6666=.)
recode PRDAY27                   (-9999 -8888 -6666=.)
recode PRDAY28                   (-9999 -8888 -6666=.)
recode PRDAY29                   (-9999 -8888 -6666=.)
recode PRDAY30                   (-9999 -8888 -6666=.)
recode PRDAY31                   (-9999 -8888 -6666=.)
recode PRDAY32                   (-9999 -8888 -6666=.)
recode PRDAY33                   (-9999 -8888 -6666=.)
recode PRDAY34                   (-9999 -8888 -6666=.)
recode PRDAY35                   (-9999 -8888 -6666=.)
recode PRDAY36                   (-9999 -8888 -6666=.)
recode PRDAY37                   (-9999 -8888 -6666=.)
recode PRDAY38                   (-9999 -8888 -6666=.)
recode PRDAY39                   (-9999 -8888 -6666=.)
recode PRDAY40                   (-9999 -8888 -6666=.)
recode PRDAY41                   (-9999 -8888 -6666=.)
recode PRDAY42                   (-9999 -8888 -6666=.)
recode PRDAY43                   (-9999 -8888 -6666=.)
recode PRDAY44                   (-9999 -8888 -6666=.)
recode PRDAY45                   (-9999 -8888 -6666=.)
recode PRDAY46                   (-9999 -8888 -6666=.)
recode PRDAY47                   (-9999 -8888 -6666=.)
recode PRDAY48                   (-9999 -8888 -6666=.)
recode PRDAY49                   (-9999 -8888 -6666=.)
recode PRDAY50                   (-9999 -8888 -6666=.)
recode PRDAY51                   (-9999 -8888 -6666=.)
recode PRDAY52                   (-9999 -8888 -6666=.)
recode PRDAY53                   (-9999 -8888 -6666=.)
recode PRDAY54                   (-9999 -8888 -6666=.)
recode PRDAY55                   (-9999 -8888 -6666=.)
recode PRDAY56                   (-9999 -8888 -6666=.)
recode PRDAY57                   (-9999 -8888 -6666=.)
recode PRDAY58                   (-9999 -8888 -6666=.)
recode PRDAY59                   (-9999 -8888 -6666=.)
recode PRDAY60                   (-9999 -8888 -6666=.)
recode PRDAY61                   (-9999 -8888 -6666=.)
recode PRDAY62                   (-9999 -8888 -6666=.)
recode PRDAY63                   (-9999 -8888 -6666=.)
recode PRDAY64                   (-9999 -8888 -6666=.)
recode PRDAY65                   (-9999 -8888 -6666=.)
recode PRDAY66                   (-9999 -8888 -6666=.)
recode PRDAY67                   (-9999 -8888 -6666=.)
recode PRDAY68                   (-9999 -8888 -6666=.)
recode PRDAY69                   (-9999 -8888 -6666=.)
recode PRDAY70                   (-9999 -8888 -6666=.)
recode PRDAY71                   (-9999 -8888 -6666=.)
recode PRDAY72                   (-9999 -8888 -6666=.)
recode PRDAY73                   (-9999 -8888 -6666=.)
recode PRDAY74                   (-9999 -8888 -6666=.)
recode PRDAY75                   (-9999 -8888 -6666=.)
recode PRDAY76                   (-9999 -8888 -6666=.)
recode PRDAY77                   (-9999 -8888 -6666=.)
recode PRDAY78                   (-9999 -8888 -6666=.)
recode PRDAY79                   (-9999 -8888 -6666=.)
recode PRDAY80                   (-9999 -8888 -6666=.)
recode PRDAY81                   (-9999 -8888 -6666=.)
recode PRDAY82                   (-9999 -8888 -6666=.)
recode PRDAY83                   (-9999 -8888 -6666=.)
recode PRDAY84                   (-9999 -8888 -6666=.)
recode PRDAY85                   (-9999 -8888 -6666=.)
recode PRDAY86                   (-9999 -8888 -6666=.)
recode PRDAY87                   (-9999 -8888 -6666=.)
recode PRDAY88                   (-9999 -8888 -6666=.)
recode PRDAY89                   (-9999 -8888 -6666=.)
recode PRDAY90                   (-9999 -8888 -6666=.)
recode PRDAY91                   (-9999 -8888 -6666=.)
recode PRDAY92                   (-9999 -8888 -6666=.)
recode PRDAY93                   (-9999 -8888 -6666=.)
recode PRDAY94                   (-9999 -8888 -6666=.)
recode PRDAY95                   (-9999 -8888 -6666=.)
recode PRDAY96                   (-9999 -8888 -6666=.)
recode PRDAY97                   (-9999 -8888 -6666=.)
recode PRDAY98                   (-9999 -8888 -6666=.)
recode PRDAY99                   (-9999 -8888 -6666=.)
recode PRDAY100                  (-9999 -8888 -6666=.)
recode PRDAY101                  (-9999 -8888 -6666=.)
recode PRDAY102                  (-9999 -8888 -6666=.)
recode PRDAY103                  (-9999 -8888 -6666=.)
recode PRDAY104                  (-9999 -8888 -6666=.)
recode PRDAY105                  (-9999 -8888 -6666=.)
recode PRDAY106                  (-9999 -8888 -6666=.)
recode PRDAY107                  (-9999 -8888 -6666=.)
recode PRDAY108                  (-9999 -8888 -6666=.)
recode PRDAY109                  (-9999 -8888 -6666=.)
recode PRDAY110                  (-9999 -8888 -6666=.)
recode PRDAY111                  (-9999 -8888 -6666=.)
recode PRDAY112                  (-9999 -8888 -6666=.)
recode PRDAY113                  (-9999 -8888 -6666=.)
recode PRDAY114                  (-9999 -8888 -6666=.)
recode PRDAY115                  (-9999 -8888 -6666=.)
recode PRDAY116                  (-9999 -8888 -6666=.)
recode PRDAY117                  (-9999 -8888 -6666=.)
recode PRDAY118                  (-9999 -8888 -6666=.)
recode PRDAY119                  (-9999 -8888 -6666=.)
recode PRDAY120                  (-9999 -8888 -6666=.)
recode PRDAY121                  (-9999 -8888 -6666=.)
recode PRDAY122                  (-9999 -8888 -6666=.)
recode PRDAY123                  (-9999 -8888 -6666=.)
recode PRDAY124                  (-9999 -8888 -6666=.)
recode PRDAY125                  (-9999 -8888 -6666=.)
recode PRDAY126                  (-9999 -8888 -6666=.)
recode PRDAY127                  (-9999 -8888 -6666=.)
recode PRDAY128                  (-9999 -8888 -6666=.)
recode PRDAY129                  (-9999 -8888 -6666=.)
recode PRDAY130                  (-9999 -8888 -6666=.)
recode PRDAY131                  (-9999 -8888 -6666=.)
recode PRDAY132                  (-9999 -8888 -6666=.)
recode PRDAY133                  (-9999 -8888 -6666=.)
recode PRDAY134                  (-9999 -8888 -6666=.)
recode PRDAY135                  (-9999 -8888 -6666=.)
recode PRDAY136                  (-9999 -8888 -6666=.)
recode PRDAY137                  (-9999 -8888 -6666=.)
recode PRDAY138                  (-9999 -8888 -6666=.)
recode PRDAY139                  (-9999 -8888 -6666=.)
recode PRDAY140                  (-9999 -8888 -6666=.)
recode PRDAY141                  (-9999 -8888 -6666=.)
recode PRDAY142                  (-9999 -8888 -6666=.)
recode PRDAY143                  (-9999 -8888 -6666=.)
recode PRDAY144                  (-9999 -8888 -6666=.)
recode PRDAY145                  (-9999 -8888 -6666=.)
recode PRDAY146                  (-9999 -8888 -6666=.)
recode PRDAY147                  (-9999 -8888 -6666=.)
recode PRDAY148                  (-9999 -8888 -6666=.)
recode PRDAY149                  (-9999 -8888 -6666=.)
recode PRDAY150                  (-9999 -8888 -6666=.)
recode PRDAY151                  (-9999 -8888 -6666=.)
recode PRDAY152                  (-9999 -8888 -6666=.)
recode PRDAY153                  (-9999 -8888 -6666=.)
recode PRDAY154                  (-9999 -8888 -6666=.)
recode PRDAY155                  (-9999 -8888 -6666=.)
recode PRDAY156                  (-9999 -8888 -6666=.)
recode PRDAY157                  (-9999 -8888 -6666=.)
recode PRDAY158                  (-9999 -8888 -6666=.)
recode PRDAY159                  (-9999 -8888 -6666=.)
recode PRDAY160                  (-9999 -8888 -6666=.)
recode PRDAY161                  (-9999 -8888 -6666=.)
recode PRDAY162                  (-9999 -8888 -6666=.)
recode PRDAY163                  (-9999 -8888 -6666=.)
recode PRDAY164                  (-9999 -8888 -6666=.)
recode PRDAY165                  (-9999 -8888 -6666=.)
recode PRDAY166                  (-9999 -8888 -6666=.)
recode PRDAY167                  (-9999 -8888 -6666=.)
recode PRDAY168                  (-9999 -8888 -6666=.)
recode PSTCO_GEO                 (-9999 -8888 -6666=.)
recode RACE                      (-9 -8 -6 -5=.)
recode RACE_PCT_MISS_HOSP        (-999.99 -888.88 -666.66=.)
recode TOTCHG                    (-999999999 -888888888 -666666666=.)
recode TOTCHG_X                  (-99999999999.99 -88888888888.88 -66666666666.66=.)
recode TRAN_IN                   (-9 -8 -6 -5=.)
recode TRAN_OUT                  (-9 -8 -6 -5=.)
recode VisitLink                 (-99999999 -88888888 -66666666=.)
recode YEAR                      (-999 -888 -666=.)
recode ZIPINC_QRTL               (-99 -88 -66=.)
recode AYEAR                     (-999 -888 -666=.)
recode PRMONTH1                  (-9 -8 -6 -5=.)
recode PRMONTH2                  (-9 -8 -6 -5=.)
recode PRMONTH3                  (-9 -8 -6 -5=.)
recode PRMONTH4                  (-9 -8 -6 -5=.)
recode PRMONTH5                  (-9 -8 -6 -5=.)
recode PRMONTH6                  (-9 -8 -6 -5=.)
recode PRMONTH7                  (-9 -8 -6 -5=.)
recode PRMONTH8                  (-9 -8 -6 -5=.)
recode PRMONTH9                  (-9 -8 -6 -5=.)
recode PRMONTH10                 (-9 -8 -6 -5=.)
recode PRMONTH11                 (-9 -8 -6 -5=.)
recode PRMONTH12                 (-9 -8 -6 -5=.)
recode PRMONTH13                 (-9 -8 -6 -5=.)
recode PRMONTH14                 (-9 -8 -6 -5=.)
recode PRMONTH15                 (-9 -8 -6 -5=.)
recode PRMONTH16                 (-9 -8 -6 -5=.)
recode PRMONTH17                 (-9 -8 -6 -5=.)
recode PRMONTH18                 (-9 -8 -6 -5=.)
recode PRMONTH19                 (-9 -8 -6 -5=.)
recode PRMONTH20                 (-9 -8 -6 -5=.)
recode PRMONTH21                 (-9 -8 -6 -5=.)
recode PRMONTH22                 (-9 -8 -6 -5=.)
recode PRMONTH23                 (-9 -8 -6 -5=.)
recode PRMONTH24                 (-9 -8 -6 -5=.)
recode PRMONTH25                 (-9 -8 -6 -5=.)
recode PRMONTH26                 (-9 -8 -6 -5=.)
recode PRMONTH27                 (-9 -8 -6 -5=.)
recode PRMONTH28                 (-9 -8 -6 -5=.)
recode PRMONTH29                 (-9 -8 -6 -5=.)
recode PRMONTH30                 (-9 -8 -6 -5=.)
recode PRMONTH31                 (-9 -8 -6 -5=.)
recode PRMONTH32                 (-9 -8 -6 -5=.)
recode PRMONTH33                 (-9 -8 -6 -5=.)
recode PRMONTH34                 (-9 -8 -6 -5=.)
recode PRMONTH35                 (-9 -8 -6 -5=.)
recode PRMONTH36                 (-9 -8 -6 -5=.)
recode PRMONTH37                 (-9 -8 -6 -5=.)
recode PRMONTH38                 (-9 -8 -6 -5=.)
recode PRMONTH39                 (-9 -8 -6 -5=.)
recode PRMONTH40                 (-9 -8 -6 -5=.)
recode PRMONTH41                 (-9 -8 -6 -5=.)
recode PRMONTH42                 (-9 -8 -6 -5=.)
recode PRMONTH43                 (-9 -8 -6 -5=.)
recode PRMONTH44                 (-9 -8 -6 -5=.)
recode PRMONTH45                 (-9 -8 -6 -5=.)
recode PRMONTH46                 (-9 -8 -6 -5=.)
recode PRMONTH47                 (-9 -8 -6 -5=.)
recode PRMONTH48                 (-9 -8 -6 -5=.)
recode PRMONTH49                 (-9 -8 -6 -5=.)
recode PRMONTH50                 (-9 -8 -6 -5=.)
recode PRMONTH51                 (-9 -8 -6 -5=.)
recode PRMONTH52                 (-9 -8 -6 -5=.)
recode PRMONTH53                 (-9 -8 -6 -5=.)
recode PRMONTH54                 (-9 -8 -6 -5=.)
recode PRMONTH55                 (-9 -8 -6 -5=.)
recode PRMONTH56                 (-9 -8 -6 -5=.)
recode PRMONTH57                 (-9 -8 -6 -5=.)
recode PRMONTH58                 (-9 -8 -6 -5=.)
recode PRMONTH59                 (-9 -8 -6 -5=.)
recode PRMONTH60                 (-9 -8 -6 -5=.)
recode PRMONTH61                 (-9 -8 -6 -5=.)
recode PRMONTH62                 (-9 -8 -6 -5=.)
recode PRMONTH63                 (-9 -8 -6 -5=.)
recode PRMONTH64                 (-9 -8 -6 -5=.)
recode PRMONTH65                 (-9 -8 -6 -5=.)
recode PRMONTH66                 (-9 -8 -6 -5=.)
recode PRMONTH67                 (-9 -8 -6 -5=.)
recode PRMONTH68                 (-9 -8 -6 -5=.)
recode PRMONTH69                 (-9 -8 -6 -5=.)
recode PRMONTH70                 (-9 -8 -6 -5=.)
recode PRMONTH71                 (-9 -8 -6 -5=.)
recode PRMONTH72                 (-9 -8 -6 -5=.)
recode PRMONTH73                 (-9 -8 -6 -5=.)
recode PRMONTH74                 (-9 -8 -6 -5=.)
recode PRMONTH75                 (-9 -8 -6 -5=.)
recode PRMONTH76                 (-9 -8 -6 -5=.)
recode PRMONTH77                 (-9 -8 -6 -5=.)
recode PRMONTH78                 (-9 -8 -6 -5=.)
recode PRMONTH79                 (-9 -8 -6 -5=.)
recode PRMONTH80                 (-9 -8 -6 -5=.)
recode PRMONTH81                 (-9 -8 -6 -5=.)
recode PRMONTH82                 (-9 -8 -6 -5=.)
recode PRMONTH83                 (-9 -8 -6 -5=.)
recode PRMONTH84                 (-9 -8 -6 -5=.)
recode PRMONTH85                 (-9 -8 -6 -5=.)
recode PRMONTH86                 (-9 -8 -6 -5=.)
recode PRMONTH87                 (-9 -8 -6 -5=.)
recode PRMONTH88                 (-9 -8 -6 -5=.)
recode PRMONTH89                 (-9 -8 -6 -5=.)
recode PRMONTH90                 (-9 -8 -6 -5=.)
recode PRMONTH91                 (-9 -8 -6 -5=.)
recode PRMONTH92                 (-9 -8 -6 -5=.)
recode PRMONTH93                 (-9 -8 -6 -5=.)
recode PRMONTH94                 (-9 -8 -6 -5=.)
recode PRMONTH95                 (-9 -8 -6 -5=.)
recode PRMONTH96                 (-9 -8 -6 -5=.)
recode PRMONTH97                 (-9 -8 -6 -5=.)
recode PRMONTH98                 (-9 -8 -6 -5=.)
recode PRMONTH99                 (-9 -8 -6 -5=.)
recode PRMONTH100                (-9 -8 -6 -5=.)
recode PRMONTH101                (-9 -8 -6 -5=.)
recode PRMONTH102                (-9 -8 -6 -5=.)
recode PRMONTH103                (-9 -8 -6 -5=.)
recode PRMONTH104                (-9 -8 -6 -5=.)
recode PRMONTH105                (-9 -8 -6 -5=.)
recode PRMONTH106                (-9 -8 -6 -5=.)
recode PRMONTH107                (-9 -8 -6 -5=.)
recode PRMONTH108                (-9 -8 -6 -5=.)
recode PRMONTH109                (-9 -8 -6 -5=.)
recode PRMONTH110                (-9 -8 -6 -5=.)
recode PRMONTH111                (-9 -8 -6 -5=.)
recode PRMONTH112                (-9 -8 -6 -5=.)
recode PRMONTH113                (-9 -8 -6 -5=.)
recode PRMONTH114                (-9 -8 -6 -5=.)
recode PRMONTH115                (-9 -8 -6 -5=.)
recode PRMONTH116                (-9 -8 -6 -5=.)
recode PRMONTH117                (-9 -8 -6 -5=.)
recode PRMONTH118                (-9 -8 -6 -5=.)
recode PRMONTH119                (-9 -8 -6 -5=.)
recode PRMONTH120                (-9 -8 -6 -5=.)
recode PRMONTH121                (-9 -8 -6 -5=.)
recode PRMONTH122                (-9 -8 -6 -5=.)
recode PRMONTH123                (-9 -8 -6 -5=.)
recode PRMONTH124                (-9 -8 -6 -5=.)
recode PRMONTH125                (-9 -8 -6 -5=.)
recode PRMONTH126                (-9 -8 -6 -5=.)
recode PRMONTH127                (-9 -8 -6 -5=.)
recode PRMONTH128                (-9 -8 -6 -5=.)
recode PRMONTH129                (-9 -8 -6 -5=.)
recode PRMONTH130                (-9 -8 -6 -5=.)
recode PRMONTH131                (-9 -8 -6 -5=.)
recode PRMONTH132                (-9 -8 -6 -5=.)
recode PRMONTH133                (-9 -8 -6 -5=.)
recode PRMONTH134                (-9 -8 -6 -5=.)
recode PRMONTH135                (-9 -8 -6 -5=.)
recode PRMONTH136                (-9 -8 -6 -5=.)
recode PRMONTH137                (-9 -8 -6 -5=.)
recode PRMONTH138                (-9 -8 -6 -5=.)
recode PRMONTH139                (-9 -8 -6 -5=.)
recode PRMONTH140                (-9 -8 -6 -5=.)
recode PRMONTH141                (-9 -8 -6 -5=.)
recode PRMONTH142                (-9 -8 -6 -5=.)
recode PRMONTH143                (-9 -8 -6 -5=.)
recode PRMONTH144                (-9 -8 -6 -5=.)
recode PRMONTH145                (-9 -8 -6 -5=.)
recode PRMONTH146                (-9 -8 -6 -5=.)
recode PRMONTH147                (-9 -8 -6 -5=.)
recode PRMONTH148                (-9 -8 -6 -5=.)
recode PRMONTH149                (-9 -8 -6 -5=.)
recode PRMONTH150                (-9 -8 -6 -5=.)
recode PRMONTH151                (-9 -8 -6 -5=.)
recode PRMONTH152                (-9 -8 -6 -5=.)
recode PRMONTH153                (-9 -8 -6 -5=.)
recode PRMONTH154                (-9 -8 -6 -5=.)
recode PRMONTH155                (-9 -8 -6 -5=.)
recode PRMONTH156                (-9 -8 -6 -5=.)
recode PRMONTH157                (-9 -8 -6 -5=.)
recode PRMONTH158                (-9 -8 -6 -5=.)
recode PRMONTH159                (-9 -8 -6 -5=.)
recode PRMONTH160                (-9 -8 -6 -5=.)
recode PRMONTH161                (-9 -8 -6 -5=.)
recode PRMONTH162                (-9 -8 -6 -5=.)
recode PRMONTH163                (-9 -8 -6 -5=.)
recode PRMONTH164                (-9 -8 -6 -5=.)
recode PRMONTH165                (-9 -8 -6 -5=.)
recode PRMONTH166                (-9 -8 -6 -5=.)
recode PRMONTH167                (-9 -8 -6 -5=.)
recode PRMONTH168                (-9 -8 -6 -5=.)
recode PRYEAR1                   (-999 -888 -666=.)
recode PRYEAR2                   (-999 -888 -666=.)
recode PRYEAR3                   (-999 -888 -666=.)
recode PRYEAR4                   (-999 -888 -666=.)
recode PRYEAR5                   (-999 -888 -666=.)
recode PRYEAR6                   (-999 -888 -666=.)
recode PRYEAR7                   (-999 -888 -666=.)
recode PRYEAR8                   (-999 -888 -666=.)
recode PRYEAR9                   (-999 -888 -666=.)
recode PRYEAR10                  (-999 -888 -666=.)
recode PRYEAR11                  (-999 -888 -666=.)
recode PRYEAR12                  (-999 -888 -666=.)
recode PRYEAR13                  (-999 -888 -666=.)
recode PRYEAR14                  (-999 -888 -666=.)
recode PRYEAR15                  (-999 -888 -666=.)
recode PRYEAR16                  (-999 -888 -666=.)
recode PRYEAR17                  (-999 -888 -666=.)
recode PRYEAR18                  (-999 -888 -666=.)
recode PRYEAR19                  (-999 -888 -666=.)
recode PRYEAR20                  (-999 -888 -666=.)
recode PRYEAR21                  (-999 -888 -666=.)
recode PRYEAR22                  (-999 -888 -666=.)
recode PRYEAR23                  (-999 -888 -666=.)
recode PRYEAR24                  (-999 -888 -666=.)
recode PRYEAR25                  (-999 -888 -666=.)
recode PRYEAR26                  (-999 -888 -666=.)
recode PRYEAR27                  (-999 -888 -666=.)
recode PRYEAR28                  (-999 -888 -666=.)
recode PRYEAR29                  (-999 -888 -666=.)
recode PRYEAR30                  (-999 -888 -666=.)
recode PRYEAR31                  (-999 -888 -666=.)
recode PRYEAR32                  (-999 -888 -666=.)
recode PRYEAR33                  (-999 -888 -666=.)
recode PRYEAR34                  (-999 -888 -666=.)
recode PRYEAR35                  (-999 -888 -666=.)
recode PRYEAR36                  (-999 -888 -666=.)
recode PRYEAR37                  (-999 -888 -666=.)
recode PRYEAR38                  (-999 -888 -666=.)
recode PRYEAR39                  (-999 -888 -666=.)
recode PRYEAR40                  (-999 -888 -666=.)
recode PRYEAR41                  (-999 -888 -666=.)
recode PRYEAR42                  (-999 -888 -666=.)
recode PRYEAR43                  (-999 -888 -666=.)
recode PRYEAR44                  (-999 -888 -666=.)
recode PRYEAR45                  (-999 -888 -666=.)
recode PRYEAR46                  (-999 -888 -666=.)
recode PRYEAR47                  (-999 -888 -666=.)
recode PRYEAR48                  (-999 -888 -666=.)
recode PRYEAR49                  (-999 -888 -666=.)
recode PRYEAR50                  (-999 -888 -666=.)
recode PRYEAR51                  (-999 -888 -666=.)
recode PRYEAR52                  (-999 -888 -666=.)
recode PRYEAR53                  (-999 -888 -666=.)
recode PRYEAR54                  (-999 -888 -666=.)
recode PRYEAR55                  (-999 -888 -666=.)
recode PRYEAR56                  (-999 -888 -666=.)
recode PRYEAR57                  (-999 -888 -666=.)
recode PRYEAR58                  (-999 -888 -666=.)
recode PRYEAR59                  (-999 -888 -666=.)
recode PRYEAR60                  (-999 -888 -666=.)
recode PRYEAR61                  (-999 -888 -666=.)
recode PRYEAR62                  (-999 -888 -666=.)
recode PRYEAR63                  (-999 -888 -666=.)
recode PRYEAR64                  (-999 -888 -666=.)
recode PRYEAR65                  (-999 -888 -666=.)
recode PRYEAR66                  (-999 -888 -666=.)
recode PRYEAR67                  (-999 -888 -666=.)
recode PRYEAR68                  (-999 -888 -666=.)
recode PRYEAR69                  (-999 -888 -666=.)
recode PRYEAR70                  (-999 -888 -666=.)
recode PRYEAR71                  (-999 -888 -666=.)
recode PRYEAR72                  (-999 -888 -666=.)
recode PRYEAR73                  (-999 -888 -666=.)
recode PRYEAR74                  (-999 -888 -666=.)
recode PRYEAR75                  (-999 -888 -666=.)
recode PRYEAR76                  (-999 -888 -666=.)
recode PRYEAR77                  (-999 -888 -666=.)
recode PRYEAR78                  (-999 -888 -666=.)
recode PRYEAR79                  (-999 -888 -666=.)
recode PRYEAR80                  (-999 -888 -666=.)
recode PRYEAR81                  (-999 -888 -666=.)
recode PRYEAR82                  (-999 -888 -666=.)
recode PRYEAR83                  (-999 -888 -666=.)
recode PRYEAR84                  (-999 -888 -666=.)
recode PRYEAR85                  (-999 -888 -666=.)
recode PRYEAR86                  (-999 -888 -666=.)
recode PRYEAR87                  (-999 -888 -666=.)
recode PRYEAR88                  (-999 -888 -666=.)
recode PRYEAR89                  (-999 -888 -666=.)
recode PRYEAR90                  (-999 -888 -666=.)
recode PRYEAR91                  (-999 -888 -666=.)
recode PRYEAR92                  (-999 -888 -666=.)
recode PRYEAR93                  (-999 -888 -666=.)
recode PRYEAR94                  (-999 -888 -666=.)
recode PRYEAR95                  (-999 -888 -666=.)
recode PRYEAR96                  (-999 -888 -666=.)
recode PRYEAR97                  (-999 -888 -666=.)
recode PRYEAR98                  (-999 -888 -666=.)
recode PRYEAR99                  (-999 -888 -666=.)
recode PRYEAR100                 (-999 -888 -666=.)
recode PRYEAR101                 (-999 -888 -666=.)
recode PRYEAR102                 (-999 -888 -666=.)
recode PRYEAR103                 (-999 -888 -666=.)
recode PRYEAR104                 (-999 -888 -666=.)
recode PRYEAR105                 (-999 -888 -666=.)
recode PRYEAR106                 (-999 -888 -666=.)
recode PRYEAR107                 (-999 -888 -666=.)
recode PRYEAR108                 (-999 -888 -666=.)
recode PRYEAR109                 (-999 -888 -666=.)
recode PRYEAR110                 (-999 -888 -666=.)
recode PRYEAR111                 (-999 -888 -666=.)
recode PRYEAR112                 (-999 -888 -666=.)
recode PRYEAR113                 (-999 -888 -666=.)
recode PRYEAR114                 (-999 -888 -666=.)
recode PRYEAR115                 (-999 -888 -666=.)
recode PRYEAR116                 (-999 -888 -666=.)
recode PRYEAR117                 (-999 -888 -666=.)
recode PRYEAR118                 (-999 -888 -666=.)
recode PRYEAR119                 (-999 -888 -666=.)
recode PRYEAR120                 (-999 -888 -666=.)
recode PRYEAR121                 (-999 -888 -666=.)
recode PRYEAR122                 (-999 -888 -666=.)
recode PRYEAR123                 (-999 -888 -666=.)
recode PRYEAR124                 (-999 -888 -666=.)
recode PRYEAR125                 (-999 -888 -666=.)
recode PRYEAR126                 (-999 -888 -666=.)
recode PRYEAR127                 (-999 -888 -666=.)
recode PRYEAR128                 (-999 -888 -666=.)
recode PRYEAR129                 (-999 -888 -666=.)
recode PRYEAR130                 (-999 -888 -666=.)
recode PRYEAR131                 (-999 -888 -666=.)
recode PRYEAR132                 (-999 -888 -666=.)
recode PRYEAR133                 (-999 -888 -666=.)
recode PRYEAR134                 (-999 -888 -666=.)
recode PRYEAR135                 (-999 -888 -666=.)
recode PRYEAR136                 (-999 -888 -666=.)
recode PRYEAR137                 (-999 -888 -666=.)
recode PRYEAR138                 (-999 -888 -666=.)
recode PRYEAR139                 (-999 -888 -666=.)
recode PRYEAR140                 (-999 -888 -666=.)
recode PRYEAR141                 (-999 -888 -666=.)
recode PRYEAR142                 (-999 -888 -666=.)
recode PRYEAR143                 (-999 -888 -666=.)
recode PRYEAR144                 (-999 -888 -666=.)
recode PRYEAR145                 (-999 -888 -666=.)
recode PRYEAR146                 (-999 -888 -666=.)
recode PRYEAR147                 (-999 -888 -666=.)
recode PRYEAR148                 (-999 -888 -666=.)
recode PRYEAR149                 (-999 -888 -666=.)
recode PRYEAR150                 (-999 -888 -666=.)
recode PRYEAR151                 (-999 -888 -666=.)
recode PRYEAR152                 (-999 -888 -666=.)
recode PRYEAR153                 (-999 -888 -666=.)
recode PRYEAR154                 (-999 -888 -666=.)
recode PRYEAR155                 (-999 -888 -666=.)
recode PRYEAR156                 (-999 -888 -666=.)
recode PRYEAR157                 (-999 -888 -666=.)
recode PRYEAR158                 (-999 -888 -666=.)
recode PRYEAR159                 (-999 -888 -666=.)
recode PRYEAR160                 (-999 -888 -666=.)
recode PRYEAR161                 (-999 -888 -666=.)
recode PRYEAR162                 (-999 -888 -666=.)
recode PRYEAR163                 (-999 -888 -666=.)
recode PRYEAR164                 (-999 -888 -666=.)
recode PRYEAR165                 (-999 -888 -666=.)
recode PRYEAR166                 (-999 -888 -666=.)
recode PRYEAR167                 (-999 -888 -666=.)
recode PRYEAR168                 (-999 -888 -666=.)

save "MA_SID_2020_CORE.dta", replace
