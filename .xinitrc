#!/bin/sh

xset +dpms
xset dpms 0 0 3600
xset m 1 1 &
xset r rate 220 45
setxkbmap -option terminate:ctrl_alt_bksp -option caps:escape
syndaemon -t -k -i 2 -d &
xsetroot -cursor_name left_ptr

urxvtd -o -q -f &
sh -c 'eval `cat ~/.fehbg`'
xmodmap ~/.Xmodmap
touchpad &
xset +fp ~/.fonts
#compton -cC -t-5 -l-5 -r5 -I0.02 -O0.03 -D4 -fF -Gb --backend glx
#compton -b
echo 3 | sudo dd of=/sys/class/backlight/acpi_video0/brightness
volumeicon &
mpd &
tint2 &
pidgin &
#conky &
parcellite &
exec openbox-session
