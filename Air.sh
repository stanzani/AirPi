#!/bin/bash

sudo apt-get update

sudo apt-get install autoconf automake avahi-daemon build-essential git libasound2-dev libavahi-client-dev libconfig-dev libdaemon-dev libpopt-dev libssl-dev libtool xmltoman -y

cd /tmp

pwd

git clone https://github.com/mikebrady/shairport-sync.git

cd shairport-sync

autoreconf -i -f

./configure --with-alsa --with-avahi --with-ssl=openssl --with-systemd --with-metadata

make

sudo make install

sudo mkdir -p /home/shairport-sync/.config/pulse

sudo chown -R shairport-sync /home/shairport-sync

sudo service shairport-sync restart

sudo service shairport-sync start

sudo systemctl enable shairport-sync

sudo systemctl status shairport-sync.service

sleep 1.5

exit
