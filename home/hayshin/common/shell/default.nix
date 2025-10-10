{ pkgs, ... }:
{
  imports = [
    ./devenv.nix
    ./zsh.nix
    ./ssh.nix
    ./nushell
  ];
  home.packages = with pkgs; [
    fastfetch
    tree
    # Add your packages here
  ];
  programs = {
    bat = {
      enable = true;
    };
    fzf = {
      enable = true;
    };
    pay-respects = {
      enable = true;
      # enableNushellIntegration = true;
      # enableZshIntegration = true;
    };
    zoxide = {
      enable = true;
    };
    starship = {
      enable = true;
    };
    fd = {
      enable = true;
    };
    ripgrep = {
      enable = true;
    };
    ripgrep-all = {
      enable = true;
    };
  };
}
