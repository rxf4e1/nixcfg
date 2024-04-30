{pkgs, ...}:
let
  defaultSettings = import ./settings.nix;
in {
  # home.packages = [pkgs.firefox];
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-esr;
    policies = {
      ExtensionSettings = {
        "*".installation_mode = "allowed"; # "blocked";
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "vimium-c@gdh1995.cn" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-c/latest.xpi";
          installation_mode = "force_installed";
        };
        "{019b606a-6f61-4d01-af2a-cea528f606da}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/xbs/latest.xpi";
          installation_mode = "force_installed";
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        # "{3c078156-979c-498b-8990-85f7987dd929}" = {
        #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/sidebery/latest.xpi";
        #   installation_mode = "force_installed";
        # };
        # "{714a87ab-a1df-4c1e-9c5f-030058b2bfa4}" = {
        #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/alby/latest.xpi";
        #   installation_mode = "force_installed";
        # };
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          installation_mode = "force_installed";
        };
      };
      SearchEngines = {
        PreventInstalls = false;
        Default = "SwissCows";
        Add = [
          {
            Name = "StartPage";
            Alias = "@st";
            Method = "GET";
            URLTemplate = "https://www.startpage.com/sp/search?query={searchTerms}";
          }
          {
            Name = "SwissCows";
            Alias = "@sc";
            Method = "GET";
            URLTemplate = "https://swisscows.com/en/web?query={searchTerms}";
          }
          {
            Name = "SearXNG";
            Alias = "@sx";
            Method = "POST";
            URLTemplate = "https://priv.au/?q={searchTerms}";
            PostData = "q={searchTerms}&time_range=&language=en-US&category_general=on";
          }
          # {
          #   Name = "SearXNG";
          #   Alias = "@sx";
          #   Method = "POST";
          #   URLTemplate = "https://searx.be/?q={searchTerms}";
          #   PostData = "q={searchTerms}&time_range=&language=en-US&category_general=on";
          # }
        ];
        Remove = [
          "Amazon.com"
          "Google"
        ];
      };
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DisableFeedbackCommands = true;
      DisablePocket = true;
      DisableSetDesktopBackground = true;
      DisableDeveloperTools = false;
      DisplayBookmarksToolbar = "newtab";
      DisplayMenuBar = "default-off";
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
      PromptForDownloadLocation = true;
      HardwareAcceleration = true;
      NewTabPage = false;
      Homepage = {
        StartPage = "homepage";
        URL = "about:blank";
        Locked = true;
      };
      FirefoxHome = {
        Search = false;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Snippets = false;
        Locked = true;
      };
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
        Exceptions = [];
      };
      SearchBar = "unified"; # unified|separated
      Preferences = defaultSettings;
    };
    profiles = {
      default = {
        id = 0;
        name = "Default";
        isDefault = true;
        # settings = defaultSettings;
        # userChrome = import ./css/userChrome.css;
        # userContent = import ./css/userContent.css;
      };
      i2p = {
        id = 1;
        name = "I2P";
      };
    };
  };
}
