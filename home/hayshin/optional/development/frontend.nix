{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    pnpm
    bun
    emmet-ls

    nodePackages.prettier
    biome
    typescript-language-server
    vscode-langservers-extracted
    svelte-language-server

    eas-cli
  ];
}
