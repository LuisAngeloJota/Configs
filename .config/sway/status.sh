#!/bin/sh

# Date
date=$(date +"%Y-%m-%d")

# Time
time=$(date +"%H:%M")

# Speaker
speaker=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | awk -F '"' '/node.description/ { print "Speaker: " $2 }')

# Volume
if [ "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ print $3 }')" ]
then
    volume=$(echo "Volume: Muted")
else
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ print "Volume: " $2 * 100 "%"}')
fi

# Brightness
brightness=$(brightnessctl get | awk '{ print "Brightness: " $1 / 120000 * 100 "%"}')

# Wi-Fi Network Name
if [ "$(iwctl station list | awk -F '  +' '/wlan/ { print $3 }')" == disconnected ]
then
    wifi=$(echo "WiFi: Disconnected")
else
    wifi=$(echo "WiFi: Connected")
fi

# Status Bar
echo "$wifi   $speaker   $volume   $brightness   $date   $time"
