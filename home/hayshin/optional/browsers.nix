{ pkgs, inputs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  home.packages = with pkgs; [
    google-chrome
    microsoft-edge
    vivaldi
  ];

  programs.firefox = {
    enable = true;
  };
  programs.qutebrowser = {
    enable = true;
  };
  programs.zen-browser = {
    enable = true;
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
    };
  };
}
