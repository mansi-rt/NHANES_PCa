libname pca "/home/u49748641/LSU/PCa Project";

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_1999_2000;  

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=/home/u49748641/LSU/PCa Project/;

****************;
*NHANES VERSION*;
****************;

* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS 
	.='MISSING'
   	OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"  
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
		"001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
		"002" = "Malignant neoplasms (C00-C97)"
		"003" = "Chronic lower respiratory diseases (J40-J47)"
		"004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
		"005" = "Cerebrovascular diseases (I60-I69)"
		"006" = "Alzheimer's disease (G30)"
		"007" = "Diabetes mellitus (E10-E14)"
		"008" = "Influenza and pneumonia (J09-J18)"
		"009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
		"010" = "All other causes (residual)" 
		"   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA pca.&SURVEY.;		
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT
	
	SEQN			1-6 	
	ELIGSTAT		15
	MORTSTAT		16
	UCOD_LEADING	$17-19
	DIABETES		20
	HYPERTEN		21
	PERMTH_INT		43-45	
	PERMTH_EXM		46-48	
     ;

* DEFINE VARIABLE LABELS;
LABEL
	SEQN			=	'NHANES Respondent Sequence Number'
	ELIGSTAT		=	'Eligibility Status for Mortality Follow-up'
	MORTSTAT		=	'Final Mortality Status'
	UCOD_LEADING	=	'Underlying Leading Cause of Death: Recode'
	DIABETES		=	'Diabetes Flag from Multiple Cause of Death (MCOD)'
	HYPERTEN		=	'Hypertension Flag from Multiple Cause of Death (MCOD)'
	PERMTH_INT		=	'Number of Person-Months of Follow-up from NHANES Interview date'
	PERMTH_EXM		=	'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT    
	ELIGSTAT 		ELIGFMT.          
	MORTSTAT 		MORTFMT.
	UCOD_LEADING	UCODFMT.
	DIABETES 		FLAGFMT.          
	HYPERTEN 		FLAGFMT. 
	PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=pca.&SURVEY. VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=pca.&SURVEY.;
TABLES 
	ELIGSTAT
	MORTSTAT 
	UCOD_LEADING 
	DIABETES
	HYPERTEN 
	PERMTH_INT	
	PERMTH_EXM	

	/ MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE, 
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;


** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2001_2002;  

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=/home/u49748641/LSU/PCa Project/;

****************;
*NHANES VERSION*;
****************;

* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS 
	.='MISSING'
   	OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"  
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
		"001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
		"002" = "Malignant neoplasms (C00-C97)"
		"003" = "Chronic lower respiratory diseases (J40-J47)"
		"004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
		"005" = "Cerebrovascular diseases (I60-I69)"
		"006" = "Alzheimer's disease (G30)"
		"007" = "Diabetes mellitus (E10-E14)"
		"008" = "Influenza and pneumonia (J09-J18)"
		"009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
		"010" = "All other causes (residual)" 
		"   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA pca.&SURVEY.;		
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT
	
	SEQN			1-6 	
	ELIGSTAT		15
	MORTSTAT		16
	UCOD_LEADING	$17-19
	DIABETES		20
	HYPERTEN		21
	PERMTH_INT		43-45	
	PERMTH_EXM		46-48	
     ;

* DEFINE VARIABLE LABELS;
LABEL
	SEQN			=	'NHANES Respondent Sequence Number'
	ELIGSTAT		=	'Eligibility Status for Mortality Follow-up'
	MORTSTAT		=	'Final Mortality Status'
	UCOD_LEADING	=	'Underlying Leading Cause of Death: Recode'
	DIABETES		=	'Diabetes Flag from Multiple Cause of Death (MCOD)'
	HYPERTEN		=	'Hypertension Flag from Multiple Cause of Death (MCOD)'
	PERMTH_INT		=	'Number of Person-Months of Follow-up from NHANES Interview date'
	PERMTH_EXM		=	'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT    
	ELIGSTAT 		ELIGFMT.          
	MORTSTAT 		MORTFMT.
	UCOD_LEADING	UCODFMT.
	DIABETES 		FLAGFMT.          
	HYPERTEN 		FLAGFMT. 
	PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=pca.&SURVEY. VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=pca.&SURVEY.;
