{ pkgs, ... }:
{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "00000000-0000-0000-0000-000000000000" = {
        credentialsFile = "/home/hayshin/.cloudflared/e27bd15c-a906-407f-a2d2-6aa5dd5b8079.json";
        default = "http_status:404";
      };
    };
  };
}
