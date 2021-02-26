#!/usr/bin/env bash

CONTAINER_NAME='mkinitcpio-ykfde:latest'
PUID=$(id -u)
PGID=$(id -g)

podman rmi $CONTAINER_NAME &>/dev/null

podman build --tag "$CONTAINER_NAME" \
	--rm --force-rm --compress \
	--build-arg PUID=$PUID \
	--build-arg PGID=$PGID \
	--no-cache=true .

podman run --detach --rm -it --name fedora mkinitcpio-ykfde:latest 

podman cp fedora:/home/user/rpmbuild/RPMS/ .
podman cp fedora:/home/user/rpmbuild/SRPMS .

podman stop fedora

podman rmi $CONTAINER_NAME &>/dev/null

