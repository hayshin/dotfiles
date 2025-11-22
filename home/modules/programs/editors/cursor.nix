{ pkgs, lib, config, ... }:
let
  cfg = config.modules.programs.editors.cursor;
in
{
  options.modules.programs.editors.cursor = {
    enable = lib.mkEnableOption "Cursor Editor";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.code-cursor-fhs ];
  };
}

