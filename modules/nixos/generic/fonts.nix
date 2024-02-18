{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
      iosevka
      noto-fonts
      noto-fonts-color-emoji
      jetbrains-mono
    ];
    fontconfig = {
      hinting.autohint = true;
      defaultFonts = {
        emoji = ["Noto Emoji"];
        monospace = ["Iosevka" "Noto Sans Mono"];
        serif = ["Noto Serif"];
        sansSerif = ["Noto Sans"];
      };
    };
  };
}
