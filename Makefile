# Makefile for ansible-ndtk

HASH=$(shell dd if=/dev/urandom bs=9 count=1 2>/dev/null | base64 | tr '+/' '_-')

help:	##
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

install:
	## make install - installs "NGINX Plus"
	ansible-playbook --ask-pass -i hosts install-nginx-plus/site.yml

default:
	## make default - resets nginx configurations to default
	ansible-playbook --ask-pass -i hosts default-configuration/site.yml

template:
	## make template - generates an nginx ansible playbook template configuration
	cp -R default-configuration template-${HASH}

deploy:
	## make deploy FOO=BAR - deploys specific ansible playbook folder
	ansible-playbook --ask-pass -i hosts ${FOO}/site.yml
