{
  nix = {
    extraOptions = ''
      trusted-users = root hayshin
    '';
    # extra-substituters = https://devenv.cachix.org
    # extra-trusted-publick-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
