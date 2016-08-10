# Puppet files for Ubuntu install

### ==========================================================================
### Clone the 'puppet' repo
### ==========================================================================
```bash
read -p "Download the github repo? yes/no > " response
if echo "$response" | grep -iq "^y" ;then
    echo "creating backup and downloading the github repo"
    cd /etc
    sudo mv puppet/ puppet-bak
    sudo git clone https://github.com/grfiv/puppet.git /etc/puppet
else
    echo "github repo not downloaded"
fi
```
