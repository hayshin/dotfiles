{ pkgs, ... }:
let
  concat = dir: name: dir + "/${name}";
in
{
  imports = [
    ./hardware/matte.nix
    # ./common/optional/server/cloudflared.nix
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
    hostName = "matte";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  hardware.enableAllFirmware = true;
  hardware.firmware = [ pkgs.sof-firmware ];

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
