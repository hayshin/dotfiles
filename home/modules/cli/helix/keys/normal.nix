{
  C-s = ":w";
  "C-/" = "toggle_comments";
  C-q = ":q";

  k = "move_visual_line_down";
  K = "extend_line_down";
  C-k = "select_next_sibling";

  i = "move_visual_line_up";
  I = "extend_line_up";
  C-i = "select_prev_sibling";

  j = "move_char_left";
  J = "extend_char_left";
  C-j = "extend_to_line_start";

  h = "insert_mode";
  H = "insert_at_line_start";

  l = "move_char_right";
  L = "extend_char_right";
  C-l = "extend_to_line_end";

  w = "move_prev_word_start";
  W = "extend_prev_long_word_start";

  E = "extend_next_word_end";
  b = "move_next_word_start";
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
