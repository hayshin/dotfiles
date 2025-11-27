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
    includes = [
      {
        condition = "gitdir:~/dev/gentest";
        contents = {
          user.name = "Dauren Baimurza";
          user.email = "baimurza.d@idoctor.kz";
          core.sshCommand = "ssh -i ~/.ssh/gitlab";
        };
      }
      {
        condition = "gitdir:~/dev/idoctor";
        contents = {
          user.email = "baimurza.d@idoctor.kz";
          user.name = "Dauren Baimurza";
          core.sshCommand = "ssh -i ~/.ssh/gitlab";
        };
      }
    ];
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
