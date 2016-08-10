# Puppet files for Ubuntu install

# ==========================================================================
# Clone the 'puppet' repo
# ==========================================================================
read -p "Download the github repo? yes/no > " response
if echo "$response" | grep -iq "^y" ;then
    echo "downloading the github repo"
    cd /etc
    mv puppet/ puppet-bak
    git clone https://github.com/grfiv/puppet.git /etc/puppet
else
    echo "github repo not downloaded"
fi
