#!/bin/sh
date=$(date +"%Y-%m-%d")

time=$(date +"%H:%M")

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ print $2 * 100 "%"}')

brightness=$(brightnessctl get | awk '{ print $1 / 120000 * 100 "%"}')

echo "  $brightness |   $volume | $date | $time"
