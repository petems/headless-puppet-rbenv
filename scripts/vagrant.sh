#!/bin/bash

echo "### Vagrant provision script... ###"

apt-get upgrade
apt-get update
apt-get install git puppet -y
cd /etc/puppet
git init
git remote add origin https://github.com/petems/headless-puppet
git pull -u origin master
git submodule init
git submodule update
puppet apply /etc/puppet/manifests/default.pp --modulepath /etc/puppet/modules