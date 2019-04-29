#!/bin/bash

#st_prev=$(cat /sys/class/drm/card0-HDMI-A-1/status)
st_prev="disconnected"

while :
do
    st_next=$(cat /sys/class/drm/card0-HDMI-A-2/status)
    if [ $st_prev != $st_next ]; then
        echo "connect or disconnect display"
        st_prev=$st_next
        if [ $st_next = "connected" ]; then
            echo "do change multi display"
            xrandr --output eDP1 --mode 1920x1080 --output HDMI2 --auto --above eDP1
        else
            echo "do change single display"
            xrandr --output eDP1 --mode 1920x1080 --output HDMI2 --off
        fi
    fi
    sleep 1
done
