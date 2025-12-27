{ pkgs, lib, config, ... }:
let
  cfg = config.modules.programs.editors;
in
{
  imports = [
    ./vscode.nix
    ./zed.nix
    ./cursor.nix
    ./helix
  ];

  options.modules.programs.editors = {
    default = lib.mkOption {
      type = lib.types.enum [ "vscode" "zed" "cursor" "hx" ];
      default = "hx";
      description = "Default system editor";
    };
  };


  config = {
    home.sessionVariables = {
      EDITOR = cfg.default;
    };

    home.shellAliases = {
      editor = cfg.default;
    };

    xdg.desktopEntries = {
      editor = {
        name = "editor";
        genericName = "Editor selector";
        exec = cfg.default;
        type = "Application";
        terminal = false;
      };
    };
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
          "text/plain" = "editor.desktop";
          "text/markdown" = "editor.desktop";
      };
    };
    editorconfig = {
      enable = true;
      settings = {
        "*" = {
          charset = "utf-8";
          end_of_line = "lf";
          trim_trailing_whitespace = true;
          isnert_final_newline = true;
          max_line_width = 80;
          indent_style = "space";
          indent_size = 2;
        };
      };
    };
  };
}
