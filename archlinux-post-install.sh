#!/bin/bash
pacman -Syu

pacman -S git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru -S adwaita-cursors adwaita-icon-theme aria2 audacious \
            bluez bluez-utils btop \
            chromium code cups \
            dnsmasq \
            edk2-ovmf \
            ffmpeg firefox flatpak foot fuzzel \
            gamemode glib2 greetd grim gvfs \
            handbrake \
            ifuse imagemagick intel-compute-runtime intel-media-driver inter-font iptables-nft iwd \
            libarchive libnotify libreoffice-fresh libvirt \
            mako mangohud mediainfo mpv \
            noto-fonts noto-fonts-cjk noto-fonts-emoji nvidia-open nvidia-prime \
            obs-studio otf-font-awesome \
            pipewire pipewire-alsa pipewire-jack pipewire-pulse playerctl power-profiles-daemon \
            qpwgraph \
            rsync rtkit \
            shotcut slurp steam streamlink sway swaybg \
            tesseract thunar ttf-jetbrains-mono tumbler \
            uxplay \
            virt-manager vpl-gpu-rt vulkan-validation-layers \
            wireguard-tools wireplumber wl-clipboard \
            xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr \
            yambar yt-dlp \
            zram-generator

flatpak install flathub net.ankiweb.Anki org.localsend.localsend_app net.davidotek.pupgui2

systemctl enable bluetooth.service
systemctl enable cups.service
systemctl enable libvirtd.service
systemctl enable libvirtd.socket
systemctl enable power-profiles-daemon.service
systemctl enable rtkit-daemon.service
systemctl enable systemd-networkd.service
systemctl enable systemd-resolved.service
systemctl enable systemd-timesyncd.service
