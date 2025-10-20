{ pkgs, ... }:
{
  imports = [
    ./cloud.nix
    ./editors.nix
    ./frontend.nix
    ./git.nix
  ];
  home.packages = with pkgs; [
    # python
    uv
    python313

    # rust
    cargo
    rust-analyzer
    rustfmt

    # go
    go
    gopls

    # c++
    gcc
    clang-tools

    # nix
    nil
    nixfmt-rfc-style

    # java
    # (jdk.override { enableJavaFX = true; })
    # jdk11
    # openjfx17
    jdk8
    maven

    # databases
    sqlite
    postgresql

    lazysql
  ];

}
