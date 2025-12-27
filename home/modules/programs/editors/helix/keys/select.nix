{
  C-s = ":w";
  "C-/" = "toggle_comments";
  C-q = ":q";
  C-c = "normal_mode";

  k = "extend_line_down";
  K = "no_op";
  A-k = "shrink_selection";

  i = "extend_line_up";
  I = "no_op";
  A-i = "expand_selection";

  j = "extend_char_left";
  J = "goto_line_start";
  A-j = "select_prev_sibling";

  h = "insert_mode";
  H = "insert_at_line_start";

  l = "extend_char_right";
  L = "goto_line_end";
  A-l = "select_next_sibling";

  w = "extend_prev_word_start";
  W = "extend_prev_long_word_start";

  b = "extend_next_word_start";
  B = "extend_next_long_word_start";
  # goto mode
  g = {
    j = "goto_line_start";
    h = "no_op";
    i = "move_line_up";
    k = "move_line_down";
  };

  # window mode
  C-w = {
    j = "jump_view_left";
    C-j = "jump_view_left";
    J = "swap_view_left";

    i = "jump_view_up";
    C-i = "jump_view_up";
    I = "swap_view_up";

    k = "jump_view_down";
    C-k = "jump_view_down";
    K = "swap_view_down";

    h = "no_op";
    C-h = "no_op";
    H = "no_op";
  };

  # view mode
  z = {
    i = "scroll_up";
    k = "scroll_down";
    j = "no_op";
    I = "page_cursor_half_up";
    K = "page_cursor_half_down";
  };
  Z = {
    i = "scroll_up";
    k = "scroll_down";
    j = "no_op";
    I = "page_cursor_half_up";
    K = "page_cursor_half_down";
  };
}
