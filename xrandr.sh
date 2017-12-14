#!/bin/bash

# Detects where am I connected and sets up xrandr accordingly
#
# Runs on i3 startup

if [ $(xrandr | grep HDMI2 | awk '{print $2}') == "connected" ]
   then
       xrandr --output LVDS1 --off
       xrandr --output HDMI2 --mode 1920x1080
fi

if [ $(xrandr | grep VGA1 | awk '{print $2}') == "connected" ]
then
    xrandr --newmode "1440x900_60.00"  106.50  1440 1528 1672 1904  900 903 909 934 -hsync +vsync
    xrandr --addmode VGA1 1440x900_60.00
    xrandr --output VGA1 --mode 1440x900_60.00
    xrandr --output LVDS1 --off
fi
