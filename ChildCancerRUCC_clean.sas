*---
#PROLOG   ###############################################################

#PROJECT: Rural/urban residence and childhood and adolescent cancer survival in 
the United States
#PURPOSE: Association between rural/urban residence and childhood cancer 
survival 
#DATA:    SEER 18 Registries
#AUTHOR:  Arash Delavar
#CREATED: December 4th, 2017
#LATEST:  April 24th, 2018
#NOTES:   This code was written to perform statistical analysis for a study 
titled "Rural/urban residence and childhood and adolescent cancer survival in 
the United States"

#PROLOG   ###############################################################
---;

*Import data;
filename in1 '/folders/myfolders/mylib/2015SEER3.txt';
proc format;
  value Sexf
    1 = "Male"
    2 = "Female"
    ;
  value SEERcausespecificdeathclassifif
    0 = "Alive or dead of other cause"
    1 = "Dead (attributable to this cancer dx)"
    8 = "Dead (missing/unknown COD)"
    9 = "N/A not first tumor"
    ;
  value RaceandoriginrecodeNHWNHBNHAIAf
    1 = "Non-Hispanic White"
    2 = "Non-Hispanic Black"
    3 = "Non-Hispanic American Indian/Alaska Native"
    4 = "Non-Hispanic Asian or Pacific Islander"
    5 = "Hispanic (All Races)"
    9 = "Non-Hispanic Unknown Race"
    ;
  value ICCCsiterecextendedICDO3WHO200f
    1 = "I(a.1) Precursor cell leukemias"
    2 = "I(a.2) Mature B-cell leukemias"
    3 = "I(a.3) Mature T-cell and NK cell leukemias"
    4 = "I(a.4) Lymphoid leukemia, NOS"
    5 = "I(b) Acute myeloid leukemias"
    6 = "I(c) Chronic myeloproliferative diseases"
    7 = "I(d) Myelodysplastic syndrome and other myeloproliferative"
    8 = "I(e) Unspecified and other specified leukemias"
    9 = "II(a) Hodgkin lymphomas"
    10 = "II(b.1) Precursor cell lymphomas"
    11 = "II(b.2) Mature B-cell lymphomas except Burkitt lymphoma"
    12 = "II(b.3) Mature T-cell and NK-cell lymphomas"
    13 = "II(b.4) Non-Hodgkin lymphomas, NOS"
    14 = "II(c) Burkitt lymphoma"
    15 = "II(d) Miscellaneous lymphoreticular neoplasms"
    16 = "II(e) Unspecified lymphomas"
    17 = "III(a.1) Ependymomas"
    18 = "III(a.2) Choroid plexus tumor"
    19 = "III(b) Astrocytomas"
    20 = "III(c.1) Medulloblastomas"
    21 = "III(c.2) PNET"
    22 = "III(c.3) Medulloepithelioma"
    23 = "III(c.4) Atypical teratoid/rhabdoid tumor"
    24 = "III(d.1) Oligodendrogliomas"
    25 = "III(d.2) Mixed and unspecified gliomas"
    26 = "III(d.3) Neuroepithelial glial tumors of uncertain orig"
    27 = "III(e.1) Pituitary adenomas and carcinomas"
    28 = "III(e.2) Tumors of sellar region (craniopharyngiomas)"
    29 = "III(e.3) Pineal parenchymal tumors"
    30 = "III(e.4) Neuronal and mixed neuronal-glial tumors"
    31 = "III(e.5) Meningiomas"
    32 = "III(f) Unspecified intracranial and intraspinal neoplasms"
    33 = "IV(a) Neuroblastoma and ganglioneuroblastoma"
    34 = "IV(b) Other peripheral nervous cell tumors"
    35 = "V Retinoblastoma"
    36 = "VI(a.1) Nephroblastoma"
    37 = "VI(a.2) Rhabdoid renal tumor"
    38 = "VI(a.3) Kidney sarcomas"
    39 = "VI(a.4) pPNET of kidney"
    40 = "VI(b) Renal carcinomas"
    41 = "VI(c) Unspecified malignant renal tumors"
    42 = "VII(a) Hepatoblastoma"
    43 = "VII(b) Hepatic carcinomas"
    44 = "VII(c) Unspecified malignant hepatic tumors"
    45 = "VIII(a) Osteosarcomas"
    46 = "VIII(b) Chondrosarcomas"
    47 = "VIII(c.1) Ewing tumor and Askin tumor of bone"
    48 = "VIII(c.2) pPNET of bone"
    49 = "VIII(d.1) Malignant fibrous neoplasms of bone"
    50 = "VIII(d.2) Malignant chordomas"
    51 = "VIII(d.3) Odontogenic malignant tumors"
    52 = "VIII(d.4) Miscellaneous malignant bone tumors"
    53 = "VIII(e) Unspecified malignant bone tumors"
    54 = "IX(a) Rhabdomyosarcomas"
    55 = "IX(b.1) Fibroblastic and myofibroblastic tumors"
    56 = "IX(b.2) Nerve sheath tumors"
    57 = "IX(b.3) Other fibromatous neoplasms"
    58 = "IX(c) Kaposi sarcoma"
    59 = "IX(d.1) Ewing tumor and Askin tumor of soft tissue"
    60 = "IX(d.2) pPNET of soft tissue"
    61 = "IX(d.3) Extrarenal rhabdoid tumor"
    62 = "IX(d.4) Liposarcomas"
    63 = "IX(d.5) Fibrohistiocytic tumors"
    64 = "IX(d.6) Leiomyosarcomas"
    65 = "IX(d.7) Synovial sarcomas"
    66 = "IX(d.8) Blood vessel tumors"
    67 = "IX(d.9) Osseous & chondromatous neoplasms of soft tissue"
    68 = "IX(d.10) Alveolar soft parts sarcoma"
    69 = "IX(d.11) Miscellaneous soft tissue sarcomas"
    70 = "IX(e) Unspecified soft tissue sarcomas"
    71 = "X(a.1) Intracranial & intraspinal germinomas"
    72 = "X(a.2) Intracranial & intraspinal teratomas"
    73 = "X(a.3) Intracranial & intraspinal embryonal carcinomas"
    74 = "X(a.4) Intracranial & intraspinal yolk sac tumor"
    75 = "X(a.5) Intracranial & intraspinal choriocarcinoma"
    76 = "X(a.6) Intracranial & intraspinal tumors of mixed forms"
    77 = "X(b.1) Germinomas: extracranial/extragonadal"
    78 = "X(b.2) Malignant teratomas: extracranial/extragonadal"
    79 = "X(b.3) Embryonal carcinomas: extracranial/extragonadal"
    80 = "X(b.4) Yolk sac tumor: extracranial/extragonadal"
    81 = "X(b.5) Choriocarcinomas: extracranial/extragonadal"
    82 = "X(b.6) Other mixed germ cell: extracranial/extragonadal"
    83 = "X(c.1) Malignant gonadal germinomas"
    84 = "X(c.2) Malignant gonadal teratomas"
    85 = "X(c.3) Gonadal embryonal carcinomas"
    86 = "X(c.4) Gonadal yolk sac tumor"
    87 = "X(c.5) Gonadal choriocarcinoma"
    88 = "X(c.6) Malignant gonadal tumors of mixed forms"
    89 = "X(c.7) Malignant gonadal gonadoblastoma"
    90 = "X(d) Gonadal carcinomas"
    91 = "X(e) Other and unspecified malignant gonadal tumors"
    92 = "XI(a) Adrenocortical carcinomas"
    93 = "XI(b) Thyroid carcinomas"
    94 = "XI(c) Nasopharyngeal carcinomas"
    95 = "XI(d) Malignant melanomas"
    96 = "XI(e) Skin carcinomas"
    97 = "XI(f.1) Carcinomas of salivary glands"
    98 = "XI(f.2) Carcinomas of colon and rectum"
    99 = "XI(f.3) Carcinomas of appendix"
    100 = "XI(f.4) Carcinomas of lung"
    101 = "XI(f.5) Carcinomas of thymus"
    102 = "XI(f.6) Carcinomas of breast"
    103 = "XI(f.7) Carcinomas of cervix uteri"
    104 = "XI(f.8) Carcinomas of bladder"
    105 = "XI(f.9) Carcinomas of eye"
    106 = "XI(f.10) Carcinomas of other specified sites"
    107 = "XI(f.11) Carcinomas of unspecified site"
    108 = "XII(a.1) Gastrointestinal stromal tumor"
    109 = "XII(a.2) Pancreatoblastoma"
    110 = "XII(a.3) Pulmonary blastoma and pleuropulmonary blastoma"
    111 = "XII(a.4) Other complex mixed and stromal neoplasms"
    112 = "XII(a.5) Mesothelioma"
    113 = "XII(a.6) Other specified malignant tumors"
    114 = "XII(b) Other unspecified malignant tumors"
    253 = "Not classified by ICCC or in situ"
    ;
  value RuralUrban_Continuum_Code_2003f
    1 = "Counties in metropolitan areas ge 1 million pop"
    2 = "Counties in metropolitan areas of 250,000 to 1 million pop"
    3 = "Counties in metropolitan areas of lt 250 thousand pop"
    4 = "Urban pop of ge 20,000 adjacent to a metropolitan area"
    5 = "Urban pop of ge 20,000 not adjacent to a metropolitan area"
    6 = "Urban pop of 2,500 to 19,999, adjacent to a metro area"
    7 = "Urban pop of 2,500 to 19,999, not adjacent to a metro area"
    8 = "Comp rural lt 2,500 urban pop, adjacent to a metro area"
    9 = "Comp rural lt 2,500 urban pop, not adjacent to metro area"
    88 = "Unknown/missing/no match (Alaska or Hawaii - Entire State)"
    99 = "Unknown/missing/no match"
    ;
      value Year_of_diagnosisf
    173 = "1973"
    174 = "1974"
    175 = "1975"
    176 = "1976"
    177 = "1977"
    178 = "1978"
    179 = "1979"
    180 = "1980"
    181 = "1981"
    182 = "1982"
    183 = "1983"
    184 = "1984"
    185 = "1985"
    186 = "1986"
    187 = "1987"
    188 = "1988"
    189 = "1989"
    190 = "1990"
    191 = "1991"
    192 = "1992"
    193 = "1993"
    194 = "1994"
    195 = "1995"
    196 = "1996"
    197 = "1997"
    198 = "1998"
    199 = "1999"
    200 = "2000"
    201 = "2001"
    202 = "2002"
    203 = "2003"
    204 = "2004"
    205 = "2005"
    206 = "2006"
    207 = "2007"
    208 = "2008"
    209 = "2009"
    210 = "2010"
    211 = "2011"
    212 = "2012"
    213 = "2013"
    214 = "2014"
    215 = "2015"
    ;
