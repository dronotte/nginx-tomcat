# Homework ansible project

# Install requirements
```
ansible-galaxy install -r requirements.yml
```
# Set hosts file

## Requires two virtual machines on Centos 7

http://ftp.nsc.ru/pub/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-Minimal-2009.iso

## Set ip-addresses of web-server and app-server

# Copy ssh-key on VM's
Create roles/common/templates/authorized_keys with your key

# Run
```
ansible-playbook site.yml
```
