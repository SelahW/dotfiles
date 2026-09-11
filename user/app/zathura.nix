{pkgs, ...}: {
  programs.zathura = {
    enable = true;
    options = {
      default-fg = "#d3c6aa";
      default-bg = "#4b565c";
      statusbar-fg = "#d3c6aa";
      statusbar-bg = "#2b3339";
      inputbar-bg = "#2b3339";
      inputbar-fg = "#d3c6aa";
      notification-bg = "#2b3339";
      notification-fg = "#d3c6aa";
      notification-error-bg = "#2b3339";
      notification-error-fg = "#d3c6aa";
      notification-warning-bg = "#2b3339";
      notification-warning-fg = "#d3c6aa";
      highlight-color = "#4b565c";
      highlight-active-color = "#e67e80";
      completion-bg = "#2b3339";
      completion-fg = "#d3c6aa";
      completion-highlight-fg = "#4b565c";
      completion-highlight-bg = "#2b3339";
      recolor-lightcolor= "#2b3339";
      recolor-darkcolor= "#d3c6aa";
      recolor = "true";
      recolor-keephue = "false";
    };
  };
}
