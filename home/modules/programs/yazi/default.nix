{ pkgs, lib, config, ... }:
let
  cfg = config.modules.programs.yazi;
in
{
  options.modules.programs.yazi = {
    enable = lib.mkEnableOption "Yazi";
  };

  config = lib.mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      keymap = import ./keymap.nix;
      initLua = ./init.lua;
      settings = {
        tasks = {
          image_bound = [
            10000
            10000
          ];
        };
        mgr = {
          # sort_by = "mtime";
          # sort_reverse = true;
          linemode = "mtime";
        };
        preview = {
          tab_size = 2;
        };
        plugin = {
          prepend_fetchers = [
            {
              id = "git";
              name = "*";
              run = "git";
            }
            {
              id = "git";
              name = "*/";
              run = "git";
            }
          ];
        };
      };
      plugins = {
        folder-rules = ./folder-rules;
        wl-clipboard = pkgs.yaziPlugins.wl-clipboard;
        full-border = pkgs.yaziPlugins.full-border;
        smart-enter = pkgs.yaziPlugins.smart-enter;
        smart-paste = pkgs.yaziPlugins.smart-paste;
        git = pkgs.yaziPlugins.git;
        mount = pkgs.yaziPlugins.mount;
        # yatline = pkgs.yaziPlugins.yatline;
        # zoom = pkgs.yaziPlugins.zoom;
        # vcs-files = pkgs.yaziPlugins.vcs-files;
      };
    };
  };
}
