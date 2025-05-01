{ pkgs, ... }:
{
  imports = [
    ./git.nix # version control system
    ./gh.nix # github
    ./editorconfig.nix
    ./lazysql.nix
    ./zellij.nix
    ./vscode.nix
  ];
  home.packages = with pkgs; [
    # cargo
    # rust-analyzer
    # rustfmt
    gcc
    clang-tools
    # jetbrains.idea-ultimate
    # jetbrains.pycharm-professional
    # linuxKernel.packages.linux_6_11.perf
    # maven
    # nil
    # nixfmt-rfc-style
    # nodejs
    # pnpm
    # emmet-ls
    # nodePackages.prettier
    # nodePackages.svelte-language-server
    # nodePackages.typescript
    # nodePackages.typescript-language-server
    # vscode
    # vscode-langservers-extracted
  ];
}
