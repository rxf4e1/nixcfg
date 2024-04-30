{pkgs, ...}: {
  home.packages = with pkgs; [
    anki
    ghostscript
    libsForQt5.okular
    pandoc
    marksman
    swappy
  ];
}
