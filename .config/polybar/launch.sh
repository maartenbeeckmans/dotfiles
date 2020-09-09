#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
if [ "$1" == "light" ]
then
	polybar -c $HOME/.config/polybar/light-config nord-top &
else
	polybar -c $HOME/.config/polybar/dark-config nord-top &
fi

# polybar -c $HOME/.config/polybar/top-left &
# polybar -c $HOME/.config/polybar/top-center &
# polybar -c $HOME/.config/polybar/top-right &

echo "Bars launched..."
