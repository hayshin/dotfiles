{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "hayshin";
    userEmail = "hayshinbj@gmail.com";
  };

  programs.gh = {
    enable = true;
  };

  home.packages = with pkgs; [
    tokei
    cocogitto
    git-quick-stats
  ];
}
