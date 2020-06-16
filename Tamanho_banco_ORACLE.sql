SELECT 'Database Tamanho' "Nome"
,ROUND(SUM(ROUND(SUM(NVL(fs.bytes/1024/1024,0)))) /
SUM(ROUND(SUM(NVL(fs.bytes/1024/1024,0))) + ROUND(df.bytes/1024/
1024 - SUM(NVL(fs.bytes/1024/1024,0)))) * 100, 0) "%Livre"
,ROUND(SUM(ROUND(df.bytes/1024/1024 - SUM(NVL(fs.bytes/1024/
1024,0)))) / SUM(ROUND(SUM(NVL(fs.bytes/1024/1024,0))) +
ROUND(df.bytes/1024/1024 - SUM(NVL(fs.bytes/1024/1024,0)))) * 100,
0) "%Usado"
,SUM(ROUND(SUM(NVL(fs.bytes/1024/1024/1024,0)))) "GB Livre"
,SUM(ROUND(df.bytes/1024/1024/1024
- SUM(NVL(fs.bytes/1024/1024/1024,0)))) "GB Usado"
,SUM(ROUND(SUM(NVL(fs.bytes/1024/1024/1024,0))) + ROUND(df.bytes/1024/
1024/1024
- SUM(NVL(fs.bytes/1024/1024/1024,0)))) "Tamanho em GB"
FROM dba_free_space fs, dba_data_files df
WHERE fs.file_id(+) = df.file_id
GROUP BY df.tablespace_name, df.file_id, df.bytes,
df.autoextensible
ORDER BY df.file_id ;


select *    from dba_tablespace_usage_metrics   where tablespace_name in (select TABLESPACE_NAME from DBA_TABLESPACES) 
and USED_PERCENT = USED_SPACE / TABLESPACE_SIZE * 100 order by 1;

select * from dba_tablespace_usage_metrics  
where tablespace_name in ('TSD_FROTA')order by 1;

select * from dba_tablespace_usage_metrics  where
USED_PERCENT = USED_SPACE / TABLESPACE_SIZE * 100
and TABLESPACE_NAME='TSD_FROTA';

select file_id,tablespace_name,round(bytes/1024/1024) size_mb,blocks,autoextensible,increment_by,round(maxbytes/1024/1024) max_mb 
from dba_data_files where tablespace_name in ('TSD_FROTA')order by 1;