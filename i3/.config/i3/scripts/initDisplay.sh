#! /bin/bash

# first argument: internal monitor 
# second argument: external monitor
if xrandr | grep -q "$2 d"; then
	xrandr --output "$2" --off
	xrandr --auto
else
	xrandr --auto
	xrandr --output "$2" --auto --left-of "$1"
fi

nitrogen --restore --set-scaled
