{
  format = "";
  format-connected = " {device_alias}";
  format-connected-battery = " {device_alias} {device_battery_percentage}%";
  tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
  on-click = "rfkill toggle bluetooth";
  on-click-right = "blueman-manager";
}
