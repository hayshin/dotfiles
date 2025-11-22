{ config, lib, ... }:
let
  cfg = config.modules.services.ollama;
in
{
  options.modules.services.ollama = {
    enable = lib.mkEnableOption "Ollama";
  };

  config = lib.mkIf cfg.enable {
    services.ollama = {
      enable = true;
    };
  };
}
