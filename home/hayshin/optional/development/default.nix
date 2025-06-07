{ pkgs, ... }:
{
  imports = [
    ./git.nix # version control system
    ./gh.nix # github
    ./cursor.nix
    ./editorconfig.nix
    ./lazysql.nix
    ./zellij.nix
    ./vscode.nix
    ./rust.nix
    ./frontend.nix
    ./warp-terminal.nix
    ./database.nix
    ./python.nix
  ];
  home.packages = with pkgs; [
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
    # vscode
  ];
}
