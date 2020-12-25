#!/bin/bash
# Installs Spring Tool Suite and creates shortcut on Ubuntu system.
#
# After installation: 
# SUPER-A --> SpringToolSuite --> right click and 'Add to Favorites'
#

# https://spring.io/tools/
DOWNLOAD_URL=https://download.springsource.com/release/STS4/4.9.0.RELEASE/dist/e4.18/spring-tool-suite-4-4.9.0.RELEASE-e4.18.0-linux.gtk.x86_64.tar.gz

CURRENTDIR=$(dirname $0)
. ${CURRENTDIR}/../lib.sh
. ${CURRENTDIR}/../.config

INSTALLDIR=${TOOLDIR}/IDE/sts

PREFIX="spring-tool-suite-"
SUFFIX="-linux.gtk"
EXECUTABLE="SpringToolSuite4"

install_sts ${DOWNLOAD_URL} ${INSTALLDIR} ${PREFIX} ${SUFFIX} ${EXECUTABLE}

