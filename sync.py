import boto3
import urllib

TARGET_BUCKET = 'destination-bucket-name-account-b'

def lambda_handler(event, context):
    try:
        
        source_bucket = 'source-bucket-account-a-name' 
        source_key =  'changes this with your object key name' 

        # Copy object to a different bucket
        s3_resource = boto3.resource('s3')
        copy_source = {
            'Bucket': source_bucket,
            'Key': source_key
        }
        target_key = source_key  # Change if desired

        s3_resource.Bucket(TARGET_BUCKET).Object(target_key).copy(copy_source, ExtraArgs={'ACL': 'bucket-owner-full-control'})

        return {
            'statusCode': 200,
            'body': 'Object copied successfully!'
        }
    except Exception as e:
        # Handle and log the error
        print(f"Error: {str(e)}")
        return {
            'statusCode': 500,
            'body': 'Error copying object.'
        }
