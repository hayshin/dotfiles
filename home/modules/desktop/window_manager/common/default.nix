{pkgs, ...}: {
  imports = [
    ./waybar # bar
    ./wlogout # logout menu
    ./dunst.nix # notification
    ./fuzzel.nix # menu
    ./paper.nix # wallpaper
    ./idle.nix # control idle
    ./swayosd.nix # notification when control brightness, volume
    ./cliphist.nix # clipboard history
  ];
  home.packages = with pkgs; [
    hyprshot # screenshot
    hyprpicker # color picker
    brightnessctl # control brightness 
    playerctl # control media
    pulseaudio # control volume and audio
    pavucontrol
    wl-clipboard # clipboard
  ];
}
