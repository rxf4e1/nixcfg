{pkgs, ...}:

{
  home.packages = [pkgs.libnotify];
  services.dunst = {
    enable = true;
    package = pkgs.dunst;
    # settings = {};
    # waylandDisplay = "";
  };
}
