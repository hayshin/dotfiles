{
  description = "System configuration of hayshin";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";

    stylix.url = "github:danth/stylix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    helix.url = "github:helix-editor/helix";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    sops-nix.url = "github:Mic92/sops-nix";

    hyprrun.url = "github:hayshin/hyprrun";
    caelestia-shell.url = "github:caelestia-dots/shell";

    hyprland-virtual-desktops = {
      url = "github:levnikmyskin/hyprland-virtual-desktops";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprsession.url = "github:joshurtree/hyprsession"; # raise.url = "github:neg-serg/raise";
  };
  outputs =
    {
      nixpkgs,
      stylix,
      home-manager,
      zen-browser,
      helix,
      sops-nix,
      nixos-hardware,
      hyprland-virtual-desktops,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      rootPath = ./.;
    in
    {
      # "hayshin" - system hostname
      nixosConfigurations = {
        iners = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit rootPath;
          };
          modules = [
            ./hosts/iners.nix
            stylix.nixosModules.stylix
            sops-nix.nixosModules.sops
            nixos-hardware.nixosModules.asus-fx506hm
          ];
        };
        matte = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit rootPath;
          };
          modules = [
            ./hosts/matte.nix
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
            stylix.nixosModules.stylix
          ];
        };
      };

      # "hayshin" - username
      homeConfigurations = {
        "hayshin@iners" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home/hayshin/iners.nix
            stylix.homeManagerModules.stylix
          ];
          extraSpecialArgs = {
            inherit inputs;
            inherit rootPath;
          };
        };
        "hayshin@matte" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home/hayshin/matte.nix
            stylix.homeManagerModules.stylix
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
            stylix.homeManagerModules.stylix
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
