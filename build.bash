#!/usr/bin/env bash
set -Eeuox pipefail
basedir=$(cd $(dirname "$0"); pwd)

GODOT_VERSION=$1

docker build --pull --rm \
	--file "Dockerfile" \
	--platform linux/amd64,linux/arm64 \
	--build-arg GODOT_VERSION=${GODOT_VERSION} \
	--tag ghcr.io/lunagic/godot:${GODOT_VERSION} \
	"."
