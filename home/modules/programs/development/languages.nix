{ pkgs, lib, config, ... }:
let
  cfg = config.modules.programs.development.languages;
in
{
  options.modules.programs.development.languages = {
    python.enable = lib.mkEnableOption "Python development";
    rust.enable = lib.mkEnableOption "Rust development";
    go.enable = lib.mkEnableOption "Go development";
    cpp.enable = lib.mkEnableOption "C++ development";
    nix.enable = lib.mkEnableOption "Nix development";
    java.enable = lib.mkEnableOption "Java development";
    databases.enable = lib.mkEnableOption "Database tools";
  };

  config = {
    home.packages = lib.flatten [
      (lib.optionals cfg.python.enable (with pkgs; [
        uv
        python313
      ]))
      (lib.optionals cfg.rust.enable (with pkgs; [
        cargo
        rust-analyzer
        rustfmt
      ]))
      (lib.optionals cfg.go.enable (with pkgs; [
        go
        gopls
      ]))
      (lib.optionals cfg.cpp.enable (with pkgs; [
        gcc
        clang-tools
      ]))
      (lib.optionals cfg.nix.enable (with pkgs; [
        nil
        nixfmt-rfc-style
      ]))
      (lib.optionals cfg.java.enable (with pkgs; [
        jdk8
        maven
      ]))
      (lib.optionals cfg.databases.enable (with pkgs; [
        sqlite
        postgresql
        mongosh
        mongodb-compass
        mariadb.client
        lazysql
      ]))
    ];
  };
}
