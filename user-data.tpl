#!/bin/bash

# install saltstack
wget -O - http://bootstrap.saltstack.org | sudo sh
sudo mkdir /srv/salt
sudo chmod 777 /srv/salt/

cat << EOF > /srv/salt/webserver.sls
 nginx:
   pkg:
     - installed
   service:
     - running
EOF

cat << EOF > /srv/salt/top.sls
 base:
   '*':
     - webserver
EOF

sudo salt-call --local state.highstate
