{ pkgs, ... }:
{
  users.users.lenovo = {
    shell = pkgs.nushell;
    isNormalUser = true;
    description = "lenovo";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
    ];
  };
}
