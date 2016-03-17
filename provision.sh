#!/bin/bash
#
# provisioning file for vagrant box "ubuntu/trusty64" with docker and ansible support
#

# allow environments in shared folder; public may be versioned, private may not and can contain auth etc.
cat <<EOT >> .bashrc
if [ -f "/vagrant/.bashrc" ] ; then
    source "/vagrant/.bashrc"
fi
EOT

# docker with docker-compose
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-cache policy docker-engine
sudo apt-get install docker-engine -y
sudo apt-get install python-pip -y
sudo pip install docker-compose
sudo usermod -aG docker vagrant

# awscli
sudo pip install awscli

# ansible with external aws ec2 inventory
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible -y
sudo pip install boto
sudo wget –q https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py -P /etc/ansible
sudo chmod +x /etc/ansible/ec2.py
# prevent strict key checking because of host recreation
mkdir -p /home/vagrant/.ssh
cat <<EOT >> /home/vagrant/.ssh/config
Host *
    StrictHostKeyChecking no
EOT
# add ssh agent setup with all keys in /vagrant/secret/*.pem for easy ansibling
cat <<EOT >> .profile
export PATH=$PATH:/vagrant/aws
# enable ssh-agent for ansible
exec ssh-agent bash -s 10<&0 << EOF
    ssh-add /vagrant/secret/*.pem &> /dev/null
    exec bash <&10-
EOF
EOT
