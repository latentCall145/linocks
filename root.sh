#!/usr/bin/bash

sudo apt update
sudo apt upgrade

sudo apt install alsa-utils cloc compton coreutils feh git i3 lm-sensors man mpv mupdf ncurses neofetch network-manager nmap picom pulseaudio python3 python3-pip rxvt-unicode sox tmux unzip vim xserver-xorg-core xinit x11-xserver-utils zip

sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
curl -s https://install.speedtest.net/app/cli/install.deb.sh | sudo bash
sudo apt update
sudo apt install brave-browser
sudo apt install speedtest
