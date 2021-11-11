#!/bin/bash

# https://adoptium.net/releases.html?variant=openjdk17&jvmVariant=hotspot
DOWNLOAD_URL=https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.1%2B12/OpenJDK17U-jdk_x64_linux_hotspot_17.0.1_12.tar.gz
JAVA_VERSION=17


CURRENTDIR=$(dirname $0)
. ${CURRENTDIR}/../lib.sh
. ${CURRENTDIR}/../.config

INSTALLDIR=${TOOLDIR}/Java


install_java_with_alternatives ${DOWNLOAD_URL} ${INSTALLDIR} ${JAVA_VERSION}
