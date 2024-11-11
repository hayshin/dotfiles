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
      TERMINAL = "wezterm";
    };

  };
  imports = [
    ../stylix.nix
    ./modules/modules.nix
  ];
}
