{ pkgs, ... }:
{
  imports = [
    ./common
    ../modules
    ./optional
  ];

  modules.programs.browsers = {
    zen.enable = true;
    firefox.enable = true;
    chrome.enable = true;
    default = "zen";
  };

  modules.programs.editors = {
    vscode.enable = true;
    zed.enable = true;
    cursor.enable = true;
    helix.enable = true;
    default = "hx";
  };

  modules.programs.yazi.enable = true;
  modules.programs.zellij.enable = true;

  modules.programs.shell = {
    enable = true;
    direnv.enable = true;
    zsh.enable = true;
    nushell.enable = true;
    ssh.enable = true;
  };

  modules.programs.development = {
    git.enable = true;
    frontend.enable = true;
    dprint.enable = true;
    languages = {
      python.enable = true;
      rust.enable = true;
      go.enable = true;
      cpp.enable = true;
      nix.enable = true;
      java.enable = true;
      databases.enable = true;
    };
  };

  modules.programs.terminals.enable = true;
  modules.desktop.hyprland.enable = true;
}
