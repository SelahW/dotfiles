{pkgs, ...}: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
          ls = "ls -oah --color";
          c = "clear";
          fastfetch = "fastfetch --logo nixos_old";
      };
      initContent = ''bindkey '^F' autosuggest-accept'';
    };
    zoxide = { 
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        manager = {
          show_hidden = true;
          sort_by = "natural";
        };
        opener.edit = [{run = "nvim \"$@\""; block = true; desc = "Open with Neovim";}];
      };
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = builtins.fromTOML (builtins.readFile ./starship.toml);
    };
  };
}
