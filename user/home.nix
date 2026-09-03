{pkgs, ...}: let identity = import ./identity.nix; in {
  imports = [
    ./app/zsh.nix
    ./app/ghostty.nix
    ./app/neovim.nix
    ./app/rofi.nix
    ./app/ncspot.nix
    ./app/xmonad.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  targets.genericLinux.enable = true;
  home = {
    packages = with pkgs; [
      # CLI things, you probably want these
      wget
      git
      gh
      xclip
      scrot
      atool
      httpie
      ghc
      btop
      fastfetch
      # Other apps, you maybe want these
      firefox
      equibop
      feh
      ncspot
      vlc
      obs-studio
      steam
      osu-lazer-bin
      # Fonts, you maybe want these
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      iosevka
      nerd-fonts.iosevka-term
      nerd-fonts.go-mono
    ];
    username = identity.username;
    homeDirectory = "/${identity.homeDir}${identity.username}";
    pointerCursor = {
      enable = true;
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size = 32;
      gtk.enable = true;
      x11.enable = true;
    };
  };
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["IosevkaTerm Nerd Font Medium"];
      sansSerif = ["Iosevka Aile"];
      serif = ["Iosevka Etoile"];
    };
  };
  programs.git.enable = true;
  dconf.settings= {
    "org/gnome/desktop/interface" = {
     color-scheme = "prefer-dark";
    };
  };
  home.stateVersion = "26.05";
}
