# Raspberry Pi Zero as Shabad OS display

Link to tutorial: https://inderpreetsingh.com/2018/12/01/raspberry-pi-zero-as-shabad-os-display/

## Setup

Make sure to edit the `symlink-scripts/` files:
* Point your specific URL in `autostart`
* Add your wifi passwords to wpa_supplicant.conf

## Todo

* Enable ssh by touching `ssh` in boot volume on raspbian install.
* Enable VNC using `sudo raspi-config` > `5 Interfacing Options` > VNC.
