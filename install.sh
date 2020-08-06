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

# ↓ Restart Ras Pi
sudo reboot
