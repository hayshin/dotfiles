let
  lock = ./. + "/images/lock.png";
  logout = ./. + "/images/logout.png";
  restart = ./. + "/images/restart.png";
  sleep = ./. + "/images/sleep.png";
  power = ./. + "/images/power.png";
  lock-hover = ./. + "/images/lock-hover.png";
  logout-hover = ./. + "/images/logout-hover.png";
  restart-hover = ./. + "/images/restart-hover.png";
  sleep-hover = ./. + "/images/sleep-hover.png";
  power-hover = ./. + "/images/power-hover.png";
in
{
  programs.wlogout = {
    enable = true;
    style = ''
            * {
              font-family: Jetbrains Mono;
              transition: 20ms;
            }

            window {
              background-color: rgba(12, 12, 12, 0.5);
            }

            button {
              color: #FFFFFF;
              font-size: 25px;
              font-weight: bold;

              background-repeat: no-repeat;
              background-position: center;
              background-size: 50%;

              border-style: solid;
              background-color: rgba(12, 12, 12, 0.5);
              border: 3px solid #FFFFFF;
              border-radius: 10%;

              box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }

            button:focus {
              background-color: rgba(255, 255, 255, 0.8);
              border: 3px solid #000000;
            }

      #lock {
          background-image: image(url("${lock}"));
      }

      #suspend {
          background-image: image(url("${sleep}"));
      }

      #poweroff {
          background-image: image(url("${power}"));
      }

      #reboot {
          background-image: image(url("${restart}"));
      }

      #lock:focus {
          background-image: image(url("${lock-hover}"));
      }

      #suspend:focus {
          background-image: image(url("${sleep-hover}"));
      }

      #poweroff:focus {
          background-image: image(url("${power-hover}"));
      }

      #reboot:focus {
          background-image: image(url("${restart-hover}"));
      }
    '';

    layout = import ./layout.nix;
  };
}
