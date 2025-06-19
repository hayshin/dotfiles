{ pkgs, ... }:
let
  gdk = pkgs.google-cloud-sdk.withExtraComponents (
    with pkgs.google-cloud-sdk.components;
    [
      gke-gcloud-auth-plugin
    ]
  );
in
{
  home.packages = [
    gdk
    pkgs.firebase-tools
    pkgs.supabase-cli
  ];
}
