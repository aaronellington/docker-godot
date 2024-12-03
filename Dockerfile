# Setup
FROM debian:bookworm
WORKDIR /workspace
RUN apt-get update
RUN apt-get install -y build-essential curl unzip
RUN apt-get clean

# Install
ARG GODOT_VERSION
COPY install.bash .
RUN bash install.bash ${GODOT_VERSION}
RUN rm install.bash
