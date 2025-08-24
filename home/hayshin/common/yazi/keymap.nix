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
  ];
}
