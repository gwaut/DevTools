#!/bin/bash

CURRENTDIR=$(dirname $0)
. ${CURRENTDIR}/lib.sh
 
ROOTDIR=${HOME}/Dev
TOOLDIR=${ROOTDIR}/Tools
PROJECTDIR=${ROOTDIR}/Projects


fail_if_dir_exists ${ROOTDIR}
fail_if_dir_exists ${TOOLDIR}
fail_if_dir_exists ${PROJECTDIR}

mkdir -p ${TOOLDIR}
mkdir -p ${PROJECTDIR}


cat > .config <<EOF
export TOOLDIR=${TOOLDIR}
EOF
