#!/bin/bash
BASEDIR="$( cd "$(dirname "$0")" ; pwd -P )"

# Install some stuff
sudo apt-get install vim unclutter

# Symlink autostart
PI_AUTOSTART="$HOME/.config/lxsession/LXDE-pi/autostart"
PI_AUTOSTART_DIR=$(dirname "$PI_AUTOSTART")

if [[ ! -L "$PI_AUTOSTART" ]]; then
    echo "Pi Autostart not symlinked."
    if [[ -f "$PI_AUTOSTART" ]]; then
        echo "Pi autostart ($PI_AUTOSTART) is a file, backing up."
        mv "$PI_AUTOSTART" "$PI_AUTOSTART.$(date +%Y-%m-%d-%H%M%S)"
    else
        echo "Pi autostart directory created at ${PI_AUTOSTART_DIR}."
        mkdir -p "$PI_AUTOSTART_DIR"
    fi

    echo "Symlinking $PI_AUTOSTART -> $BASEDIR/symlink-scripts/autostart"
    ln -s "$BASEDIR/symlink-scripts/autostart" "$PI_AUTOSTART"
fi

# Symlink wpa_supplicant
PI_WIFI_CONFIG="/etc/wpa_supplicant/wpa_supplicant.conf"
PI_WIFI_CONFIG_DIR=$(dirname "$PI_WIFI_CONFIG")

if [[ ! -L "$PI_WIFI_CONFIG" ]]; then
    echo "Wifi config not symlinked."
    if [[ -f "$PI_WIFI_CONFIG" ]]; then
        echo "Wifi config ($PI_WIFI_CONFIG) is a file, backing up."
        mv "$PI_WIFI_CONFIG" "$PI_WIFI_CONFIG.$(date +%Y-%m-%d-%H%M%S)"
    else
        echo "Wifi config directory created at ${PI_WIFI_CONFIG_DIR}."
        mkdir -p "$PI_WIFI_CONFIG_DIR"
    fi

    echo "Symlinking $PI_WIFI_CONFIG -> $BASEDIR/symlink-scripts/autostart"
    ln -s "$BASEDIR/symlink-scripts/wpa_supplicant.conf" "$PI_WIFI_CONFIG"
fi
