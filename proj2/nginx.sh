#!/bin/bash
yum update -y
yum install nginx wget unzip -y
systemctl start nginx
systemctl enable nginx
cd /tmp
wget https://freewebsitetemplates.com/download/cakewebsitetemplate/cakewebsitetemplate.zip
unzip cakewebsitetemplate.zip
rm -rf /usr/share/nginx/html/*
cp -r cakewebsitetemplate/* /usr/share/nginx/html/
