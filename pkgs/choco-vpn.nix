{
  pkgs,
  ...
}:

pkgs.writeShellApplication {
  name = "choco-vpn";

  runtimeInputs = [
    pkgs.openfortivpn
    pkgs.totp-cli
  ];

  text = ''
    #!/bin/bash
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8

    OTP_CODE=$(sudo cat /run/secrets/choco_otp | totp-cli instant --algorithm sha256)
    PASSWORD=$(sudo cat /run/secrets/choco_password)
    VPN_PASSWORD="$PASSWORD''${OTP_CODE}"
    sudo openfortivpn -c /run/secrets/choco_vpn -p "$VPN_PASSWORD"
  '';
}
