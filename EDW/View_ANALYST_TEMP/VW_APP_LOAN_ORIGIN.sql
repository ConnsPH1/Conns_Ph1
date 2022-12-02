-- EDW_PRD.ANALYST_TEMP.VW_APP_LOAN_ORIGIN source

create or replace view EDW_PRD.ANALYST_TEMP.VW_APP_LOAN_ORIGIN(
	APPLICATION_ID,
	CUSTOMER_ID,
	ACCOUNT_NUMBER,
	INVOICE_NB,
	SSN,
	APPLICATION_STATUS,
	APPLICATION_TYPE,
	APPLICATION_SOURCE,
	BUREAU_CODE,
	STORE_LOCATION,
	ADDON_AMT,
	PRODUCT_PRICE,
	INVOICE_TOTAL,
	MAINTENANCE_AMT,
	DP_VALUE,
	ORIG_FICO,
	ORIG_FICO_VERSION,
	BUREAU_REPORT_DATE,
	LIMIT_ASSIGNED,
	LIMIT_OVERRIDDEN,
	CREDIT_LIMIT,
	DOWN_PMT_ASSIGNED,
	DOWN_PAY_OVERRIDE,
	GRADER_OVERRIDE,
	CURR_PAST_DUE,
	CURR_OBLIGATION,
	CO_APPLICANT,
	SALES_PROMOTION,
	INSURANCE_TYPE,
	BANKRUPTCY_STATUS,
	CHARGES_PENDING,
	EXTENDED_CREDIT_LMT,
	RISK_GRADE,
	DENIAL_CODE,
	DENIAL_DESC,
	NEW_EXISTING_FLAG,
	COP_TYPE,
	COP_FLAG,
	CUST_MONTHLY_INCOME,
	CUST_FIRST_NAME,
	CUST_LAST_NAME,
	CUST_ADDRESS_LINE_1,
	CUST_ADDRESS_LINE_2,
	CUST_STATE,
	CITY30,
	CUST_ZIP,
	CUST_PHONE_NBR,
	CUST_EMAIL,
	CUST_DOB,
	ORIGINAL_TERM,
	APR_PERCENT,
	CONTRACT_VER,
	ADMIN_FEE,
	CARRY_OVER_ADMIN_FEE,
	DOC_FEE,
	CARRY_OVER_DOC_FEE,
	INTEREST_BEARING,
	SPECIAL_MILITARY,
	INT_RATE,
	BOOKED_DATE,
	MONTHLY_PAYMENT_AMOUNT,
	WAR_EXTT_AMT,
	STORE_STATE,
	STORE_ZIP,
	AMT_FINANCED,
	AMOUNT_FINANCED_NOFEE,
	DECISION_BUREAU,
	ORIG_AUTO_DECISION,
	PRIOR_CLASS_CODE,
	PRIOR_CREDIT_LIMIT,
	PRIOR_CURRENT_DELINQUENCY,
	PRIOR_CURRENT_OBLIGATION,
	LIFE_TIME_CHARGE_OFF_ACC,
	LIFE_TIME_CHARGE_OFF_AMT,
	DATE_OF_FIRST_ACC,
	LIFETIME_PURCHASE_DOLLAR,
	LIFETIME_PURCHASE_NUM,
	LIFETIME_ACCOUNTS,
	LIFETIMEBALANCE,
	LIFETIME_MAX_DAYSPD,
	LIFETIME_NUMBER_OF_REAGES,
	PRIOR_APP_DATE,
	PRIOR_ORIGINATION_DATE,
	PRIOR_PRODUCT_CLASS,
	FICODMS_DESCISION,
	AS400_DESCISION,
	AS400_OVERRIDE,
	AUTODECISION_AS400,
	TOB_BUCKET,
	TOTAL_ACCOUNTS_REAGED,
	TOTAL_ACTIVE_ACC,
	TOTAL_ACTIVE_BAL,
	TOTAL_PAYMENTS,
	TOTAL_TIMES_30,
	TOTAL_TIMES_60,
	TOTAL_TIMES_90,
	OCCUPATION_TYPE,
	EMPLOY_STATUS,
	MONTHS_AT_CURRENTJOB,
	CUSTOMER_TYPE,
	EXPERIAN_VANTAGE_SCORE,
	TSTAMP_APP_AUDIT_STAMP,
	APP_DATE_QTR,
	APP_DATE_YR,
	APP_DATE_QTR_FY,
	APP_DATE_YR_FY,
	CUSTOM_RISK_SCORE,
	EQF_SEGMENT_SCORE,
	TU_CREDIT_SCORE,
	PROMOTION_MAILER_FLG,
	VANTAGE_SCORE_VERSION,
	STATE_CODE,
	STATE_TIER,
	STATE_PROFITABILITY,
	MAX_DPD_LAST_ACC,
	EXPERIAN_CUSTOM_SCORE,
	OFFER_EXPIRY_DAYS,
	OFFER_EXPIRY_FLAG,
	BANKRUPTCY_IN_PAST,
	RTO_APP_ID,
	RTO_APPROVAL_AMOUNT,
	RTO_CUSTOMER_ID,
	RTO_MULTIPLIER,
	NUMBER_OF_PERIODIC_PAYMENTS,
	RTO_ID,
	RTO_BAL_AMT,
	RTO_INITIAL_PYMNT,
	RTO_NON_LEASABLE_ITEMS,
	RTO_CASH_PRICE,
	RTO_RENT_PAYMENT,
	PTI,
	APPLICATION_DECISION_DATE,
	CREDIT_GRANTING_FLAG,
	EXPERIAN_RISKTIER,
	TU_RISKTIER,
	INITIAL_DELIVERY_DT,
	MAX_DELIVERY_DT,
	PRODUCT_CATEGORY_DESC,
	PRODUCT_TYPE,
	PAYMENT_FREQUENCY,
	CHANNEL,
	GDS_DECISION_CODE,
	PROVE_RESPONSE,
	FRAUD_SCORE,
	NDI,
	OFFER_PRESENTED_INSTALLMENT,
	OFFER_PRESENTED_LEASE,
	OFFER_PRESENTED_CARD,
	OFFER_DATE,
	CUST_OFFER_SELECTED,
	SOFT_PULL_FLAG,
	HARD_PULL_FLAG,
	INSTALLATION_DATE,
	INSTALLATION_DATE_2,
	CONFIRMED_FRAUD,
	SUSPECTED_FRAUD,
	RTO_DELIV_FEE,
	INSTAL_FEE,
	HAUL_AWAY_FEE,
	RTO_WARRANTY,
	INSURANCE,
	TAXES,
	RTO_RENTAL_COST,
	RTO_OPTIONAL_CHARGES,
	RTO_TTL_INITIAL_PYMNT,
	RTO_FRST_RNWL_PYMNT,
	DW_INSERT_DATE,
	PRIOR_CHARGE_OFF_DATE,
	DAYS_FROM_LASTCO
) as (    
--SELECT COUNT(*) FROM (
SELECT DCA.APPLICATION_ID,
DCA.CUSTOMER_ID,
CA.CREDIT_ACCOUNT AS  ACCOUNT_NUMBER,
DCA.INVOICE_NB,
DCA.SSN,
DCA.APPLICATION_STATUS,  
DCA.APPLICATION_TYPE,
DCA.APPLICATION_SOURCE,
--DCA.CAHE_ENTERED1 AS APP_DATE,
DCA.BUREAU_CODE,
DCA.STORE_LOCATION,
DCA.ADDON_AMT,
DCA.PRODUCT_PRICE,
DCA.INVOICE_TOTAL,
DCA.MAINTENANCE_AMT,
DCA.DP_VALUE,
DCA.FICO AS ORIG_FICO,
8 as ORIG_FICO_VERSION, 
DCA.BUREAU_REPORT_DATE,
DCA.LIMIT_ASSIGNED,
DCA.CREDIT_LIMIT AS LIMIT_OVERRIDDEN,
CASE WHEN DCA.CREDIT_LIMIT > 0 THEN DCA.CREDIT_LIMIT  ELSE DCA.LIMIT_ASSIGNED END AS CREDIT_LIMIT,
DCA.DOWN_PMT  AS  DOWN_PMT_ASSIGNED,
DCA.DOWN_PAY_OVERRIDE,
DCA.GRADER_OVERRIDE,
DCA.CURR_PAST_DUE,
DCA.CURR_OBLIGATION,
DCA.CO_APPLICANT,
--DCA.DENIAL_CODE,
DCA.SALES_PROMOTION,
DCA.INSURANCE_TYPE,
DCA.BANKRUPTCY_STATUS,
DCA.CHARGES_PENDING,
DCA.EXTENDED_CREDIT_LMT,
CSM.RISK_GRADE,
DD.DENIAL_CODE,
DD.DENIAL_DESC,
CASE WHEN FFR.PRIOR_CUST IS NULL THEN FFR.FICO_CUST_NEW ELSE FFR.PRIOR_CUST END AS NEW_EXISTING_FLAG,
--FFR.FICO_CUST_NEW AS  NEW_EXISTING_FLAG,
--FFR.PRIOR_CUST AS NEW_EXISTING_FORMER,
CA.CONTRACT_TYPE AS COP_TYPE,
CASE WHEN CA.CONTRACT_TYPE IN ('18','IY','2Y','30', 'I6', 'I3') THEN 'YES' ELSE 'NO' END AS COP_FLAG,
FFR.CUST_MONTHLY_INCOME, ---CHANGE NUMBER(9,2) MOHAN DECINMAL IS MUST
FFR.FIRST_NAME AS  CUST_FIRST_NAME,
FFR.LAST_NAME AS  CUST_LAST_NAME,
DCAD.CUSTOMER_ADDRESS_1 AS  CUST_ADDRESS_LINE_1,
DCAD.CUSTOMER_ADDRESS_2 AS  CUST_ADDRESS_LINE_2,
FFR.STATE_CODE AS CUST_STATE,
FFR.CITY30,
FFR.ZIP AS CUST_ZIP,
FFR.PHONENUMBER AS  CUST_PHONE_NBR,
DC.PRIMARY_EMAIL AS CUST_EMAIL,
DC.DOB AS CUST_DOB,
FLA.ORIGINAL_TERM,
DCE.APR_PERCENT,
DCE.CONTRACT_VER,
DCE.ORGN_FEE AS  ADMIN_FEE,
DCE.ADMIN_FEE_ADDON AS  CARRY_OVER_ADMIN_FEE,
DCE.DOCUMENTATION_FEE AS  DOC_FEE,
DCE.DOC_FEE_ADDON AS  CARRY_OVER_DOC_FEE,
DCE.FEE_INTEREST_BEARING AS INTEREST_BEARING, --+
DCE.SPECIAL_MILITARY,
DCE.INT_RATE, --+
FLA.BOOKED_DATE, 
FLA.MONTHLY_PAYMENT_AMOUNT, ---CREDIT-CONTRACT_AGG. PAYMENT --CCAP(APCJVA	Payment Amount)
--CA.PAYMENT AS MONTHLY_PAYMENT_AMOUNT, --GETTING SAME VALUES (ON BOARDED DATA THAT CAN BE ALTERED)
BKDIS.WAR_EXTT_AMT,
SLOC.STATE AS STORE_STATE,
SLOC.ZIP AS STORE_ZIP,
FLA.AMT_FINANCED,
--CRCA.ORIG_DISC,
CA.FINANCED AS  AMOUNT_FINANCED_NOFEE,
--DCA.INVOICE_TOTAL, --dup
DFR.FRS_ORIG_BUREAU AS  DECISION_BUREAU,
DFR.ORIG_AUTO_DECISION,
FFR.CLASS_CODE AS  PRIOR_CLASS_CODE,
FFR.CREDIT_LIMIT AS PRIOR_CREDIT_LIMIT,
CASE WHEN LENGTH(FFR.CURRENT_DELINQCY)>0 THEN cast(FFR.CURRENT_DELINQCY as decimal(38,0)) ELSE NULL END AS PRIOR_CURRENT_DELINQUENCY,
--FFR.CURRENT_DELINQCY AS  PRIOR_CURRENT_DELINQUENCY,
FFR.CURRENT_OBLIGATION AS  PRIOR_CURRENT_OBLIGATION,
FFR.LIFE_TIME_CHARGE_OFF_ACC,
FFR.LIFE_TIME_CHARGE_OFF_AMT,
FFR.DATE_OF_FIRST_ACC, -- AS DATE_OF_FIRST_ACC (CHANGE IN FFR MOHAN)
FFR.LIFE_TIME_PURCHASE AS LIFETIME_PURCHASE_DOLLAR,
FFR.LIFE_TIME_COUNT AS LIFETIME_PURCHASE_NUM,
FFR.LIFE_TIME_ACC AS LIFETIME_ACCOUNTS,
FFR.LIFE_TIME_BAL AS LIFETIMEBALANCE,
CAST(FFR.LAST_ACC_DPD AS DECIMAL(38,0)) AS LIFETIME_MAX_DAYSPD,
--FFR.LAST_ACC_DPD
FFR.NO_OF_REAGES AS LIFETIME_NUMBER_OF_REAGES,
FFR.LAST_APP_DATE AS  PRIOR_APP_DATE,
FFR.LAST_ACC_OPEN AS  PRIOR_ORIGINATION_DATE,
FFR.PRODUCT_CLASS AS  PRIOR_PRODUCT_CLASS,
DCA.CAHE_EXTRA_2_6 AS FICODMS_DESCISION,
DCA.CAHE_EXTRA_1_5 AS AS400_DESCISION,
CASE WHEN DCA.CAHE_EXTRA_2_6='A' AND DCA.CAHE_EXTRA_1_5='D' THEN 1 ELSE 0 END AS AS400_OVERRIDE,
DCA.CAHE_AUTO_DECISION AS  AUTODECISION_AS400,
FFR.TOB_BUCKET,  
FFR.TOTAL_ACCOUNTS_REAGED, 
FFR.TOTAL_ACTIVE_ACC,
FFR.TOTAL_ACTIVE_BAL,
FFR.TOTAL_PAYMENTS,
FFR.TOTAL_TIMES_30,
FFR.TOTAL_TIMES_60,
FFR.TOTAL_TIMES_90,
--DCA.DRIVERS_LICENSE_MATCH, -- remove (CONFRIM WITH STEPHEN)
--DCA.PHONE_MATCHED,---remove (CONFRIM WITH STEPHEN)
--DCA.SSN_EXCEPTION,---remove (CONFRIM WITH STEPHEN)
FFR.OCCUPATION_TYPE,
FFR.EMPLOY_STATUS,
FFR.MONTHS_AT_CURRENTJOB,
DC.CUSTOMER_TYPE,
DFR.EXPERIAN_VANTAGE_SCORE, --FES.VANTAGE_SCORE
DCA.CRD_APP_AUDIT_STAMP::TIMESTAMP AS TSTAMP_APP_AUDIT_STAMP,
QUARTER(CAHE_ENTERED1) AS "APP_DATE_QTR",YEAR(CAHE_ENTERED1) AS "APP_DATE_YR",
DDT.FISCAL_QUARTER AS  APP_DATE_QTR_FY,
DDT.FISCAL_YEAR AS APP_DATE_YR_FY,
--DCA.APPLICATION_TYPE,
DFR.ORIG_SCORE AS  CUSTOM_RISK_SCORE,
DFR.EQF_SEGMENT_SCORE,
DFR.SC01_SCORE AS TU_CREDIT_SCORE,
FFR.PROMOTION_MAILER_FLG,
4 as VANTAGE_SCORE_VERSION,
CASE WHEN DCA.STORE_LOCATION='040' THEN 'TX' ELSE SLOC.STATE END AS STATE_CODE,     --FFR.STATE_CODE,
CASE WHEN (CASE WHEN DCA.STORE_LOCATION='040' THEN 'TX' ELSE SLOC.STATE END) in ('TX','LA','NM','SC','AZ') then 'TIER1' 
when (CASE WHEN DCA.STORE_LOCATION='040' THEN 'TX' ELSE SLOC.STATE END) IN ('GA','NV','OK') then 'TIER2'
WHEN (CASE WHEN DCA.STORE_LOCATION='040' THEN 'TX' ELSE SLOC.STATE END) IN ('TN','CO','AL','NC','MS','VA', 'FL', '') THEN 'TIER3' END AS STATE_TIER,
  
CASE WHEN (CASE WHEN (CASE WHEN DCA.STORE_LOCATION='040' THEN 'TX' ELSE SLOC.STATE END) in ('TX','LA','NM','SC','AZ') then 'TIER1' 
when (CASE WHEN DCA.STORE_LOCATION='040' THEN 'TX' ELSE SLOC.STATE END) IN ('GA','NV','OK') then 'TIER2'
WHEN (CASE WHEN DCA.STORE_LOCATION='040' THEN 'TX' ELSE SLOC.STATE END) IN ('TN','CO','AL','NC','MS','VA', 'FL', '') THEN 'TIER3' END) = 'TIER1' THEN 'HIGH'
  
WHEN (CASE WHEN (CASE WHEN DCA.STORE_LOCATION='040' THEN 'TX' ELSE SLOC.STATE END) in ('TX','LA','NM','SC','AZ') then 'TIER1' 
when (CASE WHEN DCA.STORE_LOCATION='040' THEN 'TX' ELSE SLOC.STATE END) IN ('GA','NV','OK') then 'TIER2'
WHEN (CASE WHEN DCA.STORE_LOCATION='040' THEN 'TX' ELSE SLOC.STATE END) IN ('TN','CO','AL','NC','MS','VA', 'FL', '') THEN 'TIER3' END) = 'TIER2' THEN 'MEDIUM'
  
WHEN (CASE WHEN (CASE WHEN DCA.STORE_LOCATION='040' THEN 'TX' ELSE SLOC.STATE END) in ('TX','LA','NM','SC','AZ') then 'TIER1' 
when (CASE WHEN DCA.STORE_LOCATION='040' THEN 'TX' ELSE SLOC.STATE END) IN ('GA','NV','OK') then 'TIER2'
WHEN (CASE WHEN DCA.STORE_LOCATION='040' THEN 'TX' ELSE SLOC.STATE END) IN ('TN','CO','AL','NC','MS','VA', 'FL', '') THEN 'TIER3' END) = 'TIER3' THEN 'LOW'
ELSE 'MISSING' END AS STATE_PROFITABILITY,  
--FLA.LST_PYMT  AS  LST_PYMNT_AMNT,
--FLA.LAST_PYMT_DT,
FFR.LAST_ACC_DPD AS MAX_DPD_LAST_ACC,  --(TAKE THIS INSTEAD OF FLA.DAYS_PAST_DUE_NBR)
--FLA.DAYS_PAST_DUE_NBR,
DFR.EXPERIAN_CUSTOM_SCORE,--FES.EXPERIAN_CUSTOMER_SCORE,
DFAS.OFFER_EXPIRY_DAYS,
DFAS.OFFER_EXPIRY_FLAG,
--BKDIS.PROD_CAT_DESC,
BK.bankruptcy_IN_PAST,
--FLA.PRIOR_CHARGE_OFF_DATE,
RTO.APPLICATION_ID AS RTO_APP_ID,
RTO.APPROVAL_AMOUNT AS  RTO_APPROVAL_AMOUNT,
RTO.CUSTOMER_ID AS RTO_CUSTOMER_ID,
RTO.MONEY_FACTOR AS  RTO_MULTIPLIER,
RTO.NUMBER_OF_PERIODIC_PAYMENTS,
DCL.LEASE_ID AS  RTO_ID,
((DCL.LEASE_AMOUNT_NO_TAX * RTO.MONEY_FACTOR ) - FLB.RENT_SETTLED)  AS RTO_BAL_AMT,
DCL.AMOUNT_DUE_AT_SIGNING AS  RTO_INITIAL_PYMNT,
DCL.NONLEASABLE_ITEMS_TOTAL AS  RTO_NON_LEASABLE_ITEMS ,
DCL.LEASE_AMOUNT_WITH_TAX AS  RTO_CASH_PRICE,
DCL.ONGOING_PAYMENT_AMOUNT  AS  RTO_RENT_PAYMENT,
DIV0(FLA.MONTHLY_PAYMENT_AMOUNT,FFR.CUST_MONTHLY_INCOME) AS PTI,
DCA.CAHE_ENTERED1 AS APPLICATION_DECISION_DATE,
CASE WHEN DCA.CAHE_AUTO_DECISION= 'Y' THEN 'N' ELSE 'Y' END AS CREDIT_GRANTING_FLAG,
CSM.EXPERIAN_RISKTIER,
CSM.TU_RISKTIER,
INITIAL_DELIVERY_DT,
MAX_DELIVERY_DT,
DP.PRODUCT_CATEGORY_DESC,
NULL AS PRODUCT_TYPE,
NULL AS PAYMENT_FREQUENCY, --PAYMENT_TYPE,
NULL AS CHANNEL,
NULL AS GDS_DECISION_CODE,
NULL AS PROVE_RESPONSE,
NULL AS FRAUD_SCORE,
NULL AS NDI,
NULL AS OFFER_PRESENTED_INSTALLMENT,
NULL AS OFFER_PRESENTED_LEASE,
NULL AS OFFER_PRESENTED_CARD,
NULL AS OFFER_DATE,
NULL AS CUST_OFFER_SELECTED,
CASE WHEN FFR.SOFT_PULL='N' OR FFR.SOFT_PULL='' THEN 'N' ELSE 'Y' END AS SOFT_PULL_FLAG,
CASE WHEN DCA.APPLICATION_STATUS='U' THEN 'Y' ELSE 'N' END AS HARD_PULL_FLAG,
NULL AS INSTALLATION_DATE,
NULL AS INSTALLATION_DATE_2,
NULL AS CONFIRMED_FRAUD,
NULL AS SUSPECTED_FRAUD,
NULL AS RTO_DELIV_FEE,
NULL AS INSTAL_FEE,
NULL AS HAUL_AWAY_FEE,
NULL AS RTO_WARRANTY,
NULL AS INSURANCE,
BKDIS.TAXES,
NULL AS RTO_RENTAL_COST,
NULL AS RTO_OPTIONAL_CHARGES,
NULL AS RTO_TTL_INITIAL_PYMNT,
NULL AS RTO_FRST_RNWL_PYMNT,
CURRENT_TIMESTAMP(4) AS DW_INSERT_DATE,
LCO.LAST_CO_DATE AS PRIOR_CHARGE_OFF_DATE,
DATEDIFF(DAYS,LCO.LAST_CO_DATE,DCA.CAHE_ENTERED1) AS DAYS_FROM_LASTCO

FROM "EDW_PRD"."MASTER"."DIM_CREDIT_APPLICATION" DCA  -- DCA


LEFT JOIN (SELECT DCA2.APPLICATION_ID, MAX(CO.CHARGE_OFF_DATE) AS LAST_CO_DATE FROM "EDW_PRD"."MASTER"."DIM_CREDIT_APPLICATION" DCA2
left join (Select DC1.SSN, FL.ACCOUNT_NUMBER,FL.CHARGE_OFF_DATE FROM "EDW_PRD"."MASTER"."FACT_LOAN_ACCOUNT" FL
LEFT JOIN "EDW_PRD"."MASTER"."DIM_CUSTOMER" DC1 ON FL.CUSTOMER_ID=DC1.CUSTOMER_ID
WHERE FL.CHARGE_OFF_DATE IS NOT NULL) CO
ON DCA2.SSN = CO.SSN AND CO.CHARGE_OFF_DATE <= DCA2.CAHE_ENTERED1 GROUP BY DCA2.APPLICATION_ID) LCO ON DCA.APPLICATION_ID = LCO.APPLICATION_ID

LEFT OUTER JOIN "EDW_PRD"."MASTER"."DIM_DATE" DDT ON DDT.TODAY=DCA.CAHE_ENTERED1 --DDT
  
LEFT OUTER JOIN "EDW_PRD"."MASTER"."DIM_DENIAL" DD ON DCA.DENIAL_CODE=DD.DENIAL_CODE --DD 

LEFT OUTER JOIN (                                                                                              
SELECT * FROM (SELECT *,ROW_NUMBER() OVER(PARTITION BY APPLICATION_ID ORDER BY TRANS_ID DESC) RW FROM
"EDW_PRD"."MASTER"."FACT_FICO_REQUEST") WHERE RW=1) FFR ON  DCA.APPLICATION_ID = FFR.APPLICATION_ID -- FFR  
               
LEFT OUTER JOIN (
  SELECT * FROM(SELECT *, ROW_NUMBER() OVER(PARTITION BY ORDER_ID ORDER BY CNTCT_VER DESC) RW FROM
  "EDW_PRD"."MASTER"."DIM_CREDIT_CONTRACT_AGREEMENT") WHERE RW=1) CA ON DCA.INVOICE_NB= CA.ORDER_ID -- CA  

LEFT OUTER JOIN "EDW_PRD"."MASTER"."DIM_CUSTOMER" DC ON DCA.CUSTOMER_ID=DC.CUSTOMER_ID -- DC      
               
LEFT OUTER JOIN (
SELECT * FROM (SELECT *, ROW_NUMBER() OVER(PARTITION BY ORD ORDER BY CONTRACT_VER DESC) RW FROM 
"EDW_PRD"."MASTER"."DIM_CONTRACT_EXTENSION") WHERE RW=1) DCE ON DCA.INVOICE_NB=DCE.ORD --DCE --CONFIRM THE JOIN TO GET Lets. CONT VER

LEFT OUTER JOIN (
SELECT * FROM (SELECT *, ROW_NUMBER() OVER(PARTITION BY FRS_APPLICATION ORDER BY TRANS_ID DESC) RW FROM 
"EDW_PRD"."MASTER"."DIM_FICO_RESPONSE") WHERE RW=1) DFR ON DCA.APPLICATION_ID=DFR.FRS_APPLICATION --DFR 18899535


//LEFT OUTER JOIN (
//SELECT *,IFF(CHARGE_OFF_DATE>'2015-01-01' AND CHARGE_OFF_ORIGINAL_AMOUNT>0,CHARGE_OFF_DATE,NULL)AS PRIOR_CHARGE_OFF_DATE FROM (SELECT *,ROW_NUMBER() OVER(PARTITION BY /*CUSTOMER_ID,*/APP_ID ORDER BY CUSTOMER_ID/*,APP_ID*/ DESC) RW FROM 
//"EDW_PRD"."MASTER"."FACT_LOAN_ACCOUNT") WHERE RW=1) FLA ON DCA.APPLICATION_ID=FLA.APP_ID --FLA 

left outer join "EDW_PRD"."MASTER"."FACT_LOAN_ACCOUNT" FLA ON CA.CREDIT_ACCOUNT=FLA.ACCOUNT_NUMBER::VARCHAR --FLA
   
LEFT OUTER JOIN (
SELECT FAS_TRANS_ID,MAX("'offerExpiryDays'") AS OFFER_EXPIRY_DAYS,
--MAX("'offerExpiryFlag'") AS OFFER_EXPIRY_FLAG,
CASE WHEN OFFER_EXPIRY_DAYS IS NOT NULL THEN 1 ELSE 0 END AS OFFER_EXPIRY_FLAG FROM
(SELECT * FROM "EDW_PRD"."MASTER"."DIM_FICO_ATTRIBUTE_SUMMARY"
PIVOT (MAX(FAS_VALUE) FOR FAS_ID IN('offerExpiryDays','offerExpiryFlag'))) GROUP BY FAS_TRANS_ID)
DFAS ON FFR.TRANS_ID=DFAS.FAS_TRANS_ID --DFAS

  
LEFT OUTER JOIN( 
   SELECT INV_NBR ,SUM(WAR_EXTT_AMT) AS WAR_EXTT_AMT,SUM(TAXES) AS TAXES FROM "EDW_PRD"."MASTER"."FACT_BOOKED_INVOICE_SALES" GROUP BY INV_NBR) BKDIS ON  DCA.INVOICE_NB=BKDIS.INV_NBR
  

LEFT OUTER JOIN (
select distinct APPLICATION as APPID, 
          'Y' as bankruptcy_IN_PAST, max('1'||SUBSTR(BUREAU_DETAILS ,1,2)||SUBSTR(BUREAU_DETAILS ,4,2)||SUBSTR(BUREAU_DETAILS,7,2)) over (partition by application)  as BK_in_Past_DT
          from "EDW_PRD"."MASTER"."CREDIT_BUREAU_DETAILS"
             where substr(BUREAU_DETAILS, 10, 5) in ('BKRPT', 'W E P') order by appid) AS BK
ON DCA.APPLICATION_ID=BK.APPID --BK

LEFT OUTER JOIN(
  SELECT * FROM 
  "EDW_PRD"."MASTER"."DIM_CUSTOMER_ADDRESS_DETAILS" WHERE CUSTOMER_ADDRESS_TYPE='PRI') DCAD ON DCA.CUSTOMER_ID=DCAD.CUSTOMER_ID --DCAD 18899535  

LEFT OUTER JOIN(
SELECT * FROM (SELECT *,ROW_NUMBER() OVER(PARTITION BY APPID ORDER BY CUSTOMER_ID DESC) RW FROM 
"EDW_PRD"."ANALYST_TEMP"."BIG_APP") WHERE RW=1)  BA ON DCA.APPLICATION_ID=BA.APPID --BA
  
LEFT OUTER JOIN "EDW_PRD"."ANALYTICS"."CREDIT_SCORING_MASTER" CSM ON DCA.APPLICATION_ID=CSM.APPLICATION_ID

LEFT OUTER JOIN 
(Select DA.*,REPLACE(REPLACE(REPLACE(REPLACE(APPLICATION_ID,'exp_',''),'-', ''),'EXP_' , ''),'0','') AS NEW_APP_ID FROM "EDW_PRD"."RTO"."DIM_RTO_APPROVALS" DA) RTO
ON RTO.NEW_APP_ID=DCA.APPLICATION_ID::VARCHAR   
LEFT OUTER JOIN 
(Select * FROM "EDW_PRD"."RTO"."FACT_RTO_CLIENT_LEASES") DCL
ON DCL.APPROVAL_ID=RTO.APPROVAL_ID
LEFT OUTER JOIN 
(SELECT * FROM "EDW_PRD"."RTO"."FACT_RTO_LEASE_BALANCES") FLB
ON FLB.APPROVAL_ID=RTO.APPROVAL_ID
  

LEFT OUTER JOIN (
SELECT "ORDER" AS INVOICENBR, Min(DELIVERY_STATUS_DATE) as INITIAL_DELIVERY_DT, Max(DELIVERY_STATUS_DATE) as MAX_DELIVERY_DT  from
"EDW_PRD"."MASTER"."DIM_POSTED_ORDER_DETAILS" where TRANSACTION_TYPE_CODE = 'S' Group by "ORDER") DPOD ON DCA.INVOICE_NB = DPOD.INVOICENBR

LEFT OUTER JOIN(  
SELECT * FROM(SELECT *,ROW_NUMBER() OVER(PARTITION BY "ORDER" ORDER BY TRANSACTION_AMOUNT DESC) RW FROM
"EDW_PRD"."MASTER"."DIM_POSTED_ORDER_DETAILS") WHERE RW=1) POD ON DCA.INVOICE_NB = POD."ORDER"
  LEFT OUTER JOIN
(SELECT DISTINCT PRODUCT_CATEGORY_CODE,PRODUCT_CATEGORY_DESC  FROM "EDW_PRD"."MASTER"."DIM_PRODUCT") DP 
ON POD.PRODUCT_CATEGORY::VARCHAR=LPAD(DP.PRODUCT_CATEGORY_CODE,3,'0')::VARCHAR
  
LEFT OUTER JOIN 
(SELECT * FROM EDW_PRD.MASTER.DIM_STORE_LOCATION ) SLOC ON DCA.STORE_LOCATION = SLOC."LOCATION" 
WHERE STORE_LOCATION IS NOT NULL);