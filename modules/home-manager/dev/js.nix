{pkgs, ...}: {
  home.packages = [
    # pkgs.nodejs
    # pkgs.nodePackages.npm
    pkgs.bun
  ];
}
