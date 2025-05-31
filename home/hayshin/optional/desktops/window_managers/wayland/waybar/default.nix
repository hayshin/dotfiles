{ lib, ... }:
let
  styleStr = builtins.readFile ./style.css;
in
{
  programs.waybar = {
    enable = true;
    settings = import ./settings.nix;
    systemd = {
      enable = true;
    };
    style = lib.mkAfter styleStr;
  };
  # stylix.targets.waybar.enable = false;
}
