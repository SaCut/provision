#!/bin/bash

sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install python-software-properties -y

sudo apt-get install nginx -y

sudo echo "server {
    listen 80;

    server_name _;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}" | sudo tee /etc/nginx/sites-available/default

sudo systemctl restart nginx
 
# install nodejs6.x and npm
sudo echo "export DB_HOST=mongodb://10.0.2.100:27017/posts" >> /home/ubuntu/.bashrc

source /home/ubuntu/.bashrc

sudo apt-get install npm -y

sudo npm install -g pm2

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

sudo apt-get install nodejs -y

cd ~/app

npm install
# hostnamectl set-hostname app
