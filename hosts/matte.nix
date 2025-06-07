{ pkgs, ... }:
let
  concat = dir: name: dir + "/${name}";
in
{
  imports =
    [
      ./hardware/matte.nix
      ./common/core
      ./common/users
    ]
    ++ map (concat ./common/optional) [
      # "kdeconnect.nix"
      "bluetooth.nix"
      "asus.nix"
      "stylix.nix"
      "docker.nix"
      "battery"
      "kanata"
      "hyprland.nix"
      "audio.nix"
      "security.nix"
      "nix-ld.nix"
      "ydotool.nix"
      "greeter.nix"
      "jupyter.nix"
      "ollama.nix"
    ];

  networking = {
    hostName = "matte";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  environment = {
    sessionVariables = import ../variables.nix;
    systemPackages = [ pkgs.cloudflared ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  system.stateVersion = "24.05";
}
