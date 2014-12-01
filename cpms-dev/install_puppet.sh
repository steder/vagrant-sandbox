#!/usr/bin/env bash
set -u -x

YUM=`command -v yum`
APT=`command -v apt-get`
BREW=`command -v brew`

PACKAGE_MANAGER=`((command -v yum >/dev/null 2>&1 && echo "yum") || (command -v apt-get >/dev/null 2>&1 && echo "apt") || (command -v brew >/dev/null 2>&1 && echo "brew"))`

case $PACKAGE_MANAGER in
"yum")
    rpm -ivh https://yum.puppetlabs.com/el/6.5/products/x86_64/puppetlabs-release-6-10.noarch.rpm
    yum install -y puppet
    #chkconfig puppet on
    ;;
"apt")
    # For official puppet ubuntu packages first do:
    #wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
    #sudo dpkg -i puppetlabs-release-precise.deb
    #sudo apt-get update
    sudo apt-get install puppet
    ;;
"brew")
    echo "I don't support brew at the moment!"
    exit 1
    ;;
*)
    echo "I don't know how to install puppet for that package manager."
    exit 1
esac
