{
  imports = [
    ./hardware/nanus.nix
    ./modules
  ];

  networking = {
    hostName = "nanus";
    networkmanager.enable = true;
  };

  system.stateVersion = "24.11";
}
