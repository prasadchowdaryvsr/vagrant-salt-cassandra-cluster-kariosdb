#!/bin/sh
cd /scripts
sudo apt-get purge -f -y openjdk-9-*
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install -f -y openjdk-8-jdk
rm -f python-support_1.0.15_all.deb
wget http://launchpadlibrarian.net/109052632/python-support_1.0.15_all.deb
sudo dpkg -i python-support_1.0.15_all.deb
rm -f python-support_1.0.15_all.deb

echo "############# ${HOST} SETUP COMPLETE #####################"