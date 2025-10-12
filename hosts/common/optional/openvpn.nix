{
  services.openvpn = {
    servers.choco = {
      config = "config /home/hayshin/dev/choco/client.ovpn";
      authUserPass = /home/hayshin/.secrets/choco/openvpn.nix;
      # autoStart = true;
      # updateResolvConf = true;
    };
  };
}
