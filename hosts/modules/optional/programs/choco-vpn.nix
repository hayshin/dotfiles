{
  config,
  pkgs,
  lib,
  ...
}:
let
  chocoVpnScript = pkgs.writeShellScript "choco-vpn-connect" ''
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8

    OTP_CODE=$(cat /run/secrets/choco_otp | ${pkgs.totp-cli}/bin/totp-cli instant --algorithm sha256)
    PASSWORD=$(cat /run/secrets/choco_password)
    VPN_PASSWORD="$PASSWORD$OTP_CODE"

    exec ${pkgs.openfortivpn}/bin/openfortivpn -c /run/secrets/choco_vpn -p "$VPN_PASSWORD"
  '';
in
{
  options.services.choco-vpn = {
    enable = lib.mkEnableOption "Choco VPN service";
  };

  config = lib.mkIf config.services.choco-vpn.enable {
    systemd.services.choco-vpn = {
      description = "Choco VPN";
      after = [ "network-online.target" "sops-nix.service" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        Type = "simple";
        ExecStart = chocoVpnScript;
        Restart = "on-failure";
        RestartSec = "5s";

        # Kill cleanly on stop
        KillMode = "mixed";
        KillSignal = "SIGTERM";
        TimeoutStopSec = "10s";
      };
    };

    # Restart VPN after resume from sleep
    systemd.services.choco-vpn-resume = {
      description = "Restart Choco VPN after sleep";
      after = [ "suspend.target" "hibernate.target" "hybrid-sleep.target" ];
      wantedBy = [ "suspend.target" "hibernate.target" "hybrid-sleep.target" ];

      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.systemd}/bin/systemctl restart choco-vpn.service";
      };
    };
  };
}

