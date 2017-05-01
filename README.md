# 2017-q3-week4-hw-soln
Homework Solutions to Docker installation homework

# Ansible Solution - 

After searching the ansible galaxy for docker (sorted by downloads - e.g.: popularity)
I found the first 8 matches either did not explicitly list support for Centos/EL and Ubuntu.
The most popular one that listed both distors as supported was: https://galaxy.ansible.com/andrewrothstein/docker/
the latest version (v5.0.3) also supports ansible version 2.0... execpt it doesn't
see: https://github.com/andrewrothstein/ansible-docker/pull/12

It appears there isn't any great role in ansible for what I want - so I wrote my own that directly
implements the directions posted by Docker (and used in the lab) to install the docker apt repo
and install the docker packages.

# Puppet Solution -

The puppet solution this week is a little bit more involved due to the fact that Centos does not have
built in puppet, facter, puppet-librarian, or docker pacakges... in light of this I broke things up
into 2 stages

## stage 1 - Puppet Install
[Puppet Installation on Centos7](etc/puppet/install)

Uses ansible to install the puppet pre-requisites so I can deploy docker + images using puppet.
In a 'nomrmal' environment something like installing puppet, facter, etc. would be handled by your OS
installation or deployed image.  This puppet install definition will:
- EPEL installation
Many [Enterprise Linux Distros](https://en.wikipedia.org/wiki/Category:Enterprise_Linux_distributions) rely on the EPEL repository to install software not shipped directly with the distro
- Install puppet and facter RPMs from the EPEL repo
- Install librarian-puppet using the gem ruby package manager (instead of yum) as EPEL has no librarian-puppet rpm

## stage 2 - Install Docker
[Garethr Docker Module](https://forge.puppet.com/garethr/docker/dependencies) Provides all the code for getting docker installed.
- [Puppetlabs-Apt](https://forge.puppet.com/puppetlabs/apt) is a prequisite for garether-docker and requires a too new a version of puppet.
I versioned liked this in the Puppetfile to 2.4.0 for compatibility
- Apply the docker puppet manifest to actually install docker
