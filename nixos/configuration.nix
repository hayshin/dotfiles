{ pkgs, ... }:
{
  imports = [
    ./battery.nix
    ./i18n.nix
    ./nix.nix
    ./users/users.nix
    ../stylix.nix
    ./hardware-configuration.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 1;
  };

  networking = {
    hostName = "hayshin";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Tashkent";

  nixpkgs.config.allowUnfree = true;
  environment = {
    systemPackages = with pkgs; [
      wget
      helix
      home-manager
      hyprland
      git
      zsh
      nushell
      gh
      powertop
      zip
      unzip
      (import ./scripts/lock.nix { inherit pkgs; })
    ];
    sessionVariables = import ../variables.nix;
  };

  hardware = {
    graphics.enable = true;
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  security = {
    # pam = {
    #   services = {
    #     gdm.enableGnomeKeyring = true;
    #   };
    # };
    # polkit.enable = true;
  };

  services = {
    kanata = {
      enable = true;
    };

    xserver = {
      enable = true;
      xkb.layout = "us";
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    getty.autologinUser = "hayshin";
  };

  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
  ];

  system.stateVersion = "24.05";
}
