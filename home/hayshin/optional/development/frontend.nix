{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    pnpm
    bun
    emmet-ls
    nodePackages.prettier
    typescript-language-server
    vscode-langservers-extracted
    svelte-language-server
  ];
}
