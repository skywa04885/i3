#!/bin/bash

for pid in $(pgrep -f -x 'polybar --reload status')
do
  kill -9 $pid
done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload status &
  done
else
  polybar --reload status &
fi

