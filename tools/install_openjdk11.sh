#!/bin/bash

# https://adoptopenjdk.net/releases.html?variant=openjdk11&jvmVariant=hotspot#x64_linux
DOWNLOAD_URL=https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.5%2B10/OpenJDK11U-jdk_x64_linux_hotspot_11.0.5_10.tar.gz
JAVA_VERSION=11

CURRENTDIR=$(dirname $0)
. ${CURRENTDIR}/../lib.sh
. ${CURRENTDIR}/../.config

INSTALLDIR=${TOOLDIR}/Java/

install_java ${DOWNLOAD_URL} ${INSTALLDIR} ${JAVA_VERSION}
