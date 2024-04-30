{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    ccls
    cmake
    gnumake
    ctags
  ];
}
