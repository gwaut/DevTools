#!/bin/bash

# https://adoptium.net/releases.html?variant=openjdk11&jvmVariant=hotspot
DOWNLOAD_URL=https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.13%2B8/OpenJDK11U-jdk_x64_linux_hotspot_11.0.13_8.tar.gz
JAVA_VERSION=11

CURRENTDIR=$(dirname $0)
. ${CURRENTDIR}/../lib.sh
. ${CURRENTDIR}/../.config

INSTALLDIR=${TOOLDIR}/Java

install_java_with_alternatives ${DOWNLOAD_URL} ${INSTALLDIR} ${JAVA_VERSION}
