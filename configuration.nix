{ config, pkgs, ... }:

{
  imports = [
    ./stylix.nix
    ./hardware-configuration.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "hayshin"; # Define your hostname.
    networkmanager.enable = true;
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  };

  time.timeZone = "Asia/Tashkent";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  users.users.hayshin = {
    shell = pkgs.nushell;
    isNormalUser = true;
    description = "hayshin";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "input"
    ];
  };

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
      zip
      unzip

      (import ./scripts/lock.nix { inherit pkgs; })
    ];

    sessionVariables = import ./variables.nix;
  };

  hardware = {
    graphics.enable = true;
  };

  services = {
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

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    zsh.enable = true;
  };

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
  ];

  system.stateVersion = "24.05";
}
