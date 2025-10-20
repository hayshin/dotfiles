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


# Converts a .env file into a record
# may be used like this: open .env | load-env
# works with quoted and unquoted .env files
def "from env" []: string -> record {
  lines
    | split column '#' # remove comments
    | get column1
    | parse "{key}={value}"
    | update value {
        str trim                        # Trim whitespace between value and inline comments
          | str trim -c '"'             # unquote double-quoted values
          | str trim -c "'"             # unquote single-quoted values
          | str replace -a "\\n" "\n"   # replace `\n` with newline char
          | str replace -a "\\r" "\r"   # replace `\r` with carriage return
          | str replace -a "\\t" "\t"   # replace `\t` with tab
    }
    | transpose -r -d
}
