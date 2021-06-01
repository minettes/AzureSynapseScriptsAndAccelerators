SELECT OWNER AS SCHEMA_NAME, name AS OBJECT_NAME, type AS OBJECT_TYPE, MAX(line) AS LINE_COUNT, 
	COUNT(DECODE (REPLACE(text, chr(10), ''), NULL, NULL, '1')) AS NO_EMPLY_LINE_COUNT, SUM(LENGTH(TEXT)) AS CHAR_COUNT 
FROM dba_source 
WHERE OWNER NOT IN ('SYS', 'SYSTEM', 'ANONYMOUS', 'CTXSYS', 'DBSNMP', 'LBACSYS', 'MDSYS', 'OLAPSYS', 'ORDPLUGINS', 
	'ORDSYS', 'OUTLN', 'SCOTT', 'WKSYS', 'WMSYS', 'XDB',   'DVSYS', 'EXFSYS', 'MGMT_VIEW', 'ORDDATA', 'OWBSYS', 'ORDPLUGINS', 
	'SYSMAN', 'WKSYS', 'WKPROXY', 'AUDSYS', 'GSMADMIN_INTERNAL', 'DBSFWUSER', 'OJVMSYS', 'APPQOSSYS', 'REMOTE_SCHEDULER_AGENT', 'DVF', 'ORACLE_OCM') 
GROUP BY OWNER, name, type;
 