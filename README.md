# Android sqlite native driver with ICU

Provides a native build of sqlite with a low-level interface for Android libraries
with ICU (4.4l) integrated.

Based on: https://github.com/sulite/SQLiteGlue-ICU

License: ICU

## About

TBD

This project includes the ICU (4.4l) source and build scripts to build the sqlite
native library along with ICU 4.4l embedded. Note that this project actually references
Android-sqlite-native-driver for the JNI code in a git submodule.

# Building

## First step

    $ make init # include `Android-sqlite-native-driver` & `sqlite-amalgamation` subprojects

## Normal build

    $ make

**IMPORTANT:** Please do `make init` first otherwise it will not build.

# Adaptations & extensions

TBD

# History

TBD

# Credits

Thanks to Kalishenko Stanislav for providing `jni` with ICU sources & `Android.mk` build scripts from `jni.zip`, as referenced by http://habrahabr.ru/post/122408/ (please use Google Translate if you do not know Russian)
