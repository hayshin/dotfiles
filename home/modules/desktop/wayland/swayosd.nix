# notification to show changing steps of volume/brightness
{ pkgs, ... }:
{
  services.swayosd = {
    enable = true;
  };
  home.packages = with pkgs; [
    brightnessctl
    playerctl
    pavucontrol
    pulseaudio
  ];
}
