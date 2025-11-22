{
  config,
  lib,
  rootPath,
  pkgs,
  ...
}:
let
  cfg = config.modules.ui.stylix;
in
{
  options.modules.ui.stylix = {
    enable = lib.mkEnableOption "Stylix";
  };

  imports = [
    (lib.mkIf cfg.enable (import (rootPath + /stylix) { inherit pkgs config lib; }))
  ];
}
