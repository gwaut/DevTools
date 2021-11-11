#!/bin/bash

# https://adoptium.net/releases.html?variant=openjdk8&jvmVariant=hotspot
DOWNLOAD_URL=https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u312-b07/OpenJDK8U-jdk_x64_linux_hotspot_8u312b07.tar.gz
JAVA_VERSION=8


CURRENTDIR=$(dirname $0)
. ${CURRENTDIR}/../lib.sh
. ${CURRENTDIR}/../.config

INSTALLDIR=${TOOLDIR}/Java/


install_java_with_alternatives ${DOWNLOAD_URL} ${INSTALLDIR} ${JAVA_VERSION}
