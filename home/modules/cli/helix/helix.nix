{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nil
      nixfmt-rfc-style
      rust-analyzer
      rustfmt
      cargo
      nodePackages.svelte-language-server
      nodePackages.typescript-language-server
      vscode-langservers-extracted
      nodePackages.prettier
      nodePackages.typescript
      emmet-ls
    ];
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
          };
        }
        # {
        # name = "java";
        # roots = [
        #   "pom.xml"
        #   "build.gradle"
        # ];
        # language-servers = {
        #   command = "jdtls";
        # };
        # }
      ];

    };
    settings = {
      # theme = "base16_default";
      editor = import ./editor.nix;
      keys = import ./keys.nix;
    };
  };
}