TABLES 
	ELIGSTAT
	MORTSTAT 
	UCOD_LEADING 
	DIABETES
	HYPERTEN 
	PERMTH_INT	
	PERMTH_EXM	

	/ MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE, 
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2003_2004;  

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=/home/u49748641/LSU/PCa Project/;

****************;
*NHANES VERSION*;
****************;

* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS 
	.='MISSING'
   	OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"  
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
		"001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
		"002" = "Malignant neoplasms (C00-C97)"
		"003" = "Chronic lower respiratory diseases (J40-J47)"
		"004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
		"005" = "Cerebrovascular diseases (I60-I69)"
		"006" = "Alzheimer's disease (G30)"
		"007" = "Diabetes mellitus (E10-E14)"
		"008" = "Influenza and pneumonia (J09-J18)"
		"009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
		"010" = "All other causes (residual)" 
		"   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA pca.&SURVEY.;		
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT
	
	SEQN			1-6 	
	ELIGSTAT		15
	MORTSTAT		16
	UCOD_LEADING	$17-19
	DIABETES		20
	HYPERTEN		21
	PERMTH_INT		43-45	
	PERMTH_EXM		46-48	
     ;

* DEFINE VARIABLE LABELS;
LABEL
	SEQN			=	'NHANES Respondent Sequence Number'
	ELIGSTAT		=	'Eligibility Status for Mortality Follow-up'
	MORTSTAT		=	'Final Mortality Status'
	UCOD_LEADING	=	'Underlying Leading Cause of Death: Recode'
	DIABETES		=	'Diabetes Flag from Multiple Cause of Death (MCOD)'
	HYPERTEN		=	'Hypertension Flag from Multiple Cause of Death (MCOD)'
	PERMTH_INT		=	'Number of Person-Months of Follow-up from NHANES Interview date'
	PERMTH_EXM		=	'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT    
	ELIGSTAT 		ELIGFMT.          
	MORTSTAT 		MORTFMT.
	UCOD_LEADING	UCODFMT.
	DIABETES 		FLAGFMT.          
	HYPERTEN 		FLAGFMT. 
	PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=pca.&SURVEY. VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=pca.&SURVEY.;
TABLES 
	ELIGSTAT
	MORTSTAT 
	UCOD_LEADING 
	DIABETES
	HYPERTEN 
	PERMTH_INT	
	PERMTH_EXM	

	/ MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE, 
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2005_2006;  

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=/home/u49748641/LSU/PCa Project/;

****************;
*NHANES VERSION*;
****************;

* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS 
	.='MISSING'
   	OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"  
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
		"001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
		"002" = "Malignant neoplasms (C00-C97)"
		"003" = "Chronic lower respiratory diseases (J40-J47)"
		"004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
		"005" = "Cerebrovascular diseases (I60-I69)"
		"006" = "Alzheimer's disease (G30)"
		"007" = "Diabetes mellitus (E10-E14)"
		"008" = "Influenza and pneumonia (J09-J18)"
		"009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
		"010" = "All other causes (residual)" 
		"   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA pca.&SURVEY.;		
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT
	
	SEQN			1-6 	
	ELIGSTAT		15
	MORTSTAT		16
	UCOD_LEADING	$17-19
	DIABETES		20
	HYPERTEN		21
	PERMTH_INT		43-45	
	PERMTH_EXM		46-48	
     ;

