{lib, ...}: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    enableTransience = true;
    settings = {
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$cmd_duration"
        "$line_break"
        "$character"
      ];
      directory.style = "blue";
      character = {
        success_symbol = "[>](green)";
        error_symbol = "[>](red)";
        vimcmd_symbol = "[<](yellow)";
      };
      cmd_duration = {
        format = "[$duration]($style)";
        style = "yellow";
      };
      git_branch = {
        symbol = "";
        format = "[$symbol $branch]($style)";
        style = "bright-black";
      };
      git_state = {
        format = ''
          '\([$state( $progress_current/$progress_total)]($style)\) '
        '';
        style = "bright-black";
      };
      git_status = {
        format = ''
          "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)"
        '';
        style = "cyan";
        conflicted = "​";
        untracked = "​";
        modified = "​";
        staged = "​";
        renamed = "​";
        deleted = "​";
        stashed = "≡";
      };
    };
  };
}
