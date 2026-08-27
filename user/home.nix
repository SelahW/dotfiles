{pkgs, ...}: {
  imports = [
    ./app/zsh.nix
    ./app/ghostty.nix
    ./app/neovim.nix
    ./app/rofi.nix
    ./app/xmonad.nix
  ];
  home = {
    packages = [
      pkgs.atool
      pkgs.httpie
      pkgs.fastfetch
      pkgs.osu-lazer-bin
    ];
    pointerCursor = {
      enable = true;
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size = 32;
      gtk.enable = true;
      x11.enable = true;
      x11.defaultCursor = "left_ptr";
    };
  };

  programs = {
    git.enable = true;
  };
  dconf.settings= {
    "org/gnome/desktop/interface" = {
     color-scheme = "prefer-dark";
    };
  };
  home.stateVersion = "26.05";
}
