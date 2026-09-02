{config,pkgs,...}: {
 programs.ncspot = {
    enable = true;
    settings.theme = {
      primary = "white";
      secondary = "light black";
      title = "green";
      playing = "yellow";
      playing_bg = "black";
      highlight = "cyan";
      highlight_bg = "black";
      error_bg = "red";
      statusbar = "white";
      statusbar_progress = "cyan";
      statusbar_bg = "black";
      search_match = "red";
    };
  };
}
