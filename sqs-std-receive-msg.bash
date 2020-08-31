#!/bin/bash

REGION="us-east-2"
SQS_URL="https://sqs.us-east-2.amazonaws.com/"
QUEUE_URL=${SQS_URL}"082617581021/jplabqueue01"

echo "Start time: " $(date +%F" "%T"."%N)

while true
do
	RCV_HANDLE=`aws sqs receive-message --region $REGION --endpoint-url $SQS_URL --queue-url $QUEUE_URL|tee -a sqs_std_messages.txt|grep "ReceiptHandle"|awk -F": \"" '{print $2}'`
	[ -z "$RCV_HANDLE" ] && break
	aws sqs delete-message --region $REGION --endpoint-url $SQS_URL --queue-url $QUEUE_URL --receipt-handle "${RCV_HANDLE%??}"
done

echo "End time  : " $(date +%F" "%T"."%N)
