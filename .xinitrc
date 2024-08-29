setxkbmap -layout fi
numlockx &
xrandr -s 1920x1080 --dpi 96



SPACE=$( echo " | " )

# Statusbar loop
while true; do

  BRIGHTNESS="$( brightnessctl info | grep "Current" | sed '0,/(/ s/^.*(/(/' )"
  BATTERY="$( acpi -b )"
  DATETIME="$( date +"%F %T" )"

   xsetroot -name "$BRIGHTNESS $SPACE $BATTERY $SPACE $DATETIME"
   sleep 1s

done &

# Disable middle-mouse paste
while true; do
    xsel -fin </dev/null
done &

# Audio function to start pipewire, pipewire-pulse & wireplumber in the background
audio (){
  /usr/bin/pipewire &
  sleep 2
  /usr/bin/pipewire-pulse &
  /usr/bin/wireplumber &
}

audio &

dunst &

export GTK_THEME=Adwaita:dark
picom -b
./.wallpaper
brightnessctl -q set 10%
redshift -P -O 5000

exec dwm
