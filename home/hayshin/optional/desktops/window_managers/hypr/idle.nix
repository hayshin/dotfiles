{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "lock";
      };
      listener = [
        {
          timeout = 300;
          on-timeout = "lock";
        }
        {
          timeout = 600;
          on-timeout = "suspend";
        }
      ];
    };
  };
}
