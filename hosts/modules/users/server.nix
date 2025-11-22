{ pkgs, ... }:
{
  users.users.server = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "user for server purposes";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
    ];
  };
  programs.zsh.enable = true;
}
