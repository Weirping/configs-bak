#!/bin/bash
# coding: utf-8
# ========================================================================
# File Name: tools_install.sh
# Author: Weiping
# Created Time: 2018年12月29日 星期六 11时53分44秒
# =======================================================================

prefix=${HOME}

mkdir ${prefix}/tools_install_tmp
TMP_DIR=${prefix}/tools_install_tmp
cd ${TMP_DIR}

if test -e ${prefix}/bin
then
    echo '文件已存在!'
else
    mkdir ${prefix}/bin
fi

# tree
echo 'tree begin ==============='
if test -e ${prefix}/bin/tree
then
    echo 'tree has been installed!'
else
    wget ftp://mama.indstate.edu/linux/tree/tree-1.8.0.tgz
    tar -zxvf tree-1.8.0.tgz
    cd tree-1.8.0
    cp Makefile Makefile.bk
    sed "19c prefix = ${prefix}" Makefile.bk > Makefile
    make install
    cd ${TMP_DIR}
fi
echo 'tree end ==============='
echo ''
echo ''
echo ''

# ack
echo 'ack begin ==============='
if test -e ${prefix}/bin/ack
then
    echo 'ack has been installed!'
else
    curl https://beyondgrep.com/ack-2.22-single-file > ${prefix}/bin/ack && chmod 0755 ${prefix}/bin/ack
    if [$? -ne 0];then
        echo "ack install failed!"
    fi
fi
echo 'ack end ==============='

# autojump
echo autojump begin ============
if test -e ${HOME}/.autojump
then
    echo 'autojump has been installed!'
else
    git clone https://github.com/joelthelion/autojump.git
    cd autojump
    python install.py
    cd ${TMP_DIR}
    echo "" >> ${HOME}/.bashrc
    echo "#autojump" >> ${HOME}/.bashrc
    echo "[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh" >> ${HOME}/.bashrc
fi
echo 'autojump end ==============='

cd -
rm -rf ${TMP_DIR}
