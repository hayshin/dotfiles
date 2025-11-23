{
  pkgs,
  ...
}:

pkgs.writeShellApplication {
  name = "vpn";

  runtimeInputs = [
    pkgs.openfortivpn
    pkgs.cotp
  ];

  text = ''
    #!/bin/bash
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8

    OTP_CODE="''${1-}"

    if [ -z "$OTP_CODE" ]; then
        read -r -p "Введите OTP-код аутенфикатора: " OTP_CODE
    fi

    read -r PASSWORD < /home/hayshin/.secrets/choco/password.txt

    VPN_PASSWORD="''${PASSWORD}''${OTP_CODE}"

    sudo openfortivpn -p "$VPN_PASSWORD"
  '';
}
