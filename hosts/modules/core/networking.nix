# defined hosts names for all my machines
{ pkgs, ... }:
{
  # networking = {
  # nameservers = [
  #   "1.1.1.1"
  #   "8.8.8.8"
  # ];
  # resolvconf = {
  #   enable = true;
  # };
  # hosts = {
  #   "192.168.0.50" = [ "poco" ];
  #   "192.168.0.15" = [ "nanus" ];
  #   "192.168.0.10" = [ "iners" ];
  # };
  # };
  environment.systemPackages = [
    pkgs.dig
    pkgs.lsof
  ];
  # services.avahi = {
  #   enable = true;
  #   nssmdns4 = true;
  #   openFirewall = true;
  #   publish = {
  #     enable = true;
  #     addresses = true;
  #     domain = true;
  #     hinfo = true;
  #     userServices = true;
  #     workstation = true;
  #   };
  # };
  # services.resolved = {
  #   enable = true;
  # };
  # services.dnsmasq = {
  #   enable = true;
  #   settings = {
  #     domain = "lan";
  #     domain-needed = true;
  #     bogus-priv = true;
  #     # dhcp-range = "192.168.0.100,192.168.0.200,2h";
  #     expand-hosts = true;
  #     dhcp-host = "9c:9e:d5:71:a7:c6,poco";
  #   };
  # };
}
