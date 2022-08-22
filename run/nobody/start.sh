#!/usr/bin/dumb-init /bin/bash

install_path="/usr/lib/sabnzbd"
virtualenv_path="${install_path}/venv"

# activate virtualenv where requirements have been installed from install.sh
source "${virtualenv_path}/bin/activate"

# run app
python3 "${install_path}/SABnzbd.py" --config-file /config --server 0.0.0.0:8080 --https 8090
