# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# added by Anaconda2 4.4.0 installer
PYTHON_HOME=/home/zhangweiping/opt/anaconda2
PYTHONPATH=$PYTHON_HOME/lib/python2.7/site-packages:$PYTHONPATH
export PYTHONPATH
PATH=$PYTHON_HOME/bin:$PATH
export PATH

LD_LIBRARY_PATH=/home/zhangweiping/opt/anaconda2/lib
export LD_LIBRARY_PATH

CLANG_HOME=/home/zhangweiping/opt/llvm
export PATH=$CLANG_HOME/bin:$PATH

PATH=/home/zhangweiping/opt/cmake/bin:$PATH
export PATH

export BLADE_CACHE_DIR=${HOME}/.blade_cache

export LANG=zh_CN.UTF8 # 使用utf-8

alias tmux="TERM=screen-256color-bce tmux"
