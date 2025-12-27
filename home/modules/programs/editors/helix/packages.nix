{ pkgs, ... }:
with pkgs;
[
  nixd
  nixfmt-rfc-style
  bash-language-server

  clang-tools
  rust-analyzer

  buf
  vscode-langservers-extracted
  typescript-language-server
  svelte-language-server
  nodePackages.prettier
  emmet-ls

  taplo
  marksman
  yaml-language-server

  # docker-langserver
  docker-compose-language-service
  kdlfmt
  # ruff
  # ruff-lsp
  # pyright

  # clang-tools
  # rustfmt
  # cargo
]
