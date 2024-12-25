{
  programs.direnv = {
    enable = true;
    enableNushellIntegration = true;
    # nix-direnv.enable = true;
    config = {
      whitelist = {
        prefix = [ "/home/hayshin/dev" ];
      };
    };
  };
}
