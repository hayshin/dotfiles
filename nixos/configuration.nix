{ pkgs, ... }:
{
  imports = [
    ./kanata/kanata.nix
    ./audio.nix
    ./battery.nix
    ./i18n.nix
    ./nix.nix
    ./users/users.nix
    ../stylix.nix
    ./hardware-configuration.nix
    ./boot.nix
    ./greeter.nix
  ];

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

  system.stateVersion = "24.05";

  security = {
    # pam = {
    #   services = {
    #     gdm.enableGnomeKeyring = true;
    #   };
    # };
    # polkit.enable = true;
  };

  services = {
    # xserver = {
    #   enable = true;
    #   xkb.layout = "us";
    # displayManager.gdm = {
    #   enable = true;
    #   wayland = true;
    # };
    # };
  };

  # fonts.packages = with pkgs; [
  #   font-awesome
  #   jetbrains-mono
  # ];

}
