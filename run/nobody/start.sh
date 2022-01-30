#!/bin/bash

# change to app install path and activate virtualenv
cd /usr/lib/sabnzbd

# activate virtualenv where requirements have been installed from install.sh
source ./env/bin/activate

# run app
python3 /usr/lib/sabnzbd/SABnzbd.py --config-file /config --server 0.0.0.0:8080 --https 8090
