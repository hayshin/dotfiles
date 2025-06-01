{ config, ... }:
{
  gaps_in = 0;
  gaps_out = 0;
  border_size = 2;
  "col.active_border" = "rgb(${config.lib.stylix.colors.base02})";
  "col.inactive_border" = "rgb(${config.lib.stylix.colors.base00})";
  layout = "dwindle";
  # cursor_inactive_timeout = 5;
  resize_on_border = true;
}
