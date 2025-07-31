{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    zed-editor-fhs
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
        install -m 0640 "$(readlink ${configPath})" ${configPath}
      '';
    };
}
