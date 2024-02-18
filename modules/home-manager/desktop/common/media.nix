{pkgs, ...}: {
  home.packages = with pkgs; [
    ffmpeg-full
    lsix # chafa|lsix - Terminal Thumbnails
    vpv # imv|nsxiv|vpv Image Viewer
    ytfzf # Terminal YT Player
  ];

  programs.mpv = {
    enable = false;
    config = {};
  };
}
