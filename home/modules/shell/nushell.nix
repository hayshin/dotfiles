{
  programs.nushell = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake $env.NIX";
      update = "sudo nix flake update $env.NIX";
      upgrade = "sudo nixos-rebuild switch --upgrade --flake $env.NIX";
      home-rebuild = "home-manager switch --flake $env.NIX";
      cd = "z";
    };
    extraConfig = "
$env.config = {
  show_banner: false,
  hooks: {
    pre_prompt: [{ ||
      if (which direnv | is-empty) {
        return
      }

      direnv export json | from json | default {} | load-env
      if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
        $env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
      }
    }]
  }
} ";
  };
}