run;
data use;
  /*NOTE: The data file was created using the Windows format line delimiter.*/
  /*The TERMSTR=CRLF input option for reading the file in UNIX, requires SAS 
  version 9.*/
  infile in1 LRECL = 32000 delimiter = '09'X TERMSTR = CRLF;
  input Patient_ID
    Sex
    Year_of_birth
    Year_of_diagnosis
    age_at_diagnosis
    SEERcausespecificdeathclassifi
    Survival_months
    RaceandoriginrecodeNHWNHBNHAIA
    ICCCsiterecextendedICDO3WHO200
    RuralUrban_Continuum_Code_2003
    Medianfamily_incomein_tens_2000
    V_High_school_education_2000
    Insurance_Recode_2007
    ;
  label Patient_ID = "Patient ID"
    Sex = "Sex"
    Year_of_birth = "Year of birth"
    Year_of_diagnosis = "Year of diagnosis"
    age_at_diagnosis = "Age at diagnosis"
    SEERcausespecificdeathclassifi = "SEER cause-specific death classification"
    Survival_months = "Survival months"
    RaceandoriginrecodeNHWNHBNHAIA = "Race and origin recode (NHW, NHB, NHAIAN"
    ICCCsiterecextendedICDO3WHO200 = "ICCC site rec extended ICD-O-3/WHO 2008"
    RuralUrban_Continuum_Code_2003 = "Rural-Urban Continuum Code 2003"
    Medianfamily_incomein_tens_2000 = "Median family income (in tens) 2000"
    V_High_school_education_2000 = "% < High school education 2000"
    Insurance_Recode_2007 = "Insurance Recode (2007+)"
    ;
  format
    Sex Sexf.
    SEERcausespecificdeathclassifi SEERcausespecificdeathclassifif.
    RaceandoriginrecodeNHWNHBNHAIA RaceandoriginrecodeNHWNHBNHAIAf.
    ICCCsiterecextendedICDO3WHO200 ICCCsiterecextendedICDO3WHO200f.
    RuralUrban_Continuum_Code_2003 RuralUrban_Continuum_Code_2003f.
    Year_of_diagnosis Year_of_diagnosisf.
    ;
