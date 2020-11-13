
export CC=clang;
export CROSS_TOP=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer
export CROSS_SDK=iPhoneOS.sdk
export PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH"

set -e

export CURDIR=`pwd`
# ios
export INSTALL_DIR=$(pwd)/platform/ios/libwebsockets/Release/ios
mkdir -p build
cd build

export IOS_TOOLCHAIN_FILE=${CURDIR}/ios.toolchain.cmake
export OPENSSL_ROOT=${CURDIR}/../openssl/platform/ios/openssl/Release/ios
export LIBUV_ROOT=${CURDIR}/libuv/
export LIBZ_ROOT=${CURDIR}/zlib-1.2.8/


declare -a PLATFORMS=("OS" "OS64" "SIMULATOR" "SIMULATOR64")
PLATFORM="OS64"

cmake -G "Xcode" -DENABLE_BITCODE=0 -DCMAKE_TOOLCHAIN_FILE=$IOS_TOOLCHAIN_FILE -DPLATFORM=$PLATFORM \
    -DCMAKE_BUILD_TYPE=Debug \
     -DLWS_WITH_LWSWS=0 \
     -DLWS_WITH_MBEDTLS=0 \
     -DLWS_WITHOUT_TESTAPPS=1 \
     -DLWS_LIBUV_LIBRARIES=${LIBUV_ROOT}/lib/libuv_a.a \
    -DLWS_LIBUV_INCLUDE_DIRS=${LIBUV_ROOT}/include \
    -DLWS_ZLIB_LIBRARIES=${LIBZ_ROOT}/lib/libz.a \
    -DLWS_ZLIB_INCLUDE_DIRS=${LIBZ_ROOT}/include \
     -DOPENSSL_ROOT_DIR=../openssl/platform/ios/openssl/Release/ios \
     -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR ../ \
    -DLWS_OPENSSL_LIBRARIES="${OPENSSL_ROOT}/lib/libssl.a;${OPENSSL_ROOT}/lib/libcrypto.a" \
     -DLWS_OPENSSL_INCLUDE_DIRS=${OPENSSL_ROOT}/include

cmake --build . --config Debug --target install
