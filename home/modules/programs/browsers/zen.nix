{
  config,
  inputs,
  lib,
  ...
}:
let
  cfg = config.modules.programs.browsers;
in
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  config = lib.mkIf cfg.zen.enable {
    programs.zen-browser = {
      enable = true;
      profiles.default = {
        settings = {
          "zen.workspaces.continue-where-left-off" = true;
          "zen.welcome-screen.seen" = true;
          "zen.urlbar.behavior" = "float";
        };

        containersForce = false;
        containers = {
          Personal = {
            color = "orange";
            icon = "fingerprint";
            id = 1;
          };
          Work = {
            color = "blue";
            icon = "briefcase";
            id = 2;
          };
          University = {
            color = "purple";
            icon = "fence";
            id = 3;
          };
        };

        spacesForce = false;
        spaces =
          let
            containers = config.programs.zen-browser.profiles.default.containers;
          in
          {
            "home" = {
              id = "78aabdad-8aae-4fe0-8ff0-2a0c6c4ccc10";
              icon = "🏠";
              container = containers."Personal".id;
              position = 10;
            };
            "idoctor" = {
              id = "78aabdad-8aae-4fe0-8ff0-2a0c6c4ccc20";
              icon = "🩺";
              container = containers."Work".id;
              position = 20;
            };
            "gentest" = {
              id = "78aabdad-8aae-4fe0-8ff0-2a0c6c4ccc30";
              icon = "🧬";
              container = containers."Work".id;
              position = 30;
            };
            "sdu" = {
              id = "78aabdad-8aae-4fe0-8ff0-2a0c6c4ccc40";
              icon = "🎓";
              container = containers."University".id;
              position = 40;
            };
            "research" = {
              id = "78aabdad-8aae-4fe0-8ff0-2a0c6c4ccc50";
              icon = "🔬";
              container = containers."Work".id;
              position = 50;
            };
            "linux" = {
              id = "78aabdad-8aae-4fe0-8ff0-2a0c6c4ccc60";
              icon = "🐧";
              container = containers."Personal".id;
              position = 60;
            };
          };
      };
    };
  };
}
