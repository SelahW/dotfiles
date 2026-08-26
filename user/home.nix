{pkgs, ...}: {
  imports = [
    ./app/zsh.nix
    ./app/ghostty.nix
    ./app/neovim.nix
    ./app/rofi.nix
    ./app/xmonad.nix
  ];
  home.packages = [
    pkgs.atool
    pkgs.httpie
    pkgs.fastfetch
  ];
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
