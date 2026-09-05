#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm glu openal pipewire-audio pipewire-jack

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

make-aur-package zenity-rs-bin

echo "Getting app..."
echo "---------------------------------------------------------------"
VERSION=1.8.5
echo "$VERSION" > ~/version
wget "https://api.rv.pkgforge.dev/https://projectmagma.net/downloads/myth2_updates/1.8.5%20Final%20(Build%20471b)/Myth2_185_Linux.tar.gz"
tar -xvf ./Myth2_185_Linux.tar.gz
rm -f ./*.gz ./*.pdf ./*.txt ./Myth2_32bit ./.DS_Store

mkdir -p ./AppDir/bin
mv -v ./plugins ./Myth2_64bit ./AppDir/bin
