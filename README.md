# AWS-SQS-benchmark

Scripts to experiment with AWS SQS and get a better understanding on standard and FIFO queues. The scripts are using AWS CLI.

This experiment requires:
- a host with AWS CLI installed and configured
- an AWS account

1. Create SQS standard queue (in this case, using a CloudFormation template)
	aws cloudformation create-stack --stack-name jpsqs-std-stack --template-body file:///jpapp/scripts/jpsqs-std.yml
	aws cloudformation describe-stacks --stack-name jpsqs-std-stack
2. Edit variables in sqs-std-send-msg.bash and sqs-std-receive-msg.bash scripts according to your environment.
3. Open multiple shell windows
   Run sqs-std-send-msg.bash script and then sqs-std-receive-msg.bash in different shell windows.
   Monitor the queue depth from the SQS window of AWS Management Console.
   The script sqs-std-send-msg.bash will generate messages and put them in the standard queue.
   The script sqs-std-receive-msg.bash will read them from the queue, write append the message to an output file and delete them after read.
4. Tail the output file and notice that the message is not in sequential order.
5. When you are done, delete standard queues
	aws cloudformation delete-stack --stack-name jpsqs-std-stack
6. Create SQS FIFO queue
	aws cloudformation create-stack --stack-name jpsqs-fifo-stack --template-body file:///jpapp/scripts/jpsqs-fifo.yml
	aws cloudformation describe-stack --stack-name jpsqs-fifo-stack
7. Repeat step 2-4 using scripts sqs-fifo-send-msg.bash and then sqs-fifo-receive-msg.bash
   Compare the write and read throughput difference between standard and FIFO queues. Also notice that the message will be read in sequential order in FIFO queue.
8.  When you are done, delete the queues
	aws cloudformation delete-stack --stack-name jpsqs-fifo-stack
