{pkgs, ...}:

{
  home.packages = [pkgs.libnotify pkgs.wob];

  services.dunst = {
    enable = true;
    package = pkgs.dunst;
  };

  services.wob = {
    enable = true;
    systemd = true;
    settings = {
      "" = {
        border_size = 10;
        height = 50;
      };
      "output.main".name = "eDP-1";
      "style.muted".background_color = "032cfc";
    };
  };

}
