{pkgs, ...}: {
  home.packages = with pkgs; [
    ffmpeg-full
    lsix # Terminal Thumbnails
    pqiv # imv|pqiv|nsxiv|vpv|swayimg Image Viewer
    # ytfzf # Terminal YT Player
  ];

}
