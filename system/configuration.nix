# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{config, lib, pkgs, ...}: {
  imports = [
  ./hardware-configuration.nix
  ];

  # Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Graphics & OTD
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    opentabletdriver.enable = true;
    uinput.enable = true;
  };

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  # XDG Portal
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  # DBus
  services.dbus.enable = true;
  programs.dconf.enable = true;


  # XMonad, Ly, xscreensaver
  services = {
    xserver = {
      enable = true;
      windowManager.xmonad.enable = true;
    };
    displayManager.ly.enable = true;
    xscreensaver.enable = true;
    libinput.enable = true;
  };
  security.pam.services.xscreensaver.enable = true;

  # Bootloader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      consoleMode = "max";
    };
    efi.canTouchEfiVariables = true;
  };
  boot.kernelModules = [ "uinput" ];

  # Networking
  networking.hostName = "theo-desktop";
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
      extraGroups = ["networkmanager" "wheel" "input" "uinput"];
      packages = [];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System Packages
  environment.systemPackages = with pkgs; [xinit xscreensaver];
  
  # ZSH default
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # See man configuration.nix or https://nixos.org/nixos/options.html
  system.stateVersion = "26.05";
}
