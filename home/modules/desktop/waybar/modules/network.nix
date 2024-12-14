{
  format = "<span foreground='#ff0000'></span>";
  format-wifi = "";
  format-disconnected = "<span foreground='#ff0000'></span>";
  on-click = "rfkill toggle wlan";
  on-click-right = "$TERMINAL -e nmtui";
  "tooltip-format-wifi" = "{essid} ({signalStrength}%) ";
}
