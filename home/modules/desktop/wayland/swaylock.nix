{ pkgs, config, ... }:
with config.lib.stylix.colors;
pkgs.writeShellApplication {
  name = "lock";

  runtimeInputs = [
    pkgs.swaylock-effects
  ];

  text = ''
      #!/bin/bash
    ${pkgs.swaylock-effects}/bin/swaylock \
      --hide-keyboard-layout \
      --disable-caps-lock-text \
      --indicator-radius 100 \
      --indicator-thickness 10 \
      --font "JetBrains Mono"\
      --ring-color ${base00} \
      --ring-ver-color ${base02} \
      --ring-wrong-color ${base08} \
      --ring-clear-color ${base01} \
      --key-hl-color ${base05} \
      --bs-hl-color ${base04} \
      --text-color  ${base05} \
      --text-caps-lock-color  ${base05} \
      --line-color 00000000 \
      --line-ver-color 00000000 \
      --line-wrong-color 00000000 \
      --line-clear-color 00000000 \
      --separator-color 00000000 \
      --inside-color ${base00} \
      --inside-ver-color ${base02} \
      --inside-wrong-color ${base08} \
      --inside-clear-color ${base01} \
      --clock \
      --indicator \
      --screenshots \
      --effect-blur 5x2
  '';
}
