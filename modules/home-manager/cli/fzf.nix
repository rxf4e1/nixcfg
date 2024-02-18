{pkgs, ...}:
let
  fzf-menu = pkgs.writeShellScriptBin "fzf-menu" ''
    set -m
    spath=$HOME/.nix-profile/bin
    selection=$(fd . $spath | fzf -e -i --reverse --delimiter / --with-nth -1)
    nohup "$selection" >/dev/null 2>&1&
  '';
in
{
  home.packages = [fzf-menu];
  programs.fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      tmux.enableShellIntegration = true;
      tmux.shellIntegrationOptions = ["-d 30%"];
      changeDirWidgetCommand = "fd --color=auto --type=d";
      changeDirWidgetOptions = ["--preview 'lsd --tree --color=always -L 4 {}'"];
      defaultCommand = "fd --color=auto";
      fileWidgetCommand = "fd --color=auto --type=f";
      fileWidgetOptions = ["--preview 'head -n 100 {}'"];
    };
    home.sessionVariables = {
      FZF_COMPLETION_TRIGGER = ",,";
      FZF_DEFAULT_OPTS = "--info=inline";
    };
}
