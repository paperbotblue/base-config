#!/bin/bash

exec killall pipewire & 
exec systemctl --user start pipewire pipewire-pulse wireplumber & 
exec sudo pacman -S wireplumber --noconfirm &
exec systemctl --user restart wireplumber.service &

exec systemctl --user restart pipewire pipewire-pulse wireplumber