run;

*New Variables;
data use1;
set use;
*cancer type recode;
cancer_type=.;
if ICCCsiterecextendedICDO3WHO200 ge 1 and ICCCsiterecextendedICDO3WHO200 le 8 then cancer_type = 1; *leukemias;
else if ICCCsiterecextendedICDO3WHO200 ge 9 and ICCCsiterecextendedICDO3WHO200 le 16 then cancer_type = 2; *lymphomas;
else if ICCCsiterecextendedICDO3WHO200 ge 17 and ICCCsiterecextendedICDO3WHO200 le 32 then cancer_type = 3; *CNS;
else if ICCCsiterecextendedICDO3WHO200 ge 33 and ICCCsiterecextendedICDO3WHO200 le 34 then cancer_type = 4; *neuroblastoma;
else if ICCCsiterecextendedICDO3WHO200 = 35 then cancer_type = 5; *retinoblastoma;
else if ICCCsiterecextendedICDO3WHO200 ge 36 and ICCCsiterecextendedICDO3WHO200 le 41 then cancer_type = 6; *renal;
else if ICCCsiterecextendedICDO3WHO200 ge 42 and ICCCsiterecextendedICDO3WHO200 le 44 then cancer_type = 7; *hepatic;
else if ICCCsiterecextendedICDO3WHO200 ge 45 and ICCCsiterecextendedICDO3WHO200 le 53 then cancer_type = 8; *bone;
else if ICCCsiterecextendedICDO3WHO200 ge 54 and ICCCsiterecextendedICDO3WHO200 le 70 then cancer_type = 9; *extraosseous sarcoma;
else if ICCCsiterecextendedICDO3WHO200 ge 71 and ICCCsiterecextendedICDO3WHO200 le 91  then cancer_type = 10; *reproductive;
else if ICCCsiterecextendedICDO3WHO200 ge 92  and ICCCsiterecextendedICDO3WHO200 le 107 then cancer_type = 11; *epithelial;
else if ICCCsiterecextendedICDO3WHO200 ge 108 and ICCCsiterecextendedICDO3WHO200 le 114 then cancer_type = 12; *other;
else if ICCCsiterecextendedICDO3WHO200 = 253  then cancer_type = 13; *not classified;
*metro/non-metro residence (2003);
metro=.;
if RuralUrban_Continuum_Code_2003 ge 1 and RuralUrban_Continuum_Code_2003 le 3 then metro=1; *metro county;
else if RuralUrban_Continuum_Code_2003 ge 4 and RuralUrban_Continuum_Code_2003 le 9 then metro=0; *non-metro county;
*RUCC of residence (2003);
RUCC=.;
if RuralUrban_Continuum_Code_2003 = 1 then RUCC =1; *metro ≥1M;
else if RuralUrban_Continuum_Code_2003 = 2 then RUCC =2; *metro 250k-1M;
else if RuralUrban_Continuum_Code_2003 = 3 then RUCC =3; *metro <250k;
else if RuralUrban_Continuum_Code_2003 = 4 then RUCC =4; *non-metro ≥20k adj to metro;
else if RuralUrban_Continuum_Code_2003 = 5 then RUCC =5; *non-metro ≥20k non-adj to metro;
else if RuralUrban_Continuum_Code_2003 = 6 then RUCC =6; *non-metro 2,500-19,999 adj to metro;
else if RuralUrban_Continuum_Code_2003 = 7 then RUCC =7; *non-metro 2,500-19,999 non-adj to metro;
else if RuralUrban_Continuum_Code_2003 = 8 then RUCC =8; *non-metro < 2,500 adj to metro;
else if RuralUrban_Continuum_Code_2003 = 9 then RUCC =9; *non-metro < 2,500 non-adj to metro;
*median family income in county (2000);
if Medianfamily_incomein_tens_2000 = 16382 then family_income=.; *missing;
else if Medianfamily_incomein_tens_2000 le 4583 then family_income=1; *≤$45,830;
else if Medianfamily_incomein_tens_2000 gt 4583 and Medianfamily_incomein_tens_2000 le 4841 then family_income=2; *>$45,830 and ≤$48,410;
else if Medianfamily_incomein_tens_2000 gt 4841 and Medianfamily_incomein_tens_2000 le 5482 then family_income=3; *>$48,410 and ≤$54,820;
else if Medianfamily_incomein_tens_2000 gt 5482 and Medianfamily_incomein_tens_2000 le 6529 then family_income=4; *>$54,820 and≤$65,290;
else if Medianfamily_incomein_tens_2000 gt 6529 then family_income=5; *>$65,290;
*percent < high school education in county (2000);
if V_High_school_education_2000 = 16382 then no_hs_diploma=.; *missing;
else if V_High_school_education_2000 le 1368 then no_hs_diploma=1; *≤%13.68;
else if V_High_school_education_2000 gt 1368 and V_High_school_education_2000 le 1705 then no_hs_diploma=2; *>%13.68 and ≤%17.05;
else if V_High_school_education_2000 gt 1705 and V_High_school_education_2000 le 2073 then no_hs_diploma=3; *>%17.05 and ≤%20.73;
else if V_High_school_education_2000 gt 2073 and V_High_school_education_2000 le 3010 then no_hs_diploma=4; *>%20.73 and ≤%30.10;
else if V_High_school_education_2000 gt 3010 then no_hs_diploma=5; *>%30.10;
*death by cancer;
death=.;
if SEERcausespecificdeathclassifi = 0 then death=0; *alive or dead of other cause;
else if SEERcausespecificdeathclassifi = 1 then death=1; *dead from cancer;
*race;
race=.;
if RaceandoriginrecodeNHWNHBNHAIA = 1 then race = 1; *White;
else if RaceandoriginrecodeNHWNHBNHAIA = 2 then race = 2; *Black;
else if RaceandoriginrecodeNHWNHBNHAIA = 3 then race = 3; *American Indian/Alaskan Native;
else if RaceandoriginrecodeNHWNHBNHAIA = 4 then race = 4; *Asian or PI;
else if RaceandoriginrecodeNHWNHBNHAIA = 5 then race = 5; *Hispanic (any race);
*survival months;
if survival_months = 9999 then survival_months=.; *missing;
*survivl years;
survival_years=survival_months/12;
*age at exit;
age_at_exit=survival_years+age_at_diagnosis;
*age categories;
age_diag_ct=.;
if age_at_diagnosis ge 0 and age_at_diagnosis le 4 then age_diag_ct = 1; *0-4 y/o;
else if age_at_diagnosis gt 4 and age_at_diagnosis le 9 then age_diag_ct = 2; *5-9 y/o;
else if age_at_diagnosis gt 9 and age_at_diagnosis le 14 then age_diag_ct = 3; *10-14 y/o;
else if age_at_diagnosis gt 14 and age_at_diagnosis le 19 then age_diag_ct = 4; *15-19 y/o;
*insurance;
insurance=.;
if Insurance_Recode_2007 = 1 then insurance =1; *uninsured;
else if Insurance_Recode_2007 = 2 then insurance = 2; *Medicaid;
else if Insurance_Recode_2007 ge 3 and Insurance_Recode_2007 le 4 then insurance = 3; *insured;
run;
*remove observations with missing values and zero survival time;
data use2;
set use1;
where metro ne .  and race ne . and sex ne . and cancer_type ne . 
and family_income ne . and no_hs_diploma ne . and age_at_exit ne . 
and death ne . and age_at_diagnosis ne . and survival_months ne 0;
run;

