{pkgs, ...}:

{
# programs.nixvim = {
#   plugins = {};
#   extraPlugins = withpkgs.vimPlugins; [];
#   colorscheme = "solarized";
#   options = {};
#   globals.mapleader = " ";
#   keymaps = [
#
#   ];
#   # extraConfig = '''';
# };

  home.packages = with pkgs; [ neovim ];
  home.sessionVariables.EDITOR = "nvim";
  home.shellAliases = {
      v = "nvs";
      vim = "nvim";
    };
}
