{ pkgs, ... }:
{
  imports = [
    ./office.nix
    ./media.nix
    ./development
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
