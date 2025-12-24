{
  pkgs,
  inputs,
  polymc,
  rootPath,
  ...
}:
{
  imports = [
    ./hardware/wujie.nix
    ./modules
  ];

  boot = {
    initrd.kernelModules = [
      "amdgpu"
    ];
    kernelParams = [
      "video=eDP-1:2880x1800@120"
    ];
    kernelModules = [ "amdgpu" ];
    loader.systemd-boot.consoleMode = "1"; # press r on system-boot
    kernelPackages = pkgs.linuxKernel.packages.linux_6_17;
  };
  services.choco-vpn.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd # OpenCL
      libva # VA-API
    ];
  };
  modules = {
    hardware = {
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

  nixpkgs.overlays = [ polymc.overlay ];
  networking = {
    hostName = "wujie";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  environment = {
    sessionVariables = import (rootPath + /shared/variables.nix);
    systemPackages = [
      pkgs.cloudflared
      pkgs.choco-vpn
      pkgs.polymc
    ];
  };

  system.stateVersion = "24.05";
}
