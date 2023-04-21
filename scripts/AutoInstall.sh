#!/bin/bash

sudo apt install nvidia-driver-470

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