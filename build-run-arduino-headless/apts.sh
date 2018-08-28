#!/bin/sh

sudo apt-get update
sudo apt-get -y install arduino
sudo apt-get -y install python-dev
sudo apt-get -y install python-setuptools
git clone git://github.com/amperka/ino.git
cd ino
sudo python setup.py install
sudo apt-get -y install picocom

