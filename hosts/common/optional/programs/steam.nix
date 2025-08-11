{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    wineWowPackages.full
    steam-run
    winetricks
    # wine-wayland
  ];
}
