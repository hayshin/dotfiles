{ pkgs, ... }:
{
  imports = [
    ./common
    ../modules
    ./optional
  ];

  modules.programs.browsers = {
    zen.enable = true;
    default = "zen";
  };

  modules.programs.editors = {
    vscode.enable = true;
    zed.enable = true;
    cursor.enable = true;
    default = "cursor";
  };

  modules.programs.terminals.enable = true;
  modules.desktop.hyprland.enable = true;

  home.packages = [ pkgs.vpn ];
}
