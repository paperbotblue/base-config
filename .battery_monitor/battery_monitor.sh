#!/bin/bash

min_charge=10
power_off_at=5
switch=5;

while :
do
  sleep 1
  charge="$(cat /sys/class/power_supply/BAT1/capacity)"
  status="$(cat /sys/class/power_supply/BAT1/status)"
  if(($charge < $power_off_at ));
    then
      ./../sys_suspend.sh 
    fi
  if (( $charge < $min_charge )) && (($switch > 0)) && [ "$status"  != "Charging" ];
    then
      ffplay -v 0 -nodisp -autoexit /home/guildarts/.battery_monitor/Audio_2023_11_30_12_36_35.mp3    
      switch = $(($switch - 1))
    fi
done;
