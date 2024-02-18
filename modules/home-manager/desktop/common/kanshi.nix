{
  services.kanshi = {
    enable = true;
    systemdTarget = "graphical-session.target";
    profiles = {
      default = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            adaptiveSync = true;
            mode = "1366x768@60Hz";
            position = "0,0";
            scale = 1.0;
          }
        ];
      };
    };
  };
}
