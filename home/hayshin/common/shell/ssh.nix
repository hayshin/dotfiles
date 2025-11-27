{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    # extraConfig = ''
    #   IdentityFile ~/.ssh/github
    #   AddKeysToAgent yes
    # '';
    matchBlocks."github.com" = {
      addKeysToAgent = "yes";
      forwardAgent = true;
      user = "git";
      identitiesOnly = true;
      identityFile = "~/.ssh/github";
    };
    matchBlocks."git.chocodev.kz" = {
      addKeysToAgent = "yes";
      forwardAgent = true;
      user = "git";
      identitiesOnly = true;
      identityFile = "~/.ssh/gitlab";
    };
  };
  services.ssh-agent = {
    enable = true;
    # enableNushellntegration = true;
  };
}
