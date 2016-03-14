#!/bin/bash

# update
sudo apt-get update
sudo apt-get dist-upgrade -y

# pip
sudo apt-get -y install python-pip

# docker with docker-compose
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
/etc/apt/sources.list.d/docker.list
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-cache policy docker-engine
sudo apt-get install linux-image-extra-$(uname -r) -y
sudo apt-get install apparmor -y
sudo apt-get install docker-engine -y
sudo pip install docker-compose
sudo usermod -aG docker vagrant

# awscli
sudo pip install awscli
