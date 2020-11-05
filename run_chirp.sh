#!/bin/sh

str_image_name=localhost/chirp:fedora31_20201103
str_chirp_device="/dev/ttyUSB0"

if [ ! -e "$str_chirp_device" ]
then
  echo "Expecting a $str_chirp_device device. Is cable connected?"
  exit 1
fi
if [ "$(stat -c %a $str_chirp_device)" != "666" ]
then
  echo "Permissions to $str_chirp_device not liberal enough. Trying with sudo to fix it."
  sudo chmod 666 $str_chirp_device 
fi

# --volume /dev:/dev \
podman run \
  --interactive \
  --tty \
  --env DISPLAY=$DISPLAY \
  --rm \
  --volume $str_chirp_device:$str_chirp_device \
  --volume /tmp/.X11-unix:/tmp/.X11-unix:rw \
  --security-opt label=type:container_runtime_t \
  $str_image_name

