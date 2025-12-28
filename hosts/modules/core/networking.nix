# defined hosts names for all my machines
{ pkgs, ... }:
{
  networking = {
    wireless = {
      iwd = {
        enable = true;
        settings = {
          General = {
            DisableScanning = true;
            AutoEnable = true;
          };
          Network = {
            EnableIPv6 = true;
          };
          Settings = {
            AutoConnect = true;
          };
        };
      };
    };
    networkmanager = {
      enable = false;
      # wifi.backend = "iwd";
    };
    # hosts = {
    #   "192.168.0.50" = [ "powicd-cursesco" ];
    #   "192.168.0.15" = [ "nanus" ];
    #   "192.168.0.10" = [ "iners" ];
    # };
  };
  environment.systemPackages = [
    pkgs.dig
    pkgs.lsof
    pkgs.impala
    pkgs.bluetuith
  ];
}
