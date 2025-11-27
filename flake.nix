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
    caelestia-shell.url = "github:caelestia-dots/shell";
    hyprsession.url = "github:joshurtree/hyprsession";
  };
  outputs =
    {
      nixpkgs,
      stylix,
      home-manager,
      sops-nix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      overlay = import ./pkgs;
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ overlay ];
        config.allowUnfree = true;
      };
      rootPath = ./.;
    in
    {
      # "hayshin" - system hostname
      nixosConfigurations = {
        matte = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit rootPath;
          };
          modules = [
            ./hosts/matte.nix
            { nixpkgs.overlays = [ overlay ]; }
            stylix.nixosModules.stylix
            sops-nix.nixosModules.sops
          ];
        };
        nanus = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/nanus.nix
            { nixpkgs.overlays = [ overlay ]; }
            stylix.nixosModules.stylix
          ];
        };
      };

      # "hayshin" - username
      homeConfigurations = {
        "hayshin@matte" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home/hayshin/matte.nix
            stylix.homeModules.stylix
          ];
          extraSpecialArgs = {
            inherit inputs;
            inherit rootPath;
          };
        };
        "hayshin@nanus" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home/hayshin/nanus.nix
            stylix.homeModules.stylix
          ];
          extraSpecialArgs = {
            inherit inputs;
            inherit rootPath;
          };
        };
        "server" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home/server
            stylix.nixosModules.stylix
          ];
        };
      };
    };
}
