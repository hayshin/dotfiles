{
  security.sudo = {
    extraRules = [
      {
        users = [ "hayshin" ];
        commands = [
          {
            command = "/home/hayshin/vpn.sh";
            options = [
              "NOPASSWD"
            ];
          }
          {
            command = "vpn";
            options = [
              "NOPASSWD"
            ];
          }
        ];
      }
    ];
  };
}
