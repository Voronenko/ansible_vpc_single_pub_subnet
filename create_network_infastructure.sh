#!/bin/sh

# Static parameters
WORKSPACE=$PWD
BOX_PLAYBOOK=$WORKSPACE/bin/network_create.yml
BOX_NAME=awsnetwork

echo $BOX_NAME

prudentia local <<EOF
unregister $BOX_NAME
register
$BOX_PLAYBOOK
$BOX_NAME

verbose 4

set env demo
set aws_region us-east-2

eenvset AWS_ACCESS_KEY_ID THISISVERYSECUREKEYID
eenvset AWS_SECRET_ACCESS_KEY ANDTHISISTHISISVERYSECUREKEYACCESSKEY

provision $BOX_NAME

unregister $BOX_NAME
EOF
