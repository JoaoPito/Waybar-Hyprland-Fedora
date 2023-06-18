#!/bin/sh

for (( ; ; ))
    do
        hyprctl workspaces | grep "workspace ID " | cut -d' ' -f3 | sort -n | tail -1
        sleep 0.5
    done
