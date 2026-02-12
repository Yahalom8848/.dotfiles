#!/bin/bash

killall -q polybar

if type "xrandr"; then
	for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
			MONITOR=$monitor polybar &
	done
else
	polybar &
fi
