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

  on-click = "swayosd-client --output-volume mute-toggle";
  on-click-right = "swayosd-client --input-volume mute-toggle";
  on-click-middle = "pavucontrol";
  scroll-step = 0.5;
}
