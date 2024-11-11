{
  line-number = "relative";
  completion-timeout = 5;
  statusline = {
    mode.normal = "NORMAL";
    mode.insert = "INSERT";
    mode.select = "SELECT";
  };
  lsp = {
    display-messages = true;
    display-inlay-hints = true;
  };
  file-picker = {
    hidden = false; # false - enable hidden
    git-ignore = true; # true - hid git-ignore
  };
  auto-save = true;
  soft-wrap = {
    enable = true;
  };
}
