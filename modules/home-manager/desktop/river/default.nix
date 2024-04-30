{pkgs, ...}:
let

  startw = pkgs.writeShellScriptBin "startw" ''
    cd ~
    export XDG_RUNTIME_DIR=/run/user/"$(id -u)"
    timestamp=$(date +%F-%R)
    if [ -z $DISPLAY ]; then
      river -log-level debug > /tmp/river-$timestamp.log 2>&1
    else
      echo "RiverWM is running."
    fi
  '';
  
in {

  home.packages = [startw];
  
  wayland.windowManager.river = {
    enable = true;
    xwayland.enable = false;
    extraConfig = ''
      # logger "Starting river."
      #################################################
      # HELPER-FUNCTIONS
      #################################################
      shopt -s lastpipe
      
      function spawn_once {
          pgrep -f "$1" >/dev/null || riverctl spawn "$*"
      }
      
      mod=Mod4
      
      #################################################
      # WIDGETS
      #################################################
      spawn_once dunst
      spawn_once kanshi
      spawn_once "wlsunset -l -23.6 -L -43.5"
      notify-send -t 2048 "Welcome back, sir!"
      
      #################################################
      # INTEROP
      #################################################
      gsettings set org.gnome.desktop.default-applications.terminal exec foot
      spawn_once dbus-river-environment
      
      #################################################
      # APPEARANCE
      #################################################
      riverctl background-color 0x0c0c0c # 0x002B36
      riverctl border-color-focused 0x586E75
      riverctl border-color-unfocused 0x073642
      riverctl border-width 1
      
      gsettings set org.gnome.desktop.interface gtk-theme Sweet-Dark
      gsettings set org.gnome.desktop.interface icon-theme Adwaita
      gsettings set org.gnome.desktop.wm.preferences button-layout ""
      
      #################################################
      # INPUTS
      #################################################
      riverctl set-repeat 80 300
      riverctl hide-cursor timeout 2048
      riverctl hide-cursor when-typing enabled
      riverctl keyboard-layout -variant abnt2 -options ctrl:nocaps br
      
      for pad in $(riverctl list-inputs | grep -i touchpad); do
      	riverctl input $pad events enabled
      	riverctl input $pad tap enabled
      	riverctl input $pad natural-scroll disabled
      	riverctl input $pad disable-while-typing enabled
      	riverctl input $pad middle-emulation disabled
      done
      
      #################################################
      # WINDOW-MANAGEMENT
      #################################################
      riverctl map normal Super Escape exit
      riverctl map normal Super+Shift Q close
      riverctl map normal Super Return zoom
      riverctl map normal Super F toggle-fullscreen
      riverctl map normal Super+Shift Space toggle-float
      
      riverctl map normal Super N focus-view next
      riverctl map normal Super P focus-view previous
      
      riverctl map normal Super+Shift N swap next
      riverctl map normal Super+Shift P swap previous
      
      riverctl map normal Super+Alt H move left 10
      riverctl map normal Super+Alt J move down 10
      riverctl map normal Super+Alt K move up 10
      riverctl map normal Super+Alt L move right 10
      
      riverctl map normal Super+Alt+Shift H resize horizontal -10
      riverctl map normal Super+Alt+Shift J resize vertical 10
      riverctl map normal Super+Alt+Shift K resize vertical -10
      riverctl map normal Super+Alt+Shift L resize horizontal 10
      
      riverctl map normal Super+Alt+Control H snap left
      riverctl map normal Super+Alt+Control J snap down
      riverctl map normal Super+Alt+Control K snap up
      riverctl map normal Super+Alt+Control L snap right
      
      #################################################
      # LAYOUT
      #################################################
      riverctl default-layout rivertile
      rivertile -view-padding 4 -outer-padding 4 &
      
      riverctl map normal Super H send-layout-cmd rivertile "main_ratio -0.05"
      riverctl map normal Super L send-layout-cmd rivertile "main_ratio +0.05"
      riverctl map normal Super+Shift H send-layout-cmd rivertile "main_count +1"
      riverctl map normal Super+Shift L send-layout-cmd rivertile "main_count -1"
      
      riverctl map normal Super Up    send-layout-cmd rivertile "main-location top"
      riverctl map normal Super Right send-layout-cmd rivertile "main-location right"
      riverctl map normal Super Down  send-layout-cmd rivertile "main-location bottom"
      riverctl map normal Super Left  send-layout-cmd rivertile "main-location left"
      
      #################################################
      # TAGS
      #################################################
      for i in $(seq 1 4); do
      	tags=$((1 << ($i - 1)))
      	riverctl map normal Super $i set-focused-tags $tags
      	riverctl map normal Super+Shift $i set-view-tags $tags
      	riverctl map normal Super+Control $i toggle-focused-tags $tags
      	riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
      done
      
      all_tags=$(((1 << 32) - 1))
      riverctl map normal Super 0 set-focused-tags $all_tags
      riverctl map normal Super+Shift 0 set-view-tags $all_tags
      
      #################################################
      # LAUNCH-KEYBINDS
      #################################################
      riverctl map normal Super Q spawn "foot zellij"
      riverctl map normal Super+Shift Return spawn "foot"
      riverctl map normal Super D spawn bemenu-run
      riverctl map normal Super+Shift R spawn "bash $HOME/.config/river/init"
      riverctl map normal Super 5 spawn $HOME/.local/bin/emw
      riverctl map normal Super 6 spawn firefox-esr
      # riverctl map normal Super 7 spawn 
      riverctl map normal Super 8 spawn "grimshot --notify copy area"
      riverctl map normal Super 9 spawn "grimshot --notify save area $XDG_PICTURES_DIR/$(date +'%Y%m%d-%H%M%S')_ss.png"
      
      #################################################
      # MEDIA-KEYS
      #################################################
      for mode in normal locked; do
      	riverctl map $mode None XF86MonBrightnessUp spawn "brightnessctl s 10%+"
      	riverctl map $mode None XF86MonBrightnessDown spawn "brightnessctl s 10%-"
      	riverctl map $mode None XF86AudioRaiseVolume spawn "wpctl set-volume @DEFAULT_SINK@ 5%+"
      	riverctl map $mode None XF86AudioLowerVolume spawn "wpctl set-volume @DEFAULT_SINK@ 5%-"
      	riverctl map $mode None XF86AudioMute spawn "wpctl set-mute @DEFAULT_SINK@ toggle"
      	riverctl map $mode None XF86AudioMedia spawn "playerctl play-pause"
      	riverctl map $mode None XF86AudioPlay spawn "playerctl play-pause"
      	riverctl map $mode None XF86AudioPrev spawn "playerctl previous"
      	riverctl map $mode None XF86AudioNext spawn "playerctl next"
      done
      
      #################################################
      # POINTER
      #################################################
      riverctl map-pointer normal Super BTN_LEFT move-view
      riverctl map-pointer normal Super BTN_RIGHT resize-view
      riverctl map-pointer normal Super BTN_MIDDLE toggle-float
      riverctl set-cursor-warp on-focus-change
      riverctl focus-follows-cursor always
      
      #################################################
      # PASSTHROUGH-MODE
      #################################################
      riverctl declare-mode passthrough
      riverctl map normal Super F11 enter-mode passthrough
      riverctl map passthrough Super F11 enter-mode normal
      
      #################################################
      # SCRATCHPAD
      #################################################
      scratch_tag=$((1 << 20))
      riverctl map normal Super S toggle-focused-tags $scratch_tag
      riverctl map normal Super+Shift S set-view-tags $scratch_tag
      all_but_scratch_tag=$((((1 << 32) - 1) ^ $scratch_tag))
      riverctl spawn-tagmask $all_but_scratch_tag
      
      #################################################
      # FILTER
      #################################################
      riverctl float-filter-add "float"
      riverctl float-filter-add "popup"
      riverctl float-filter-add "Picture-in-Picture"
      riverctl float-filter-add "Picture_in_Picture"
      
      riverctl csd-filter-add "firefox-esr"
      riverctl csd-filter-add "emacs"
    '';
    extraSessionVariables = {
      LIBSEAT_BACKEND = "logind";
      GDK_BACKEND = "wayland";
      CLUTTER_BACKEND = "wayland";
      SDL_VIDEODRIVER = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      XDG_CURRENT_DESKTOP = "river";
      XDG_SESSION_DESKTOP = "wlroots";
      XDG_SESSION_TYPE = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
    };
    systemd = {
      enable = true;
      extraCommands = [
        "systemctl --user stop river-session.target"
        "systemctl --user start river-session.target"
      ];
      variables = [
        "DISPLAY"
        "WAYLAND_DISPLAY"
        "XDG_CURRENT_DESKTOP"
        "NIXOS_OZONE_WL"
        "XCURSOR_THEME"
        "XCURSOR_SIZE"
      ];
    };
  };
}
