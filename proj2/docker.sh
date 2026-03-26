#!/bin/bash
yum update -y
yum install docker wget unzip -y
systemctl start docker
systemctl enable docker
docker run -dt --name=cw -t -p 80:80 vishumana/dockerproject:counterstrike2
