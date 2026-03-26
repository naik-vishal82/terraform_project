#!/bin/bash
yum update -y
yum install httpd wget unzip -y
systemctl start httpd
systemctl enable httpd
cd /tmp
wget https://freewebsitetemplates.com/download/businessworldtemplate/businessworldtemplate.zip
unzip businessworldtemplate.zip
rm -rf /var/www/html/*
cp -r businessworldtemplate/* /var/www/html/
