# My Dotfiles and System config
Managed by [nix flakes](https://wiki.nixos.org/wiki/Flakes).
## Installation steps:
### 1. Clone repo
```bash
git clone https://github.com/SelahW/dotfiles ~/.config/dotfiles
cd ~/.config/dotfiles
```

### 2. Run Bootstrapper Script
Execute the file
```bash
./install.sh
```
to populate your username and architecture into `home.nix`.

> [!IMPORTANT]
> This installation will install symlinks pointing to the nix store and populate them in `~/.config`. By default, it will _not_ overwrite files, or back them up. If there are existing files (for example `~/.config/nvim/init.lua`) the build will fail.

> [!IMPORTANT]
> Do not run as root, and do not target the `.#theo-desktop` flake output. That is tailored to my system and will likely do weird things on yours.
