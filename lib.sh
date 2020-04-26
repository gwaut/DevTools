#!/bin/bash


function fail_if_dir_exists  {
   local dir=${1}
   if [[ -d ${dir} ]]; then
      echo "${1} already exists" >&2
      exit 1
   fi
}


function fail_if_dir_does_not_exist  {
   local dir=${1}
   if [[ ! -d ${dir} ]]; then
      echo "${1} does not exist" >&2
      exit 1
   fi
}

function get_rootdir_in_tarfile {
   local tarfile=${1}
   local rootdir=$(tar tf ${tarfile} | head -1)
   eval "$2=$rootdir"
}


function download {
   local url=$1 
   local local_filename=$2
   if [[ ! -f ${local_filename} ]]; then
      wget -O ${local_filename} ${url}  
   fi
}

# version=''
# get_infix_version eclipse-java-2019-06-R-linux-gtk-x86_64.tar.gz "eclipse-" version "-linux-gtk"
# --> version => java-2019-06-R
# get_infix_version eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz "eclipse-" version "-linux-gtk"
# --> version => jee-oxygen-3a
function get_infix_version {
   local filename=$1
   local prefix=$2
   local suffix=$4
   local suffix_removed=${filename%%${suffix}*}
   local prefix_removed=${suffix_removed#${prefix}}
   eval "$3=$prefix_removed"
}




function install_java {
   local url=${1}
   local install_dir=$2
   local version=$3

   local filename=$(basename ${url})

   download ${url} ${filename}

   if [[ ! -d ${install_dir} ]]; then
      mkdir -p ${install_dir}
   fi

   tar -zxvf ${filename} -C ${install_dir}

   LOAD_JAVA_FILE="${HOME}/bin/java${version}-env"
   if [[ ! -f ${LOAD_JAVA_FILE} ]]; then
      if [[ ! -d ${HOME}/bin ]]; then
         mkdir ${HOME}/bin
      fi
      java_rootdir=''
      get_rootdir_in_tarfile ${filename} java_rootdir  # Pass reference (not $java_rootdir)
      cat <<EOF > ${LOAD_JAVA_FILE}
#!/bin/bash

export JAVA_HOME=${INSTALLDIR}/$(basename ${java_rootdir})
export PATH=\${JAVA_HOME}/bin:\${PATH}
EOF
   fi

   chmod +x ${LOAD_JAVA_FILE}
}

function install_sts {
   install_ide $*
}

function install_eclipse {
   install_ide $*
}

function install_android_studio {
   local url=${1}
   local installdir=${2}
   local prefix=${3}
   local suffix=${4}
   local executable=${5}
   local icon=${6}


   local filename=$(basename ${url})

   download ${url} ${filename}

   version=''
   get_infix_version ${filename} ${prefix} version ${suffix}

   installdir=${installdir}/${version}

   if [[ ! -d ${installdir} ]]; then
      mkdir -p ${installdir}
   fi

   tar -zxvf ${filename} -C ${installdir}

   local ide_rootdir=''
   get_rootdir_in_tarfile ${filename} ide_rootdir
   installdir=${installdir}/$(basename ${ide_rootdir})

   local name="${prefix}${version}"
   local exec="${installdir}/${executable}"
   local icon_path="${installdir}/${icon}"
   add_ide_shortcut ${name} ${exec} ${icon_path}
}

function install_ide {
   local url=${1}
   local installdir=${2}
   local prefix=${3}
   local suffix=${4}
   local executable=${5}


   if [[ -z ${JAVA_HOME} ]]; then
      echo "Please set JAVA_HOME" >&2
      exit 1
   fi

   local filename=$(basename ${url})
   download ${url} ${filename}

   version=''
   get_infix_version ${filename} ${prefix} version ${suffix}

   installdir=${installdir}/${version}

   if [[ ! -d ${installdir} ]]; then
      mkdir -p ${installdir}
   fi

   tar -zxvf ${filename} -C ${installdir}

   local ide_rootdir=''
   get_rootdir_in_tarfile ${filename} ide_rootdir
   installdir=${installdir}/$(basename ${ide_rootdir})

   if [[ ! -d ${installdir}/jre ]]; then
      [ ! -z $JAVA_HOME ] && ln -s $JAVA_HOME ${installdir}/jre
   fi

   local name="${prefix}${version}"
   local exec="${installdir}/${executable}"
   local icon="${installdir}/icon.xpm"
   add_ide_shortcut ${name} ${exec} ${icon}
}


function add_ide_shortcut() {
   local name=${1}
   local exec=${2}
   local icon=${3}

   local desktopEntry=/usr/share/applications/${name}.desktop
   cat << EOF | sudo tee -a ${desktopEntry}
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Exec=${exec}
Icon=${icon}
Terminal=false
Name=${name}
Comment=Programming system and content development tool
Categories=Application;Education;Development;ComputerScience;
MimeType=application/x-eclipse-project
EOF

}

