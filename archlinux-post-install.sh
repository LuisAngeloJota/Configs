#!/bin/bash
sudo ln -sf /run/systemd/resolve/stub-resolve.conf /etc/resolv.conf

sudo systemctl enable systemd-zram-setup@zram0.service

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru -S uxplay yambar
