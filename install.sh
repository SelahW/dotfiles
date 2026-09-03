#!/usr/bin/env bash
set -e

echo "======================================="
echo "==Dotfiles Configuration Bootstrapper=="
echo "======================================="
echo ""
USERNAME=$(logname 2>/dev/null || echo ${USER:-$(whoami)})
echo "Detected system username: [$USERNAME]"
if [[ "$(uname)" == "Linux" ]]; then
    ARCH="x86_64-linux"
    HOMEDIR="home/"
    COMMAND="nix run github:nix-community/home-manager -- switch --flake .#dotfiles-linux"
elif [[ "$(uname)" == "Darwin" ]]; then
    ARCH="aarch64-darwin"
    HOMEDIR="Users/"
    COMMAND="nix run github:nix-community/home-manager -- switch --flake .#dotfiles-mac"
else
    echo "Error: System not Linux or MacOS" >&2
    exit 1
fi
echo "Detected system architecture: [$ARCH]"
sed -i "s/.*username =.*/  username = \"$USERNAME\";/" ./user/identity.nix
sed -i "s/.*architecture =.*/  architecture = \"$ARCH\";/" ./user/identity.nix
sed -i "s|.*homeDir =.*|  homeDir = \"$HOMEDIR\";|" ./user/identity.nix

echo "======================================="
echo "=======Ready to install dotfiles======="
echo "======================================="
echo " User: $USERNAME"
echo " Home Directory: ${HOMEDIR}${USERNAME}"
echo " Architecture: $ARCH"
echo " Command to be run: $COMMAND"
echo "======================================="
echo ""
read -p "Begin installation? [Y/n]: " YESNO
if [[ "$YESNO" == "y" || "$YESNO" == "Y" ]]; then
    $COMMAND
else
    echo "Exiting"
    exit 1
fi
