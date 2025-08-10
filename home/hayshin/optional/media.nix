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
  programs.imv = {
    enable = true;
  };
  programs.mpv = {
    enable = true;
  };
}
