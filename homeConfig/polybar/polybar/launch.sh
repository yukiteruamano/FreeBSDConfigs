#!/usr/bin/env bash

# Terminate already running bar instances
pkill polybar
pkill polybar

# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
#polybar top 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."

if [ -z "$(pgrep -x polybar)" ]; then
    BAR="top"
    for m in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$m polybar --reload $BAR 2>&1 | tee -a /tmp/polybar.log & disown
        sleep 1
    done
else
    polybar-msg cmd restart
fi
