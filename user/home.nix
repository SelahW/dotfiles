{ pkgs, inputs, ... }:
let
  identity = import ./identity.nix;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  tex = import ./app/tex.nix pkgs;
in
{
  imports = [
    ./app/zsh.nix
    ./app/ghostty.nix
    ./app/neovim.nix
    ./app/rofi.nix
    ./app/xmobar.nix
    ./app/xmonad.nix
    ./app/zathura.nix
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
      ripgrep
      fd
      ffmpeg
      # Other apps, you maybe want these
      firefox
      equibop
      feh
      vlc
      steam
      osu-lazer-bin
      xmobar
      tex
      # Fonts, you maybe want these / feel free to add your own
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka-term
      nerd-fonts.go-mono
      nerd-fonts.victor-mono
      nerd-fonts.caskaydia-cove
      nerd-fonts.fantasque-sans-mono
      inter
      noto-fonts
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
      monospace = [ "FantasqueSansM Nerd Font" ];
      sansSerif = [ "Inter" ];
      serif = [ "Noto Serif" ];
    };
  };
  dconf.settings = { "org/gnome/desktop/interface" = { color-scheme = "prefer-dark"; };
  };
  programs = {
    git.enable = true;
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [ obs-pipewire-audio-capture ];
    };
    spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [ shuffle ];
      theme = spicePkgs.themes.text;
      colorScheme = "EverforestDarkHard";
    };
  };
  home.stateVersion = "26.05";
}