*Table 1;
*frequency death;
proc freq;
table death /missing;
run;
*median age at diagnosis;
proc means p25 p50 p75 missing;
var age_at_diagnosis;
where death = 1;
run;
proc means p25 p50 p75 missing;
var age_at_diagnosis;
where death = 0;
run;
*median survival months;
proc means p25 p50 p75 missing;
var survival_months;
where death = 1;
run;
proc means p25 p50 p75 missing;
var survival_months;
where death = 0;
run;
*frequency sex;
proc freq;
table sex*death /missing;
run;
*frequency race;
proc freq;
table race*death /missing;
run;
*frequency cancer_type;
proc freq;
table cancer_type*death /missing;
run;
*frequency RUCC 2003;
proc freq;
table RuralUrban_Continuum_Code_2003*death /missing;
run;
*frequency metro 2003;
proc freq;
table metro*death /missing;
run;
*frequency income;
proc freq;
table family_income*death /missing;
run;
*frequency education;
proc freq;
table no_hs_diploma*death /missing;
run;

*Table 2;
*frequency overall;
proc freq;
table metro*death;
run;
*frequency RUCC;
proc freq;
table RUCC*death;
run;
*model - Metro/Non-Metro;
proc phreg plots=survival;
class metro(ref='1')  
race sex cancer_type family_income no_hs_diploma/desc;
model survival_months*death(0)= metro 
race family_income / rl;
run;
*model - RUCC;
proc phreg;
class RUCC(ref='1')  
race sex cancer_type family_income no_hs_diploma/desc;
model survival_months*death(0)= RUCC 
race family_income/ rl;
run;

