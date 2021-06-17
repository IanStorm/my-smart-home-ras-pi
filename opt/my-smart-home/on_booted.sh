#!/bin/bash

# ⬇ Disable big/red LED
# ⬇ 	see https://raspberrypi.stackexchange.com/a/112136
# ⬇ 	see https://stackoverflow.com/a/36853636
echo none | sudo tee /sys/class/leds/led1/trigger

cd /opt/my-smart-home/
./get.sh
./start.sh
