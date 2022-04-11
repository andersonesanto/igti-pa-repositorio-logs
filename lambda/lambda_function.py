import boto3

def lambda_handler(event, context):
    bucket_name = '597495568095-athena-work'

    client = boto3.client('athena')

    config = {
        'OutputLocation': 's3://' + bucket_name + '/',
        'EncryptionConfiguration': {'EncryptionOption': 'SSE_S3'}

    }

    # Query Execution Parameters
    sql = 'MSCK REPAIR TABLE coleta_logs.logs_data'
    context = {'Database': 'coleta_logs'}

    client.start_query_execution(QueryString = sql, 
                                 QueryExecutionContext = context,
                                 ResultConfiguration = config)