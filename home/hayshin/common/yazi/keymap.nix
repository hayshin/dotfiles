{
  mgr.prepend_keymap = [
    {
      on = [ "i" ];
      run = "arrow -1";
    }
    {
      on = [ "k" ];
      run = "arrow 1";
    }
    {
      on = [ "j" ];
      run = "leave";
    }
    {
      on = [ "s" ];
      run = "search --via=fd --args='-H -I'";
    }
    # plugins
    {
      on = [ "!" ];
      run = ''shell "$SHELL" --block'';
      desc = "Open shell here";
    }
    {
      on = [ "l" ];
      run = "plugin smart-enter";
      desc = "Enter the child directory or open the file";
    }
    {
      on = [ "F" ];
      run = "plugin smart-filter";
    }
    {
      on = [ "p" ];
      run = "plugin smart-paste";
      desc = "paste into the hovered directory or CWD";
    }
    {
      on = [ "M" ];
      run = "plugin mount";
    }
    {
      on = [ "+" ];
      run = "plugin zoom 1";
    }
    {
      on = [ "-" ];
      run = "plugin zoom -1";
    }

    {
      on = [
        "g"
        "d"
      ];
      run = "cd ~/downloads";
      desc = "Go to downloads";
    }
    {
      on = [
        "g"
        "z"
      ];
      run = "cd ~/dev";
      desc = "Go to dev";
    }
    {
      on = [
        "g"
        "e"
      ];
      run = "arrow bot";
      desc = "Go to bottom";
    }
  ];
}
