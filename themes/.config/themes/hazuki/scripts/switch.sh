#!/bin/bash

FLAVOR=$1
THEMES_DIR="$HOME/.config/themes/hazuki"
ACTIVE="$HOME/.config/themes/active"

if [ -z "$FLAVOR" ]; then
	echo "Usage: switch.sh <flavor>"
	exit 1
fi

if [ ! -d "$THEMES_DIR/$FLAVOR" ]; then
	echo "Flavor '$FLAVOR' not found"
	exit 1
fi

# swap the active symlink
ln -sfn "$THEMES_DIR/$FLAVOR" "$ACTIVE"

# reload each app
kill -SIGURS1 $(pidof kitty) 2>/dev/null
niri msg action reload-config 2>/dev/null

echo "Hazuki > $FLAVOR"
