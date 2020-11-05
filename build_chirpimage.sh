#!/usr/bin/env bash

# build_chirpimage.sh 

ctr=$(buildah from fedora:31)

buildah run $ctr /bin/sh -c 'dnf install -y chirp'

buildah config --cmd "/usr/bin/chirpw" $ctr

buildah commit $ctr localhost/chirp:fedora31_20201105
