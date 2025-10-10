{ rootPath, ... }:
{
  environment.shellAliases = import (rootPath + /shared/aliases.nix) { nix_dir = "$NIX"; };
}
