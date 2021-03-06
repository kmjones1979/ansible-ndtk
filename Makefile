# Makefile for ansible-ndtk

HASH=$(shell dd if=/dev/urandom bs=9 count=1 2>/dev/null | base64 | tr '+/' '_-')

help:	##
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

setup:	## make setup		: setup after checkout
	@echo "[INFO] - checking if SSL repository access directory exists"  && \
	mkdir -p install_nginx_plus/roles/nginx-plus/files/etc/ssl/nginx/ && \
	echo "[INFO] - checking if "hosts" file exists" && \
	if [ ! -f hosts ]; then echo "[nginx-plus]\n127.0.0.1" | tee hosts; fi

install:
	## make install 		: installs "NGINX Plus"
	ansible-playbook --ask-pass -i hosts install_nginx_plus/site.yml

default:
	## make default 		: resets nginx configurations to default
	ansible-playbook --ask-pass -i hosts default_nginx_configuration/site.yml

template:
	## make template 		: generates an nginx ansible playbook template configuration
	cp -R default_nginx_configuration template_${HASH}

deploy:
	## make deploy f=foo_bar	: deploys specific ansible playbook folder
	ansible-playbook --ask-pass -i hosts ${f}/site.yml
