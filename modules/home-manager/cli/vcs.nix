{pkgs, ...}: {
  home.packages = [pkgs.pijul pkgs.lazygit];

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
