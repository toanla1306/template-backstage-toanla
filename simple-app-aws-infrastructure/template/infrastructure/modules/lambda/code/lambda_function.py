import json
import time
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('demo-amplify')

# define the handler function that the Lambda service will use as an entry point
def lambda_handler(event, context):
    body = json.loads(event['body'])
    name = body.get("firstName") +' '+ body.get("lastName")

    gmt_time = time.gmtime()
    now = time.strftime('%a, %d %b %Y %H:%M:%S +0000', gmt_time)
    response = table.put_item(
        Item={
            'hash_key_attribute': 'hash_key_attribute',
            'range_key_attribute': 20,
            'ID': name,
            'LatestGreetingTime':now
            }
        )
# return a properly formatted JSON object
    return {
    'statusCode': 200,
    'body': json.dumps('Hello from Lambda, ' + name)
    }