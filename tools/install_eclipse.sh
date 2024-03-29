#!/bin/bash
# Installs eclipse and creates shortcut on Ubuntu system.
#
# After installation: 
# SUPER-A --> eclipse --> right click and 'Add to Favorites'
#

# https://www.eclipse.org/downloads/packages/
DOWNLOAD_URL=https://mirror.serverion.com/eclipse/technology/epp/downloads/release/2022-09/R/eclipse-jee-2022-09-R-linux-gtk-x86_64.tar.gz

CURRENTDIR=$(dirname $0)
. ${CURRENTDIR}/../lib.sh
. ${CURRENTDIR}/../.config

INSTALLDIR=${TOOLDIR}/IDE/eclipse

PREFIX="eclipse-"
SUFFIX="-linux-gtk"
EXECUTABLE="eclipse"

install_eclipse ${DOWNLOAD_URL} ${INSTALLDIR} ${PREFIX} ${SUFFIX} ${EXECUTABLE}

# fix svn problems...
# sudo apt-get install libsvn-java
# echo "-Djava.library.path=/usr/lib/x86_64-linux-gnu/jni" >> eclipse.ini
eclipseIni=
