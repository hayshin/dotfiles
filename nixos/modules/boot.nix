{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        # edk2-uefi-shell.enable = true;
        # "11" = {
        #   title = "Windows 11";
        #   efiDeviceHandle = "";
        # }
      };
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
