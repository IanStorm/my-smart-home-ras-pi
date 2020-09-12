#!/bin/bash

sudo timedatectl set-timezone Europe/Berlin

# ↓ Disable big/red LED
# ↓ 	see https://raspberrypi.stackexchange.com/a/112136
sudo su
echo none > /sys/class/leds/led1/trigger
exit
