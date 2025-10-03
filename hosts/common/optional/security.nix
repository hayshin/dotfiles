{
  security.sudo = {
    enable = true;
    extraRules = [
      {
        users = [ "hayshin" ];
        commands = [
          {
            command = "/home/hayshin/.nix-profile/bin/openfortivpn";
            options = [
              "NOPASSWD"
            ];
          }
        ];
      }
    ];
  };
}
