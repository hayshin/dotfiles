{
  description = "System configuration of hayshin";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/8c6c037d72944da0e327c4bfe1cf5ce9ff0eeba4";
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
    };
    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprrun = {
      url = "github:hayshin/hyprrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    polymc.url = "github:PolyMC/PolyMC";
    caelestia-shell.url = "github:caelestia-dots/shell";
    hyprsession.url = "github:joshurtree/hyprsession";
  };
  outputs =
    inputs:
    let
      lib = import ./lib { inherit inputs; };
    in
    {
      nixosConfigurations = import ./hosts { inherit lib inputs; };
      homeConfigurations = import ./home { inherit lib; };
    };
}
