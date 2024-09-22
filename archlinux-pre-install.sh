systemctl enable iwd.service
systemctl enable systemd-resolved.service
systemctl enable systemd-timesyncd.service

git clone --depth 1 https://github.com/LuisAngeloJota/Configs
cd Configs
cp -ir etc /etc
