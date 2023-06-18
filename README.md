# Waybar-Hyprland-Fedora
A collection of custom modules for Waybar, designed to be used with Hyprland and Fedora 38

## Workspace scripts

Those scripts were made because I had problems installing **waybar-hyprland** on Fedora.
I figured that it was easier to make my own custom modules than to fix the problem.
And, since I only needed a way to navigate around my opened workspaces I decided to create those 2 shell scripts.

(The config file is generally located in the directory "~/.config/waybar/config")
**When using it, don't forget to fill the exec field correctly with the path to the scripts you downloaded**.

### Current Workspace Indicator

**File: active-workspace.sh**
This script takes the output from the command `hyprctl activewindow` (it tells us information about the window currently opened), filters the output for the current workspace index, then basically spits it out in JSON format

**config file:**
```
"custom/active-workspace": {
        "exec": ".../active-workspace.sh | jq --unbuffered --compact-output",
        "return-type": "json",
        "on-scroll-up": "hyprctl dispatch workspace e+1",
        "on-scroll-down": "hyprctl dispatch workspace e-1",
        "tooltip": false,

		"format": "{icon}",
        "format-icons": {
       		"1": "web",
       		"2": "music",
       		"3": "dev",
       		"4": "terminal",
       		"5": "study",
       		"6": "6",
       		"7": "7",
       		"8": "8",
       		"9": "9",
       		"10": "10"
         }
```

**Important**: always add "| jq --unbuffered --compact-output" at the end of the exec path. It formats the JSON output of the script.

This is my setup, it takes the index of the active workspace and uses a icon (in this case the name of each workspace - web, music, ...) to represent it on the waybar.

Hovering the indicator with the mouse and scrolling up or down switches the current workspace.

### Opened Workspaces Indicator

**File: workspaces-in-use.sh**

It shows the "biggest" workspace index that is in use.
It does not count how many workspaces are opened.

**config file:**
```
    "custom/total-workspaces": {
		"exec": ".../workspaces-in-use.sh",
		"on-scroll-up": "hyprctl dispatch workspace e+1",
        "on-scroll-down": "hyprctl dispatch workspace e-1",
        "tooltip": false,
		"format": "{}"
	},
```

Those 2 modules combined results in:
![Screenchot](../main/screenshot.png)

(I'm using Catpuccin mocha color style)