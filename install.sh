#!/bin/bash

# Installer for syncwork

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DEST="/usr/local/bin/syncwork"

echo "Installing syncwork to $DEST..."

if [ ! -d "/usr/local/bin" ]; then
    sudo mkdir -p /usr/local/bin
fi

sudo cp "$SCRIPT_DIR/syncwork" "$DEST"
sudo chmod +x "$DEST"

echo "Done! You can now run 'syncwork' from any terminal."
