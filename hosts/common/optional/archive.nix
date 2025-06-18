{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zip
    unzip

    unrar-free
  ];
}
