{
  pkgs,
  ...
}:

pkgs.writeShellScriptBin "vpn" ''
  #!/bin/bash

  if [ -z "$1" ]; then
      read -p "Введите OTP-код аутенфикатора: " OTP_CODE
  else
      OTP_CODE="$1"
  fi

  read -r PASSWORD < /home/hayshin/.secrets/choco/password.txt

  VPN_PASSWORD="''${PASSWORD}''${OTP_CODE}"

  sudo openfortivpn -p "$VPN_PASSWORD"
''
