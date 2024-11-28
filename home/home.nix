{ pkgs, lib, ... }:

{
  home = {
    username = "hayshin";
    homeDirectory = "/home/hayshin";
    stateVersion = "24.05";
    packages = with pkgs; [
      maven

      linuxKernel.packages.linux_6_11.perf
      libreoffice
      jetbrains.idea-ultimate
      jetbrains.pycharm-professional
      shotcut
      swaylock-effects
      firefox
      fusuma
      waybar
      mako
      wl-clipboard
      hyprshot
      hyprpicker
      light
      pavucontrol
      wlogout
      webcord
      btop
      obs-studio
      vlc
      playerctl
      nodejs
      pulseaudio
      brightnessctl
    ];
    sessionVariables = import ../variables.nix;
    # activation.restartHyprpaper = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    #   if systemctl --user is-active --quiet hyprpaper.service; then
    #     systemctl --user restart hyprpaper.service
    #   else
    #     systemctl --user start hyprpaper.service
    #   fi
    # '';

  };
  nixpkgs.config.allowUnfree = true;
  imports = [
    ../stylix.nix
    ./modules/modules.nix
  ];
}
