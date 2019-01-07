#!/bin/bash
# coding: utf-8
# ========================================================================
# File Name: tools_install.sh
# Author: Weiping
# Created Time: 2018年12月29日 星期六 11时53分44秒
# =======================================================================

prefix=${HOME}
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
    cd ~/Downloads
    wget ftp://mama.indstate.edu/linux/tree/tree-1.8.0.tgz
    tar -zxvf tree-1.8.0.tgz
    cd tree-1.8.0
    cp Makefile Makefile.bk
    sed "19c prefix = ${prefix}" Makefile.bk > Makefile
    make install
    cd ~
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
    curl https://beyondgrep.com/ack-2.22-single-file > ~/bin/ack && chmod 0755 ${prefix}/bin/ack
    if [$? -ne 0];then
        echo "ack install failed!"
    fi
fi 
echo 'ack end ==============='
