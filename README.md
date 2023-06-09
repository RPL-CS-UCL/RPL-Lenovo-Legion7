
# Lenovo Legion 7i Ubuntu

This repo contains the neccesary steps to set up Ubuntu on the Lenovo Legion 7i. It also contains scripts to automate this process.


## Installing Ubuntu.
You will need to create a bootable USB using an ISO. You can find premade ones in the RoboHike PCs or you can create your own by downloading the ISO https://releases.ubuntu.com/focal/. You can then format the USB and use it.

To install you will have to plug the USB in and go to the UEFI Bios. 
To do this rapidly press "del" when turning the laptop on.
You will then need to either boot from the USB or change the boot order priority so that the USB is first.
Save the settings and restart.
You can then follow the Ubuntu setup instuctions.


## Installilng WiFi drivers.

```
sudo apt update 
sudo apt-get install -y git
sudo apt-get install -y build-essential 

git clone --depth 1 git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git 
cd linux-firmware 
sudo cp iwlwifi-* /lib/firmware/ 
cd .. 

git clone --depth 1 https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/backport-iwlwifi.git 
cd backport-iwlwifi 
make defconfig-iwlwifi-public 
make -j4 
sudo make install 

sudo update-initramfs -u 
sudo reboot
```

## Installing Nvidia drivers.
You can install the display drivers by opening the "Software and Updates" program.

Navigate to the "Additional Drivers" tab.

select "Using NVIDIA driver metapackage from nvidia-driver-470(proproetary)"

Then press "Apply changes" and after installation reboot.


## Warnings and best practises.

There appears to be an issue with Nvidia drivers and gcc versions. 

If your system updates gcc to 9.4 your Nvidia drivers will not be able to run (or compile). This is due to it using gcc 9.3.

To fix this downgrading to gcc 9.3 should fix this issue. If this happens we will invesigate and create a script to fix this issue.




## Versions.

Ubuntu: 20.04.6 LTS

Ubuntu Firmware: 5.15.0-69

Nvidia: 470.182.03

## Extra Storage.

If you do not want to partition the original 1TB drive to use both Windows and Ubuntu you can purchase a second m.2 NVME SSD.
[This](https://amzn.eu/d/5NU2iP5) SSD is confirmed working and has adaquete read/write speeds.
This will need to be installed by removing the bottom panel of the case.

