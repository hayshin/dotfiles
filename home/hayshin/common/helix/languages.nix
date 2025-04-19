{
  language = [
    {
      name = "nix";
      auto-format = true;
      formatter = {
        command = "nixfmt";
      };
    }
    # {
    #   name = "python";
    #   auto-format = true;
    #   formatter = {
    #     command = "ruff";
    #   };
    # }
  ];
  language-server = {
    ruff-lsp = {
      name = "ruff-lsp";
      command = "ruff-lsp";
    };
    clangd = {
      # name = "ruff-lsp";
      command = "clangd";
      args = [
        "--query-driver=clang++"
      ];
    };
  };
}
