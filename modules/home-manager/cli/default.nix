{pkgs, ...}: {
  imports = [
    # ./broot.nix
    ./direnv.nix
    ./foot.nix
    ./fzf.nix
    ./lsd.nix
    ./starship.nix
    ./tmux.nix
    ./vcs.nix
    ./wezterm.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    bat # Better cat
    bc # Calc
    bottom # System viewer
    ncdu # TUI disk usage
    fd # Better find
    ripgrep # Better grep
    rlwrap # Better readline
    httpie # Better curl
    jq # JSON pretty print and manipulate
    time # Timer
    trash-cli # Trash clean

    lesspass-cli # Password generator

    nil # Nix LSP
    nixfmt # Nix Formatter

    ltex-ls # Spell checking LSP
  ];
}
