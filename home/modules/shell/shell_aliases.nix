{nix_dir}: {
    rebuild = "sudo nixos-rebuild switch --flake ${nix_dir}";
    update = "sudo nix flake update ${nix_dir}";
    upgrade = "sudo nixos-rebuild switch --upgrade --flake ${nix_dir}";
    home-rebuild = "home-manager -b backup switch --flake ${nix_dir}";
    poweroff = "systemctl poweroff";
    reboot = "systemctl reboot";
    cd = "z";
    cat = "bat";
}

