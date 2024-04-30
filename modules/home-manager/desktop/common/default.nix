{pkgs, ...}: {
  imports = [
    ./browser
    ./bemenu.nix
    ./chromium.nix
    ./gtk.nix
    ./kanshi.nix
    ./media.nix
    ./notes.nix
    ./notify.nix
    ./wlsunset.nix
    ./xdg.nix
  ];

  home.packages = with pkgs; [
    cliphist
    font-manager
    sway-contrib.grimshot
    playerctl
    pcmanfm
    wl-clipboard
    keepassxc
    lswt
  ];
}
