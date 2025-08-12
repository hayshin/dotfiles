{ pkgs, ... }:
let
  concat = dir: name: dir + "/${name}";
in
{
  imports = [
    ./hardware/iners.nix
    ./common/core
    ./common/users
    ./common/optional/personal
    ./common/optional/programs
    ./common/optional/archive.nix
    ./common/optional/docker.nix
    ./common/optional/nix-ld.nix
    ./common/optional/stylix.nix
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
