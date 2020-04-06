#!/bin/bash
cd ~/my-smart-home/
cat ./credentials/dockerhub-pwd.txt | docker login --password-stdin -u ianstorm
docker pull ianstorm/my-smart-home-node-red:latest
docker logout
