{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    keymap = import ./keymap.nix;
  };
}
