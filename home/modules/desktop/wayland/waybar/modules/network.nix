{
  format = "<span foreground='#ff0000'></span>";
  format-wifi = "";
  format-disconnected = "<span foreground='#ff0000'></span>";
  on-click = "$TERMINAL -e impala";
  on-click-right = "rfkill toggle wlan";
  "tooltip-format-wifi" = "{essid} ({signalStrength}%) ";
}
