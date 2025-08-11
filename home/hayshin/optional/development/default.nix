{ pkgs, ... }:
{
  imports = [
    ./cloud.nix
    ./editors.nix
    ./frontend.nix
    ./git.nix
    ./zellij.nix
  ];
  home.packages = with pkgs; [
    # python
    uv
    python313

    # rust
    cargo
    rust-analyzer
    rustfmt

    # c++
    gcc
    clang-tools

    # nix
    nil
    nixfmt-rfc-style

    # databases
    sqlite
    postgresql

    lazysql
  ];

}
