{pkgs, ...}: {
  imports = [
    ./direnv.nix
    ./foot.nix
    ./fzf.nix
    ./lsd.nix
    ./starship.nix
    ./shells.nix
    ./tmux.nix
    ./vcs.nix
    ./wezterm.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    bat         # Better cat
    bc          # Calc
    nnn         # TUI File Manager
    fd          # Better find
    ripgrep     # Better grep
    rlwrap      # Better readline
    jq          # JSON pretty print and manipulate
    time        # Timer
    trash-cli   # Trash clean
    ltex-ls     # Spell checking LSP
    nil         # Nix LSP
    alejandra   # Nix Formatter
    tree-sitter #
    zip         #
    unzip       #
  ];
}
