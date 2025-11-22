{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
let
  cfg = config.modules.desktop.hyprland;
in
{
  options.modules.desktop.hyprland = {
    enable = lib.mkEnableOption "Hyprland";
  };

  imports = [
    ../common
    ../wayland
    ../addons
    ./idle.nix
    ./paper.nix
    ./lock.nix
  ];

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      settings = import ./settings { inherit config; };
      submaps = import ./settings/submaps.nix;
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
      inputs.hyprsession.packages.x86_64-linux.hyprsession
    ];
  };
}
