{ pkgs, ... }:
pkgs.writeShellScriptBin "lock" ''
  ${pkgs.swaylock-effects}/bin/swaylock \
    --hide-keyboard-layout \
    --disable-caps-lock-text \
    --indicator-radius 100 \
    --indicator-thickness 10 \
    --font "JetBrains Mono"\
    --ring-color cba6f780 \
    --ring-ver-color 89b4fa80 \
    --ring-wrong-color f38ba880 \
    --ring-clear-color a6e3a180 \
    --key-hl-color 1e1e2e80 \
    --bs-hl-color eba0ac80 \
    --text-color ffffff \
    --text-caps-lock-color ffffff \
    --line-color 00000000 \
    --line-ver-color 00000000 \
    --line-wrong-color 00000000 \
    --line-clear-color 00000000 \
    --separator-color 00000000 \
    --inside-color 00000080 \
    --inside-ver-color 89b4fa80 \
    --inside-wrong-color f38ba880 \
    --inside-clear-color a6e3a180 \
    --clock \
    --indicator \
    --screenshots \
    --effect-blur 5x2
''
