{
  format-connected = " {device_alias}";
  format-disabled = " off";
  format-connected-battery = " {device_alias} {device_battery_percentage}%";
  format-device-preference = [
    "device1"
    "device2"
  ]; # preference list
  tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
  on-click = "rfkill toggle bluetooth";
  on-click-right = "blueman-manager";
}
