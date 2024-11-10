let
  wallpaper = "~/Downloads/menhera.jpg";
in
{
  programs.wpaperd = {
    enable = true;
    settings = {
      any = {
        path = wallpaper;
      };
    };
  };
}
