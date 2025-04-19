{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "lock";
      };
      listener = [
        {
          timeout = 600;
          on-timeout = "lock";
        }
      ];
    };
  };
}
