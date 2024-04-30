{ pkgs, ... }:

{
  home.packages = with pkgs; [ kakoune kak-lsp ];
  home.sessionVariables.EDITOR = "kak";
  home.shellAliases.k = "kak";
}
