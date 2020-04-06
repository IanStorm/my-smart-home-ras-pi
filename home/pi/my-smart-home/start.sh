#!/bin/bash
cd ~/my-smart-home/
docker run -d --name my-smart-home --env-file ./credentials/docker-env.list -p 1880:1880 --rm ianstorm/my-smart-home-node-red:latest
