{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    zed-editor-fhs
    code-cursor-fhs
    vscode
  ];

  # Workaround for mutable config
  home.activation.makeVSCodeConfigWritable =
    let
      configPath = "${config.xdg.configHome}/Code/User/settings.json";
    in
    {
      after = [ "writeBoundary" ];
      before = [ ];
      data = ''
        if [ -L "${configPath}" ]; then
          realPath=$(readlink "${configPath}")
          install -m 0640 "$realPath" "${configPath}"
        fi
      '';
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
}
