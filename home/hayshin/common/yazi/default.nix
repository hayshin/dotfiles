{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    keymap = import ./keymap.nix;
    settings = {
      tasks = {
        image_bound = [
          10000
          10000
        ];
      };
    };
  };
}
