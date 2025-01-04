{ pkgs, ... }:
{
  imports = [
    ./modules
    ./users/lenovo.nix
    ../stylix.nix
    ./hardware/lenovo.nix
  ];

  networking = {
    hostName = "lenovo";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Tashkent";

  nixpkgs.config.allowUnfree = true;
  environment = {
    systemPackages = with pkgs; [
      wget
      helix
      home-manager
      git
    ];
    sessionVariables = import ../variables.nix;
  };

  system.stateVersion = "24.11";

  security = {
    # pam = {
    #   services = {
    #     gdm.enableGnomeKeyring = true;
    #   };
    # };
    # polkit.enable = true;
  };
}
