#!/usr/bin/env bash

if [ "$NDK_PATH" == "" ]; then
    echo "Fatal: NDK_PATH not set."
    exit
fi


cd jxcore
./build_scripts/android-configure.sh $NDK_PATH
./build_scripts/android_compile.sh $NDK_PATH
cd -

mkdir -p jxcore-cordova/src/android/jxcore-binaries
rm -f jxcore-cordova/src/android/jxcore-binaries/*
cp -f jxcore/out_android/android/bin/* jxcore-cordova/src/android/jxcore-binaries/


cd jxcore-cordova/src/android/jni
$NDK_PATH/ndk-build
