{pkgs, ...}:
let
  userName = "user";
  hostName = "aspire-a315";
in {
  home.packages = [pkgs.shfmt];

  programs.bash = {
    enable = false;
    enableCompletion = true;
    enableVteIntegration = true;
    historyFile = "$XDG_CACHE_HOME/bash_history";
    historyFileSize = 10000;
    historySize = 5000;
    historyControl = ["erasedups" "ignoredups" "ignorespace"];
    historyIgnore = ["ls" "cd" "exit"];
    shellOptions = [
      "histappend"
      "checkwinsize"
      "extglob"
      "globstar"
      "checkjobs"
    ];
  };

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreAllDups = true;
      ignoreDups = true;
      ignoreSpace = true;
    };
    # defaultKeymap = "emacs";
    enableVteIntegration = true;
    autocd = false;
    syntaxHighlighting.enable = false;
    initExtra = '' bindkey -v '';
  };

  home = {
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
      "$HOME/.luarocks/bin"
    ];

    sessionVariables = {
      COLORTERM = "truecolor";
      VISUAL = "$EDITOR";
      PAGER = "less";
      LC_COLLATE = "C";
      _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";
    };

    shellAliases = {
      cat = "bat";
      ip = "ip -c";
      rs = "doas nixos-rebuild --flake $NIXOS_CONFIG#${hostName} switch";
      rb = "doas nixos-rebuild --flake $NIXOS_CONFIG#${hostName} boot";
      rh = "home-manager --flake $NIXOS_CONFIG#${userName}@${hostName} switch";
      gcs = "doas nix-collect-garbage --delete-old";
      gch = "nix-collect-garbage --delete-old";
      update = "cd $NIXOS_CONFIG; nix flake update; cd -";
      yt = "ytfzf -t --notify-playing";
    };
  };

}
