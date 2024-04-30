{pkgs, ...}:
{
  # home.packages = [pkgs.vivaldi];
  programs.chromium = {
    enable = true;
    # package = pkgs.ungoogled-chromium;
    package = pkgs.chromium;
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--ozone-platform-hint=auto"
      "--disable-beforeunload"
      "--disable-grease-tls"
      "--http-accept-header"
      "--disable-search-engine-collection"
      "--extension-mime-request-handling=always-prompt-for-install"
      "--fingerprinting-canvas-image-data-noise"
      "--fingerprinting-canvas-measuretext-noise"
      "--fingerprinting-client-rects-noise"
      "--force-punycode-hostnames"
      "--max-connections-per-host=6"
      "--omnibox-autocomplete-filtering=search-bookmarks-chrome"
      "--popups-to-tabs"
      "--bookmark-bar-ntp"
      "--tab-hover-cards=none"
      "--disable-top-sites"
      "--disable-webgl"
      "--force-dark-mode"
      "--no-default-browser-check"
      "--no-pings"
      "--webrtc-ip-handling-policy"
      "--block-new-web-contents"
      "--disable-background-networking"
      "--disable-breakpad"
      "--disable-crash-reporter"
      "--extension-content-verification=enforce_strict"
      "--extensions-install-verification=enforce"
      "--gpu-rasterization-msaa-sample-count=0"
      "--lite-video-force-override-decision"
      "--isolation-by-default"
    ];
    extensions = [
      # Install chromium first, so it installs the extensions, then change to ungoogled-chromium.
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } #uBlock-Origin
      { id = "lcbjdhceifofjlpecfpeimnnphbcjgnc"; } # xBrowserSync
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
    ];
  };
  
}
