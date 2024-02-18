{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreDups = true;
      ignoreSpace = true;
    };
    defaultKeymap = "emacs";
    enableVteIntegration = true;
    autocd = false;
    syntaxHighlighting.enable = false;
    shellAliases = {
      cat = "bat";
      ip = "ip -c";
      rs = "doas nixos-rebuild --flake $NIXOS_CONFIG#\$HOST switch";
      rb = "doas nixos-rebuild --flake $NIXOS_CONFIG#\$HOST boot";
      rh = "home-manager --flake $NIXOS_CONFIG#\$USER@\$HOST switch";
      gcs = "doas nix-collect-garbage --delete-old";
      gch = "nix-collect-garbage --delete-old";
      update = "cd $NIXOS_CONFIG; nix flake update; cd -";
      yt = "ytfzf -t --notify-playing";
    };
    sessionVariables = {
      BROWSER = "firefox";
      VISUAL = "$EDITOR";
      PAGER = "less";
      LC_COLLATE = "C";
    };
    initExtra = ''
      export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'
      path+=("$HOME/.local/bin" "$HOME/.cargo/bin" "$HOME/.bun/bin" "$HOME/.luarocks/bin")
    '';
  };
}
