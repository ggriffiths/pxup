#!/bin/sh

. ./utils.sh

pullimage=$(getvar pullimage)
pximage=$(getvar pximage)

if [ $pullimage = "false" ] ; then
	echo "Copying docker ${pximage} ..."
	docker save ${pximage} > $PWD/roles/common/files/px.img
fi

vagrant up --provider=libvirt --no-provision $@ \
    && vagrant --provider=libvirt provision

