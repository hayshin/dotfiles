{ pkgs, lib, config, ... }:
let
  cfg = config.modules.programs.shell.ssh;
in
{
  options.modules.programs.shell.ssh = {
    enable = lib.mkEnableOption "SSH";
  };

  config = lib.mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks."github.com" = {
        addKeysToAgent = "yes";
        forwardAgent = true;
        user = "git";
        identitiesOnly = true;
        identityFile = "~/.ssh/github";
      };
      matchBlocks."git.chocodev.kz" = {
        addKeysToAgent = "yes";
        forwardAgent = true;
        user = "git";
        identitiesOnly = true;
        identityFile = "~/.ssh/gitlab";
      };
    };
    services.ssh-agent = {
      enable = true;
    };
  };
}
