{pkgs, ...}: {
  home.packages = with pkgs; [
    luajit
    luajitPackages.luarocks
    lua-language-server
  ];
}
