#!/bin/bash
yum install wget unzip httpd -y
systemctl start httpd
systemctl enable httpd
wget https://www.tooplate.com/zip-templates/2107_new_spot.zip
unzip -o 2107_new_spot.zip
cp -r 2107_new_spot/* /var/www/html/
systemctl restart httpd