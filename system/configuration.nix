# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{config, pkgs, ...}: {
  imports = [
  ./hardware-configuration.nix
  ];

  # Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # DBus
  services.dbus.enable = true;
  programs.dconf.enable = true;

  # Fonts
  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      nerd-fonts.iosevka-term
      nerd-fonts.go-mono
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "IosevkaTerm Nerd Font Medium" ];
      };
    };
  };

  # XMonad and Ly
  services = {
    xserver = {
      enable = true;
      windowManager.xmonad.enable = true;
    };
    displayManager.ly.enable = true;
  };

  # Bootloader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      consoleMode = "max";
    };
    efi.canTouchEfiVariables = true;
  };

  # Networking
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Locale and time zone.
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Keyboard layout
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

 # User account
  users.users = {
    "theo" = {
      isNormalUser = true;
      description = "Theo Koss";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System Packages
  environment.systemPackages = with pkgs; [wget git ghostty firefox equibop scrot xclip feh xinit gh];

  # ZSH default
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # See man configuration.nix or https://nixos.org/nixos/options.html
  system.stateVersion = "26.05";
}
