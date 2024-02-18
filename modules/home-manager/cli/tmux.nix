{pkgs, ...}:
{
  programs.zellij = {
    enable = false;
    enableBashIntegration = false;
    enableZshIntegration = false;
    # settings = {};
  };
  programs.tmux = {
    enable = false;
    prefix = "C-a";
    baseIndex = 1;
    keyMode = "vi";
    clock24 = true;
    customPaneNavigationAndResize = true;
    escapeTime = 0;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    extraConfig = ''
      set -g status off
      set-option -ga terminal-overrides ",*256col*:Tc:RGB"
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'wl-copy -po'
    '';
  };
}
