#!/bin/bash
echo "--START--"
yum -y update
echo "--install redis--"
amazon-linux-extras -y install redis
systemctl start redis.service
systemctl enable redis.service