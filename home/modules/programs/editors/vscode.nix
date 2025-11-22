{ pkgs, lib, config, ... }:
let
  cfg = config.modules.programs.editors.vscode;
in
{
  options.modules.programs.editors.vscode = {
    enable = lib.mkEnableOption "VSCode";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.vscode ];

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
  };
}

