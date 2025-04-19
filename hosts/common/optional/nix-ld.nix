# program to able to run python and other binaries from package managers
{ options, ... }:
{
  programs.nix-ld = {
    enable = true;
    libraries = options.programs.nix-ld.libraries.default;
  };
}
