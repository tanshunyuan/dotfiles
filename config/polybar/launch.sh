#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    # MONITOR=$m polybar --reload mybar &
    MONITOR=$m polybar --reload -c ~/.config/polybar/config.ini main 2>~/Desktop/logfile.txt &
  done
else
  # polybar --reload mybar &
  polybar --reload -c ~/.config/polybar/config.ini main 2>~/Desktop/logfile.txt &
fi

# Launch bar1 and bar2
echo "Polybar launched...";
