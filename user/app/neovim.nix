{pkgs, ...}: {
  programs.neovim = {
    enable = true; 
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      nixd
      nixfmt-rfc-style
      haskell-language-server
      lua-language-server
    ];
  };
  xdg.configFile."nvim" = {
          source = ./nvim;
          recursive = true;
  };
}
