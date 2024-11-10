{
  states = {
    warning = 20;
    critical = 10;
  };
  format = "{icon}{capacity}%";
  format-warning = "<span foreground='#ffff00'>{icon}{capacity}%</span>";
  format-critical = "<span foreground='#ff0000'>{icon}{capacity}%</span>";
  format-charging = "<span foreground='#00ff00'> {capacity}%</span>";
  format-plugged = "<span foreground='#00ff00'> {capacity}%</span>";
  format-alt = "{icon} {time}";
  format-full = "<span foreground='#00ff00'> {capacity}%</span>";
  format-icons = [
    " "
    " "
    " "
    " "
    " "
  ];
}
