{
  programs.direnv = {
    enable = true;
    enableNushellIntegration = true;
    # silent = true;

    # nix-direnv.enable = true;
    config = {
      hide_env_diff = true;
      whitelist = {
        warn_timeout = "1m";
        prefix = [ "/home/hayshin/dev" ];
      };
    };
  };
}
