
#!/bin/bash
set -euxo pipefail
#------------------------------------------------------------------------------#
STACK_NAME_DYNAMO=dynamodb
STACK_NAME_S3=s3
STACK_NAME_LAMBDA_REST_API=lambdaRestApi
STACK_NAME_GATEWAY=apigateway
REGION=us-west-2
#------------------------------------------------------------------------------#

# Output colours
COL='\033[1;34m'
NOC='\033[0m'

echo -e  "$COL> Destroying CloudFormation stacks...$NOC"

# Run below to delete stacks
aws cloudformation delete-stack --stack-name $STACK_NAME_GATEWAY --region $REGION
aws cloudformation wait stack-delete-complete --stack-name $STACK_NAME_GATEWAY --region $REGION

aws cloudformation delete-stack --stack-name $STACK_NAME_LAMBDA_REST_API --region $REGION
aws cloudformation wait stack-delete-complete --stack-name $STACK_NAME_LAMBDA_REST_API --region $REGION

aws cloudformation delete-stack --stack-name $STACK_NAME_DYNAMO --region $REGION
aws cloudformation wait stack-delete-complete --stack-name $STACK_NAME_DYNAMO --region $REGION

aws cloudformation delete-stack --stack-name $STACK_NAME_S3 --region $REGION
aws cloudformation wait stack-delete-complete --stack-name $STACK_NAME_S3 --region $REGION



