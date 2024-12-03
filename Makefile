test:
	bash build.bash 4.3-stable
	docker run --rm -it  ghcr.io/lunagic/godot:4.3-stable

publish:
	bash publish.bash
