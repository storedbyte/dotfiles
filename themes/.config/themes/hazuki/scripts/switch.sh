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

# template inject and symlink
source "$ACTIVE/colors.sh"
sed 	-e "s/{{bg-main}}/$bg_main/g" \
	-e "s/{{bg-ui}}/$bg_ui/g" \
	-e "s/{{bg-sel}}/$bg_sel/g" \
	-e "s/{{fg}}/$fg/g" \
	-e "s/{{ui-accent}}/$ui_accent/g" \
	-e "s/{{ui-border}}/$ui_border/g" \
	"$HOME/.config/themes/templates/fuzzel.ini" > "$HOME/.config/fuzzel/fuzzel.ini"

# reload each app
kill -SIGURS1 $(pidof kitty) 2>/dev/null
niri msg action reload-config 2>/dev/null

echo "Hazuki > $FLAVOR"
