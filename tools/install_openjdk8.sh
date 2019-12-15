#!/bin/bash

# https://adoptopenjdk.net/releases.html?variant=openjdk11&jvmVariant=hotspot#x64_linux
DOWNLOAD_URL=https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u232-b09/OpenJDK8U-jdk_x64_linux_hotspot_8u232b09.tar.gz
JAVA_VERSION=8


CURRENTDIR=$(dirname $0)
. ${CURRENTDIR}/../lib.sh
. ${CURRENTDIR}/../.config

INSTALLDIR=${TOOLDIR}/Java/


install_java ${DOWNLOAD_URL} ${INSTALLDIR} ${JAVA_VERSION}
