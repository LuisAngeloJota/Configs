# Date
datetime=$(date +"%Y-%m-%d   %H:%M")

# Speaker
speaker=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | awk -F '"' '/node.description/ { print "Speaker: " $2 }')

# Volume
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ if ($3 == "") print "Volume: " $2 * 100 "%"; else print "Volume: Muted" }')

# Brightness
brightness=$(brightnessctl get | awk '{ print "Brightness: " $1 / 120000 * 100 "%" }')

# Wi-Fi Network Name
wifi=$(iwctl station list | awk -F '  +' '/wlan/ { print "WiFi: " toupper(substr($3, 1, 1)) tolower(substr($3, 2)) }')

# Status Bar
printf "%s   %s   %s   %s   %s" "$wifi" "$speaker" "$volume" "$brightness" "$datetime"
