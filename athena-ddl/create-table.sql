CREATE EXTERNAL TABLE IF NOT EXISTS 'coleta-logs'.'logs-data' 
(
    'date' timestamp,
    'filepath' string,
    'level' string,
    'timestamp' timestamp,
    'message' string,
    'hostname' string,
    'environment' string,
    'port' string,
    'client' string
) 
PARTITIONED BY (
    client string,
    environment string,
    hostname string,
    port string,
    YEAR string,
    MONTH string,
    DAY string
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES ('serialization.format' = '1') 
TBLPROPERTIES ('has_encrypted_data'='false')
LOCATION 's3://logs-pa-597495568095';