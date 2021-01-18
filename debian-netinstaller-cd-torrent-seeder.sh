#!/bin/bash

# Debian Netinst torrent file location
# available at https://www.debian.org/CD/torrent-cd/
# TORRENT_URL="https://cdimage.debian.org/debian-cd/current/i386/bt-cd/debian-10.7.0-i386-netinst.iso.torrent"
TORRENT_URL="https://cdimage.debian.org/debian-cd/current/amd64/bt-cd/debian-10.7.0-amd64-netinst.iso.torrent"

# Programs path
NODE_PATH="/usr/bin/node"
NPM_PATH="/usr/bin/npm"
WGET_PATH="/usr/bin/wget"
MKDIR_PATH="/bin/mkdir"
BASENAME_PATH="/usr/bin/basename"

# Folders
BASE_FOLDER="/tmp/torrentcli"
DL_FOLDER="$BASE_FOLDER/dl"
NODE_MODULES_FOLDER="$BASE_FOLDER/node_modules"
WEBTORRENT_CLI_PATH="$NODE_PATH $NODE_MODULES_FOLDER/webtorrent-cli/bin/cmd.js"
TORRENT_FILE=$($BASENAME_PATH $TORRENT_URL)

# Create the project base folder
if [ ! -d "$BASE_FOLDER" ]; then
    $MKDIR_PATH $BASE_FOLDER
else
    echo "$BASE_FOLDER exists. Skipping..."
fi

# Create the download folder
if [ ! -d "$DL_FOLDER" ]; then
    $MKDIR_PATH $DL_FOLDER
else
    echo "$MKDIR_PATH exists. Skipping..."
fi

# Switch to the project base folder
cd $BASE_FOLDER

# Install "webtorrent-cli"
if [ ! -d "$NODE_MODULES_FOLDER" ]; then
    $NPM_PATH install webtorrent-cli
else
    echo "$NODE_MODULES_FOLDER exists. Skipping..."
fi

# Download the torrent file
if [ ! -f "$BASE_FOLDER/$TORRENT_FILE" ]; then
    $WGET_PATH $TORRENT_URL -O $TORRENT_FILE
else
    echo "$TORRENT_FILE exists. Skipping..."
fi

# Download and keep seeding
$WEBTORRENT_CLI_PATH download "$BASE_FOLDER/$TORRENT_FILE" -o ./dl --keep-seeding
