{
  format = "{icon} {volume}%";
  format-muted = "<span foreground='#ff0000'> {volume}%</span>";
  format-source = " {volume}%";
  format-source-muted = " {volume}%";
  tooltip-format = "{desc}\n{format_source}";

  format-icons = {
    headphone = "";
    hands-free = "";
    headset = "";
    phone = "";
    portable = "";
    car = "";
    default = [
      ""
      ""
      ""
    ];
  };

  on-click = "pavucontrol";
  on-click-right = "swayosd-client --output-volume mute-toggle";
  on-click-middle = "swayosd-client --input-volume mute-toggle";
  scroll-step = 0.5;
}
