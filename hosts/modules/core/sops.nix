# to keep secrets privately to others
{ inputs, pkgs, ... }:
let
  secretsDir = ../../../secrets;
in
{
  imports = [ inputs.sops-nix.nixosModules.sops ];
  environment.systemPackages = [ pkgs.sops ];
  sops = {
    defaultSopsFile = secretsDir + "/secrets.yaml";
    defaultSopsFormat = "yaml";
    validateSopsFiles = false;
    age = {
      keyFile = "/home/hayshin/.config/sops/age/keys.txt";
    };

    secrets = {
      choco_vpn = {
        format = "binary";
        sopsFile = secretsDir + "/choco_vpn";
      };
      choco_otp = { };
      choco_password = { };
    };
  };
}
