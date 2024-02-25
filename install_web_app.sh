#!/bin/bash
sudo su
yum update -y
yum install git -y
git clone https://github.com/labeveryday/ice-cream.git
sudo yum install -y httpd
systemctl enable httpd 
systemctl start httpd
chmod o+w /var/www/html
mv ice-cream/* /var/www/html
public_ip=$(curl 'http://169.254.169.254/latest/meta-data/public-ipv4' -w "\n")
aws_region=$(curl 'http://169.254.169.254/latest/meta-data/placement/region' -w "\n")
echo "$public_ip" >/var/www/html/ip.txt
echo "$aws_region" >/var/www/html/region.txt