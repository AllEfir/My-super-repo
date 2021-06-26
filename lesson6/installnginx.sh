#!/bin/bash
echo "--START--"
yum -y update
echo "--install nginx--"
amazon-linux-extras -y install nginx
systemctl start nginx.service
systemctl enable nginx.service