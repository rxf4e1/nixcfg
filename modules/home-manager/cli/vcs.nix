{pkgs, ...}: {
  home.packages = [pkgs.pijul pkgs.lazygit];
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userEmail = "social.cwo1k@slmail.me";
    userName = "user";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
