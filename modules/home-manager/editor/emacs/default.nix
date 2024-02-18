{pkgs, ...}: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-unstable;
    extraPackages = epkgs: [epkgs.vterm];
  };
  home.packages = [pkgs.libvterm pkgs.libtool pkgs.cmake];
  # home.sessionVariables.EDITOR = "emw";
  # home.file.".local/bin/emw".source = ./em;
}
