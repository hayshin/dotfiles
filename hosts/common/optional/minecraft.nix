{ pkgs, inputs, ... }:
{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
  services.minecraft-servers = {
    enable = true;
    eula = true;
    servers.ussrsdu = {
      enable = true;
      openFirewall = true;
      serverProperties = {
        online-mode = false;
      };
      package = pkgs.fabricServers.fabric-1_21_4;
      jvmOpts = "-Xms 4096 -Xmx 6144";
    };
  };
}
