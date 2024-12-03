#!/usr/bin/env bash
set -Eeuox pipefail
basedir=$(cd $(dirname "$0"); pwd)

# Setup
TARGET_TYPE="$(uname -m)"
case "$TARGET_TYPE" in
	"aarch64")
		TARGET_TYPE="arm64"
		;;
esac
export GODOT_VERSION=$1
export GODOT_URL="https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}/Godot_v${GODOT_VERSION}_linux.${TARGET_TYPE}.zip"
export GODOT_TEMPLATES_URL="https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}/Godot_v${GODOT_VERSION}_export_templates.tpz"
export GODOT_TEMPLATES_PATH=$HOME/.local/share/godot/export_templates/$(echo "$GODOT_VERSION" | tr - .)
export GODOT_ZIP_PATH=godot.zip
export GODOT_TEMPLATES_ZIP_PATH=/tmp/godot_templates.zip

# Install Godot
curl -Ls $GODOT_URL --output $GODOT_ZIP_PATH
unzip $GODOT_ZIP_PATH
mv Godot_* /usr/local/bin/godot
rm $GODOT_ZIP_PATH

# Install Godot Export Templates
curl -Ls $GODOT_TEMPLATES_URL --output $GODOT_TEMPLATES_ZIP_PATH
unzip $GODOT_TEMPLATES_ZIP_PATH -d /tmp
mkdir -p $GODOT_TEMPLATES_PATH
mv /tmp/templates/* $GODOT_TEMPLATES_PATH
rm $GODOT_TEMPLATES_ZIP_PATH
rm -rf /tmp/templates
