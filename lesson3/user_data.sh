#!/bin/bash
echo "------------------START------------------"
yum -y update
yum -y install httpd
echo "<html><body bgcolor=vlack><center><h2><p><font color=red>Hello 4uvaki</h2></center></body></html>" > /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
cat netumenya.txt
cho "UserData executed on $ (date)" >> /var/www/html/log.txt
echo "-----------FINISH----------"