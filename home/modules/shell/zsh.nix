{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake $NIX";
      update = "sudo nix flake update $NIX";
      upgrade = "sudo nixos-rebuild switch --upgrade --flake $NIX";
      home-rebuild = "home-manager switch --flake $NIX";
    };

    history.size = 10000;
    history.path = "~/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
      theme = "agnoster"; # blinks is also really nice
    };
  };
}
