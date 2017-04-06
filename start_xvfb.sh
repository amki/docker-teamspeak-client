#!/bin/bash
export DISPLAY=:1
Xvfb :1 -screen 0 1024x768x16 &
x11vnc -display :1 -bg -xkb &
sleep 5
/etc/init.d/dbus start
sleep 5
pulseaudio &
