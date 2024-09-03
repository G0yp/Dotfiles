#! /bin/bash

# first argument: internal monitor 
# second argument: external monitor
if xrandr | grep -q "$2 d"; then
	xrandr --output "$2" --off
	xrandr --auto
else
	xrandr --output "$1" --rate "260" --fb "2560x1600"
	xrandr --output "$2" --rate "144" --fb "2560x1440" --left-of "$1"
fi

nitrogen --restore --set-scaled
