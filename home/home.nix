{ pkgs, lib, ... }:

{
  home = {
    username = "hayshin";
    homeDirectory = "/home/hayshin";
    stateVersion = "24.05";
    packages = with pkgs; [
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
    sessionVariables = {
      EDITOR = "hx";
      BROWSER = "firefox";
      TERMINAL = "kitty";
      LOCK = "~/nix/home/modules/desktop/lock.sh"
    };
    # activation.restartHyprpaper = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    #   if systemctl --user is-active --quiet hyprpaper.service; then
    #     systemctl --user restart hyprpaper.service
    #   else
    #     systemctl --user start hyprpaper.service
    #   fi
    # '';

  };
  imports = [
    ../stylix.nix
    ./modules/modules.nix
  ];
}
