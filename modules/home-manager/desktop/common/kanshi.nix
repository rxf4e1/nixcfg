{pkgs, ...}: {
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

  # systemd.user.services.kanshi = {
  #   Unit = {
  #     Description = "This is a Wayland equivalent for tools like autorandr.";
  #     Documentation = "kanshi(1) man:kanshi(5)";
  #     PartOf = "graphical-session.target";
  #   };
  #   Service = {
  #     Type = "simple";
  #     ExecStart = "{pkgs.kanshi}/bin/kanshi";
  #   };
  #   Install.WantedBy = ["river-session.target"];
  # };
}
