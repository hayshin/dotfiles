{ pkgs, ... }:
{
  users.users.hayshin = {
    shell = pkgs.nushell;
    isNormalUser = true;
    description = "main user of my system";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "input"
      "ydotool"
      "docker"
    ];
  };
}
