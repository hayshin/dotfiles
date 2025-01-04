{ pkgs, ... }:
{
  users.users.hayshin = {
    shell = pkgs.nushell;
    isNormalUser = true;
    description = "hayshin";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "input"
    ];
  };
}
