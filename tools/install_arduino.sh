#!/bin/bash
#
DOWNLOAD_URL=https://downloads.arduino.cc/arduino-1.8.12-linux64.tar.xz

CURRENTDIR=$(dirname $0)
. ${CURRENTDIR}/../lib.sh
. ${CURRENTDIR}/../.config


INSTALLDIR=${TOOLDIR}/Arduino

function install_arduino {
   local url=${1}
   local installdir=${2}

   local filename=$(basename ${url})

   download ${url} ${filename}

   if [[ ! -d ${installdir} ]]; then
      mkdir -p ${installdir}
   fi

   tar -xvf ${filename} -C ${installdir}
   local arduino_rootdir=''
   get_rootdir_in_tarfile ${filename} arduino_rootdir 

  
   sudo ${installdir}/${arduino_rootdir}/install.sh
}


install_arduino ${DOWNLOAD_URL} ${INSTALLDIR}
