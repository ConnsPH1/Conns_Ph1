-- EDW_PRD.ANALYTICS.VIEW_DAILY_SNAPSHOT_LOAN_ACCOUNT source

create or replace view EDW_PRD.ANALYTICS.VIEW_DAILY_SNAPSHOT_LOAN_ACCOUNT(
	ASOFDATE,
	MOB,
	OPENED_DATE,
	BOOKED_DATE,
	ACCOUNT_NUMBER,
	CUSTOMER_ID,
	LOAN_TYPE,
	LOCATION_NBR,
	CLASS_CODE,
	LTD_DQ30_PLUS_CNT,
	LTD_DQ60_PLUS_CNT,
	LTD_DQ90_PLUS_CNT,
	ORIGINAL_TERM,
	CURRENT_TERM,
	TOTAL_REAGE_NBR,
	REAGE_IND,
	LTD_EXTENSION_NBR,
	LTD_PAYMENTS_MADE_NBR,
	AMT_FINANCED,
	PRINCIPAL_BALANCE,
	NET_BALANCE,
	DAYS_PST_DUE_NBR,
	NEXT_DUE_DATE,
	MONTHLY_PAYMENT_AMT,
	YTD_INTR_ACCURED,
	MTD_INTR_ACCURED,
	LTD_INTR_ACCURED,
	LTD_INTR_PAID,
	YTD_INTR_PAID,
	LTD_INTR_WAIVED,
	CUR_INTEREST_REBATE,
	LATE_CHRG_COLLECT,
	LATE_CHRG_UNCOLLECTED,
	LATE_CHRG_WAIVED,
	COLLATERAL_DESCRIPTION,
	CUR_PAYMENT_DUE,
	NET_PAY_OFF,
	RETURNED_CHECKS,
	PAST_DUE_INTRST,
	PAST_DUE_PRINCIPAL,
	TOT_PAST_DUE,
	BEG_OF_MONTH_BALANCE,
	BANK_CODE,
	BRANCH,
	LOAN_STATUS,
	UNCOLLECTED_INTEREST,
	FPNA_PF_BALANCE,
	APR,
	INTEREST_RATE,
	APPLICATION_ID,
	APPLICATION_SOURCE,
	ORIG_FICO,
	NEW_EXISTING_FLAG,
	DOWN_PMT_PCT,
	COP_TERM,
	EXPERIAN_CUSTOM_SCORE,
	RISKTIER,
	RISK_GRADE,
	STATE_CUSTOMER,
	INTEREST_COMPUTATION,
	TDR_FLAG,
	SNAPSHOT_KEY
) as
select    
(current_date()::date -1) as ASOFDATE,
datediff(month, LA.BOOKED_DATE::date, ASOFDATE::date) as MOB ,
LA.DATE_OPENED as Opened_Date,        
LA.BOOKED_DATE,         
LA.ACCOUNT_NUMBER ,        
LA.CUSTOMER_ID AS CUSTOMER_ID,         
LA.LOAN_TYPE,         
LA.LOCATION_NUMBER AS LOCATION_NBR,
LA.CLASS_CODE,         
LA.LTD_DQ30_PLUS_CNT, --ok        
LA.LTD_DQ60_PLUS_CNT ,        
LA.LTD_DQ90_PLUS_CNT,--ok  
LA.ORIGINAL_TERM,         
LA.CURRENT_TERM, --ok          
(LA.CURRENT_TERM -LA.ORIGINAL_TERM) as TOTAL_REAGE_NBR,
LA.LAST_UPDATE_PROGRAM as Reage_IND,--ok  
LA.TIMES_EXTED as LTD_EXTENSION_NBR,      
LA.TOTAL_NUMBER_OF_PYMTS as LTD_Payments_Made_Nbr,
LA.AMT_FINANCED,         
LA.PRINCIPAL_BALANCE,         
LA.NET_BALANCE,  
datediff(day, LA.NEXT_PAYMENT_DUE_DATE,ASOFDATE::DATE)  AS Days_Pst_Due_Nbr,
LA.NEXT_PAYMENT_DUE_DATE as NEXT_DUE_DATE,         
LA.MONTHLY_PAYMENT_AMOUNT as MONTHLY_PAYMENT_AMT,
LA.YTD_INTR_ACCURED,
LA.MTD_INTR_ACCURED,
LA.LTD_INTR_ACCURED,
LA.LTD_INTR_PAID, 
LA.YTD_INTR_PAID,
LA.LTD_INTR_WAIVED,
LA.CURRENT_INTEREST_REBATE_AMOUNT as CUR_INTEREST_REBATE, 
LA.LATE_CHRG_COLLECT,
LA.UNPAID_LATE_CHARGES AS Late_Chrg_Uncollected,
LA.LATE_CHRG_WAIVED,
LA.COLLATERAL_DESCRIPTION,
LA.CURRENT_AMOUNT_DUE AS CUR_Payment_Due,
LA.PAYOFF_AMOUNT AS Net_Pay_Off,
LA.RETURNED_CHECKS,
LA.PAST_DUE_INTRST,
LA.PAST_DUE_PRINCIPAL,
LA.TOT_PAST_DUE,
LA.BEG_OF_MON_BAL AS Beg_of_Month_Balance,
LA.BANK_CODE,
LA.BRANCH_CODE AS BRANCH,
LA.LOAN_STATUS,
LA.UNPAID_INTEREST AS uncollected_interest,
(LA.Principal_Balance -  LA.CURRENT_INTEREST_REBATE_AMOUNT +LA.PATL_INT+LA.UNPAID_INTEREST)AS	FPNA_PF_Balance,
CCA.APR,         
LA.INTEREST_RATE, 
CA.APPLICATION_ID,
CA.APPLICATION_SOURCE,
CA.FICO AS ORIG_FICO ,
CA.FICO_CUST_NEW AS NEW_EXISTING_FLAG,
CASE WHEN CA.GRADER_OVERRIDE NOT IN ('','N')
THEN CA.DOWN_PAY_OVERRIDE ELSE CA.DOWN_PMT END AS DOWN_PMT_PCT,
CASE WHEN cca.CONTRACT_TYPE IN ('18', '30', '36', '2R', '2Y', '3R', '4R', 'A3', 'A6', 'AY', 'I3', 'I6', 'IF', 'IY', 'O3', 'O6', 'OY')
THEN 'CASH OPTION' ELSE 'NON CASH OPTION' END AS COP_term ,
CSM.EXPERIAN_CUSTOM_SCORE,
CSM.RISKTIER::VARCHAR(255) AS RISKTIER,         
CSM.RISK_GRADE::VARCHAR(255) AS RISK_GRADE,        
CS.STATE AS  STATE_CUSTOMER,
CASE WHEN LA.BANK_CODE = '550' OR LA.BANK_CODE = '750' AND
LA.BRANCH_CODE  in  ('0003','0004','0017','0018','0019','0021','0023','0026','0029','0030')
then 'SI' ELSE 'PC' END AS  Interest_Computation ,
CASE WHEN (LA.CURRENT_TERM -  LA.ORIGINAL_TERM) > 3 THEN 'Y' WHEN LA.COLLATERAL_DESCRIPTION  = 'RFNC' 
THEN 'Y' WHEN LA.COLLATERAL_DESCRIPTION = 'RRR' THEN 'Y' ELSE 'N' END AS TDR_FLAG, --need to fix,
TO_CHAR(ASOFDATE,'YYYYMMDD')::VARCHAR(255) AS SNAPSHOT_KEY        
FROM  "EDW_PRD"."MASTER"."FACT_LOAN_ACCOUNT" LA
LEFT JOIN "EDW_PRD"."MASTER"."DIM_CREDIT_APPLICATION" CA ON LA.APP_ID = CA.APPLICATION_ID 
--LEFT JOIN  "EDW_PRD"."MASTER"."DIM_CREDIT_CONTRACT_AGREEMENT"  CCA ON   lpad(la.ACCOUNT_NUMBER,12,'0')::varchar = CCA.CREDIT_ACCOUNT::VARCHAR 
LEFT OUTER JOIN (SELECT * FROM 
(SELECT CREDIT_ACCOUNT, ORDER_ID AS INVOICE_NBR,CONTRACT_TYPE, APR, ROW_NUMBER() OVER(PARTITION BY CREDIT_ACCOUNT ORDER BY INVOICE_NBR DESC) RW 
FROM"EDW_PRD"."MASTER"."DIM_CREDIT_CONTRACT_AGREEMENT") CCA  WHERE RW = 1) CCA ON 
lpad(la.ACCOUNT_NUMBER,12,'0')::varchar = CCA.CREDIT_ACCOUNT::VARCHAR       
left join   "EDW_PRD"."ANALYTICS"."CREDIT_SCORING_MASTER" CSM on LA.APP_ID = CSM.APPLICATION_ID 
LEFT JOIN  (SELECT STATE, CUSTOMER_ID FROM (SELECT B.STATECODE AS STATE, A.CUSTOMER_ID , A.CUSTOMER_ADDRESS_TYPE,
ROW_NUMBER() OVER(PARTITION BY CUSTOMER_ID ORDER BY CUSTOMER_ID) RW
FROM "EDW_PRD"."MASTER"."DIM_CUSTOMER_ADDRESS_DETAILS"  A
LEFT JOIN  "EDW_PRD"."MASTER"."DIM_ZIPCODE" B ON A.CUSTOMER_ADDRESS_ZIP=RTRIM(B.ZIP_CODE,'0.') )WHERE CUSTOMER_ADDRESS_TYPE = 'PRI' AND RW = 1) CS  
ON LA.CUSTOMER_ID = CS.CUSTOMER_ID  WHERE LA.LOAN_STATUS = 'A';