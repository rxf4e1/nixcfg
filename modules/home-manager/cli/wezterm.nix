{
  home.sessionVariables.TERM = "wezterm";
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    extraConfig = ''
      return {
        term = "wezterm",
        enable_wayland = true,
        -- color_scheme = "matrix",
        color_scheme = "Modus-Vivendi",
        -- color_scheme = "tokyonight",
        -- color_scheme = "Solarized Dark - Patched",
        font_size = 9.0,
        default_cursor_style = "BlinkingUnderline",
        window_background_opacity = 0.95,
        window_decorations = "NONE",
        enable_tab_bar = false,
        hide_tab_bar_if_only_one_tab = true,
        -- keymaps
        disable_default_key_bindings = false,

        leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
        keys = {
          -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
          {
            key = 'a',
            mods = 'LEADER|CTRL',
            action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
          },
          {
            key = '%',
            mods = 'LEADER|SHIFT',
            action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
          },
          {
            key = '_',
            mods = 'LEADER|SHIFT',
            action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
          },
          {
            key = 'Enter',
            mods = 'ALT',
            action = wezterm.action.DisableDefaultAssignment,
          },
        },

      }
    '';
  };
}