*Supporting Table 1 - Effect Modification;
*frequency age;
proc freq;
table age_diag_ct*death;
run;
*frequency sex;
proc freq;
table sex*death;
run;
*frequency race;
proc freq;
table race*death;
run;
*frequency cancer_type;
proc freq;
table cancer_type*death;
run;
*model - ages 0-4;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where age_at_diagnosis le 4;
run;
*model - ages 5-9;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where age_at_diagnosis ge 5 and age_at_diagnosis le 9;
run;
*model - ages 10-14;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where age_at_diagnosis ge 10 and age_at_diagnosis le 14;
run;
*model - ages 15-19;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where age_at_diagnosis ge 15 and age_at_diagnosis le 19;
run;
*model - age p for interaction;
proc phreg;
class metro(ref='1')  
race family_income age_diag_ct/desc;
model survival_months*death(0)= metro age_diag_ct metro*age_diag_ct
race family_income/ rl;
where age_diag_ct in (1,2,3,4);
run;
*model - sex male;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where sex =1;
run;
*model - sex female;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where sex =2;
run;
*model - sex p for interaction;
proc phreg;
class metro(ref='1')  
race family_income sex/desc;
model survival_months*death(0)= metro sex metro*sex
race family_income/ rl;
where sex in (1,2);
run;
*model - race White;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
 family_income/ rl;
