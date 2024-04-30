{pkgs, ...}: {
  home.packages = with pkgs; [
    guile
    sbcl
  ];
}
