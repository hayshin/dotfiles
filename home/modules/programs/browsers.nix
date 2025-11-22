{ pkgs, lib, config, ... }:
let
  cfg = config.modules.programs.browsers;

  browserConfigs = {
    firefox = {
      cmd = "firefox";
      class = "firefox";
      pkg = pkgs.firefox-devedition;
    };
    chrome = {
      cmd = "google-chrome-stable";
      class = "Google-chrome";
      pkg = pkgs.google-chrome;
    };
    vivaldi = {
      cmd = "vivaldi";
      class = "Vivaldi-stable";
      pkg = pkgs.vivaldi;
    };
    zen = {
      cmd = "zen-beta";
      class = "zen-beta";
      # pkg handled in zen-browser.nix or externally
    };
  };

  defaultBrowser = browserConfigs.${cfg.default};
in
{
  options.modules.programs.browsers = {
    firefox.enable = lib.mkEnableOption "Firefox Developer Edition";
    chrome.enable = lib.mkEnableOption "Google Chrome";
    vivaldi.enable = lib.mkEnableOption "Vivaldi";
    zen.enable = lib.mkEnableOption "Zen Browser";

    default = lib.mkOption {
      type = lib.types.enum [ "firefox" "chrome" "vivaldi" "zen" ];
      default = "zen";
      description = "Default system browser";
    };

    defaultBrowserConfig = lib.mkOption {
      internal = true;
      readOnly = true;
      type = lib.types.attrs;
      default = defaultBrowser;
      description = "Configuration (cmd, class) of the selected default browser";
    };
  };

  config = {
    home.packages = lib.mkMerge [
      (lib.mkIf cfg.firefox.enable [ browserConfigs.firefox.pkg ])
      (lib.mkIf cfg.chrome.enable [ browserConfigs.chrome.pkg ])
      (lib.mkIf cfg.vivaldi.enable [ browserConfigs.vivaldi.pkg ])
    ];

    programs.firefox.enable = cfg.firefox.enable;

    home.sessionVariables = {
      BROWSER = defaultBrowser.cmd;
    };

    home.shellAliases = {
      browser = defaultBrowser.cmd;
    };

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "${defaultBrowser.cmd}.desktop";
        "x-scheme-handler/http" = "${defaultBrowser.cmd}.desktop";
        "x-scheme-handler/https" = "${defaultBrowser.cmd}.desktop";
        "x-scheme-handler/about" = "${defaultBrowser.cmd}.desktop";
        "x-scheme-handler/unknown" = "${defaultBrowser.cmd}.desktop";
      };
    };
  };
}
