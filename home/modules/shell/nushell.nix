{
  programs.nushell = {
    enable = true;
    # shellAliases = import ./shell_aliases.nix {};
    shellAliases = import ./shell_aliases.nix {nix_dir = "$env.NIX";};
#     extraConfig = "
# $env.config = {
#   show_banner: false,
#   hooks: {
#     pre_prompt: [{ ||
#       if (which direnv | is-empty) {
#         return
#       }

#       direnv export json | from json | default {} | load-env
#       if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
#         $env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
#       }
#     }]
#   }
# } ";
  };
}
