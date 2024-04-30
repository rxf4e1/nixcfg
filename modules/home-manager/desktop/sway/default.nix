{ config, lib, pkgs, ... }: let
  startw = pkgs.writeShellScriptBin "startw" ''
    cd ~
    if [ -z $DISPLAY ]; then
    exec sway
    else
    echo "Sway Wayland Compositor is running."
    fi
  '';
in {
  home.packages = [startw];
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.sway;
    xwayland = false;
    config = {
      modifier = "Mod4";
      # terminal = "${pkgs.wezterm}/bin/wezterm";
      terminal = "${pkgs.foot}/bin/foot";
      # menu = "foot --app-id float -w 300x150 -e fzf-menu";
      menu = "bemenu-run --fn 'Input Mono 8'";
      output = {
        "*".bg = "#000000 solid_color";
      };
      input = {
        "type:keyboard" = {
          xkb_layout = "br";
          xkb_variant = "abnt2";
          xkb_options = "caps:ctrl_modifier";
          repeat_delay = "300";
          repeat_rate = "80";
        };
        "type:touchpad" = {
          dwt = "enabled";
          tap = "enabled";
          natural_scroll = "enabled";
        };
      };
      seat."*".hide_cursor = "when-typing enable";
      fonts = {
        names = ["Input Mono" "Jetbrains Mono" "Noto Sans Mono" ];
        size = 8.0;
      };
      gaps = {
        smartGaps = true;
        smartBorders = "on";
        inner = 5;
        outer = 5;
      };
      defaultWorkspace = "workspace number 1";
      workspaceAutoBackAndForth = false;
      focus.followMouse = true;
      bars = [];
      bindkeysToCode = true;
      keybindings = let
        mod = config.wayland.windowManager.sway.config.modifier;
        term = config.wayland.windowManager.sway.config.terminal;
      in
        lib.mkOptionDefault {
          "${mod}+m" = "exec $HOME/.local/bin/emw";
          "${mod}+q" = "exec ${term} -e tmux new-session -A -s main";
          # "${mod}+q" = "exec ${term} -e zellij";
          "Print" = "exec grimshot --notify copy area";
          # "shift+Print" = "exec grimshot --notify save area";
          "XF86AudioPlay" = "playerctl play-pause";
          "XF86AudioPrev" = "playerctl previous";
          "XF86AudioNext" = "playerctl next";
        };
      window = {
        border = 2;
        titlebar = false;
        commands = [
          {
            command = "border 2";
            criteria = {
              class = "Emacs";
              titlebar = false;
            };
          }
          {
            command = "border 2";
            criteria = {
              app_id = "firefox";
              titlebar = false;
              floating = true;
            };
          }
          {
            command = "border pixel 2";
            criteria = { app_id = "float"; };
          }
        ];
      };
      floating = {
        criteria = [
          { window_role = "pop-up"; }
          { window_role = "task_dialog"; }
          { window_role = "dialog"; }
          { window_role = "menu"; }
          { app_id = "float"; }
          { app_id = "system-config-printer"; }
          { app_id = "mpv"; }
        ];
      };
      startup = [
        {command = "pkill dunst && dunst";}
        {command = "pkill wlsunset && wlsunset -l -23.6 -L -46.5";}
        {
          command = ''notify-send -t 2048 "Let's Hack!"'';
          always = true;
        }
      ];
    };
    extraConfig = ''
      # default_border none
      default_floating_border pixel 2
      titlebar_border_thickness 1
      titlebar_padding 5 1

      set $WOBSOCK $XDG_RUNTIME_DIR/wob.sock
      exec rm -f $WOBSOCK && mkfifo $WOBSOCK && tail -f $WOBSOCK | wob
      set $bindsym bindsym --to-code
      $bindsym --locked XF86MonBrightnessUp exec brightnessctl set 5%+ | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > $WOBSOCK
      $bindsym --locked XF86MonBrightnessDown exec brightnessctl set 5%- | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > $WOBSOCK
      $bindsym --locked XF86AudioRaiseVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ && wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/[^0-9]//g' > $WOBSOCK
      $bindsym --locked XF86AudioLowerVolume exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%- && wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/[^0-9]//g' > $WOBSOCK
      $bindsym --locked XF86AudioMute exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo 0 > $WOBSOCK
    '';
    extraSessionCommands = ''
      export LIBSEAT_BACKEND=logind
      export GDK_BACKEND=wayland
      export CLUTTER_BACKEND=wayland
      export SDL_VIDEODRIVER=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
    '';
    systemd.enable = true;
    systemd.xdgAutostart = true;
    wrapperFeatures.gtk = true;
  };
}
