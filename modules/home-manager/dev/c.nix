{pkgs, ...}: {
  home.packages = with pkgs; [gcc ccls gnumake ctags];
}
