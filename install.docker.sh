#!/bin/bash

echo ''
echo 'Installing dependencies...'
echo ''
sudo yum update -y && sudo yum upgrade -y
sudo yum install -y docker
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

echo ''
echo 'Start DOCKER'
echo ''
sudo systemctl start docker

echo ''
echo 'Configuring Docker...'
echo ''
sudo systemctl enable docker


echo ''
echo 'Installing app...'
echo ''
curl https://raw.githubusercontent.com/thibaultyou/tradingview-alerts-processor/master/docker-compose.yml --output docker-compose.yml
mkdir -p docker/db
sudo chown 1001 docker/db
sudo docker-compose up -d
