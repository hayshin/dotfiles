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
      identitiesOnly = true;
      identityFile = "~/.ssh/github";
    };
    matchBlocks."gitlab" = {
      addKeysToAgent = "yes";
      forwardAgent = true;
      hostname = "git.chocodev.kz";
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
