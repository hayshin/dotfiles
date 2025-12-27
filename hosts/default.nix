{ lib, inputs }:
{
  matte = lib.mkSystem {
    hostname = "matte";
    modules = [ inputs.sops-nix.nixosModules.sops ];
  };
  wujie = lib.mkSystem {
    hostname = "wujie";
    modules = [ inputs.sops-nix.nixosModules.sops ];
  };
  nanus = lib.mkSystem {
    hostname = "nanus";
  };
}
