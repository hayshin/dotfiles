{ pkgs, ... }:
{
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
