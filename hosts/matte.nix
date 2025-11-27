{ pkgs, rootPath, ... }:
{
  imports = [
    ./hardware/matte.nix
    ./modules
  ];

  services.choco-vpn.enable = false;

  modules = {
    hardware = {
      audio.enable = true;
      bluetooth.enable = true;
      # asus.enable = false; # Enable if this is an ASUS laptop
    };
    desktop = {
      hyprland.enable = true;
    };
    ui = {
      stylix.enable = true;
    };
    programs = {
      steam.enable = true;
      # ollama.enable = true;
    };
  };

  networking = {
    hostName = "matte";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  environment = {
    sessionVariables = import (rootPath + /shared/variables.nix);
    systemPackages = [
      pkgs.cloudflared
      pkgs.choco-vpn
    ];
  };

  system.stateVersion = "24.05";
}
