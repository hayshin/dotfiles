{ lib, config, ... }:
let
  cfg = config.modules.programs.terminals;
in
{
  options.modules.programs.terminals = {
    enable = lib.mkEnableOption "terminals";
  };

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      settings = {
        allow_remote_control = true;
        window_padding_width = 4;
        confirm_os_window_close = 0;
        update_check_interval = 0;
      };
      keybindings = {
        "ctrl+y" = "launch --stdin-source=@last_cmd_output --type=clipboard";
        "ctrl+c" = "copy_or_interrupt";
        "ctrl+v" = "paste_from_clipboard";

        "ctrl+i" = "scroll_line_up";
        "ctrl+up" = "scroll_line_up";

        "ctrl+k" = "scroll_line_down";
        "ctrl+down" = "scroll_line_down";

        "ctrl+home" = "scroll_home";
        "ctrl+end" = "scroll_end";

        "ctrl+page_up" = "scroll_page_up";
        "ctrl+page_down" = "scroll_page_down";
      };
    };
    programs.ghostty = {
      enable = true;
      settings = {
        window-decoration = "none";
        window-padding-y = "10,0";
      };
    };
  };
}

