#!/bin/bash

option=$(echo -e "Logout\nSuspend\nReboot\nShutdown" | fzf --prompt="Power > " --height=8 --reverse)

case $option in
    "Logout") pkill -KILL -u $USER ;;
    "Suspend") systemctl suspend ;;
    "Reboot") systemctl reboot ;;
    "Shutdown") systemctl poweroff ;;
esac
