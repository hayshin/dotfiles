{
  interval = 1;
  format = "{status_icon} {dynamic}";
  dynamic-order = [
    "artist"
    "title"
    "position"
    "length"
  ];
  dynamic-importance-order = [
    "title"
    "position"
    "length"
    "artist"
  ];
  dynamic-len = -1;
  status-icons = {
    playing = "⏸";
    paused = "";
  };
}
