# My Smart Home - Raspberry Pi

Smart Home project for personal use.
Unifies the management of various device types like smart plugs, smart radiator controls, robotic vacuum cleaner, etc.


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


### Prepare the software

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


## Sources

* [The official Raspberry Pi documentation](https://projects.raspberrypi.org/en/projects/raspberry-pi-getting-started)
