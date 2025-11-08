{
  NIXPKGS_ALLOW_UNFREE = 1;
  NIXOS_OZONE_WL = "1";
  NIX = "$HOME/nix";
  TERMINAL = "kitty";
  FILE_MANAGER = "yazi";
  EDITOR = "hx";
  MENU = "fuzzel";
  LOGOUT = "wlogout -b 4 -T 300 -B 300 -p layer-shell -s";
  BROWSER = "zen-beta";
  CLIPBOARD = "cliphist list | $MENU --dmenu | cliphist decode | wl-copy";
}
