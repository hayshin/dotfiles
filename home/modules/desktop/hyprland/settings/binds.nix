{ config, ... }:
let
  swayosd = "swayosd-client";
  run = "hyprrun";
  # workspace = "vdesk";
  workspace = "split:workspace";
  # movetoworkspace = "movetodesk";
  movetoworkspace = "split:movetoworkspace";

  browser = config.modules.programs.browsers.defaultBrowserConfig;
in
{

  # bindr = [
  #   "$mod,Super_L, exec, pkill -SIGUSR1 waybar"
  # ];

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
    # "$mod, Control_L, movewindow"
    "$mod, mouse:273, resizewindow"
    # "$mod, ALT_L, resizewindow"
  ];

  bind =
    let
      picturesDir = config.xdg.userDirs.pictures;
      screenshotsDir = picturesDir + "/screenshots";
    in
    [
      "$mod ALT, R, submap, resize"
      "$mod, PRINT, exec, hyprpicker -a"
      ", PRINT, exec, hyprshot -m region -o ${screenshotsDir}/screenshots"
      "SHIFT, PRINT, exec, hyprshot -m output -o ${screenshotsDir}"

      "$mod SHIFT, P, exec, hyprpicker -a"
      "$mod, P, exec, hyprshot -m region -o ${screenshotsDir}"
      "$mod ALT, P, exec, hyprshot -m output -o ${screenshotsDir}"
      # "$mod, O, exec, pin, toggle"

      "$mod, minus, exec, hyprctl keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2 - 1}')"
      "$mod, equal, exec, hyprctl keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2 + 1}')"
      "$mod, 0, exec, hyprctl keyword cursor:zoom_factor 1.0"

      "$mod, backslash, exec, ${swayosd} --output-volume mute-toggle"

      ", XF86AudioMute, exec, ${swayosd} --output-volume mute-toggle"
      ", XF86AudioMicMute, exec, ${swayosd} --input-volume mute-toggle"

      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPause, exec, playerctl pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
      # ", XF86Calculator, exec, qalculate-gtk"
      ", XF86Lock, exec, $lock"

      "$mod, SPACE, exec, $MENU"
      "$mod, escape, exec, $LOGOUT"
      "$mod, V, exec, $CLIPBOARD"

      "$mod, RETURN, exec, ${run} -e '$TERMINAL -e zellij a zellij' -t zellij"
      "$mod SHIFT, RETURN, exec, $TERMINAL -e zellij"

      "$mod, B, exec, ${run} -e ${browser.cmd} -c ${browser.class}"
      "$mod SHIFT, B, exec, ${browser.cmd}"

      "$mod, D, exec, ${run} -e Telegram -c telegram"
      "$mod SHIFT, D, exec, Telegram"

      "$mod, X, exec, ${run} -e 'cursor' -c cursor"
      "$mod SHIFT, X, exec, cursor"
      # "$mod, M, exec, $music"

      "$mod, E, exec, ${run} -e '$TERMINAL -e yazi' -t yazi"
      "$mod SHIFT, E, exec, $TERMINAL -e yazi"

      ", Pause, exec, playerctl play-pause"
      "$mod, slash, exec, playerctl play-pause"
      "$mod, period, exec, playerctl next"
      "$mod, comma, exec, playerctl previous"

      "$mod, Q, killactive,"
      "$mod, F, fullscreen, 1"
      "$mod SHIFT, F, fullscreen, 0"
      "$mod SHIFT, H, togglesplit, "
      "$mod, H, togglefloating, "

      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      "$mod&SHIFT, left, movewindow, l"
      "$mod&SHIFT, right,movewindow, r"
      "$mod&SHIFT, up, movewindow, u"
      "$mod&SHIFT, down, movewindow, d"

      "$mod, J, movefocus, l"
      "$mod, L, movefocus, r"
      "$mod, I, movefocus, u"
      "$mod, K, movefocus, d"

      "$mod SHIFT, J, movewindow, l"
      "$mod SHIFT, L, movewindow, r"
      "$mod SHIFT, I, movewindow, u"
      "$mod SHIFT, K, movewindow, d"

      "$mod, O, ${workspace}, r+1"
      "$mod, U, ${workspace}, r-1"
      "$mod SHIFT, O, ${movetoworkspace}, r+1"
      "$mod SHIFT, U, ${movetoworkspace}, r-1"

      # "$mod, S, togglespecialworkspace, magic"
      # "$mod SHIFT, S, movetoworkspace, special:magic"

      "$mod, mouse_down, ${workspace}, e+1"
      "$mod, mouse_up, ${workspace}, e-1"
      "$mod, tab, ${workspace}, m+1"
      "$mod SHIFT, tab, ${workspace}, m-1"

      "$mod, M, split:swapactiveworkspaces"
      "$mod SHIFT, M, split:grabroguewindows"
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
            "$mod, code:1${toString i}, ${workspace}, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, ${movetoworkspace}, ${toString ws}"
          ]
        ) 9
      )
    );
}
