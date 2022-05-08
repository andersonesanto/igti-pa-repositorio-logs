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
