# defined hosts names for all my machines
{
  networking = {
    hosts = {
      "192.168.180.55" = [ "poco" ];
      "192.168.180.10" = [ "nanus" ];
      "192.168.180.50" = [ "iners" ];
    };
  };
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
  services.dnsmasq = {
    enable = true;
    settings = {
      dhcp-host = "	9c:9e:d5:71:a7:c6,poco";
    };
  };

}
