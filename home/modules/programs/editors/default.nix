{ pkgs, lib, config, ... }:
let
  cfg = config.modules.programs.editors;
in
{
  imports = [
    ./vscode.nix
    ./zed.nix
    ./cursor.nix
  ];

  options.modules.programs.editors = {
    default = lib.mkOption {
      type = lib.types.enum [ "vscode" "zed" "cursor" "helix" ];
      default = "cursor";
      description = "Default system editor";
    };
  };

  config = {
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

