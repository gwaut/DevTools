#!/bin/bash

CURRENTDIR=$(dirname $0)
. ${CURRENTDIR}/lib.sh
 
TOOLDIR=${HOME}/Tools


fail_if_dir_exists ${TOOLDIR}

mkdir -p ${TOOLDIR}


cat > .config <<EOF
export TOOLDIR=${TOOLDIR}
EOF
