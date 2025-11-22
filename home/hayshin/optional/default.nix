{ pkgs, ... }:
{
  imports = [
    ./office.nix
    ./media.nix
    ./development
    ./desktops
  ];
  home.packages = with pkgs; [
    discord
    obsidian
    telegram-desktop
    openvpn
  ];
  programs.obs-studio = {
    enable = true;
  };

}
