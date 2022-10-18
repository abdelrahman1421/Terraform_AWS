#!/bin/bash

sudo unlink /etc/nginx/sites-enabled/default
sudo echo "server {
listen 80;
server_name _;
location / {
proxy_pass http://internal-terraform-private-load-balancer-1503470903.us-east-1.elb.amazonaws.com;
}
}" > /etc/nginx/sites-available/custom_server.conf
sudo ln -s /etc/nginx/sites-available/custom_server.conf /etc/nginx/sites-enabled/custom_server.conf
sudo systemctl restart nginx