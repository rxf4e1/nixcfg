{pkgs, inputs, ...}: {
  # home.packages = [pkgs.helix];
  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;
  };
  # home.sessionVariables.EDITOR = "hx";
}
