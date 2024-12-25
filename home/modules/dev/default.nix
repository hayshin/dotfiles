{ pkgs, ... }:
{
  imports = [
    ./direnv.nix
    ./git.nix # version control system
    ./editorconfig.nix
  ];
  home.packages = with pkgs; [
    devenv
    # cargo
    # rust-analyzer
    # rustfmt
    # gcc
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
