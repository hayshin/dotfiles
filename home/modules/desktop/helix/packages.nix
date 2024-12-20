{ pkgs, ... }:
with pkgs;
[
  clang-tools
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
]
