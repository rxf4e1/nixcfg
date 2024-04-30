{pkgs, ...}:
{
  # home.packages = with pkgs; [pkgs.tmux];
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    clock24 = true;
    customPaneNavigationAndResize = false;
    newSession = true;
    escapeTime = 0;
    # shell = "${pkgs.ion}/bin/ion";
    # shell = "${pkgs.nushell}/bin/nu";
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    extraConfig = ''
      set-option -ga terminal-overrides ",*256col*:Tc:RGB"
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy -po"

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Switch windows using Alt-</>
      bind -r [ select-window -t :-
      bind -r ] select-window -t :+

      # Window moving
      bind -r c-h swap-window -t :-
      bind -r c-l swap-window -t :+

      # Split windows using - and |
      bind - split-window -v -c "#{pane_current_path}"
      bind | split-window -h -c "#{pane_current_path}"

      bind P display-popup -Ed "#{pane_current_path}"

      # Renumber windows
      set -g renumber-windows on

      # Focus events
      set-option -g focus-events on

      set-option -g visual-activity off
      set-option -g visual-bell off
      set-option -g visual-silence off
      set-option -g bell-action none
      set-window-option -g monitor-activity off

      # Toggle status bar
      # bind -n M-space set-option -g status

      set -g status-justify left
      set -g status-interval 2
      set -g status-left ""

      # setw -g clock-mode-colour colour135
      # set -g status-position top # bottom
      set -g status-bg colour234
      set -g status-fg colour214 # colour137
      # set -g status-right "#[fg=colour233,bg=colour241,bold] %d/%m #[fg=colour233,bg=colour245,bold] %H:%M "
      # set -g status-right-length 50
      # set -g status-left-length 20
      # setw -g window-status-current-format " #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F "
      # setw -g window-status-format " #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F "
    '';
  };
}
