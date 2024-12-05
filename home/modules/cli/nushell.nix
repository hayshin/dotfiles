{
  programs.nushell = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake $env.NIX";
      update = "sudo nix flake update $env.NIX";
      upgrade = "sudo nixos-rebuild switch --upgrade --flake $env.NIX";
      home-rebuild = "home-manager switch --flake $env.NIX";
    };
    extraConfig = "
$env.config.hooks.env_change.PWD = (
  { ||
    if (which direnv | is-empty) {
        return
    }

    direnv export json | from json | default {} | load-env
  }     
)
 ";
  };
}
