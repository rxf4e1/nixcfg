{
  # Gfx
  "gfx.canvas.accelerated.cache-items" = 4096;
  "gfx.canvas.accelerated.cache-size" = 512;
  "gfx.content.skia-font-cache-size" = 20;
  # Disk Cache
  "browser.cache.jsbc_compression_level" = 3;
  # Media Cache
  "media.memory_cache_max_size" = 65536;
  "media.cache_readahead_limit" = 7200;
  "media.cache_resume_threshold" = 3600;
  # Network
  "network.buffer.cache.size" = 262144;
  "network.buffer.cache.count" = 128;
  "network.http.max-connections" = 1800;
  "network.http.max-persistent-connections-per-server" = 10;
  "network.http.max-urgent-start-excessive-connections-per-host" = 5;
  "network.http.pacing.requests.enabled" = false;
  "network.dnsCacheExpiration" = 3600;
  "network.dns.max_high_priority_threads" = 8;
  "network.ssl_tokens_cache_capacity" = 10240;
  # Speculative Loading
  "network.dns.disablePrefetch" = true;
  "network.prefetch-next" = false;
  "network.predictor.enabled" = false;
  # Experimental
  "layout.css.grid-template-masonry-value.enabled" = true;
  "dom.enable_web_task_scheduling" = true;
  "layout.css.has-selector.enabled" = true;
  "dom.security.sanitizer.enabled" = true;
  ## SecureFox
  # Tracking Protection
  "browser.contentblocking.category" = "strict";
  "network.cookie.sameSite.noneRequiresSecure" = true;
  "browser.download.start_downloads_in_tmp_dir" = true;
  "browser.helperApps.deleteTempFileOnExit" = true;
  "browser.uitour.enabled" = false;
  # OCSP & CERTS / HPKP
  "security.OCSP.enabled" = 0;
  # SSL / TLS
  "browser.xul.error_pages.expert_bad_cert" = true;
  "security.tls.enable_0rtt_data" = false;
  # DISK AVOIDANCE
  "browser.privatebrowsing.forceMediaMemoryCache" = true;
  "browser.sessionstore.interval" = 60000;
  # SEARCH / URL BAR
  "keyword.enabled" = true;
  "browser.fixup.alternate.enabled" = true;
  "browser.search.separatePrivateDefault.ui.enabled" = true;
  "browser.search.suggest.enabled" = false;
  "browser.urlbar.suggest.searches" = true;
  "browser.urlbar.update2.engineAliasRefresh" = true;
  "browser.urlbar.suggest.quicksuggest.sponsored" = false;
  "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
  "browser.formfill.enable" = false;
  "security.insecure_connection_text.enabled" = true;
  "security.insecure_connection_text.pbmode.enabled" = true;
  "network.IDN_show_punycode" = true;
  # HTTPS-FIRST POLICY
  "dom.security.https_first" = true;
  # PASSWORDS
  "signon.rememberSignons" = false;
  "signon.formlessCapture.enabled" = false;
  "signon.privateBrowsingCapture.enabled" = false;
  "network.auth.subresource-http-auth-allow" = 1;
  # ADDRESS + CREDIT CARD MANAGER
  "extensions.formautofill.addresses.enabled" = false;
  "extensions.formautofill.creditCards.enabled" = false;
  # MIXED CONTENT + CROSS-SITE
  "pdfjs.enableScripting" = false;
  "extensions.postDownloadThirdPartyPrompt" = false;
  # HEADERS / REFERERS
  "network.http.referer.XOriginTrimmingPolicy" = 2;
  # WEBRTC
  "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
  "media.peerconnection.ice.default_address_only" = true;
  # SAFE BROWSING
  "browser.safebrowsing.downloads.remote.enabled" = false;
  # CRASH REPORTS
  "browser.tabs.crashReporting.sendReport" = false;
  "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
  # DETECTION
  "network.captive-portal-service.enabled" = false;
  "network.connectivity-service.enabled" = false;
  ## Peskyfox
  # MOZILLA UI
  "browser.privatebrowsing.vpnpromourl" = "";
  "extensions.getAddons.showPane" = false;
  "extensions.htmlaboutaddons.recommendations.enabled" = false;
  "browser.discovery.enabled" = false;
  "browser.shell.checkDefaultBrowser" = false;
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
  "browser.preferences.moreFromMozilla" = false;
  "browser.tabs.tabmanager.enabled" = false;
  "browser.aboutConfig.showWarning" = false;
  "browser.aboutwelcome.enabled" = false;
  # THEME ADJUSTMENTS
  "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
  "browser.compactmode.show" = true;
  "browser.display.focus_ring_on_anything" = true;
  "browser.display.focus_ring_style" = 0;
  "browser.display.focus_ring_width" = 0;
  "layout.css.prefers-color-scheme.content-override" = 2;
  # URL BAR
  "browser.urlbar.suggest.calculator" = true;
  "browser.urlbar.unitConversion.enabled" = true;
  "browser.urlbar.trending.featureGate" = false;
  # NEWTAB PAGE
  "browser.newtabpage.activity-stream.feeds.topsites" = false;
  "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
  # POCKET
  "extensions.pocket.enabled" = false;
  # DOWNLOADS
  "browser.download.useDownloadDir" = false;
  "browser.download.always_ask_before_handling_new_types" = true;
  "browser.download.manager.addToRecentDocs" = false;
  # PDF
  "browser.download.open_pdf_attachments_inline" = true;
  # TAB BEHAVIOR
  "browser.bookmarks.openInTabClosesMenu" = false;
  "browser.menu.showViewImageInfo" = true;
  "layout.word_select.eat_space_to_next_word" = false;
  ## USER DEFINED
  "layout.css.devPixelsPerPx" = "0.9";
  "ui.systemUsesDarkTheme" = 1;
}
