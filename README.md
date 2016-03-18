# vagrant-dev

Vagrant managed VirtualBox VM (ubuntu-trusty64) for AWS configured with Docker and Ansible.

## Vagrant

### Recommended plugins

    vagrant plugin install vagrant-cachier
    vagrant plugin install vagrant-vbguest
    vagrant plugin install vagrant-proxyconf
    
Cachier caches downloads, vbguest installs the host's VirtualBox Guest Additions, proxyconf helps dealing with corporate proxies.
    
## AWS

### Settings and Keys

Place credentials and default region in `.bashrc` in the `secret` directory next to the Vagrantfile. Keys also go there:

	secret/.bashrc
	secret/*.pem
	...
	Vagrantfile
	
Note: Keys are copied into the VM on each login to restrict access required by ssh.

### Helper Scripts

* `ec2-ssh <ec2-public-ip-address>` : ssh login into your instance
* `ec2-status` : Returns a status table for all your instances
* `ec2-terminate <ec2-instance-id>` : Terminates the instance with the given ID
* `ec2-terminate-all` : Terminates all instance (after prompt)


## Smoke Test

* `ec2-status` should list all your ec2 instances
* `ansible all -m ping` should ping all ec2 instances
* `ansible all -a "df -h"` should show disk space on all ec2 instances

---

Use at your own risk.






	
