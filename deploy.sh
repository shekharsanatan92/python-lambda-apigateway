#!/bin/bash

set -e

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

echo -e  "$COL> Deploying CloudFormation stack...$NOC"
aws cloudformation deploy \
  "$@" \
  --template-file templates/dynamodb.yaml \
  --capabilities CAPABILITY_IAM \
  --stack-name "$STACK_NAME_DYNAMO" \
  --region $REGION
  
aws cloudformation deploy \
  "$@" \
  --template-file templates/s3.yaml \
  --capabilities CAPABILITY_IAM \
  --stack-name "$STACK_NAME_S3" \
  --region $REGION

aws cloudformation deploy \
  "$@" \
  --template-file templates/lambdaRestApi.yaml \
  --capabilities CAPABILITY_IAM \
  --stack-name "$STACK_NAME_LAMBDA_REST_API" \
  --region $REGION

aws cloudformation deploy \
  "$@" \
  --template-file templates/apigateway.yaml \
  --capabilities CAPABILITY_IAM \
  --stack-name "$STACK_NAME_GATEWAY" \
  --region $REGION

