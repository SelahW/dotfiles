{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "FantasqueSansM Nerd Font";
      font-style = "Medium";
      font-size = "14";
      window-inherit-font-size = false;
      theme = "Everforest Dark Hard";
      shell-integration = "zsh";
      cursor-style = "block";
      cursor-style-blink = false;
      shell-integration-features = "no-cursor";
      term = "xterm-256color";
      window-decoration = false;
    };
  };
}
