# NGINX Demo Toolkit

Setup on client side requires Ansible 2.0+. I also use Ubuntu 16.04 in my scripting so if you use a different distro the playbooks and scripts contained in this github repository will need to be altered.

#### Install Ansible (Client side)

```
$ sudo apt-get install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt-get update
$ sudo apt-get install ansible
```


#### Checkout ansible-ndtk

```
$ git clone https://github.com/kmjones1979/ansible-ndtk.git
$ cd ansible-ndtk
```

#### Setup Environment

The following make command will setup all of the pre-requisites for running this script. It will...
1. Create a basic "hosts" file for the Ansible deployment (pointing at 127.0.0.1).
2. Create a directory where you will store your unique key and certificate needed to deploy and install NGINX Plus within your environment.

```
$ make setup
```


#### Help

For help, using the make help command you can list the associated comments for each option in the Makefile.

```
$ make help
```

Note: when using SSH key authentication no password is required and the --ask-pass flags can be removed from the Makefile

Requires:

- GNU Make 4.1+
- Ansible 2.0+
- Ubuntu 16.04+ (Deployment host)
