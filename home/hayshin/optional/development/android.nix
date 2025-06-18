{ pkgs, ... }:
{
  nixpkgs.config.android_sdk.accept_license = true;
  home.packages = with pkgs; [
    android-tools
    androidsdk
    android-studio
  ];
}
