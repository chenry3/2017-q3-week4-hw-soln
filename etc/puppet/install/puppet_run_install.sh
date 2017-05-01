#!/bin/bash

# puppet and facter are not available in the stock centos repo - so lets install the 
# EPEL package repository: https://fedoraproject.org/wiki/EPEL
yum install 
ansible-playbook -i hosts puppet_install.yml  -s


