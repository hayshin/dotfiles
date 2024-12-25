# { pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    # extraPackages = import ./packages.nix { pkgs = pkgs; };
    languages = import ./languages.nix;

    settings = {
      editor = import ./editor.nix;
      keys = import ./keys/keys.nix;
    };
  };
}
