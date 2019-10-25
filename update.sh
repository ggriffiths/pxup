#!/bin/sh

. ./utils.sh

pullimage=$(getvar pullimage)
pximage=$(getvar pximage)

if [ $pullimage = "false" ] ; then
	docker save ${pximage} > $PWD/roles/common/files/px.img
fi

# All we need to do is rerun ansible
docker save quay.io/porx/grantporx:1 > $PWD/roles/common/files/px.img
vagrant provision

