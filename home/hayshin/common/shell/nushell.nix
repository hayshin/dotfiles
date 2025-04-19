{
  programs.nushell = {
    enable = true;
    # shellAliases = import ./shell_aliases.nix {};
    shellAliases = import ./shell_aliases.nix { nix_dir = "$env.NIX"; };
    extraConfig = "
$env.config = {
  show_banner: false
} ";
  };
}
