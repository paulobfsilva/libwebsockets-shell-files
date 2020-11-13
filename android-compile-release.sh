# armeabi-v7a
export INSTALL_DIR=$(pwd)/platform/android-armeabi-v7a/
mkdir -p $INSTALL_DIR
mkdir -p build
cd build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DOPENSSL_ROOT_DIR=../openssl/armeabi-v7a/
    -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR ../
make
make install
make clean
cd ..
rm -rf build

clear
# arm64-v8a
export INSTALL_DIR=$(pwd)/platform/android-arm64-v8a/
mkdir -p $INSTALL_DIR
mkdir -p build
cd build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DOPENSSL_ROOT_DIR=../openssl/arm64-v8a/
    -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR ../
make
make install
make clean
cd ..
rm -rf build

clear
# x86
export INSTALL_DIR=$(pwd)/platform/android-x86/
mkdir -p $INSTALL_DIR
mkdir -p build
cd build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DOPENSSL_ROOT_DIR=../openssl/android-x86/
    -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR ../
make
make install
make clean
cd ..
rm -rf build

clear
# x86
export INSTALL_DIR=$(pwd)/platform/android-x86_64/
mkdir -p $INSTALL_DIR
mkdir -p build
cd build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DOPENSSL_ROOT_DIR=../openssl/android-x86_64/
    -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR ../
make
make install
make clean
cd ..
rm -rf build

