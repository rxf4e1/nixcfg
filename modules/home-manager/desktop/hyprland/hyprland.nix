{
  "$mod" = "SUPER";

  monitor = [
    "eDP-1,1366x768@60,auto,1"
    "HDMI-A-1,1920x1080@60,auto,1"
  ];

  exec-once = [
    "pkill dunst && dunst >/dev/null 2>&1"
    "pkill kanshi && kanshi >/dev/null 2>&1"
    "pkill wlsunset && wlsunset -l -23.5 -L -43.5"
    "pkill foot && foot --server"
    ''notify-send -t 2048 "Let's Hack!"''
  ];

  input = {
    kb_layout = "br";
    kb_variant = "abnt2";
    kb_options = "caps:ctrl_modifier";
    repeat_delay = "300";
    repeat_rate = "80";
    follow_mouse = "2";
    sensitivity = "0";
  };
  "device:razer-razer-abyssus-2000" = { sensitivity = "-0.5"; };
  "device:elan0504:01-04f3:312a-touchpad" = {
    enabled = true;
    sensitivity = "0.0";
  };
  misc = {
    disable_hyprland_logo = true;
    disable_splash_rendering = true;
    vfr = true;
    vrr = false;
  };
  
  general = {
    gaps_in = "3";
    gaps_out = "5";
    border_size = "2";
    "col.active_border" = "rgba(833ab4ee) rgba(fd1d1dee) rgba(d8ff13ee) 45deg";
    "col.inactive_border" = "rgb(60b484)";
    cursor_inactive_timeout = "2";
    layout = "dwindle";
  };

  group = {
    "col.border_active" = "rgba(833ab4ee) rgba(fd1d1dee) rgba(d8ff13ee) 45deg";
    "col.border_inactive" = "rgb(60b484)";
    groupbar = {
      enabled = true;
      gradients = true;
      render_titles = true;
      "col.active" = "rgb(000000)";
      "col.inactive" = "rgb(808080)";
    };
  };

  master = {
    allow_small_split = true;
    new_is_master = false;
    orientation = "center";
    special_scale_factor = "0.8";
  };

  dwindle = {
    pseudotile = true;
    force_split = "0";
    preserve_split = true;
    split_width_multiplier = "1.0";
    use_active_for_splits = true;
    no_gaps_when_only = false;
    special_scale_factor = "0.8";
  };
  
  decoration = {
    rounding = "0";
    active_opacity = "1.0";
    inactive_opacity = "0.9";
    blur = { enabled = false; };
    drop_shadow = false;
  };

  animations = {
    enabled = true;
    bezier = [
      "mybezier,0,0,0,0"
      "upp,0.5,1,0.5,1"
      "downn,1,0.5,1,0.5"
    ];
    animation = [
      "windows,1,3,mybezier,slide"
      "windowsOut,1,3,mybezier,popin 20%"
      "fade,1,3,mybezier"
      "workspaces,1,3,mybezier,slidevert"
    ];
  };

  windowrule = [ "float,dialog" "float,title:Open File" ];
  windowrulev2 = [ "float,class:^(float)$" "float,class:^(mpv)$" ];

  workspace = [
    "1,name:one,default:true"
    "2,name:two"
    "3,name:three"
    "4,name:four"
  ];

  bind = [
    "$mod,Escape,exit"
    "$mod,Space,togglefloating,"
    "$mod,F,fullscreen,"
    "$mod SHIFT,Q,killactive,"
    "$mod,V,togglesplit,"

    "$mod,Q,exec,wezterm"
    "$mod D,exec,bemenu-run"
    # "$mod,D,exec,foot --app-id float -w 300x150 fzf-menu"
    "$mod,M,exec,emw"

    ",Print,exec,grimshot --notify copy area"
    "SHIFT,Print,exec,grimshot --notify save area $HOME/Pictures/$(date +'%Y%m%d-%H%M%S')_ss.png"

    "$mod,left,movefocus,l"
    "$mod,right,movefocus,r"
    "$mod,up,movefocus,u"
    "$mod,down,movefocus,d"
    "$mod,H,movefocus,l"
    "$mod,L,movefocus,r"
    "$mod,K,movefocus,u"
    "$mod,J,movefocus,d"
    
    "$mod,1,workspace,1"
    "$mod,2,workspace,2"
    "$mod,3,workspace,3"
    "$mod,4,workspace,4"
    "$mod,5,workspace,5"

    "$mod SHIFT,1,movetoworkspace,1"
    "$mod SHIFT,2,movetoworkspace,2"
    "$mod SHIFT,3,movetoworkspace,3"
    "$mod SHIFT,4,movetoworkspace,4"
    "$mod SHIFT,5,movetoworkspace,5"
    
    ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_SINK@ 5%-"
    ",XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_SINK@ 5%+"
    ",XF86AudioMute,exec,wpctl set-mute @DEFAULT_SINK@ toggle"
    ",XF86AudioMicMute,exec,wpctl set-mute @DEFAULT_SINK@ toggle"
    ",XF86MonBrightnessUp,exec,light -A 10.0"
    ",XF86MonBrightnessDown,exec,light -U 10.0"
    ",XF86AudioPlay,exec,playerctl play-pause"
    ",XF86AudioPrev,exec,playerctl previous"
    ",XF86AudioNext,exec,playerctl next"
    
    "$mod,G,togglegroup"
    "$mod,TAB,changegroupactive"
    
    "$mod SHIFT,S,movetoworkspace, special"
    "$mod,S,togglespecialworkspace"
  ];

  binde = [
    "$mod CTRL,left,resizeactive,-20 0"
    "$mod CTRL,right,resizeactive,20 0"
    "$mod CTRL,up,resizeactive,0 -20"
    "$mod CTRL,down,resizeactive,0 20"
    "$mod CTRL,H,resizeactive,-20 0"
    "$mod CTRL,L,resizeactive,20 0"
    "$mod CTRL,K,resizeactive,0 -20"
    "$mod CTRL,J,resizeactive,0 20"
  ];
  
  bindm = [
    "$mod,mouse:272,movewindow"
    "$mod,mouse:273,resizewindow"
  ];
}
