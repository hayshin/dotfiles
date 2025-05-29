{ pkgs, lib, ... }:
{
  hardware = {
    asus.battery = {
      chargeUpto = 80;
      enableChargeUptoScript = true;
    };
    nvidia = {
      open = true;
      powerManagement = {
        enable = true;
        finegrained = true;
      };
      modesetting.enable = true;
      prime = {
        sync.enable = false;
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };
  };
  services.asusd = {
    enable = true;
    enableUserService = true;
  };
  services.supergfxd = {
    enable = true;
    # this shit doesn't work properly and resets
    settings = {
      mode = "Integrated";
      always_reboot = true;
    };
  };

  environment.etc."supergfxd.conf".text = lib.mkForce ''
    {
      "mode": "Integrated",
      "vfio_enable": false,
      "vfio_save": false,
      "always_reboot": false,
      "no_logind": false,
      "logout_timeout_s": 180,
      "hotplug_type": "None"
    }
  '';
}
