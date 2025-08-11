{ pkgs, ... }:
let
  concat = dir: name: dir + "/${name}";
in
{
  imports = [
    ./hardware/iners.nix
    ./common/core
    ./common/users
    ./optional/personal
    ./optional/programs
    ./optional/archive.nix
    ./optional/docker.nix
    ./optional/nix-ld.nix
    ./optional/stylix.nix
  ];

  networking = {
    hostName = "iners";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  environment = {
    sessionVariables = import ../variables.nix;
    systemPackages = [ pkgs.cloudflared ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  system.stateVersion = "24.05";
}
