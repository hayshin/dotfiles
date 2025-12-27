{ lib, ... }:
{
  "hayshin@matte" = lib.mkHome {
    username = "hayshin";
    hostname = "matte";
  };
  "hayshin@wujie" = lib.mkHome {
    username = "hayshin";
    hostname = "wujie";
  };
  "hayshin@nanus" = lib.mkHome {
    username = "hayshin";
    hostname = "nanus";
  };
  "server" = lib.mkHome {
    username = "server";
  };
}
