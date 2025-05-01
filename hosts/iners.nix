let
  concat = dir: name: dir + "/${name}";
in
{
  imports =
    [
      ./hardware/iners.nix
      ./common/core
      ./common/users
    ]
    ++ map (concat ./common/optional) [
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
    hostName = "iners";
    networkmanager.enable = true;
  };

  environment = {
    sessionVariables = import ../variables.nix;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  system.stateVersion = "24.05";
}
