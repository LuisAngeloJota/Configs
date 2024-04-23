#!/bin/sh

# Date
date=$(date +"%Y-%m-%d")

# Time
time=$(date +"%H:%M")

# Speaker
speaker=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | awk -F '"' '/node.description/ { print "Speaker: " $2 }')

# Volume
muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ print $3 }')
if [ $muted ]
then
    volume=$(echo "Volume: Muted")
else
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ print "Volume: " $2 * 100 "%"}')
fi

# Brightness
brightness=$(brightnessctl get | awk '{ print "Brightness: " $1 / 120000 * 100 "%"}')

# Status Bar
echo "$speaker   $volume   $brightness   $date   $time"
