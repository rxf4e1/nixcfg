{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "monospace:size=9";
        prompt = ">_ ";
        icons-enabled = "no";
        password-character = "*";
        terminal = "foot -e";
        lines = "5";
        width = "23";
      };
      colors = {
        background = "002b36ff";
        text = "839496ff";
        match = "dc322fdd";
        border = "93a1a1ff";
      };
      border = {
        radius = "3";
        width = "1";
      };
    };

  };
}
