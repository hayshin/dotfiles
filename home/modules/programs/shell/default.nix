{ pkgs, lib, config, ... }:
let
  cfg = config.modules.programs.shell;
in
{
  imports = [
    ./devenv.nix
    ./zsh.nix
    ./ssh.nix
    ./nushell
  ];

  options.modules.programs.shell = {
    enable = lib.mkEnableOption "Shell environment";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      fastfetch
      tree
      dust
      tt
    ];
    programs = {
      bat.enable = true;
      fzf.enable = true;
      pay-respects.enable = true;
      zoxide.enable = true;
      starship.enable = true;
      fd.enable = true;
      ripgrep.enable = true;
      ripgrep-all.enable = true;
    };
  };
}
