#!/bin/bash

# make sure services are stopped before installing again
sudo systemctl stop frontend.service

sudo systemctl stop backend.service


sudo apt install -y mongodb npm git
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

rm -rf TeamAPoolProject*

git clone https://github.com/Nboaram/TeamAPoolProjectBackend.git

git clone https://github.com/Nboaram/TeamAPoolProjectUI.git

cd TeamAPoolProjectBackend

git checkout Developer

yes | npm install

cd ..
cd TeamAPoolProjectUI

yes | npm install 

yes | sudo npm -g install @angular/cli
cd ..


sudo rm -f /etc/systemd/system/frontend.service
sudo rm -f /etc/systemd/system/backend.service

sudo cp ./project_setup_script/frontend.service /etc/systemd/system/frontend.service
sudo cp ./project_setup_script/backend.service /etc/systemd/system/backend.service

sudo systemctl daemon-reload

sudo systemctl start mongodb

sudo systemctl start frontend.service

sudo systemctl start backend.service


