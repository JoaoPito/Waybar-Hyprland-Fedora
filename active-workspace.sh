#!/bin/sh
#
ACTIVE=1; # default
for (( ; ; ))
do
    ACTIVE_RES=$(hyprctl activewindow | grep "workspace: " | cut -d' ' -f2)
    TOTAL=$(hyprctl workspaces | grep "workspace ID " | cut -d' ' -f3 | sort | sed 's/$/,/')

    if [ -z "$ACTIVE_RES" ];
    then
        ACTIVE=$ACTIVE;
    else
        ACTIVE=$ACTIVE_RES;
    fi

   echo "{\"active\":$ACTIVE, \"open\":[${TOTAL::-1}], \"alt\":$ACTIVE}"
   sleep 0.25;
done

