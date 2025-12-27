{ inputs }:
let
  inherit (inputs.nixpkgs) lib;
  rootPath = ../.;
  overlay = import ../pkgs;

  specialArgs = {
    inherit inputs rootPath;
    inherit (inputs)
      hyprsession
      hyprrun
      caelestia-shell
      zen-browser
      helix
      sops-nix
      polymc;
  };
in
{
  inherit specialArgs;

  # Helper for NixOS systems
  mkSystem =
    {
      hostname,
      system ? "x86_64-linux",
      modules ? [ ],
    }:
    lib.nixosSystem {
      inherit system specialArgs;
      modules = [
        ../hosts/${hostname}.nix
        { nixpkgs.overlays = [ overlay ]; }
        inputs.stylix.nixosModules.stylix
      ] ++ modules;
    };

  # Helper for Home Manager configurations
  mkHome =
    {
      username,
      hostname ? null,
      system ? "x86_64-linux",
      modules ? [ ],
    }:
    let
      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [ overlay ];
        config.allowUnfree = true;
      };
      modulePath =
        if hostname == null then ../home/${username} else ../home/${username}/${hostname}.nix;
    in
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = specialArgs;
      modules = [
        modulePath
        inputs.stylix.homeModules.stylix
      ] ++ modules;
    };
}
