[
  {
    label = "suspend";
    action = "sleep 0.1 ; systemctl suspend ; lock";
    text = "Suspend";
    keybind = "u";
  }
  {
    label = "shutdown";
    action = "systemctl poweroff";
    text = "Poweroff";
    keybind = "s";
  }
  {
    label = "reboot";
    action = "systemctl reboot";
    text = "Reboot";
    keybind = "r";
  }
  {
    label = "lock";
    action = "sleep  0.1 ; lock";
    text = "Lock";
    keybind = "l";
  }
]
