#!/bin/sh

while true; do
    layout=$(xset -q | grep -A 0 "LED" | awk '{print $10}' | grep -q "00000002" && echo "RU" || echo "EN")

    if [ -d /sys/class/power_supply/BAT0 ]; then
        capacity=$(cat /sys/class/power_supply/BAT0/capacity)
        status=$(cat /sys/class/power_supply/BAT0/status)
        if [ "$status" = "Charging" ]; then
            bat_status="AC $capacity%"
        else
            bat_status="$capacity%"
        fi
    else
        bat_status="AC"
    fi

    if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
        cpu_temp=$(cat /sys/class/thermal/thermal_zone0/temp)
        cpu_temp_c=$((cpu_temp / 1000))
        temp_status="+${cpu_temp_c}°C"
    else
        temp_status="--°C"
    fi
   
    vol_info=$(amixer get Master | tail -n1)
    if echo "$vol_info" | grep -q "\[off\]"; then
        vol_status="MUTE"
    else
        vol_status=$(echo "$vol_info" | awk -F'[][]' '{print $2}')
    fi

    datetime=$(date +"%d.%m | %H:%M")

    xsetroot -name " $layout | V: $vol_status | $bat_status | $temp_status | $datetime "

    sleep 1
done
