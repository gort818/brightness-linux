#!/bin/bash
#Written by Alessandro Toia
#https://github.com/gort818/


#Grab the current brightness variable
brightness=$(cat .nvidia-settings-rc | grep 'RedBrightness' | cut -d"=" -f 2)

#create a variable for new brightness, increase the original by .075

newbright=$(echo "scale=2;$brightness+0.075" | bc)

#increase the brightness

cat .nvidia-settings-rc |sed -i '/ness/s/RedBrightness='$brightness'/RedBrightness='$newbright'/g' .nvidia-settings-rc

cat .nvidia-settings-rc |sed -i '/ness/s/GreenBrightness='$brightness'/GreenBrightness='$newbright'/g' .nvidia-settings-rc

cat .nvidia-settings-rc |sed -i '/ness/s/BlueBrightness='$brightness'/BlueBrightness='$newbright'/g' .nvidia-settings-rc

#load the configuration
nvidia-settings --load-config-only
