#!/bin/bash

# based on https://www.digitalocean.com/community/tutorials/
#          how-to-set-up-a-masterless-puppet-environment-on-ubuntu-14-04

if [ `id -u` = 0 ] ; then

    wget -O /tmp/puppetlabs.deb http://apt.puppetlabs.com/puppetlabs-release-$(lsb_release -cs).deb
    if [[ ! $? -eq 0 ]]; then
        wget -O /tmp/puppetlabs.deb http://apt.puppetlabs.com/puppetlabs-release-pc1-$(lsb_release -cs).deb
    fi

    dpkg -i /tmp/puppetlabs.deb
    apt-get update
    apt-get install -y puppet

    if [ -f /etc/default/puppet ]; then
        # allow the puppet agent service to run
        sed -i 's/START=no/START=yes/' /etc/default/puppet
    fi

    # modify the conf file for masterless
    # ===================================
    if [ ! -f /etc/puppet/puppet.conf.bak ]; then
        cp /etc/puppet/puppet.conf /etc/puppet/puppet.conf.bak
    fi


    cat > /etc/puppet/puppet.conf <<EOF
[main]
logdir=/var/log/puppet
vardir=/var/lib/puppet
ssldir=/var/lib/puppet/ssl
rundir=/run/puppet
factpath=/usr/lib/ruby/vendor_ruby/facter
EOF

else
    echo "Please enter sudo su before running this script"
fi

