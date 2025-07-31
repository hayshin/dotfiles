{ pkgs, ... }:
{
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
  ];
}
