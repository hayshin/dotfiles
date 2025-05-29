{ pkgs, config, ... }:
pkgs.writeShellScriptBin "lock" ''
  ${pkgs.swaylock-effects}/bin/swaylock \
''
