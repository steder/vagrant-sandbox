#!/usr/bin/env bash
set -u -x

rpm -ivh https://yum.puppetlabs.com/el/6.5/products/x86_64/puppetlabs-release-6-10.noarch.rpm
yum install -y puppet
chkconfig puppet on
