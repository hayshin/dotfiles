{ pkgs, ... }:
{
  imports = [
    ./common
    ../modules
    ./optional
  ];

  modules.programs.browsers = {
    zen.enable = true;
    firefox.enable = true;
    chrome.enable = true;
    default = "zen";
  };

  modules.programs.editors = {
    vscode.enable = true;
    zed.enable = true;
    cursor.enable = true;
    # hx.enable = true;
    default = "hx";
  };

  modules.programs.terminals.enable = true;
  modules.desktop.hyprland.enable = true;
}