* DEFINE VARIABLE LABELS;
LABEL
	SEQN			=	'NHANES Respondent Sequence Number'
	ELIGSTAT		=	'Eligibility Status for Mortality Follow-up'
	MORTSTAT		=	'Final Mortality Status'
	UCOD_LEADING	=	'Underlying Leading Cause of Death: Recode'
	DIABETES		=	'Diabetes Flag from Multiple Cause of Death (MCOD)'
	HYPERTEN		=	'Hypertension Flag from Multiple Cause of Death (MCOD)'
	PERMTH_INT		=	'Number of Person-Months of Follow-up from NHANES Interview date'
	PERMTH_EXM		=	'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT    
	ELIGSTAT 		ELIGFMT.          
	MORTSTAT 		MORTFMT.
	UCOD_LEADING	UCODFMT.
	DIABETES 		FLAGFMT.          
	HYPERTEN 		FLAGFMT. 
	PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=pca.&SURVEY. VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=pca.&SURVEY.;
TABLES 
	ELIGSTAT
	MORTSTAT 
	UCOD_LEADING 
	DIABETES
	HYPERTEN 
	PERMTH_INT	
	PERMTH_EXM	

	/ MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE, 
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2007_2008;  

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=/home/u49748641/LSU/PCa Project/;

****************;
*NHANES VERSION*;
****************;

* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS 
	.='MISSING'
   	OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"  
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
		"001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
		"002" = "Malignant neoplasms (C00-C97)"
		"003" = "Chronic lower respiratory diseases (J40-J47)"
		"004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
		"005" = "Cerebrovascular diseases (I60-I69)"
		"006" = "Alzheimer's disease (G30)"
		"007" = "Diabetes mellitus (E10-E14)"
		"008" = "Influenza and pneumonia (J09-J18)"
		"009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
		"010" = "All other causes (residual)" 
		"   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA pca.&SURVEY.;		
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT
	
	SEQN			1-6 	
	ELIGSTAT		15
	MORTSTAT		16
	UCOD_LEADING	$17-19
	DIABETES		20
	HYPERTEN		21
	PERMTH_INT		43-45	
	PERMTH_EXM		46-48	
     ;

* DEFINE VARIABLE LABELS;
LABEL
	SEQN			=	'NHANES Respondent Sequence Number'
	ELIGSTAT		=	'Eligibility Status for Mortality Follow-up'
	MORTSTAT		=	'Final Mortality Status'
	UCOD_LEADING	=	'Underlying Leading Cause of Death: Recode'
	DIABETES		=	'Diabetes Flag from Multiple Cause of Death (MCOD)'
	HYPERTEN		=	'Hypertension Flag from Multiple Cause of Death (MCOD)'
	PERMTH_INT		=	'Number of Person-Months of Follow-up from NHANES Interview date'
	PERMTH_EXM		=	'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT    
	ELIGSTAT 		ELIGFMT.          
	MORTSTAT 		MORTFMT.
	UCOD_LEADING	UCODFMT.
	DIABETES 		FLAGFMT.          
	HYPERTEN 		FLAGFMT. 
	PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=pca.&SURVEY. VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=pca.&SURVEY.;
TABLES 
	ELIGSTAT
	MORTSTAT 
	UCOD_LEADING 
	DIABETES
	HYPERTEN 
	PERMTH_INT	
	PERMTH_EXM	

	/ MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE, 
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2009_2010;  

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=/home/u49748641/LSU/PCa Project/;

****************;
*NHANES VERSION*;
****************;

* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS 
	.='MISSING'
   	OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"  
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
		"001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
		"002" = "Malignant neoplasms (C00-C97)"
		"003" = "Chronic lower respiratory diseases (J40-J47)"
		"004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
		"005" = "Cerebrovascular diseases (I60-I69)"
		"006" = "Alzheimer's disease (G30)"
		"007" = "Diabetes mellitus (E10-E14)"
		"008" = "Influenza and pneumonia (J09-J18)"
		"009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
		"010" = "All other causes (residual)" 
		"   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA pca.&SURVEY.;		
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT
	
	SEQN			1-6 	
	ELIGSTAT		15
	MORTSTAT		16
	UCOD_LEADING	$17-19
	DIABETES		20
	HYPERTEN		21
	PERMTH_INT		43-45	
	PERMTH_EXM		46-48	
     ;

