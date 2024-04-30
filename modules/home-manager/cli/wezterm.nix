{
  # home.sessionVariables.TERM = "wezterm";
  programs.wezterm = {
    enable = false;
    enableBashIntegration = true;
    enableZshIntegration = true;
    extraConfig = ''
      return {
        term = "wezterm",
        enable_wayland = true,
        -- color_scheme = "matrix",
        -- color_scheme = "Modus-Vivendi",
        -- color_scheme = "tokyonight",
        color_scheme = "Colors (base16)",
        font = wezterm.font("Input Mono"),
        font_size = 9.0,
        default_cursor_style = "BlinkingUnderline",
        window_background_opacity = 0.95,
        window_decorations = "NONE",
        enable_tab_bar = false,
        hide_tab_bar_if_only_one_tab = true,
        -- keymaps
        disable_default_key_bindings = false,
      }
    '';
  };
}
