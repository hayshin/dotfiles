$env.config.show_banner = false

# alias rebuild = sudo nixos-rebuild switch --flake $env.NIX;
# alias update = nix flake update --flake $env.NIX;
# alias upgrade = sudo nixos-rebuild switch --upgrade --flake $env.NIX;
# alias home-rebuild = home-manager -b backup switch --flake $env.NIX;
# alias poweroff = systemctl poweroff;
# alias reboot = systemctl reboot;
# alias cd = z;
# alias cat = bat;

def home_rebuild [] {cd $env.NIX ; git add . ; home-manager -b backup switch --flake $env.NIX}
