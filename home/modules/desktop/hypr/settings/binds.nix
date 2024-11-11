{

  bindr = [
    "$mod,Super_L, exec, pkill -SIGUSR1 waybar"
  ];

  bindl = [ " , switch:[switch name], exec, hyprlock" ];

  binde = [
    "$mod, semicolon, exec, brightnessctl -q s 5%-"
    "$mod, apostrophe, exec, brightnessctl -q s 5%+"

    "$mod, bracketleft, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
    "$mod, bracketright, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"

    ", XF86MonBrightnessUp, exec, brightnessctl -q s 5%+"
    ", XF86MonBrightnessDown, exec, brightnessctl -q s 5%-"

    ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
    ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
  ];

  bindm = [
    "$mod, mouse:272, movewindow"
    "$mod, Control_L, movewindow"
    "$mod, mouse:273, resizewindow"
    "$mod, ALT_L, resizewindow"
  ];

  bind =
    [
      "$mod, RETURN, exec, $TERMINAL"
      "$mod SHIFT, RETURN, exec, $float_terminal"
      "$mod, SPACE, exec, $MENU"
      "$mod, B, exec, $BROWSER"
      "$mod, X, exec, $EDITOR"
      # "$mod, M, exec, $music"
      "$mod, escape, exec, $LOGOUT"
      "$mod, E, exec, $FILE_MANAGER"
      "$mod, V, exec, $CLIPBOARD"

      ", Pause, exec, playerctl play-pause"
      "$mod, slash, exec, playerctl play-pause"
      "$mod, period, exec, playerctl next"
      "$mod, comma, exec, playerctl previous"

      "$mod, PRINT, exec, hyprpicker -a"
      ", PRINT, exec, hyprshot -m region"
      "SHIFT, PRINT, exec, hyprshot -m output"

      "$mod, P, exec, hyprshot -m region"
      "$mod SHIFT, P, exec, hyprpicker -a"

      "$mod, backslash, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"

      ", XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPause, exec, playerctl pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"
      # ", XF86Calculator, exec, qalculate-gtk"
      ", XF86Lock, exec, $lock"

      "$mod, Q, killactive,"
      "$mod, F, fullscreen,"
      "$mod, U, pseudo,"
      "$mod SHIFT, T, togglesplit,"
      "$mod, T, togglefloating,"

      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      "$mod, J, movefocus, l"
      "$mod, L, movefocus, r"
      "$mod, I, movefocus, u"
      "$mod, K, movefocus, d"

      "$mod, S, togglespecialworkspace, magic"
      "$mod SHIFT, S, movetoworkspace, special:magic"

      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"
      "ALT, tab, workspace, m+1"
      "ALT SHIFT, tab, workspace, m-1"
      "$mod, tab, workspace, m+1"
      "$mod SHIFT, tab, workspace, m-1"
    ]
    ++ (
      # workspaces
      # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
      builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = i + 1;
          in
          [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        ) 9
      )
    );
}
