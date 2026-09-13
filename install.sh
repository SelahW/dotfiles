#!/usr/bin/env bash
set -e

echo "======================================="
echo "==Dotfiles Configuration Bootstrapper=="
echo "======================================="
echo ""
USERNAME=$(logname 2>/dev/null || echo ${USER:-$(whoami)})
BATTERYID=""
if [[ "$(uname)" == "Linux" ]]; then
    ARCH="x86_64-linux"
    HOMEDIR="home/"
    COMMAND="nix run github:nix-community/home-manager -- switch --flake .#dotfiles-linux"
    if [ -f /etc/os-release ]; then
        DISTRO=$(grep -m 1 "ID=" /etc/os-release | cut -d"=" -f2-)
    else
        DISTRO="linux"
    fi
    if [ -d /proc/acpi/button/lid ] || ls /sys/class/power_supply/ | grep -q "^BAT"; then
        ISLAPTOP="true"
        BATTERYID=$(ls /sys/class/power_supply/ | grep "BAT" )
    else
        ISLAPTOP="false"
    fi
elif [[ "$(uname)" == "Darwin" ]]; then
    ARCH="aarch64-darwin"
    HOMEDIR="Users/"
    COMMAND="nix run github:nix-community/home-manager -- switch --flake .#dotfiles-mac"
    DISTRO="macos"
    if ioreg -r -d 1 -c AppleSmartBattery | grep -q "AppleSmartBattery"; then
        ISLAPTOP=true
    else
        ISLAPTOP=false
    fi
else
    echo "Error: System not Linux or MacOS" >&2
    exit 1
fi
sed -i "s/.*username =.*/  username = \"$USERNAME\";/" ./user/identity.nix
sed -i "s/.*architecture =.*/  architecture = \"$ARCH\";/" ./user/identity.nix
sed -i "s|.*homeDir =.*|  homeDir = \"$HOMEDIR\";|" ./user/identity.nix
sed -i "s/.*isLaptop =.*/  isLaptop = $ISLAPTOP;/" ./user/identity.nix
sed -i "s/.*distro =.*/  distro = \"$DISTRO\";/" ./user/identity.nix
sed -i "s/.*batteryID =.*/  batteryID = \"$BATTERYID\";/" ./user/identity.nix

echo "======================================="
echo "=======Ready to install dotfiles======="
echo "======================================="
echo "| User: $USERNAME"
echo "| Home Directory: ${HOMEDIR}${USERNAME}"
echo "| Architecture: $ARCH"
echo "| Distro: $DISTRO"
echo "| Laptop?: $ISLAPTOP"
echo "| Command that will run: "
echo "| $COMMAND"
echo "======================================="
echo ""
read -p "Begin installation? [Y/n]: " YESNO
if [[ "$YESNO" == "y" || "$YESNO" == "Y" ]]; then
    $COMMAND
else
    echo "Exiting"
    exit 1
fi
