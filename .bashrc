#!/bin/bash
# this file will be sourced add the end of ~/.bashrc of the vagrant user

# bin
export PATH=$PATH:/vagrant/bin # allow helper scripts to be accessed globally
chmod +x /vagrant/bin/* # relaxed adding of new scripts

# ansible
export ANSIBLE_CONFIG=/vagrant/ansible/ansible.cfg # main configuration
export ANSIBLE_HOSTS=/etc/ansible/ec2.py # external aws ec2 inventory
export EC2_INI_PATH=/vagrant/ansible/ec2.ini # configuration for external aws ec2 inventory

# copy keys to vm (access restriction via chmod will not work on windows)
cp /vagrant/secret/*.pem ~/
chmod 600 *.pem

# secret env (include aws credentials here)
if [ -f "/vagrant/secret/.bashrc" ] ; then
    source "/vagrant/secret/.bashrc"
fi
