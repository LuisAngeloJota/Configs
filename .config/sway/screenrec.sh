if [ -z "$(pgrep -x wl-screenrec)" ]; then
notify-send "Screen Recording: Started"
wl-screenrec --codec hevc -f $HOME/"$(date +"%Y-%m-%d %H:%M:%S").mkv"
else
notify-send "Screen Recording: Stopped"
pkill -x wl-screenrec
fi
