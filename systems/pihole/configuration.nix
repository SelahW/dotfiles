{config, lib, pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot = {
    loader.grub.enable = false;
    loader.generic-extlinux-compatible.enable = true;
  }; 

  networking = {
    hostName = "TheoPi";
    useDHCP = false;
    interfaces.enu1u1.useDHCP = false;
    interfaces.enu1u1.ipv4.addresses = [{
        address = "192.168.1.57";
        prefixLength = 24;
    }];
    defaultGateway = "192.168.1.1";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 22 53 80 ];
    firewall.allowedUDPPorts = [ 53 ];
  };
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };
  environment.systemPackages = with pkgs; [ vim git curl ];
  users.users.root.initialPassword = "nixos";
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
  console.keyMap = "us";
  system.stateVersion = "26.05";
}
