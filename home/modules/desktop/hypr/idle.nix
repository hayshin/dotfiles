{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "lock";
      };
      listener = [
        {
          timeout = 900;
          on-timeout = "lock";
        }
      ];
    };
  };
}
