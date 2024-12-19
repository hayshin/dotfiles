{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    kernelParams = [
      "quiet"
      "loglevel=3"
      "vt.global_cursor_default=0"
    ];
  };
}
