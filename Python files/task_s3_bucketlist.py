import boto3

session = boto3.Session()
s3_client = session.client('s3')

# List s3 bucket
response = s3_client.list_buckets()
print("S3 Buckets:")
for bucket in response['Buckets']:
    print(f"- {bucket['Name']}")

# Gett name of  bucket to count objects in it
bucket_name = input("Enter the name of the bucket to count objects: ")

# Count objects in the bucket
try:
    response = s3_client.list_objects_v2(Bucket=bucket_name)
    total_objects = sum(1 for _ in response['Contents'])
    print(f"Total objects in {bucket_name}: {total_objects}")
except ClientError as e:
    if e.response['Error']['Code'] == 'NoSuchBucket':
        print(f"Bucket '{bucket_name}' does not exist.")
    else:
        raise
