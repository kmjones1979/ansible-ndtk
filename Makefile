
install:
	ansible-playbook --ask-pass -i hosts install-nginx-plus/site.yml

default:
	ansible-playbook --ask-pass -i hosts default-configuration/site.yml
