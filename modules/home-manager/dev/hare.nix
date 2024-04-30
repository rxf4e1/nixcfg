{pkgs, ...}:
{
  home.packages = with pkgs; [
    hare
    harec
    qbe
  ];
}
