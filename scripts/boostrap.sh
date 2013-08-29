#!/bin/bash

echo "Headless Puppet Rbenv Bootstrap Script!"

apt-get upgrade
apt-get update
apt-get install git puppet -y

cd /etc/puppet
if [ -d .git ]; then
  git reset --hard
  git pull
  git submodule update
else
  git init
  git remote add origin https://github.com/petems/headless-puppet-rbenv
  git branch --set-upstream origin/master
  git submodule init
  git submodule update
fi;

puppet apply /etc/puppet/manifests/default.pp --modulepath /etc/puppet/modules