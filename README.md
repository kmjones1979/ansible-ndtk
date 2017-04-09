# NGINX Demo Toolkit

Setup on client side requires Ansible 2.0+, I typically use Ubuntu 16.04 so all commands in this README will be for Ubunutu.

#### Install Ansible

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

First we will create a hosts file that Ansible will use to deploy.

```
$ echo "[nginx-plus]" | tee hosts
$ echo "127.0.0.1" | tee -a hosts
```

Note: when using SSH key authentication no password is required and the --ask-pass flags can be removed from the Makefile

Requires:

- GNU Make 4.1+
- Ansible 2.0+
- Ubuntu 16.04+ (Deployment host)
