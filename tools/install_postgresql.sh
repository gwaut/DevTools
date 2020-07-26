#!/bin/bash

# https://www.postgresql.org/ftp/source/
DOWNLOAD_URL=https://ftp.postgresql.org/pub/source/v12.3/postgresql-12.3.tar.gz

#sudo apt-get install libreadline-dev libssl-dev libxslt1-dev libossp-uuid-dev
CURRENTDIR=$(dirname $0)
. ${CURRENTDIR}/../lib.sh
. ${CURRENTDIR}/../.config

filename=$(basename ${DOWNLOAD_URL})
version=''
get_infix_version ${filename} 'postgresql-' version '.tar.gz'
INSTALLDIR=${TOOLDIR}/PostgreSQL/${version}

function install_postgresql {
    local url=${1}
    local filename=${2}
    local installdir=${3}
    local builddir='/tmp'

    download ${url} ${filename}

    tar -zxvf ${filename} -C ${builddir}
    srcdir=''
    get_rootdir_in_tarfile ${filename} srcdir  # Pass reference (not $srcdir)

    cd ${builddir}/${srcdir}
    ./configure --prefix=${installdir} --with-ossp-uuid --with-libxml --with-libxslt --with-openssl
    check_status $?
 
    make world
    check_status $?
 
    make install-world
    check_status $?

    cd -
}

function check_status {
    local exit_status=$1
    if [[ ${exit_status} -ne 0 ]]; then
        cd -
        exit ${exit_status}
    fi
}

function pg_env {
    local major_version=${1}
    local pg_bin_path=${2}
    local bindir=${HOME}/bin

    local pg_env="pg${major_version}-env"
    cat <<EOF > "${bindir}/${pg_env}"
#!/bin/bash

export PATH=${pg_bin_path}:$PATH
export PGDATABASE=postgres
EOF

    local pgdata="pgdata"
   cat <<EOF > "${bindir}/${pgdata}"
#!/bin/bash

export PGDATA=\${PWD}
EOF
   
    grep ${pg_env} ${HOME}/.bash_aliases
    if [[ $? -ne 0 ]]; then
        echo "alias pg${major_version}=\". ${pg_env}\"" >> ${HOME}/.bash_aliases
    fi

    grep pgd ${HOME}/.bash_aliases
    if [[ $? -ne 0 ]]; then
        echo "alias pgd=\". ${pgdata}\"" >> ${HOME}/.bash_aliases
    fi
}


install_postgresql ${DOWNLOAD_URL} ${filename} ${INSTALLDIR}
major_version=${version%%.*}
pg_env ${major_version} ${INSTALLDIR}/bin