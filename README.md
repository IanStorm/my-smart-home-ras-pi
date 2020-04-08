# My Smart Home - Raspberry Pi

Smart Home project for **private purposes**.
Unifies the management of various device types like smart plugs, smart radiator controls, robotic vacuum cleaner, etc.

This repo actually puts [IanStorm/my-smart-home-node-red](https://github.com/IanStorm/my-smart-home-node-red) in action.


## Ready, ...


### Prepare the hardware 🧰

Be sure to call the following hardware your own:

* Temporary, i.e. only for setup:
	* A computer to run the [Rasperry Pi Imager](https://www.raspberrypi.org/downloads/) software
	* ...with a mouse, keyboard, display, etc.
	* ...with an SD card reader
* Permanent, i.e. dedicated to the Ras Pi:
	* 1x Raspberry Pi *(here: Raspberry Pi 3, Model B, 1GB RAM)*
	* 1x Micro SD card *(here: SanDisk Ultra 32GB)*
	* 1x Power supply, Raspberry Pi-compatible *(here: Micro USB charger)*
	* 1x Ethernet cable; WiFi access is alternatively possible, but won't be covered here


### Prepare the software, pt. 1

Follow the below step-by-step instructions:

1. Connect the Micro SD card to the computer
2. Download, install, and run **Raspberry Pi Imager**:
	* Tested with v1.2 on Windows
	* Choose **Raspbian Lite** as the Operating System (OS)
	* Write to the Micro SD card
2. Enable SSH:
	1. Open a file explorer, 2 new accessible partitions should be visible now; they belong to the Micro SD card
	2. Navigate to the partition called **"boot"**
	2. Create a file called **`ssh`** (no extension, no content) on root level
2. Eject the Micro SD card from the computer
2. Insert the Micro SD card into the Ras Pi, connect the ethernet cable, connect the power supply; the Ras Pi will automatically start


### Prepare the software, pt. 2

1. Clone this repository.
2. `cd` inside the cloned folder.
2. Make sure to copy the (exactly same) files from [IanStorm/my-smart-home-node-red](https://github.com/IanStorm/my-smart-home-node-red) to `./home/pi/my-smart-home/credentials/`.
2. Register the Ras Pi under a proper host name in your router, e.g. *"my-smart-home"*
2. Initially connect via SSH: `ssh pi@my-smart-home`
	* There will be a prompt to add the fingerprint, type `yes`
	* The default credentials for any Ras Pi are `pi` (user) and `raspberry` (password)
	* Close the SSH connection


## ...steady, ...

1. Copy relevant files to the Ras Pi:
```
$	scp -r ./home/pi/my-smart-home/ pi@my-smart-home:/home/pi/my-smart-home/
```
2. Configure Ras Pi:
```
$	ssh pi@my-smart-home 'bash -s' < ./configure.sh
```
3. Install *my-smart-home* dependencies:
```
$	ssh pi@my-smart-home 'bash -s' < ./install.sh
```
4. Setup cron jobs for *my-smart-home*:
	1. Connect via SSH again: `ssh pi@my-smart-home`
	2. Start `crontab -e`, select `nane` as your editor if prompted
	3. Jump to the end of the file by pressing STRG+END
	4. Enter the following content:
```
# Auto-start `my-smart-home` on each boot
@reboot ~/my-smart-home/get.sh && ~/my-smart-home/start.sh

# Auto-update of `my-smart-home`, daily at 3:30am
30 3 * * * ~/my-smart-home/update.sh
```
*
	5. Leave the editor by pressing STRG+X, then Y, then ENTER
	6. Enter `exit` to close the SSH session


## ...go! 🏃‍♂️ 🏃‍♀️

Done!
Now the Raspberry Pi is ready to rock your smart home. 🤘


## Sources

* [The official Raspberry Pi documentation](https://projects.raspberrypi.org/en/projects/raspberry-pi-getting-started)
* https://www.paulin.at/projects/wall-e/building-instructions/software/setting-up-your-raspberry-pi/
* https://technikkram.net/2016/12/raspberry-pi-ssh-aktivieren-bei-raspbian-jessie-lite
* https://www.simplified.guide/ssh/copy-file
* https://www.raspberrypi.org/blog/how-to-run-a-script-at-start-up-on-a-raspberry-pi-using-crontab/


### Alternatives

* https://www.heise.de/ct/artikel/Stefan-Portecks-privates-Smart-Home-openHAB-vereint-einzelne-Komponenten-4688703.html
