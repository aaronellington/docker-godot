#!/usr/bin/env bash
set -Eeuox pipefail
basedir=$(cd $(dirname "$0"); pwd)

GODOT_VERSIONS=(
	"4.5.1-stable"
)

for GODOT_VERSION in "${GODOT_VERSIONS[@]}" ; do
	# bash $basedir/build.bash $GODOT_VERSION
	docker push ghcr.io/aaronellington/godot:${GODOT_VERSION}
done
