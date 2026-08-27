# My Dotfiles and System config
Managed by [nix flakes](https://wiki.nixos.org/wiki/Flakes).
### 1. Clone repo
```bash
git clone https://github.com/SelahW/dotfiles ~/.config/dotfiles
cd ~/.config/dotfiles
```

### 2. Configure username and run 'nix run'
Run the following to replace "guest" in flake.nix with your username.
#### (a). If you are on a non-NixOS linux distro:
```bash
sed -i -e "s/guest/$(whoami)/g" flake.nix
nix run github:nix-community/home-manager -- switch --flake .#dotfiles-linux
```
#### (b). If you are on MacOS:
```bash
sed -i "" "s/guest/$(whoami)/g" flake.nix
nix run github:nix-community/home-manager -- switch --flake .#dotfiles-mac
```
