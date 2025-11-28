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
  imports = [
    ./zen.nix
  ];

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
    stylix.targets.firefox.enable = false;


    home.sessionVariables = {
      BROWSER = defaultBrowser.cmd;
    };

    home.shellAliases = {
      browser = defaultBrowser.cmd;
    };
    xdg.desktopEntries = {
      browser = {
        name = "browser";
        genericName = "Browser selector";
        exec = defaultBrowser.cmd;
        type = "Application";
        terminal = false;
        categories = [
          "Application"
          "Network"
          "WebBrowser"
        ];
        mimeType = [
          "text/html"
          "text/xml"
          "application/pdf"
        ];
      };
    };
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "browser.desktop";
        
        "x-scheme-handler/http" = "browser.desktop";
        "x-scheme-handler/https" = "browser.desktop";
        "x-scheme-handler/about" = "browser.desktop";
        "x-scheme-handler/unknown" = "browser.desktop";
        "x-scheme-handler/mailto" = "browser.desktop";
        "x-scheme-handler/chrome" = "browser.desktop";

         "application/x-extension-shtml" = "browser.desktop";
        "application/x-extension-xhtml" = "browser.desktop";
        "application/x-extension-html" = "browser.desktop";
        "application/x-extension-xht" = "browser.desktop";
        "application/x-extension-htm" = "browser.desktop";
        "application/xhtml+xml" = "browser.desktop";
        "application/pdf" = "browser.desktop";
        "application/octet-stream" = "browser.desktop";
      };
    };
  };
}
