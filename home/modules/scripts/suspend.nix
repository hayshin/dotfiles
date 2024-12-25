{ pkgs, ... }:
pkgs.writeShellScriptBin "suspend" ''
   systemctl suspend ; lock
''
