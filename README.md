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
Add ssh-key in roles/common/templates/authorized_keys
<br>
example:
```
# {{ ansible_managed }}
# Manual customization of this file is not recommended.

{% if (inventory_hostname in groups['web']) %}
{{ app_server_private_ssh_key }}
{% endif %}

ssh-rsa aabbcddccbbsssww= user@machine
```
# Add known_hosts for every host in inventory
```
ansible-playbook ssh-known_hosts.yml
```
# Run
```
ansible-playbook site.yml
```
