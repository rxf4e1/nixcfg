{pkgs, ...}: let

  startw = pkgs.writeShellScriptBin "startw" ''
    cd ~
    
    export XDG_RUNTIME_DIR=/run/user/$(id -u)
    
    if [ -z $DISPLAY ]; then
       dbus-run-session dwl
    else
       echo "dwl is running."
    fi
  '';

  dbus-dwl-environment = pkgs.writeTextFile {
    name = "dbus-dwl-environment";
    destination = "/bin/dbus-dwl-environment";
    executable = true;
    text = ''
      dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE NIXOS_OZONE_WL
      systemctl --user stop pipewire wireplumber xdg-desktop-portal xdg-desktop-portal-wlr
      systemctl --user start pipewire wireplumber xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };

in
  {
    home.packages = with pkgs; [
      dwl
      startw 
      # dbus-dwl-environment
    ];

    nixpkgs.overlays = [
      (final: prev: { dwl = prev.dwl.override {conf = ./dwl-config.h; }; })
    ];

    
    home.sessionVariables = {
      LIBSEAT_BACKEND = "logind";
      GDK_BACKEND = "wayland";
      CLUTTER_BACKEND = "wayland";
      SDL_VIDEODRIVER = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      XDG_CURRENT_DESKTOP = "dwl";
      XDG_SESSION_DESKTOP = "wlroots";
      XDG_SESSION_TYPE = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
    };

    systemd.user.targets.dwl-session = {
      Unit = {
        Description = "dwl compositor session";
        BindsTo = ["graphical-session.target"];
        Wants = ["graphical-session-pre.target"];
        After = ["graphical-session-pre.target"];
      };
    };
  }
