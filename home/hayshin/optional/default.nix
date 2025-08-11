{ pkgs, ... }:
{
  imports = [
    ./browsers.nix
    ./terminals.nix
    ./office.nix
    ./media.nix
    ./development
    ./desktops
  ];
  home.packages = with pkgs; [
    discord
    webcord
    obsidian
    telegram-desktop
  ];
  programs.obs-studio = {
    enable = true;
  };

}
