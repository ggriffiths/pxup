#!/bin/sh

# All we need to do is rerun ansible
docker save quay.io/porx/grantporx:1 > $PWD/roles/common/files/px.img
vagrant provision

