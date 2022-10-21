#!/bin/bash

sudo unlink /etc/nginx/sites-enabled/default
sudo echo "server {
listen 80;
server_name _;
location / {
proxy_pass http://dns_name
}
}" > /etc/nginx/sites-available/custom_server.conf
sudo ln -s /etc/nginx/sites-available/custom_server.conf /etc/nginx/sites-enabled/custom_server.conf
sudo systemctl restart nginx