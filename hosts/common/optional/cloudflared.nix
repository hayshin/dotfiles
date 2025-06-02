{ pkgs, ... }:
{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "00000000-0000-0000-0000-000000000000" = {
        credentialsFile = "/home/hayshin/.cloudflared/cert.pem";
        default = "http_status:404";
      };
    };
  };
}
