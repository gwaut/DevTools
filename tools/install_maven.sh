#!/bin/bash
#
DOWNLOAD_URL=https://dlcdn.apache.org/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.tar.gz

CURRENTDIR=$(dirname $0)
. ${CURRENTDIR}/../lib.sh
. ${CURRENTDIR}/../.config

INSTALLDIR=${TOOLDIR}/Maven


function install_maven {
   local url=${1}
   local installdir=${2}

   local filename=$(basename ${url})

   download_file_and_extract_in_dir ${url} ${filename} ${installdir}

   local maven_rootdir=''
   get_rootdir_in_tarfile ${filename} maven_rootdir

   installdir=${installdir}/$(basename ${maven_rootdir})

   sudo update-alternatives --install /usr/bin/mvn mvn ${installdir}/bin/mvn 1
}


install_maven ${DOWNLOAD_URL} ${INSTALLDIR} 
