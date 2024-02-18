{pkgs, 
# inputs, 
...}: {
  # programs.helix = {
  #   enable = true;
  #   package = inputs.helix-master.packages."x86_64-linux".default;
  # };
  home.packages = [pkgs.helix];
  home.sessionVariables.COLORTERM = "truecolor";
  home.sessionVariables.EDITOR = "hx";
}