* DEFINE VARIABLE LABELS;
LABEL
	SEQN			=	'NHANES Respondent Sequence Number'
	ELIGSTAT		=	'Eligibility Status for Mortality Follow-up'
	MORTSTAT		=	'Final Mortality Status'
	UCOD_LEADING	=	'Underlying Leading Cause of Death: Recode'
	DIABETES		=	'Diabetes Flag from Multiple Cause of Death (MCOD)'
	HYPERTEN		=	'Hypertension Flag from Multiple Cause of Death (MCOD)'
	PERMTH_INT		=	'Number of Person-Months of Follow-up from NHANES Interview date'
	PERMTH_EXM		=	'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT    
	ELIGSTAT 		ELIGFMT.          
	MORTSTAT 		MORTFMT.
	UCOD_LEADING	UCODFMT.
	DIABETES 		FLAGFMT.          
	HYPERTEN 		FLAGFMT. 
	PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=pca.&SURVEY. VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=pca.&SURVEY.;
TABLES 
	ELIGSTAT
	MORTSTAT 
	UCOD_LEADING 
	DIABETES
	HYPERTEN 
	PERMTH_INT	
	PERMTH_EXM	

	/ MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE, 
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2011_2012;  

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=/home/u49748641/LSU/PCa Project/;

****************;
*NHANES VERSION*;
****************;

* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS 
	.='MISSING'
   	OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"  
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
		"001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
		"002" = "Malignant neoplasms (C00-C97)"
		"003" = "Chronic lower respiratory diseases (J40-J47)"
		"004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
		"005" = "Cerebrovascular diseases (I60-I69)"
		"006" = "Alzheimer's disease (G30)"
		"007" = "Diabetes mellitus (E10-E14)"
		"008" = "Influenza and pneumonia (J09-J18)"
		"009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
		"010" = "All other causes (residual)" 
		"   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA pca.&SURVEY.;		
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT
	
	SEQN			1-6 	
	ELIGSTAT		15
	MORTSTAT		16
	UCOD_LEADING	$17-19
	DIABETES		20
	HYPERTEN		21
	PERMTH_INT		43-45	
	PERMTH_EXM		46-48	
     ;

* DEFINE VARIABLE LABELS;
LABEL
	SEQN			=	'NHANES Respondent Sequence Number'
	ELIGSTAT		=	'Eligibility Status for Mortality Follow-up'
	MORTSTAT		=	'Final Mortality Status'
	UCOD_LEADING	=	'Underlying Leading Cause of Death: Recode'
	DIABETES		=	'Diabetes Flag from Multiple Cause of Death (MCOD)'
	HYPERTEN		=	'Hypertension Flag from Multiple Cause of Death (MCOD)'
	PERMTH_INT		=	'Number of Person-Months of Follow-up from NHANES Interview date'
	PERMTH_EXM		=	'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT    
	ELIGSTAT 		ELIGFMT.          
	MORTSTAT 		MORTFMT.
	UCOD_LEADING	UCODFMT.
	DIABETES 		FLAGFMT.          
	HYPERTEN 		FLAGFMT. 
	PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=pca.&SURVEY. VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=pca.&SURVEY.;
TABLES 
	ELIGSTAT
	MORTSTAT 
	UCOD_LEADING 
	DIABETES
	HYPERTEN 
	PERMTH_INT	
	PERMTH_EXM	

	/ MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE, 
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2013_2014;  

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=/home/u49748641/LSU/PCa Project/;

****************;
*NHANES VERSION*;
****************;

* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS 
	.='MISSING'
   	OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"  
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
		"001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
		"002" = "Malignant neoplasms (C00-C97)"
		"003" = "Chronic lower respiratory diseases (J40-J47)"
		"004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
		"005" = "Cerebrovascular diseases (I60-I69)"
		"006" = "Alzheimer's disease (G30)"
		"007" = "Diabetes mellitus (E10-E14)"
		"008" = "Influenza and pneumonia (J09-J18)"
		"009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
		"010" = "All other causes (residual)" 
		"   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA pca.&SURVEY.;		
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT
	
	SEQN			1-6 	
	ELIGSTAT		15
	MORTSTAT		16
	UCOD_LEADING	$17-19
	DIABETES		20
	HYPERTEN		21
	PERMTH_INT		43-45	
	PERMTH_EXM		46-48	
     ;

