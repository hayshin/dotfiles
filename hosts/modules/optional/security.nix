{ pkgs, ... }:
{
  security.sudo = {
    enable = true;
    extraRules = [
      {
        users = [ "hayshin" ];
        commands = [
          {
            command = "${pkgs.choco-vpn}/bin/choco-vpn";
            options = [
              "NOPASSWD"
            ];
          }
        ];
      }
    ];
  };
}
