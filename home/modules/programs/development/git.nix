{ pkgs, lib, config, ... }:
let
  cfg = config.modules.programs.development.git;
in
{
  options.modules.programs.development.git = {
    enable = lib.mkEnableOption "Git configuration";
    userName = lib.mkOption {
      type = lib.types.str;
      default = "hayshin";
      description = "Git user name";
    };
    userEmail = lib.mkOption {
      type = lib.types.str;
      default = "hayshinbj@gmail.com";
      description = "Git user email";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = cfg.userName;
      userEmail = cfg.userEmail;
      includes = [
        {
          condition = "gitdir:~/dev/gentest/";
          contents = {
            user.name = "Dauren Baimurza";
            user.email = "baimurza.d@idoctor.kz";
            core.sshCommand = "ssh -i ~/.ssh/gitlab";
          };
        }
        {
          condition = "gitdir:~/dev/idoctor/";
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
  };
}
