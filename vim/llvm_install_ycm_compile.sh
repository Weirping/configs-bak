mkdir LLVM_TMP
cd LLVM_TMP
if test -e llvm-3.9.1.src.tar.xz
then
   echo 'llvm-3.9.1.src.tar.xz exist' 
else
    wget http://llvm.org/releases/3.9.1/llvm-3.9.1.src.tar.xz
fi

if test -e cfe-3.9.1.src.tar.xz
then
   echo 'cfe-3.9.1.src.tar.xz exist' 
else
    wget http://llvm.org/releases/3.9.1/cfe-3.9.1.src.tar.xz
fi

if test -e compiler-rt-3.9.1.src.tar.xz
then
   echo 'compiler-rt-3.9.1.src.tar.xz exist' 
else
    wget http://llvm.org/releases/3.9.1/compiler-rt-3.9.1.src.tar.xz
fi

if test -e clang-tools-extra-3.9.1.src.tar.xz
then
   echo 'clang-tools-extra-3.9.1.src.tar.xz exist' 
else
    wget http://llvm.org/releases/3.9.1/clang-tools-extra-3.9.1.src.tar.xz
fi

if test -e llvm
then
    echo 'llvm dir exist, del it'
    rm -rf llvm
fi
tar xf llvm-3.9.1.src.tar.xz
mv llvm-3.9.1.src llvm
cd llvm/tools/
tar xf ../../cfe-3.9.1.src.tar.xz
mv cfe-3.9.1.src clang
cd clang/tools
tar xf ../../../../clang-tools-extra-3.9.1.src.tar.xz
mv clang-tools-extra-3.9.1.src extra
cd ../../../projects
tar xf ../../compiler-rt-3.9.1.src.tar.xz
mv compiler-rt-3.9.1.src compiler-rt
cd ../..
if test -e llvm-build
then
    echo 'llvm-build exist, del it'
    rm -rf llvm-build
fi
mkdir llvm-build
cd llvm-build
pwd
CC="/opt/rh/devtoolset-3/root/usr/bin/gcc" CXX="/opt/rh/devtoolset-3/root/usr/bin/g++" cmake -G "UnixMakefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${HOME}/opt/llvm -DLLVM_OPTIMIZED_TABLEGEN=1 ../llvm
make -j8
make install

# compile ycm_core
#cd ~
#mkdir ycm_build
#cd ycm_build
#CC="/opt/rh/devtoolset-3/root/usr/bin/gcc" CXX="/opt/rh/devtoolset-3/root/usr/bin/g++" cmake -G "UnixMakefiles" -DPATH_TO_LLVM_ROOT=${HOME}/opt/llvm . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
#cmake --build . --target ycm_core
