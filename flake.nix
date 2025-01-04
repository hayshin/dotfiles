{
  description = "System configuration of hayshin";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix = {
      # style applications
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      stylix,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      # "hayshin" - system hostname
      nixosConfigurations = {
        hayshin = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/hayshin.nix
            stylix.nixosModules.stylix
          ];
        };
        lenovo = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/lenovo.nix
          ];
        };
      };
      # "hayshin" - username
      homeConfigurations = {
        hayshin = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            ./home/hayshin.nix
            stylix.homeManagerModules.stylix
          ];
        };
        lenovo = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            ./home/lenovo.nix
          ];
        };
      };
    };
}
