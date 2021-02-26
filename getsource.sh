#!/bin/bash

# Change the path below as needed
DOWNLOAD_PATH="$HOME/Downloads"
GIT_URL=https://github.com/eworm-de/mkinitcpio-ykfde.git
PKG_NAME=mkinitcpio-ykfde
RPMSOURCEDIR="$HOME/rpmbuild/SOURCES"
VERSION=0.7.7

if [ -z "$DOWNLOAD_PATH" ]
then
  echo "Download location not specified... Exiting..."
  exit 1
fi

mkdir -p "$DOWNLOAD_PATH"
cd "$DOWNLOAD_PATH"

git clone $GIT_URL "./${PKG_NAME}-${VERSION}"
tar -zcpvf "$RPMSOURCEDIR/${PKG_NAME}-${VERSION}.tar.gz" "${PKG_NAME}-${VERSION}"
rm -rf "./${PKG_NAME}-${VERSION}"


