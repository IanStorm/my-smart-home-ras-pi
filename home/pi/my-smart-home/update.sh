#!/bin/bash
cd ~/my-smart-home/
./clean.sh # clean before stop -> doesn't remove used Docker stuff, removes unused Docker stuff with a delay of 1 day
./stop.sh
./get.sh
./start.sh
