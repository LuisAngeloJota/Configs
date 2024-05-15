if [ -z "$(pgrep -x wl-screenrec)" ]; then
notify-send "Screen Recording: Started"
wl-screenrec --low-power off --codec hevc --bitrate "1 MB" --audio --audio-device "$(wpctl inspect @DEFAULT_AUDIO_SINK@ | awk -F '"' '/node.name/ { print $2 ".monitor" }')" -f $HOME/"$(date +"%Y-%m-%d %H:%M:%S").mkv"
else
notify-send "Screen Recording: Saved to $HOME"
pkill -x wl-screenrec
fi
