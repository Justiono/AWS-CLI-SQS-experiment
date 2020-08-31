#!/bin/bash

REGION="us-east-2"
SQS_URL="https://sqs.us-east-2.amazonaws.com/"
QUEUE_URL=${SQS_URL}"082617581021/jplabqueue01"
SQS_MSG="Hello SQS subscribers, this is message number:"

echo "Start time: " $(date +%F" "%T"."%N)

for i in {1..100}
do
	aws sqs send-message --region $REGION --endpoint-url $SQS_URL --queue-url $QUEUE_URL --message-body "${SQS_MSG}"${i}" Created on:"$(date +%F"-"%T"."%N)
done

echo "End time  : " $(date +%F" "%T"."%N)