where race =1;
run;
*model - race Black;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
 family_income/ rl;
where race =2;
run;
*model - race American Indian;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
 family_income/ rl;
where race =3;
run;
*model - race Asian;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
 family_income/ rl;
where race =4;
run;
*model - ethnicity Hispanic;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
 family_income/ rl;
where race =5;
run;
*model - race p for interaction;
proc phreg;
class metro(ref='1')  
race family_income /desc;
model survival_months*death(0)= metro race metro*race
 family_income /rl;
where race in (1,2,3,4,5);
run;
*model - cancer type leukemias;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where cancer_type=1;
run;
*model - cancer type lymphomas;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where  cancer_type=2;
run;
*model - cancer type CNS;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where cancer_type=3;
run;
*model - cancer type neuroblastoma;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where cancer_type=4;
run;
*model - cancer type retinoblastoma;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where cancer_type=5;
run;
*model - cancer type renal;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where cancer_type=6;
run;
*model - cancer type hepatic;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where cancer_type=7;
run;
*model - cancer type bone;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where cancer_type=8;
run;
*model - cancer type soft tissue;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where cancer_type=9;
run;
*model - cancer type germ cell;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where cancer_type=10;
run;
*model - cancer type epithelial;
proc phreg;
class metro(ref='1')  
race family_income/desc;
model survival_months*death(0)= metro 
race family_income/ rl;
where cancer_type=11;
run;
*model - cancer type p for interaction;
proc phreg;
class RUCC(ref='1')  
race family_income cancer_type/ desc;
model survival_months*death(0)= RUCC cancer_type RUCC*cancer_type
race family_income/ rl;
where cancer_type in (1,2,3,4,5,6,7,8,9,10,11,12,13);
run;

*Supporting Table 2 - with insurance 2007+;
*frequency - metro;
proc freq;
table metro*death /missing;
where Year_of_diagnosis ge 207;
run;
*frequency - RUCC;
proc freq;
table RUCC*death /missing;
where Year_of_diagnosis ge 207;
run;
*model - Metro/Non-Metro;
proc phreg;
class metro(ref='1')  
race family_income insurance/desc;
model survival_months*death(0)= metro 
race family_income insurance/ rl;
where Year_of_diagnosis ge 207;
run;
*model - RUCC;
proc phreg;
class RUCC(ref='1')  
race family_income insurance/desc;
model survival_months*death(0)= RUCC 
race family_income insurance/ rl;
where Year_of_diagnosis ge 207;
run;

*Figure 1 - Kaplan Meier Curve;
proc lifetest;
time survival_months*death(0);
strata metro;
run;

*Check proportionality assumptions;
ods graphics on; 
proc phreg;
class metro;
model age_at_exit*death(0)= metro;
assess  ph / resample;
run;
ods graphics off; 