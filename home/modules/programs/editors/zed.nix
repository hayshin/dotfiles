{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.modules.programs.editors.zed;
in
{
  options.modules.programs.editors.zed = {
    enable = lib.mkEnableOption "Zed Editor";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.zed-editor-fhs ];

    xdg.configFile."zed".source = config.lib.file.mkOutOfStoreSymlink ./zed;

    # home.file.".config/zed".source = config.lib.file.mkOutOfStoreSymlink ./zed/settings.json; # xdg.configFile."zed/keymap.json".source = ./zed/keymap.json;

    # xdg.configFile."zed/settings.json".source = ./zed/settings.json;
    # xdg.configFile."zed/keymap.json".source = ./zed/keymap.json;
  };
}
