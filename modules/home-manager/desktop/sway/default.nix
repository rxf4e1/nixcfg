{ config, lib, pkgs, ... }: let
  startw = pkgs.writeShellScriptBin "startw" ''
    cd ~
    if [ -z $DISPLAY ]; then
    exec sway
    else
    echo "Sway Wayland Compositor is running."
    fi
  '';
  sss = pkgs.writeShellScriptBin "sss" ''
    dir="$XDG_PICTURES_DIR/10-19_Generic/13_Screenshot"
    file="$(date +'%Y%m%d-%H%M')_screenshot.png"
    grimshot --notify save area "$dir/$file"
  '';
in {
  home.packages = [startw sss];
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "wezterm";
      menu = "foot --app-id float -w 300x150 -e fzf-menu";
      input = {
        "type:keyboard" = {
          xkb_layout = "br";
          xkb_variant = "abnt2";
          xkb_options = "caps:ctrl_modifier";
          repeat_delay = "300";
          repeat_rate = "60";
        };
        "type:touchpad" = {
          dwt = "enabled";
          tap = "enabled";
          natural_scroll = "enabled";
        };
      };
      seat."*".hide_cursor = "when-typing enable";
      fonts = {
        names = ["Iosevka" "Jetbrains Mono" "Noto Sans Mono" ];
        size = 9.0;
      };
      gaps = {
        smartGaps = true;
        smartBorders = "on";
        inner = 5;
        outer = 5;
      };
      defaultWorkspace = "1";
      workspaceAutoBackAndForth = false;
      focus.followMouse = true;
      bars = [];
      bindkeysToCode = false;
      keybindings = let
        mod = config.wayland.windowManager.sway.config.modifier;
        term = config.wayland.windowManager.sway.config.terminal;
      in
        lib.mkOptionDefault {
          "${mod}+m" = "exec $HOME/.local/bin/emw";
          "${mod}+q" = "exec ${term}";
          "${mod}+shift+d" = "exec fuzzel";
          "Print" = "exec grimshot --notify copy area";
          "shift+Print" = "exec sss";
          "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%+";
          "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%-";
          "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_SINK@ toggle";
          "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_SINK@ toggle";
          "XF86MonBrightnessUp" = "exec light -A 10.0";
          "XF86MonBrightnessDown" = "exec light -U 10.0";
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
          { window_role = "bubble"; }
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
        {command = "pkill wlsunset && wlsunset";}
        {
          command = ''notify-send -t 1024 "Let's Hack!"'';
          always = true;
        }
      ];
    };
    extraConfig = ''
      # default_border none
      default_floating_border pixel 2
      titlebar_border_thickness 1
      titlebar_padding 5 1
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
