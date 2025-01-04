{ pkgs, ... }:
{
  imports = [
    ./modules
    ./users
    ../stylix.nix
    ./hardware/hayshin.nix
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

  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
  ];
}
