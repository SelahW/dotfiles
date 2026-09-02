{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "IosevkaTerm NF";
      font-style = "Medium";
      font-style-bold = "SemiBold Oblique";
      font-style-italic = "Medium Italic";
      font-style-bold-italic = "SemiBold Italic";
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
