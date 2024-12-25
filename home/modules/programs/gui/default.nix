
{ pkgs, config, ... }:
{
  imports = [
    ./browser
    ./imv.nix # image viewer
    ./mpv.nix # video viewer
    ./kitty.nix # terminal
    ./obs.nix # video recorder
  ];
  home.packages = with pkgs; [
    libreoffice # office programs
    obsidian # notes
    shotcut # video editor
    webcord # discord wrapper with wayland support
  ];
}
