{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
      input-fonts
      gohufont
      noto-fonts
      noto-fonts-color-emoji
      jetbrains-mono
    ];
    fontconfig = {
      hinting.autohint = true;
      defaultFonts = {
        emoji = ["Noto Emoji"];
        monospace = ["Input Mono" "Gohu Font" "Noto Sans Mono"];
        serif = ["Input Serif" "Noto Serif"];
        sansSerif = ["Input Sans" "Noto Sans"];
      };
    };
  };
}
