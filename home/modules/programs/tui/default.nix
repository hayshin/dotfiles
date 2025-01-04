{ pkgs, ... }:
{
  imports = [
    ./helix # text editor
    ./yazi # file manager
    ./zellij.nix # terminal workspace manager
  ];
  home.packages = with pkgs; [
    btop # resource monitor
    fastfetch # os info
    pandoc # document converter
  ];
}
