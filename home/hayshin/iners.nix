{ pkgs, ... }:
{
  imports = [
    ./common
    ../modules
    ./optional
  ];

  modules.programs.browsers.enable = true;
  modules.programs.terminals.enable = true;
  modules.desktop.hyprland.enable = true;

  home.packages = [ pkgs.vpn ];
}
