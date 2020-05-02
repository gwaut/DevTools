#!/bin/bash
# Installs Android Studio and creates shortcut on Ubuntu system.
#
# After installation: 
# SUPER-A --> Android studio --> right click and 'Add to Favorites'
#
# /dev/kvm device: permission denied
# --> 
# sudo apt install qemu-kvm
# sudo usermod -aG kvm $USER


# https://developer.android.com/studio
DOWNLOAD_URL=https://redirector.gvt1.com/edgedl/android/studio/ide-zips/3.6.3.0/android-studio-ide-192.6392135-linux.tar.gz

CURRENTDIR=$(dirname $0)
. ${CURRENTDIR}/../lib.sh
. ${CURRENTDIR}/../.config

INSTALLDIR=${TOOLDIR}/IDE/AndroidStudio

PREFIX="android-studio-ide-"
SUFFIX="-linux.tar.gz"
EXECUTABLE="bin/studio.sh"
ICON="bin/studio.png"

install_android_studio ${DOWNLOAD_URL} ${INSTALLDIR} ${PREFIX} ${SUFFIX} ${EXECUTABLE} ${ICON}

