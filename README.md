# My Smart Home - Raspberry Pi

[![GitHub Actions](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2FIanStorm%2Fmy-smart-home-ras-pi%2Fbadge%3Fref%3Dmain&style=flat&label=build&logo=none)](https://actions-badge.atrox.dev/IanStorm/my-smart-home-ras-pi/goto?ref=main)

Garage project for **private purposes**.
Puts the following repos in action:
* [IanStorm/my-home-printer](https://github.com/IanStorm/my-home-printer)
* [IanStorm/my-smart-home-mqtt](https://github.com/IanStorm/my-smart-home-mqtt)
* [IanStorm/my-smart-home-node-red](https://github.com/IanStorm/my-smart-home-node-red)
* [IanStorm/my-smart-home-zigbee2mqtt](https://github.com/IanStorm/my-smart-home-zigbee2mqtt)


## Ready, ...


### Prepare the hardware 🧰

Be sure to call the following hardware your own:

* Temporary, i.e. only for setup:
	* A computer to run the [Rasperry Pi Imager](https://www.raspberrypi.org/downloads/) software
	* ...with a mouse, keyboard, display, etc.
	* ...with an SD card reader
* Permanent, i.e. dedicated to the Ras Pi:
	* 1x Raspberry Pi *(here: Raspberry Pi 4, Model B, 2GB RAM)*
	* 1x Micro SD card *(here: SanDisk Extreme 32GB)*
	* 1x Power supply, Raspberry Pi-compatible 🔌 *(here: Official USB-C Power Supply)*
	* 1x Ethernet cable; WiFi access is alternatively possible, but won't be covered here
* Misc.:
	* 1x USB printer, including power supply and USB cable *(here: HP Photosmart 5520)*
	* 1x USB Zigbee sniffer *(here: CC2531)*


### Prepare the software, pt. 1 🦙 1️⃣

1. Connect the Micro SD card to the computer
2. Download, install, and run **Raspberry Pi Imager**:
	* Tested with v1.2 on Windows
	* Choose OS: Raspbian (other) -> **Raspbian Lite**
	* Write to the Micro SD card
2. Clone this repository.
2. Enable SSH:
	1. Eject and re-insert the SD card
	2. Open a file explorer, navigate to the drive called **"boot"**
	2. Open another file explorer, navigate to the cloned repo
	2. Copy all items from the cloned `SD_card/` folder to the SD card's root folder
2. Eject the Micro SD card from the computer
2. Insert the Micro SD card into the Ras Pi, connect the ethernet cable, connect the power supply; the Ras Pi will automatically start


### Prepare the software, pt. 2 🦙 2️⃣

1. `cd` inside the cloned folder.
2. Make sure to copy the (exactly same) file(s) from [IanStorm/my-smart-home-node-red](https://github.com/IanStorm/my-smart-home-node-red) to `./opt/my-smart-home/credentials/`.
2. Register the Ras Pi under a proper host name in your router, e.g. *"my-smart-home"*
2. Initially connect via SSH: `ssh pi@my-smart-home`
	* There will be a prompt to add the fingerprint, type `yes`
	* The default credentials for any Ras Pi are `pi` (user) and `raspberry` (password)
	* Close the SSH connection


## ...steady, ...

1. Create file/folder structure:
	* `$	ssh pi@my-smart-home 'bash -s' < ./prepare.sh`
2. Copy relevant files to the Ras Pi:
	* `$	scp -r ./opt/my-smart-home/ pi@my-smart-home:/opt/`
	* `$	scp -r ./var/opt/my-smart-home-zigbee2mqtt/ pi@my-smart-home:/var/opt/`
3. Configure Ras Pi:
	* `$	ssh pi@my-smart-home 'bash -s' < ./configure.sh`
4. Install *my-smart-home* dependencies (Mind: The Ras Pi will automatically restart after this step):
	* `$	ssh pi@my-smart-home 'bash -s' < ./install.sh`
5. Setup cron jobs for *my-smart-home*:
	1. Connect via SSH again: `ssh pi@my-smart-home`
	2. Start `crontab -e`, select `/bin/nano` as your editor if prompted
	3. Jump to the end of the file by pressing STRG+END
	4. Enter the following content:
```
# Auto-start `my-smart-home` on each boot
@reboot /opt/my-smart-home/get.sh && /opt/my-smart-home/start.sh

# Auto-update of `my-smart-home`, daily at 3:30am
30 3 * * * /opt/my-smart-home/update.sh
```
*
	5. Leave the editor by pressing STRG+X, then Y, then ENTER
	6. Restart the Ras Pi:
		* `sudo reboot`


## ...go! 🏃‍♂️ 🏃‍♀️

Done!
Now the Raspberry Pi is ready to rock your smart home. 🤘


## Appendix


### Sources 📙

* [The official Raspberry Pi documentation](https://projects.raspberrypi.org/en/projects/raspberry-pi-getting-started)
* https://www.paulin.at/projects/wall-e/building-instructions/software/setting-up-your-raspberry-pi/
* https://technikkram.net/2016/12/raspberry-pi-ssh-aktivieren-bei-raspbian-jessie-lite
* https://www.simplified.guide/ssh/copy-file
* https://www.raspberrypi.org/blog/how-to-run-a-script-at-start-up-on-a-raspberry-pi-using-crontab/


### Alternatives

* https://www.heise.de/ct/artikel/Stefan-Portecks-privates-Smart-Home-openHAB-vereint-einzelne-Komponenten-4688703.html
