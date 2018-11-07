# added by Anaconda2 4.4.0 installer
PYTHON_HOME=${HOME}/opt/anaconda2
PYTHONPATH=$PYTHON_HOME/lib/python2.7/site-packages:$PYTHONPATH
export PYTHONPATH
PATH=$PYTHON_HOME/bin:$PATH
export PATH

LD_LIBRARY_PATH=${HOME}/opt/anaconda2/lib
export LD_LIBRARY_PATH

CLANG_HOME=${HOME}/opt/llvm
export PATH=$CLANG_HOME/bin:$PATH

PATH=${HOME}/opt/cmake/bin:$PATH
export PATH

export BLADE_CACHE_DIR=${HOME}/.blade_cache

export LANG=zh_CN.UTF8 # 使用utf-8

alias tmux="TERM=screen-256color-bce tmux"

export TMPDIR="${HOME}/.tmp/"

alias grep="grep --color "