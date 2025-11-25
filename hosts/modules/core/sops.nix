# to keep secrets privately to others
{ inputs, pkgs, ... }:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];
  environment.systemPackages = [ pkgs.sops ];
  sops = {
    defaultSopsFile = ../../secrets.yaml;
    defaultSopsFormat = "yaml";
    validateSopsFiles = false;
    age = {
      keyFile = "/home/hayshin/.config/sops/age/keys.txt";
    };

    secrets = {
      choco_vpn = {
        format = "binary";
        sopsFile = ../../../secrets/choco_vpn;
      };
    };
  };
}
