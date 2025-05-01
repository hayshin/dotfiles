{ config, ... }:
with config.lib.stylix.colors.withHashtag;
let
  style = import ./style.nix {
    bg-color = base00;
    fg-color = base05;
  };
in
{

  programs.waybar = {
    enable = true;
    settings = import ./settings.nix;
    systemd = {
      enable = true;
    };
    style = style;
  };
  stylix.targets.waybar.enable = false;
}
