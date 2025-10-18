test:
	bash build.bash 4.5.1-stable
	docker run --rm -it  ghcr.io/aaronellington/godot:4.5.1-stable

publish:
	bash publish.bash
