#!/bin/sh

set -e

echo "==> Detecting package manager..."

if command -v xbps-install >/dev/null 2>&1; then
    echo "==> Void Linux detected. Installing dependencies..."
    sudo xbps-install -Sy base-devel libX11-devel libXft-devel libXinerama-devel fontconfig-devel
elif command -v pacman >/dev/null 2>&1; then
    echo "==> Arch Linux detected. Installing dependencies..."
    sudo pacman -S --needed --noconfirm base-devel libx11 libxft libxinerama fontconfig
elif command -v apt >/dev/null 2>&1; then
    echo "==> Debian/Ubuntu detected. Installing dependencies..."
    sudo apt update && sudo apt install -y build-essential libx11-dev libxft-dev libxinerama-dev libfontconfig1-dev
else
    echo "==> Unknown distro. Please ensure build dependencies (X11, Xft, Xinerama, fontconfig, make, gcc) are installed."
fi

echo "==> Cleaning old build artifacts..."
make clean

echo "==> Building and installing dwm..."
sudo make clean install

echo "==> Done! dwm-gruvbox successfully installed."