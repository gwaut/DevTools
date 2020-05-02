#!/bin/bash
#
DOWNLOAD_URL=https://apache.belnet.be/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz


CURRENTDIR=$(dirname $0)
. ${CURRENTDIR}/../lib.sh
. ${CURRENTDIR}/../.config

INSTALLDIR=${TOOLDIR}/Maven


function install_maven {
   local url=${1}
   local installdir=${2}

   local filename=$(basename ${url})
   download ${url} ${filename}

   if [[ ! -d ${installdir} ]]; then
      mkdir -p ${installdir}
   fi

   tar -zxvf ${filename} -C ${installdir}

   local maven_rootdir=''
   get_rootdir_in_tarfile ${filename} maven_rootdir

   installdir=${installdir}/$(basename ${maven_rootdir})

   add2java_env $installdir/bin
   
}

function add2java_env {
   local mvn_bin_path=${1}
   local bindir=${HOME}/bin
   for javaEnvFile in $(ls ${bindir}/java*-env); do
      grep ${mvn_bin_path} ${javaEnvFile} >> /dev/null
      if [[ $? -ne 0 ]]; then
         echo "export PATH=\${PATH}:${mvn_bin_path}" >> ${javaEnvFile}
      fi
   done
}

install_maven ${DOWNLOAD_URL} ${INSTALLDIR} 
