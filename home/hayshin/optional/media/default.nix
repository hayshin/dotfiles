{ pkgs, ... }:
{
  imports = [
    ./mpv.nix
    ./imv.nix
  ];
  home.packages = with pkgs; [
    ffmpeg
    speechd
  ];
}
