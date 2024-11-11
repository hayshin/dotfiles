{
  programs.wlogout = {
    enable = true;
    # style = builtins.readFile ./style.css;
    layout = import ./layout.nix;
  };
}
