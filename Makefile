
all: ndk-build

init:
	git submodule update --init

ndk-build:
	cd jni
	ndk-build

# source: http://software.intel.com/en-us/articles/creating-and-porting-ndk-based-android-apps-for-ia
# [not tested]
ndk-build-x86:
	cd jni
	ndk-build APP_ABI=x86

clean:
	rm -rf obj
	rm -rf libs

