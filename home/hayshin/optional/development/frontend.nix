{ pkgs, ... }:
{
  home.packages = with pkgs; [
    yarn
    nodejs
    pnpm
    bun
    emmet-ls
    nodePackages.prettier
    typescript-language-server
    vscode-langservers-extracted
    svelte-language-server

    eas-cli
  ];
}
