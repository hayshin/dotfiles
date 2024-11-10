{ pkgs, lib, ... }:

{
  home = {
    username = "hayshin";
    homeDirectory = "/home/hayshin";
    stateVersion = "24.05";
    packages = with pkgs; [
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
      wpaperd
      btop
      obs-studio
      vlc
      playerctl
      nodejs
      pulseaudio
      brightnessctl
    ];
    sessionVariables = {
      EDITOR = "hx";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
    };
    activation.clearTofiCache = lib.mkAfter ''
      rm -f ~/.cache/tofi-drun
      rm -f ~/.cache/tofi-compgen
    '';
  };

  imports = [ ./modules/modules.nix ];
}
