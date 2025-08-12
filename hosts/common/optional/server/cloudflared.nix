{ pkgs, ... }:
{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "a57101b4-90c6-4ec8-a065-967552c12949" = {
        credentialsFile = "/home/hayshin/.cloudflared/a57101b4-90c6-4ec8-a065-967552c12949.json";
        default = "http_status:404";
        ingress = {
          "meeplix.hayshin.dev" = "http://127.0.0.1:3000";
        };
      };
    };
  };
}
