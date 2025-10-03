{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    # extraConfig = ''
    #   IdentityFile ~/.ssh/github
    #   AddKeysToAgent yes
    # '';
    matchBlocks."github" = {
      addKeysToAgent = "yes";
      forwardAgent = true;
      hostname = "github.com";
      user = "git";
      identityFile = "~/.ssh/github";
    };
  };
}
