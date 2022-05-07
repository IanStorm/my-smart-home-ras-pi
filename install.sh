#!/bin/bash

sudo apt-get update

# ↓ Enable auto-update
# ↓ 	see https://raspberrypi.stackexchange.com/a/38990
sudo apt-get install -y unattended-upgrades

# ↓ Install Docker
# ↓ 	see https://linuxhint.com/install_docker_on_raspbian_os/
sudo apt-get install -y raspberrypi-kernel raspberrypi-kernel-headers
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi
# ↓ 	Install docker-compose
sudo apt-get install -y docker-compose

# ↓ Install libseccomp2
# ↓ 	see https://www.zigbee2mqtt.io/guide/installation/02_docker.html#notes-for-raspberry-pi-users
sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 04EE7237B7D453EC 648ACFD622F3D138
echo "deb http://httpredir.debian.org/debian buster-backports main contrib non-free" | sudo tee -a "/etc/apt/sources.list.d/debian-backports.list"
sudo apt update
sudo apt install libseccomp2 -t buster-backports

# ↓ Restart Ras Pi
sudo reboot
