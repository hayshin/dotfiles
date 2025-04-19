{
  programs.kitty = {
    enable = true;
    settings = {
      window_padding_width = 4;
      confirm_os_window_close = 0;
      clear_all_shortcuts = "yes";
      update_check_interval = 0;
    };
    keybindings = {
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
}
