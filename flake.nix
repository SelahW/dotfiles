{
  description = "My System Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs = { nixpkgs.follows = "nixpkgs"; };
    };
  };

  outputs = { nixpkgs, home-manager, spicetify-nix, ... }@inputs:
    {
      nixosConfigurations = {
        theo-desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./system/configuration.nix
            ./system/mount-hdd.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.sharedModules = [ spicetify-nix.homeManagerModules.default ];
              home-manager.users.theo = ./user/home.nix;
            }
          ];
        };
      };
      homeConfigurations = {
        "dotfiles-linux" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./user/home.nix
            spicetify-nix.homeManagerModules.default
          ];
        };
        "dotfiles-mac" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./user/home.nix
            spicetify-nix.homeManagerModules.default
          ];
        };
      };
    };
}
