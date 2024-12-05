{ config, ... }:
let
  swayosd = "swayosd-client";
in
{

  bindr = [
    "$mod,Super_L, exec, pkill -SIGUSR1 waybar"
  ];

  bindl = [ " , switch:Lid Switch, exec, lock" ];

  binde = [
    "$mod, apostrophe, exec, ${swayosd} --brightness raise"
    "$mod, semicolon, exec, ${swayosd} --brightness lower"

    "$mod, bracketright, exec, ${swayosd} --output-volume raise"
    "$mod, bracketleft, exec, ${swayosd} --output-volume lower"

    ", XF86MonBrightnessUp, exec, ${swayosd} --brightness raise"
    ", XF86MonBrightnessDown, exec, ${swayosd} --brightness lower"

    ", XF86AudioRaiseVolume, exec, ${swayosd} --output-volume raise"
    ", XF86AudioLowerVolume, exec, ${swayosd} --output-volume lower"
  ];

  bindm = [
    "$mod, mouse:272, movewindow"
    "$mod, Control_L, movewindow"
    "$mod, mouse:273, resizewindow"
    "$mod, ALT_L, resizewindow"
  ];

  bind =
    let
      picturesDir = config.xdg.userDirs.pictures;
      screenshotsDir = picturesDir + "/screenshots";
    in
    [
      "$mod, PRINT, exec, hyprpicker -a"
      ", PRINT, exec, hyprshot -m region -o ${screenshotsDir}/screenshots"
      "SHIFT, PRINT, exec, hyprshot -m output -o ${screenshotsDir}"

      "$mod SHIFT, P, exec, hyprpicker -a"
      "$mod, P, exec, hyprshot -m region -o ${screenshotsDir}"

      "$mod, backslash, exec, ${swayosd} --output-volume mute-toggle"

      ", XF86AudioMute, exec, ${swayosd} --output-volume mute-toggle"
      ", XF86AudioMicMute, exec, ${swayosd} --input-volume mute-toggle"

      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPause, exec, playerctl pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
      # ", XF86Calculator, exec, qalculate-gtk"
      ", XF86Lock, exec, $lock"

      "$mod, RETURN, exec, $TERMINAL"
      "$mod SHIFT, RETURN, exec, $float_terminal"
      "$mod, SPACE, exec, $MENU"
      "$mod, B, exec, $BROWSER"
      "$mod, X, exec, $TERMINAL -e $EDITOR"
      # "$mod, M, exec, $music"
      "$mod, escape, exec, $LOGOUT"
      "$mod, E, exec, $TERMINAL -e $FILE_MANAGER"
      "$mod, V, exec, $CLIPBOARD"

      ", Pause, exec, playerctl play-pause"
      "$mod, slash, exec, playerctl play-pause"
      "$mod, period, exec, playerctl next"
      "$mod, comma, exec, playerctl previous"

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
