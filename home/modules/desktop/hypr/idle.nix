{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "loginctl lock-session";
      };
      listener = [
        {
          timeout = 900;
          on-timeout = "loginctl lock-session";
        }
      ];
    };
  };
}
