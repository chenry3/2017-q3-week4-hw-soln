#!/bin/bash

# install puppet/factor/librarian using ansible
./install/puppet_run_install.sh

# install puppet files
sudo cp -rp etc/puppet/* /etc/puppet/

# install dependencies
cd /etc/puppet && sudo /usr/local/bin/librarian-puppet install

# install docker via manifest
sudo puppet apply /etc/puppet/manifests/docker.pp
