{pkgs, ...}: let
  startw = pkgs.writeShellScriptBin "startw" ''
    cd ~
    if [ -z $DISPLAY ]; then
       exec Hyprland
    else
       echo "Hyprland is running."
    fi
  '';
in {
  home.packages = [ startw ];
  
  wayland.windowManager.hyprland = {
    enable = true;
    # package = pkgs.inputs.hyprland.hyprland;
    xwayland.enable = true;
    settings = import ./hyprland.nix;
    # extraConfig = '''';
    systemd = {
      enable = true;
      extraCommands = [
        "systemctl --user stop hyprland-session.target"
        "systemctl --user start hyprland-session.target"
      ];
      variables = [
        "DISPLAY"
        "HYPRLAND_INSTANCE_SIGNATURE"
        "WAYLAND_DISPLAY"
        "XDG_CURRENT_DESKTOP"
      ];
    };
  };
    
}
