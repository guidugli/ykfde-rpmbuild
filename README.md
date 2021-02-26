# ykfde-rpmbuild
Simple solution to build [mkinitcpio-ykfde](https://github.com/eworm-de/mkinitcpio-ykfde) project in a container then extracting the RPM package.

## Pre-Requisites

Podman (or docker) needs to be available.
Adjust the version number on getsoutce.sh and mkinitcpio-ykfde.spec before building.

## Running the solution

If you have podman installed, all you need to do is run build.sh. This command will build and instantiate the image then extract the RPM from the container to the local filesystem.
If running docker, change the script build.sh replacing "podman" with "docker"


