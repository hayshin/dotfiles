{ config, ... }:
with config.lib.stylix.colors.withHashtag;
{
  programs.waybar = {
    enable = true;
    settings = import ./settings.nix;
    style = ''
      @define-color bg ${base00};
      @define-color fg ${base05};

      * {
        min-height: 0;
        font-family: JetBrains Mono, FontAwesome;
        font-size: 14px;
        font-weight: 900;
      }

      window#waybar {
        transition: all 0.5s;
        opacity: 1;
        margin-top: 0;
        background-color: rgba(0, 0, 0, 0);
      }

      window#waybar.hidden {
        opacity: 0;
        margin-top: -50px;
      }

      #workspaces {
        background: @bg;
        padding-left: 10px;
        padding-right: 15px;
        border-bottom-right-radius: 16px;
        border-top-right-radius: 16px;
      }

      #workspaces button {
        padding: 2px 2px;
        margin: 3px 3px;
        border-radius: 16px;
        border: 0px;
        transition: all 0.2s ease-in-out;
      }

      #workspaces button.active {
        color: @bg;
        background: @fg;
        min-width: 40px;
        transition: all 0.2s ease-in-out;
      }

      #workspaces button.urgent {
        background: #ff0000;
      }

      .module {
        background: @bg;
        color: @fg;
        padding-right: 10px;
        padding-left: 10px;
      }

      tooltip {
        background: @bg;
        color: @fg;
      }

      #mpris {
        font-weight: 600;
        font-size: 14px;
        border-bottom-left-radius: 16px;
        border-bottom-right-radius: 16px;
        margin-left: 10px;
        margin-right: 10px;
      }

      #custom-power {
        font-size: 16px;
      }

      #network {
        border-bottom-left-radius: 16px;
        border-top-left-radius: 16px;
      }

      #tray {
        border-bottom-right-radius: 16px;
        border-bottom-left-radius: 16px;
        margin-left: 10px;
        margin-right: 10px;
      }

      #clock {
        /* font-weight: 600; */
        font-size: 14px;
      }
    '';
  };
  stylix.targets.waybar.enable = false;
}
