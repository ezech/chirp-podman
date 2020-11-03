#!/bin/sh

str_image_name=localhost/chirp:fedora31_20201103

# --volume /dev/ttyUSB0:/dev/ttyUSB0
podman run \
  --interactive \
  --tty \
  --env DISPLAY=$DISPLAY \
  --rm \
  --volume /dev:/dev \
  --volume /tmp/.X11-unix:/tmp/.X11-unix:rw \
  --security-opt label=type:container_runtime_t \
  $str_image_name
