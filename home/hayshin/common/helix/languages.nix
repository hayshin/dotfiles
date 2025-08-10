{
  language = [
    {
      name = "nix";
      auto-format = true;
      formatter = {
        command = "nixfmt";
      };
    }
    {
      name = "python";
      auto-format = true;
      formatter = {
        command = "ruff";
      };
      language-servers = [
        "pyright"
        "basedpyright"
      ];
    }
    {
      name = "javascript";
      auto-format = true;
      language-servers = [
        "biome"
        "typescript-language-servers"
      ];
    }
    {
      name = "typescript";
      auto-format = true;
      language-servers = [
        "biome"
        "typescript-language-servers"
      ];
    }
    {
      name = "tsx";
      auto-format = true;
      language-servers = [
        "biome"
        "typescript-language-servers"
      ];
    }
    {
      name = "json";
      auto-format = true;
      language-servers = [
        "biome"
        "typescript-language-servers"
      ];
    }
    {
      name = "jsonc";
      auto-format = true;
      language-servers = [
        "biome"
        "typescript-language-servers"
      ];
    }
    {
      name = "css";
      auto-format = true;
      language-servers = [
        "biome"
        "typescript-language-servers"
      ];
    }
    {
      name = "svelte";
      auto-format = true;
      language-servers = [
        "typescript-language-servers"
      ];
    }
  ];
  language-server = {
    # ruff-lsp = {
    #   name = "ruff-lsp";
    #   command = "ruff-lsp";
    # basedpyright = {
    #   command = "uv";
    #   args = [
    #     "run"
    #     "basedpyright-langserver"
    #     "--stdio"
    #   ];
    # };
    clangd = {
      command = "clangd";
      args = [
        "--query-driver=clang++"
      ];
    };
    biome = {
      command = "biome";
      args = [
        "lsp-proxy"
      ];
    };
  };
}
