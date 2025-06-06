use role accountadmin;
use database DEV_DB;
use schema S_API_QONTO;


select * from requests;



select * from DEV_DB.S_API.V_APIS;

select * 
FROM S_API_QONTO.RESPONSES t,
LATERAL FLATTEN(input => t.CONTENT:transactions)
WHERE t.SERVICE = 'TRANSACTIONS'
--AND LABEL IN ('KPC SUD', 'KEY PERFORMANCE CONSULTING FINANCE', 'JCDECAUX FRANCE')
AND OPERATION_TYPE = 'income'
AND LABEL not in  ('teckio', 'hull', 'NOREY');
