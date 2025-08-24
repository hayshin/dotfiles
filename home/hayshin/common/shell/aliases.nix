{ nix_dir }:
let
  baseCommand = command: attrs: builtins.mapAttrs (name: value: command + " " + value) attrs;

  cog-commit = baseCommand "cog commit" {
    cc = "";
    ccf = "feat";
    ccr = "refactor";
    ccx = "fix";
    ccd = "docs";
  };

  cd = baseCommand "z" {
    zz = "~/dev";
    zzm = "~/dev/meeplix";
    zzp = "~/dev/probent";
    zi = "~/images";
    ziw = "~/images/wallpapers";
    zn = "~/nix";
  };
  bun = baseCommand "bun" {
    bd = "dev";
    bt = "test";
    br = "run";
    ba = "add";
    bi = "install";
  };
  uv = baseCommand "uv" {
    ua = "add";
    ui = "sync";
  };
  docker = baseCommand "docker" {
    d = "";
    du = "compose up";
    dd = "compose down";
    dub = "compose up --build";
  };
  git = baseCommand "git" {
    gm = "commit -m";
    gc = "clone";
    gp = "push";
    gpo = "push origin";
    gg = "pull";
    ga = "add";
    gi = ''bash -c "init; git add .; git commit -m "init"; "'';
    last-commit-hash = ''log -1 --format="%H"'';
  };
in
{
  rebuild = "sudo nixos-rebuild switch --flake ${nix_dir}";
  update = "nix flake update --flake ${nix_dir}";
  upgrade = "sudo nixos-rebuild switch --upgrade --flake ${nix_dir}";
  home-rebuild = "home-manager -b backup switch --flake ${nix_dir}";
  poweroff = "systemctl poweroff";
  suspend = "bash -c 'systemctl suspend; lock'";
  reboot = "systemctl reboot";

  cat = "bat";
  zed = "zeditor";
  copy = "wl-copy";

  rr = "rm -rf";
  md = "mkdir";
  cwd = "bash -c 'pwd | wl-copy'";
  ct = "bash -c 'tree | wl-copy'";

  rm-node-modules = ''bash -c "find . -type d -name node_modules -prune -print | xargs rm -rf"'';
}
// cog-commit
// cd
// bun
// uv
// docker
// git
