#!/bin/bash
echo "TASK: Starting node dependency setup"
cd /nodeApplication
npm install --verbose
chmod 777 public -R
cd public
sudo -u nodeowner bower install
echo "INFO: All dependencies are downloaded, please close this"
