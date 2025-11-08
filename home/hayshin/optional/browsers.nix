{ pkgs, ... }:
{
  imports = [
    ./zen-browser.nix
  ];

  home.packages = with pkgs; [
    google-chrome
    firefox-devedition
    vivaldi
  ];

  programs.firefox = {
    enable = true;
  };
  # programs.qutebrowser = {
  #   enable = true;
  # };
}