* DEFINE VARIABLE LABELS;
LABEL
	SEQN			=	'NHANES Respondent Sequence Number'
	ELIGSTAT		=	'Eligibility Status for Mortality Follow-up'
	MORTSTAT		=	'Final Mortality Status'
	UCOD_LEADING	=	'Underlying Leading Cause of Death: Recode'
	DIABETES		=	'Diabetes Flag from Multiple Cause of Death (MCOD)'
	HYPERTEN		=	'Hypertension Flag from Multiple Cause of Death (MCOD)'
	PERMTH_INT		=	'Number of Person-Months of Follow-up from NHANES Interview date'
	PERMTH_EXM		=	'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT    
	ELIGSTAT 		ELIGFMT.          
	MORTSTAT 		MORTFMT.
	UCOD_LEADING	UCODFMT.
	DIABETES 		FLAGFMT.          
	HYPERTEN 		FLAGFMT. 
	PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=pca.&SURVEY. VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=pca.&SURVEY.;
TABLES 
	ELIGSTAT
	MORTSTAT 
	UCOD_LEADING 
	DIABETES
	HYPERTEN 
	PERMTH_INT	
	PERMTH_EXM	

	/ MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE, 
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2015_2016;  

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=/home/u49748641/LSU/PCa Project/;

****************;
*NHANES VERSION*;
****************;

* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS 
	.='MISSING'
   	OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"  
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
		"001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
		"002" = "Malignant neoplasms (C00-C97)"
		"003" = "Chronic lower respiratory diseases (J40-J47)"
		"004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
		"005" = "Cerebrovascular diseases (I60-I69)"
		"006" = "Alzheimer's disease (G30)"
		"007" = "Diabetes mellitus (E10-E14)"
		"008" = "Influenza and pneumonia (J09-J18)"
		"009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
		"010" = "All other causes (residual)" 
		"   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA pca.&SURVEY.;		
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT
	
	SEQN			1-6 	
	ELIGSTAT		15
	MORTSTAT		16
	UCOD_LEADING	$17-19
	DIABETES		20
	HYPERTEN		21
	PERMTH_INT		43-45	
	PERMTH_EXM		46-48	
     ;

* DEFINE VARIABLE LABELS;
LABEL
	SEQN			=	'NHANES Respondent Sequence Number'
	ELIGSTAT		=	'Eligibility Status for Mortality Follow-up'
	MORTSTAT		=	'Final Mortality Status'
	UCOD_LEADING	=	'Underlying Leading Cause of Death: Recode'
	DIABETES		=	'Diabetes Flag from Multiple Cause of Death (MCOD)'
	HYPERTEN		=	'Hypertension Flag from Multiple Cause of Death (MCOD)'
	PERMTH_INT		=	'Number of Person-Months of Follow-up from NHANES Interview date'
	PERMTH_EXM		=	'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT    
	ELIGSTAT 		ELIGFMT.          
	MORTSTAT 		MORTFMT.
	UCOD_LEADING	UCODFMT.
	DIABETES 		FLAGFMT.          
	HYPERTEN 		FLAGFMT. 
	PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=pca.&SURVEY. VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=pca.&SURVEY.;
TABLES 
	ELIGSTAT
	MORTSTAT 
	UCOD_LEADING 
	DIABETES
	HYPERTEN 
	PERMTH_INT	
	PERMTH_EXM	

	/ MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE, 
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;

** This is the name of the survey. The program will pass this information to the appropriate places.
** You only need to enter it here ;
%LET SURVEY=NHANES_2017_2018;  

** This is the file location where you have downloaded the public file on your computer.
** Don't forget the last "\".;
%LET INFILNM=/home/u49748641/LSU/PCa Project/;

****************;
*NHANES VERSION*;
****************;

