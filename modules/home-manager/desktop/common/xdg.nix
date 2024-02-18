{config, pkgs, ...}: {
  home.packages = [pkgs.xdg-utils];
  xdg = {
    enable = true;
    cacheHome = "${config.home.homeDirectory}/.cache";
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";

    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        NIXOS_CONFIG = "${config.home.homeDirectory}/.repos/nixcfg";
      };
    };
    desktopEntries = {
      ffplay = {
        name = "FFPlay";
        type = "Application";
        exec = "${pkgs.ffmpeg-full}/bin/ffplay %U";
        categories = ["AudioVideo" "Audio" "Video" "Player"];
        mimeType = [
          "audio/webm"
          "audio/mp3"
          "audio/mp4"
          "video/avi"
          "video/mp4"
          "video/mpeg"
          "video/webm"
          "video/webm"
        ];
      };
      firefox = {
        name = "firefox";
        genericName = "Web Browser";
        exec = "${pkgs.firefox-esr}/bin/firefox-esr --new-tab %u";
        terminal = false;
        categories = ["Application" "Network" "WebBrowser"];
        mimeType = ["text/html" "text/xml"];
      };
      swayimg = {
        name = "swayimg";
        type = "Application";
        exec = "${pkgs.swayimg}/bin/swayimg %u";
        categories = ["Viewer"];
        mimeType = [ "image/png" "image/jpg" "image/jpeg" ];
      };
    };
    
    mime.enable = true;
    mimeApps = {
      enable = true;
      associations.added = {
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "image/png" = "swayimg.desktop";
        "image/jpg" = "swayimg.desktop";
        "image/jpeg" = "swayimg.desktop";
      };
      # associations.removed = {};
      defaultApplications = {
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "application/pdf" = "org.kde.okular.desktop";
        "image/png" = "swayimg.desktop";
        "image/jpg" = "swayimg.desktop";
        "image/jpeg" = "swayimg.desktop";
      };
    };
  };
}
