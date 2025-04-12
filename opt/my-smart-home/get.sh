#!/bin/bash
docker pull ianstorm/my-home-nginx:latest
docker pull ianstorm/my-home-status:latest
docker pull ianstorm/my-smart-home-mqtt:latest
docker pull ianstorm/my-smart-home-node-red:latest
docker pull ianstorm/my-smart-home-zigbee2mqtt:latest

rclone selfupdate --stable
	# ⬇️ Sync Nextcloud data, one-way to machine
rclone sync --progress nextcloud:sync/ ~/Nextcloud/sync/
