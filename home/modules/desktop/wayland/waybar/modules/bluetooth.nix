{
  format = "";
  format-connected = " {device_alias}";
  format-connected-battery = " {device_alias} {device_battery_percentage}%";
  tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
  on-click = "$TERMINAL -e bluetuith";
  on-click-right = "rfkill toggle bluetooth";
}
