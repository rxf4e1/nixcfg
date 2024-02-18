{pkgs, ...}: {
  imports = [
    ./chromium.nix
    ./browser
    ./fuzzel.nix
    ./gammastep.nix
    ./gtk.nix
    ./kanshi.nix
    ./media.nix
    ./notes.nix
    ./notify.nix
    ./xdg.nix
  ];

  home.packages = with pkgs; [
    cliphist
    sway-contrib.grimshot
    playerctl
    pcmanfm
    wl-clipboard
    keepassxc
  ];
}
