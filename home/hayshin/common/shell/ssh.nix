{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    forwardAgent = true;
    # extraConfig = ''
    #   IdentityFile ~/.ssh/github
    #   AddKeysToAgent yes
    # '';
    matchBlocks."github" = {
      hostname = "github.com";
      user = "git";
      identityFile = "~/.ssh/github";
      # extraOptions = {
      #   IdentityFile = "~/.ssh/github";
      #   AddKeysToAgent = "yes";
      # };
    };
  };
}
