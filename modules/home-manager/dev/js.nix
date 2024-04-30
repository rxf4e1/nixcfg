{pkgs, ...}: {
  home.packages = [
    pkgs.nodejs
    pkgs.bun
  ];
}
