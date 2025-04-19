{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    git
    helix
    yazi
    home-manager
  ];

  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
  ];
}
