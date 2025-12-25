{ pkgs, config, ... }:
{
  imports = [
    ./swayosd.nix # notification when control brightness, volume
    ./waybar # bar
    ./wlogout # logout menu
  ];

  home.packages = [
    (import ./swaylock.nix { inherit pkgs config; })
  ];
}
