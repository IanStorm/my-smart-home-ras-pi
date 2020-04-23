#!/bin/bash
cd ~/my-smart-home/
docker run -d --rm --network host -p 1880:1880 --env-file ./credentials/docker-env.list --name my-smart-home ianstorm/my-smart-home-node-red:latest
