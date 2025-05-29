{
  programs.zellij = {
    enable = true;
  };

  xdg.configFile."zellij/config.kdl".text = ''
    keybinds {
      normal {
        bind "Alt n" { NewPane; }
      }
    }
  '';
}
