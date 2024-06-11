# ==========
# Status Bar
# ==========

printf "%s   %s   %s   %s   %s" \
"$(iwctl station list | awk -F '  +' '/wlan/ { print "WiFi: " toupper(substr($3, 1, 1)) substr($3, 2) }')" \
"$(wpctl inspect @DEFAULT_AUDIO_SINK@ | awk -F '"' '/node.description/ { print "Speaker: " $2 }')" \
"$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ if ($3 == "") print "Volume: " $2 * 100 "%"; else print "Volume: Muted" }')" \
"$(brightnessctl get | awk '{ print "Brightness: " $1 / 120000 * 100 "%" }')" \
"$(date +"%Y-%m-%d   %H:%M")"
