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
      language-servers = [ "basedpyright" ];
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
  };
}
