{ nix_dir }:
{
  gc = "git commit -m ";
  rebuild = "sudo nixos-rebuild switch --flake ${nix_dir}";
  update = "nix flake update --flake ${nix_dir}";
  upgrade = "sudo nixos-rebuild switch --upgrade --flake ${nix_dir}";
  home-rebuild = "home-manager -b backup switch --flake ${nix_dir}";
  poweroff = "systemctl poweroff";
  reboot = "systemctl reboot";
  cd = "z";
  cat = "bat";
}
