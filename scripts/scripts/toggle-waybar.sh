#!bin/sh

if pgrep waybar > /dev/null; then
	kill $(pidof waybar)
else
	waybar &
fi

