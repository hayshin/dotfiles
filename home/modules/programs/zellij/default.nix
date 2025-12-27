{ pkgs, lib, config, ... }:
let
  cfg = config.modules.programs.zellij;
in
{
  options.modules.programs.zellij = {
    enable = lib.mkEnableOption "Zellij";
  };

  config = lib.mkIf cfg.enable {
    programs.zellij = {
      enable = true;
    };
    # xdg.configFile."zellij/config.kdl".source = config.lib.file.mkOutOfStoreSymlink ./config.kdl;
    xdg.configFile."zellij/config.kdl".source = ./config.kdl;
  };
}
