let
  concat = dir: name: dir + "/${name}";
in
{
  imports = [
    ./hardware/nanus.nix
    ./common/core
    ./common/users
    ./common/optional/server
    ./common/optional/docker.nix
  ];

  networking = {
    hostName = "nanus";
    networkmanager.enable = true;
  };

  environment = {
    # sessionVariables = import ../variables.nix;
  };

  system.stateVersion = "24.11";
}