* Define variable values for reports;
PROC FORMAT;
  VALUE PREMISS 
	.='MISSING'
   	OTHER='PRESENT';

  VALUE ELIGFMT
    1 = "Eligible"
    2 = "Under age 18, not available for public release"
    3 = "Ineligible";

  VALUE MORTFMT
    0 = "Assumed alive"
    1 = "Assumed deceased"
    . = "Ineligible or under age 18";

  VALUE FLAGFMT
    0 = "No - Condition not listed as a multiple cause of death"
    1 = "Yes - Condition listed as a multiple cause of death"  
    . = "Assumed alive, under age 18, ineligible for mortality follow-up, or MCOD not available";

  VALUE $UCODFMT
		"001" = "Diseases of heart (I00-I09, I11, I13, I20-I51)"
		"002" = "Malignant neoplasms (C00-C97)"
		"003" = "Chronic lower respiratory diseases (J40-J47)"
		"004" = "Accidents (unintentional injuries) (V01-X59, Y85-Y86)"
		"005" = "Cerebrovascular diseases (I60-I69)"
		"006" = "Alzheimer's disease (G30)"
		"007" = "Diabetes mellitus (E10-E14)"
		"008" = "Influenza and pneumonia (J09-J18)"
		"009" = "Nephritis, nephrotic syndrome and nephrosis (N00-N07, N17-N19, N25-N27)"
		"010" = "All other causes (residual)" 
		"   " = "Ineligible, under age 18, assumed alive, or no cause of death data available";

RUN;


*Create a temporary SAS work dataset;

DATA pca.&SURVEY.;		
INFILE "&INFILNM.&SURVEY._MORT_2019_PUBLIC.dat"  LRECL = 61 PAD MISSOVER ;

* INPUT VARIABLES;
INPUT
	
	SEQN			1-6 	
	ELIGSTAT		15
	MORTSTAT		16
	UCOD_LEADING	$17-19
	DIABETES		20
	HYPERTEN		21
	PERMTH_INT		43-45	
	PERMTH_EXM		46-48	
     ;

* DEFINE VARIABLE LABELS;
LABEL
	SEQN			=	'NHANES Respondent Sequence Number'
	ELIGSTAT		=	'Eligibility Status for Mortality Follow-up'
	MORTSTAT		=	'Final Mortality Status'
	UCOD_LEADING	=	'Underlying Leading Cause of Death: Recode'
	DIABETES		=	'Diabetes Flag from Multiple Cause of Death (MCOD)'
	HYPERTEN		=	'Hypertension Flag from Multiple Cause of Death (MCOD)'
	PERMTH_INT		=	'Number of Person-Months of Follow-up from NHANES Interview date'
	PERMTH_EXM		=	'Number of Person-Months of Follow-up from NHANES Mobile Examination Center (MEC) Date'
;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
FORMAT    
	ELIGSTAT 		ELIGFMT.          
	MORTSTAT 		MORTFMT.
	UCOD_LEADING	UCODFMT.
	DIABETES 		FLAGFMT.          
	HYPERTEN 		FLAGFMT. 
	PERMTH_INT PERMTH_EXM PREMISS.
;
RUN;


OPTIONS PAGENO=1;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";

*RUN PROC CONTENTS;
PROC CONTENTS DATA=pca.&SURVEY. VARNUM; RUN;

*RUN FREQUENCIES;
PROC FREQ DATA=pca.&SURVEY.;
TABLES 
	ELIGSTAT
	MORTSTAT 
	UCOD_LEADING 
	DIABETES
	HYPERTEN 
	PERMTH_INT	
	PERMTH_EXM	

	/ MISSING;
TITLE1 "&SURVEY. PUBLIC-USE LINKED MORTALITY FILE";
TITLE2 "UNWEIGHTED FREQUENCIES";

* USER NOTE: TO SEE UNFORMATTED VALUES IN THE FREQUENCY PROCEDURE, 
  UNCOMMENT THE STATEMENT "FORMAT _ALL_" BELOW ;
* FORMAT _ALL_;
RUN;
