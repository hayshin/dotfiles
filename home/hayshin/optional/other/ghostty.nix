{
  programs.ghostty = {
    enable = true;
    settings = {

      # to start with yazelix, creating a new session or attaching if a session called yazelix already exists
      # command = "nu -c 'zellij --config-dir ~/.config/yazelix/zellij attach --create yazelix_ghostty options --default-layout yazelix'";

      # Alternative: Pick a Layout
      # command = "nu -c 'zellij -l welcome --config-dir ~/.config/yazelix/zellij options --layout-dir ~/.config/yazelix/zellij/layouts'"

      # theme = "Abernathy";
      window-decoration = "none";
      window-padding-y = "10,0";
    };
  };
}
