{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    # package = pkgs.emacs-unstable;
    package = pkgs.emacs-pgtk; # Wayland Native
    extraPackages = epkgs: [epkgs.vterm];
  };
  home.packages = [pkgs.libvterm pkgs.libtool pkgs.cmake];
  # home.sessionVariables.EDITOR = "emw";
}
