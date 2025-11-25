{ pkgs, ... }:
{
  security.sudo = {
    enable = true;
    extraRules = [
      {
        users = [ "hayshin" ];
        commands = [
          {
            command = "${pkgs.vpn}/bin/vpn";
            options = [
              "NOPASSWD"
            ];
          }
        ];
      }
    ];
  };
}
