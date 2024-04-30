{pkgs, ...}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "${pkgs.zsh}/bin/zsh";
        font = "monospace:size-9";
      };

      scrollback.lines = "4096";
      cursor = {
        style = "block";
        blink = "no";
        color = "181818 ffdd33";
      };
      mouse.hide-when-typing = "yes";
      colors = {
        alpha = "0.95";

        ### Grayscale
        # background = "181818";
        # foreground = "b9b9b9";
        # regular0 = "101010";
        # regular1 = "252525";
        # regular2 = "464646";
        # regular3 = "525252";
        # regular4 = "ababab";
        # regular5 = "b9b9b9";
        # regular6 = "e3e3e3";
        # regular7 = "f7f7f7";
        # bright0 = "7c7c7c";
        # bright1 = "999999";
        # bright2 = "a0a0a0";
        # bright3 = "8e8e8e";
        # bright4 = "868686";
        # bright5 = "686868";
        # bright6 = "747474";
        # bright7 = "5e5e5e";

        ### Catppuccin Macchiato
        # foreground = "cad3f5"; # Text
        # background = "24273a"; # Base
        # regular0 = "494d64";   # Surface 1
        # regular1 = "ed8796";   # red
        # regular2 = "a6da95";   # green
        # regular3 = "eed49f";   # yellow
        # regular4 = "8aadf4";   # blue
        # regular5 = "f5bde6";   # pink
        # regular6 = "8bd5ca";   # teal
        # regular7 = "b8c0e0";   # Subtext 1
        # bright0 = "5b6078";    # Surface 2
        # bright1 = "ed8796";    # red
        # bright2 = "a6da95";    # green
        # bright3 = "eed49f";    # yellow
        # bright4 = "8aadf4";    # blue
        # bright5 = "f5bde6";    # pink
        # bright6 = "8bd5ca";    # teal
        # bright7 = "a5adcb";    # Subtext 0

        ### Gruber-Darker
        background = "181818";
        foreground = "e4e4ef";

        # Color Palette (0-7)
        regular0 = "393939"; # black
        regular1 = "9F3032"; # red
        regular2 = "5CA02B"; # green
        regular3 = "CCB028"; # yellow
        regular4 = "416894"; # blue
        regular5 = "dc7fa3"; # "7e779f"; # magenta
        regular6 = "76eec6"; #"4b9599"; # "77877F"; # cyan
        regular7 = "e4e4ef"; # white

        # Color Palette (8-15)
        bright0 = "484848"; # bright black
        bright1 = "c73c3f"; # bright red
        bright2 = "73c936"; # bright green
        bright3 = "ffdd33"; # bright yellow
        bright4 = "96a6c8"; # bright blue
        bright5 = "e7a7c0"; # "9e95c7"; # bright magenta
        bright6 = "a3f4d9"; #"71e0e6"; # "95a99f"; # bright cyan
        bright7 = "ffffff"; # bright white
      };
    };
  };
}
