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
  security = {
    # pam = {
    #   services = {
    #     gdm.enableGnomeKeyring = true;
    #   };
    # };
    polkit.enable = true;
  };
  environment.systemPackages = [ pkgs.openssl ];
}
