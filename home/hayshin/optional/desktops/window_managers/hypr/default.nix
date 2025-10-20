{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../common
    ../wayland
    ../optional
    ./idle.nix
    ./paper.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = import ./settings { inherit config; };
    plugins = [
      inputs.hyprland-virtual-desktops.packages.${pkgs.system}.virtual-desktops
      pkgs.hyprlandPlugins.hyprsplit
    ];
    extraConfig = ''
      plugin {
          virtual-desktops {
              names = 1:coding, 2:internet, 3:mail and chats
              cycleworkspaces = 1
              rememberlayout = size
              notifyinit = 0
              verbose_logging = 0
          }
      }

      plugin {
          hyprsplit {
              num_workspaces = 5
          }
      }
    '';
  };
  stylix.targets.hyprland.enable = false;
  home.packages = [
    pkgs.hyprshot # screenshot
    pkgs.hyprpicker # color picker
    inputs.hyprrun.defaultPackage.x86_64-linux
  ];
}
