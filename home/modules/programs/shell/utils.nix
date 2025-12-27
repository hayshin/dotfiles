{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fastfetch
    tree
    dust
    tt
  ];
  programs = {
    bat = {
      enable = true;
    };
    fzf = {
      enable = true;
    };
    pay-respects = {
      enable = true;
    };
    zoxide = {
      enable = true;
    };
    starship = {
      enable = true;
    };
    fd = {
      enable = true;
    };
    ripgrep = {
      enable = true;
    };
    ripgrep-all = {
      enable = true;
    };
  };

}
