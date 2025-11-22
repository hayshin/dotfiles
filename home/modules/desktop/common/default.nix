{ pkgs, ... }:
{
  imports = [
    ./dunst.nix # notification
    ./fuzzel.nix # menu
    ./cliphist.nix # clipboard history
    ./keyring.nix # keyring
    ./xdg.nix
  ];
  home.packages = with pkgs; [ ddcutil ];
}
