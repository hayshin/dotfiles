{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nil
      nixfmt-rfc-style
      rust-analyzer
      rustfmt
      cargo
    ];
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
          };
        }
      ];
    };
    settings = {
      theme = "base16_default";
      editor = import ./editor.nix;
      keys = import ./keys.nix;
    };
  };
}
