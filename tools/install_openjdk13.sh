#!/bin/bash

# https://adoptopenjdk.net/releases.html?variant=openjdk11&jvmVariant=hotspot#x64_linux
DOWNLOAD_URL=https://github.com/AdoptOpenJDK/openjdk13-binaries/releases/download/jdk-13.0.2%2B8/OpenJDK13U-jdk_x64_linux_hotspot_13.0.2_8.tar.gz
JAVA_VERSION=13


CURRENTDIR=$(dirname $0)
. ${CURRENTDIR}/../lib.sh
. ${CURRENTDIR}/../.config

INSTALLDIR=${TOOLDIR}/Java


install_java ${DOWNLOAD_URL} ${INSTALLDIR} ${JAVA_VERSION}
