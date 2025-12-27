{ rootPath, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = import (rootPath + /shared/aliases.nix) { nix_dir = "$NIX"; };

    # history.size = 10000;
    # history.path = "~/zsh/history";

    # oh-my-zsh = {
    #   enable = true;
    #   plugins = [
    #     "git"
    #     "sudo"
    #   ];
    #   theme = "agnoster"; # blinks is also really nice
    # };
  };

  home.shell.enableZshIntegration = true;
}
