{ pkgs, lib, config, ... }:
let
  cfg = config.modules.programs.development.frontend;
in
{
  options.modules.programs.development.frontend = {
    enable = lib.mkEnableOption "Frontend development";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nodejs
      pnpm
      bun
      deno
      emmet-ls

      nodePackages.prettier
      biome
      typescript-language-server
      vscode-langservers-extracted
      svelte-language-server

      eas-cli

      insomnia
      postman
    ];
  };
}
