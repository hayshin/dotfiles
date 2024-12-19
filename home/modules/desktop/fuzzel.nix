{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "kitty -e";
        # font = "JetBrains Mono:size=12";
        icons-enabled = false;
        fuzzy = true;
      };
      # colors = {
      # background = "444444dd";
      # text = "ffffffff";
      # };
    };
  };
}
