CREATE EXTERNAL TABLE IF NOT EXISTS coleta_logs.logs_data
(
    'date' timestamp,
    'filepath' string,
    'level' string,
    'timestamp' timestamp,
    'message' string,
    'client' string,
    'environment' string,
    'hostname' string,
    'port' string
) 
PARTITIONED BY 
(
    client string,
    environment string,
    hostname string,
    port string,
    year string,
    month string,
    day string
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES ('serialization.format' = '1') 
TBLPROPERTIES ('has_encrypted_data'='false')
LOCATION 's3://logs-pa-597495568095';



CREATE EXTERNAL TABLE `logs_data`(
  `date` string COMMENT 'from deserializer', 
  `filepath` string COMMENT 'from deserializer', 
  `timestamp` string COMMENT 'from deserializer', 
  `level` string COMMENT 'from deserializer', 
  `message` string COMMENT 'from deserializer', 
  `hostname` string COMMENT 'from deserializer', 
  `environment` string COMMENT 'from deserializer', 
  `port` string COMMENT 'from deserializer', 
  `client` string COMMENT 'from deserializer')
PARTITIONED BY ( 
  `client` string, 
  `environment` string, 
  `hostname` string, 
  `port` string, 
  `year` string, 
  `month` string, 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
WITH SERDEPROPERTIES ( 
  'paths'='client,date,environment,filepath,hostname,level,message,port,timestamp') 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://logs-pa-597495568095/'
TBLPROPERTIES (
  'CrawlerSchemaDeserializerVersion'='1.0', 
  'CrawlerSchemaSerializerVersion'='1.0', 
  'UPDATED_BY_CRAWLER'='cr1', 
  'averageRecordSize'='1042', 
  'classification'='json', 
  'compressionType'='none', 
  'objectCount'='28', 
  'recordCount'='101588', 
  'sizeKey'='106108711', 
  'typeOfData'='file')



  CREATE EXTERNAL TABLE `logs_data`(
  `date` string , 
  `filepath` string , 
  `timestamp` string , 
  `level` string , 
  `message` string )
PARTITIONED BY ( 
  `client` string, 
  `environment` string, 
  `hostname` string, 
  `port` string, 
  `year` string, 
  `month` string, 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
WITH SERDEPROPERTIES ( 
  'paths'='client,date,environment,filepath,hostname,level,message,port,timestamp') 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://logs-pa-597495568095/'
TBLPROPERTIES (
  'classification'='json', 
  'compressionType'='none', 
  'typeOfData'='file')