{pkgs, ...}: {
  gtk = {
    enable = true;
    font = { name = "Noto Sans Mono"; size = 10; };
    iconTheme = { package = pkgs.gnome.adwaita-icon-theme; name = "Adwaita"; };
    theme = { package = pkgs.sweet; name = "Sweet-Dark"; };
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      package = pkgs.libsForQt5.breeze-qt5;
    };
  };
  
}
