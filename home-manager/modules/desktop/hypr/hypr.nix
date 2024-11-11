{
  imports = [
    ./paper.nix
    ./lock.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = import ./settings/settings.nix;
  };
}
