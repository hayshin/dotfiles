[
  {
    label = "suspend";
    action = "systemctl suspend; lock";
    text = "Sleep";
    keybind = "s";
  }
  {
    label = "poweroff";
    action = "systemctl poweroff";
    text = "Poweroff";
    keybind = "p";
  }
  {
    label = "reboot";
    action = "systemctl reboot";
    text = "Reboot";
    keybind = "r";
  }
  {
    label = "lock";
    action = "sleep 0.3 ; lock";
    text = "Lock";
    keybind = "l";
  }
]
