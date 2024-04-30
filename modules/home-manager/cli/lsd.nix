{
  programs.lsd = {
    enable = true;
    enableAliases = true;
    settings = {
      color = {
        when = "auto";
        theme = "default";
      };
      blocks = [ "permission" "user" "name" ];
      icons.when = "never";
      ignore-globs = [ ".git" ".hg" ];
      layout = "grid";
      permission = "octal";
      sorting = {
        column = "name";
        reverse = false;
        dir-grouping = "first";
      };
      no-symlink = true;
      symlink-arrow = "⇒";
      header = true;
    };
  };
}
