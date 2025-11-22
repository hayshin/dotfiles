{ pkgs, rootPath, ... }:
{
  imports = [
    ./hardware/iners.nix
    ./modules
  ];

  modules = {
    hardware = {
      # asus.enable = true; # Asus module deleted
      audio.enable = true;
      bluetooth.enable = true;
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
    hostName = "iners";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  environment = {
    sessionVariables = import (rootPath + /shared/variables.nix);
    systemPackages = [ pkgs.cloudflared ];
  };

  system.stateVersion = "24.05";
}
