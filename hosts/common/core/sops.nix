# to keep secrets privately to others
{ inputs, ... }:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];
  sops = {
    defaultSopsFile = ../../secrets.yaml;
    defaultSopsFormat = "yaml";
    validateSopsFiles = false;
    age = {
      keyFile = "/home/hayshin/.config/sops/age/keys.txt";
    };
  };
}
