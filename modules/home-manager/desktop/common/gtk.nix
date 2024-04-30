{pkgs, ...}:

{
  home.packages = with pkgs; [ glib gnome.nixos-gsettings-overrides ];
  
  gtk = {
    enable = true;
    font = { name = "monospace"; size = 8; };
    iconTheme = { package = pkgs.gnome.adwaita-icon-theme; name = "Adwaita"; };
    theme = { package = pkgs.sweet; name = "Sweet-Dark"; };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      package = pkgs.libsForQt5.breeze-qt5;
    };
  };  
}
