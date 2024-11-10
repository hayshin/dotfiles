{
  format = "{icon} {volume}%   {format_source}";
  format-muted = "<span foreground='#ff0000'> off</span>  {format_source}";
  format-source = " {volume}%";
  format-source-muted = "<span foreground='#ff0000'> off</span>";

  format-icons = {
    headphone = "";
    hands-free = "";
    headset = "";
    phone = "";
    portable = "";
    car = "";
    default = [
      " "
      " "
      " "
    ];
  };

  on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
  on-click-right = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
  on-click-middle = "pavucontrol";
  scroll-step = 0.5;
}
