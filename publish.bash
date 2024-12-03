#!/usr/bin/env bash
set -Eeuox pipefail
basedir=$(cd $(dirname "$0"); pwd)

GODOT_VERSIONS=(
	"4.4-dev5"
	"4.3-stable"
)

for GODOT_VERSION in "${GODOT_VERSIONS[@]}" ; do
	bash $basedir/build.bash $GODOT_VERSION
	docker push ghcr.io/lunagic/godot:${GODOT_VERSION}
done
