{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "hayshin";
        email = "hayshinbj@gmail.com";
      };
    };
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
