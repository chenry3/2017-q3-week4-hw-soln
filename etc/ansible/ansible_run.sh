#!/bin/bash

# after searching the ansible galaxy for docker (sorted by downloads - e.g.: popularity)
# I found the first 8 matches either did not explicitly list support for Centos/EL and Ubuntu.
# The most popular one that listed both distors as supported was: https://galaxy.ansible.com/andrewrothstein/docker/
# the latest version (v5.0.3) also supports ansible version 2.0... execpt it doesn't
# see: https://github.com/andrewrothstein/ansible-docker/pull/12
#
# It appears there isn't any great role in ansible for what I want - so i'll do my own

# copy this repos files into place... be careful of duplicates from prior homeworks!
sudo cp -rpi etc/ansible/* /etc/ansible/

# run playbook on 'docker' group in hosts file
ansible-playbook -s /etc/ansible/hw3/hw3_playbook.yml
