{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases =
      let
        flakeDir = "~/nix";
      in
      {
        rebuild = "sudo nixos-rebuild switch --flake ${flakeDir}";
        update = "sudo nix flake update ${flakeDir}";
        upgrade = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
        home-rebuild = "home-manager switch --flake ${flakeDir}";
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
