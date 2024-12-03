{ pkgs, ... }:
with pkgs;
[
  maven
  linuxKernel.packages.linux_6_11.perf
  libreoffice
  jetbrains.idea-ultimate
  jetbrains.pycharm-professional
  shotcut
  swaylock-effects
  firefox
  fusuma
  waybar
  mako
  wl-clipboard
  hyprshot
  hyprpicker
  light
  pavucontrol
  wlogout
  webcord
  btop
  obs-studio
  vlc
  playerctl
  nodejs
  pulseaudio
  brightnessctl
]